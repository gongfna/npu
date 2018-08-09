// ---------------------------------------------------------------------
//
//                   (C) COPYRIGHT 2005-2011 SYNOPSYS INC.
//                             ALL RIGHTS RESERVED
//
//  This software and the associated documentation are confidential and
//  proprietary to Synopsys Inc.  Your use or disclosure of this software
//  is subject to the terms and conditions of a written license agreement
//  between you or your company, and Synopsys, Inc.
//
//  The entire notice above must be reproduced on all authorized copies.
//
// -------------------------------------------------------------------------
//
// AUTHOR:    James Feagans      2/10/2005
//
// VERSION:   DW_axi_gs_exclusive Verilog Synthesis Model
//
//
//-----------------------------------------------------------------------------
//-----------------------------------------------------------------------------
//
// ABSTRACT:  Exclusive Access Monitor
//
// Maintains exclusive access table of addresses and IDs.
// Asserts output port exokay upon successful exclusive read or write access.
//
// Upon an exclusive read access:
//
//   - if the {id} matches the {id} field of an existing table entry, replace
//     that table entry with the new {id, addr} pair and report exokay = 1.
//
//   - else if the table is full, do not alter the table and report exokay = 0.
//
//   - else, add the entry to the table and report exokay = 1.
//
// Upon an exclusive write access:
//
//   - if the address matches an existing table entry, delete
//     that table entry and report exokay = 1.
//
//   - else, do not alter the table and report exokay = 0.
//
// Upon a normal read access:
//
//   - do not alter the table and report exokay = 0.
//
// Upon a normal write access:
//
//   - if the address matches an existing table entry, delete
//     that table entry and report exokay = 0.
//
//   - else, do not alter the table and report exokay = 0.
//
//-----------------------------------------------------------------------------
module DW_axi_gs_exclusive(

  // Inputs
  clk,       // Clock, positive edge
  clk_en,    // Clock enable for quasi-synchronous clocking mode
  reset_n,   // Reset, active low
  read,      // Initiate read transaction
  write,     // Initiate write transaction
  exclusive, // Identify transaction as exclusive access
  id,        // Transaction ID
  addr,      // Transaction Address (drop lower order bits)

  // Outputs
  exokay,    // Indicates exclusive access succeeded
  exfail     // Indicates exclusive access failed
);


// ----------------------------------------------------------------------------
// PARAMETERS
// ----------------------------------------------------------------------------

// these parameters are defined by the user upon instantiation
parameter num_entries    = 4;  // RANGE 1 to 32
parameter id_width       = 8;  // RANGE 1 to 16
// The exclusive access monitor ignores the low-order bits of the address
// per the AXI Protocol v1.0 Specification. Monitoring 128 bytes for any given
// access corresponds to dropping the 7 low-order bits. This would make the
// address input of the exclusive access monitor 25 bits if the AXI address bus
// is 32 bits wide.
parameter addr_width     = 25; // RANGE 1 to 64

// these parameters are automatically derived from the parameters above
//parameter ex_encode_width   = ((num_entries>16)?((num_entries>64)?
//  ((num_entries>128)?8:7):((num_entries>32)?6:5)):((num_entries>4)?
//  ((num_entries>8)?4:3):((num_entries>2)?2:1)));
parameter ex_id_tbl_width   = num_entries*id_width;
parameter ex_addr_tbl_width = num_entries*addr_width;


// ----------------------------------------------------------------------------
// PORTS
// ----------------------------------------------------------------------------

input  clk;
input  clk_en;
input  reset_n;
input  read;
input  write;
input  exclusive;
input  [id_width-1:0] id;
input  [addr_width-1:0] addr;

output exokay;
output exfail;


// ----------------------------------------------------------------------------
// INTERNAL SIGNALS
// ----------------------------------------------------------------------------

// Exclusive Access Table
// There are (num_entries) entries in the table.
// Each entry includes three fields: {id, address, valid}
reg  [ex_id_tbl_width-1:0]   ex_id, next_ex_id;
reg  [ex_addr_tbl_width-1:0] ex_addr, next_ex_addr;
reg  [num_entries-1:0]       ex_valid, next_ex_valid,
                             ex_id_eq, ex_addr_eq, empty_selected;

wire                         ex_id_found, ex_addr_found, ex_tbl_full;
reg  [num_entries-1:0]       ex_tbl_wr;
wire [num_entries-1:0]       ex_tbl_r;


// ----------------------------------------------------------------------------
// DESIGN
// ----------------------------------------------------------------------------

// determine whether ID matches an ID in the table
assign ex_id_found = |ex_id_eq;

// determine whether address matches an address in the table
assign ex_addr_found = |ex_addr_eq;

// determine whether the table is full
assign ex_tbl_full = &ex_valid;

// determine whether the exclusive access failed
assign exfail = (num_entries == 0) ? exclusive:
  exclusive & ((read & (!ex_id_found & ex_tbl_full)) | (write & (!ex_id_found | (ex_id_found & !ex_addr_found))));

// determine whether the exclusive access passed
assign exokay = (num_entries == 0) ? 0: exclusive & !exfail;

// Select an empty location in table
reg  [7:0] empty_i;
always @(ex_tbl_full or ex_valid)
begin : find_empty_entries
  empty_selected = 0;
  if (!ex_tbl_full)
    for (empty_i=0; empty_i<num_entries; empty_i=empty_i+1)
      if (ex_valid[empty_i] == 1'b0)
        begin
	  //cg empty_selected = (1'b1 << empty_i);
          empty_selected = 0;
          empty_selected[empty_i] = 1'b1;
        end
end // find_empty_entries


// assert ff reset upon any write that matches a table address
assign ex_tbl_r = (write & ex_addr_found) ? ex_addr_eq: 0;

// assert ff write enable upon successful exclusive read
always @(exclusive or read or ex_id_found or ex_id_eq or ex_tbl_full or
  empty_selected)
begin : write_control
  if (exclusive & read) begin
    if      (ex_id_found)  ex_tbl_wr = ex_id_eq;
    else if (ex_tbl_full)  ex_tbl_wr = 0;
    else                   ex_tbl_wr = empty_selected;
  end
  else                     ex_tbl_wr = 0;
end // write_control

// Instantiate comparators for each ID in the Exclusive Access Table
// ex_id_eq(i) is asserted if (ex_id(i) == id(i)) *and* entry(i) is valid.
reg  [7:0] id_i, id_j;
reg  [id_width-1:0] temp_ex_id;
always @(ex_id or ex_valid or id)
begin : id_comparator
  for (id_i=0; id_i<num_entries; id_i=id_i+1) begin

    // select id(id_i)
    for (id_j=0; id_j<id_width; id_j=id_j+1)
      temp_ex_id[id_j] = ex_id[id_width*id_i+id_j];

    // infer ID comparator
    ex_id_eq[id_i] = ex_valid[id_i] & (id == temp_ex_id);

  end // for (id_i
end // id_comparator

// Instantiate comparators for each address in the Exclusive Access Table
// ex_addr_eq(i) is asserted if (ex_addr(i) == addr(i)) *and* entry(i) is valid.
reg  [7:0] addr_i, addr_j;
reg  [addr_width-1:0] temp_ex_addr;
always @(ex_addr or ex_valid or addr)
begin : addr_comparator
  for (addr_i=0; addr_i<num_entries; addr_i=addr_i+1) begin

    // select addr(addr_i)
    for (addr_j=0; addr_j<addr_width; addr_j=addr_j+1)
      temp_ex_addr[addr_j] = ex_addr[addr_width*addr_i+addr_j];

    // infer addr comparator
    ex_addr_eq[addr_i] = ex_valid[addr_i] & (addr == temp_ex_addr);

  end // for (addr_i
end // addr_comparator

// ----------------------------------------------------------------------------
// Flip Flops
//
// For each entry (i) in the exclusive access table,
// instantiate the following three sets of flip flops:
//                --------
// -----id--------|D    Q|---ex_id(i)---
// --ex_tbl_wr(i)-|en    |
// ---------------|r     |
// ----clk--------|>     |
//                --------
//                --------
// ----addr-------|D    Q|--ex_addr(i)--
// --ex_tbl_wr(i)-|en    |
// ---------------|r     |
// ----clk--------|>     |
//                --------
//                --------
// -----1---------|D    Q|-ex_valid(i)--
// --ex_tbl_wr(i)-|en    |
// --ex_tbl_r(i)--|r     |
// ----clk--------|>     |
//                --------
// ----------------------------------------------------------------------------

// counters for wire assignments
reg [7:0] entry, id_bit, addr_bit;

always @(ex_tbl_r or ex_tbl_wr or id or ex_id or addr or ex_addr or ex_valid)
begin : next_dff
  for (entry=0; entry<num_entries; entry=entry+1) begin
  
    // assign ID flip flops
    for (id_bit=0; id_bit<id_width; id_bit=id_bit+1)
      next_ex_id[(entry*id_width)+id_bit] = (ex_tbl_wr[entry]) ?
	id[id_bit] : ex_id[(entry*id_width)+id_bit];
    
    // assign address flip flops
    for (addr_bit=0; addr_bit<addr_width; addr_bit=addr_bit+1)
      next_ex_addr[(entry*addr_width)+addr_bit] = (ex_tbl_wr[entry]) ?
	addr[addr_bit] : ex_addr[(entry*addr_width)+addr_bit];
    
    // assign valid flip flops
    if      (ex_tbl_r[entry])   next_ex_valid[entry] = 0;
    else if (ex_tbl_wr[entry])  next_ex_valid[entry] = 1;
    else                        next_ex_valid[entry] = ex_valid[entry];

  end // for (entry
  
end // next_dff


// standard DFFs
always @(posedge clk or negedge reset_n)
begin : dff
  if (!reset_n) begin
    ex_id    <= 0;
    ex_addr  <= 0;
    ex_valid <= 0;
  end
  else begin
    if (clk_en) begin
      ex_id    <= next_ex_id;
      ex_addr  <= next_ex_addr;
      ex_valid <= next_ex_valid;
    end
    else begin
      ex_id    <= ex_id;
      ex_addr  <= ex_addr;
      ex_valid <= ex_valid;
    end
  end
end // dff

endmodule
