/* ---------------------------------------------------------------------
**
**                  (C) COPYRIGHT 2001-2011 SYNOPSYS, INC.
**                            ALL RIGHTS RESERVED
**
**  This software and the associated documentation are confidential and
**  proprietary to Synopsys, Inc.  Your use or disclosure of this
**  software is subject to the terms and conditions of a written
**  license agreement between you, or your company, and Synopsys, Inc.
**
**  The entire notice above must be reproduced on all authorized copies.
**
** ---------------------------------------------------------------------
**
** File     : tb_gen_lp.v
** Abstract : Generates stimuli for low power port
**
**
** ---------------------------------------------------------------------
*/

module tb_gen_lp (
  resetn,
  clk,                                            // System clock
  csysack,
  cactive,
  csysreq,
  clk_lp
);

localparam PowerOn    = 3'b000;
localparam PerReqPD   = 3'b001;
localparam LPCReqPD   = 3'b010;
localparam StopClock  = 3'b011;
localparam PowerOff   = 3'b100;
localparam StartClock = 3'b101;
localparam PerReqPU   = 3'b110; // not used
localparam LPCReqPU   = 3'b111;

input        resetn;
input        clk;
input        csysack;
input        cactive;
output       csysreq;
output       clk_lp;

wire         resetn;
wire         clk;
wire         csysack;
wire         cactive;

reg          csysreq;
reg          clk_lp;

reg    [2:0] state;

reg          shutdown;
reg          shutdown_negclk;
reg          clocklevel;

reg    [7:0] random_PowerOn;
reg    [7:0] random_PowerOn_count;
reg    [3:0] random_PerReqPD;
reg    [3:0] random_PerReqPD_count;
reg    [3:0] random_LPCReqPD;
reg    [3:0] random_LPCReqPD_count;
reg    [3:0] random_StopClock;
reg    [3:0] random_StopClock_count;
reg    [3:0] random_StartClock;
reg    [3:0] random_StartClock_count;
reg    [3:0] random_PowerOff;
reg    [3:0] random_PowerOff_count;


always@(posedge clk or negedge resetn)
begin
  if(~resetn)
  begin
    state                   <= PowerOn;
    random_PowerOn          <= 0;
    random_PowerOn_count    <= 0;
    random_PerReqPD         <= 0;
    random_PerReqPD_count   <= 0;
    random_LPCReqPD         <= 0;
    random_LPCReqPD_count   <= 0;
    random_StopClock        <= 0;
    random_StopClock_count  <= 0;
    random_StartClock       <= 0;
    random_StartClock_count <= 0;
    random_PowerOff         <= 0;
    random_PowerOff_count   <= 0;
  end
  else
  begin
    case(state)

    PowerOn    : begin
              if ( cactive == 1'b0 )
              begin
                random_PerReqPD_count <= 0;
                     random_PerReqPD       <= $random;
                state                 <= PerReqPD;
              end
              else
                   begin
                if ( random_PowerOn == random_PowerOn_count )
                begin
                       random_LPCReqPD_count <= 0;
                       random_LPCReqPD       <= $random;
                       state                 <= LPCReqPD;
                     end
                else
                begin
                       random_PowerOn_count  <= random_PowerOn_count + 1;
                       state                 <= PowerOn;
                     end
              end
            end

    PerReqPD   : begin
         if ( cactive == 1'b1 ) begin
            random_PowerOn_count <= 0;
            random_PowerOn       <= $random + 8;
            state                <= PowerOn;
         end
         else begin
            if ( random_PerReqPD == random_PerReqPD_count ) begin
               random_StopClock_count <= 0;
               random_StopClock       <= $random + 1; // at least one clock cycle is needed to sample csysack low
               state                  <= StopClock;
            end
            else begin
               random_PerReqPD_count <= random_PerReqPD_count + 1;
               state                 <= PerReqPD;
            end
         end
       end

    LPCReqPD   : begin
         if ( cactive == 1'b0 ) begin
              random_StopClock_count <= 0;
              random_StopClock       <= $random + 1; // at least one clock cycle is needed to sample csysack low
              state                  <= StopClock;
         end
         else begin
            if ( random_LPCReqPD == random_LPCReqPD_count)
            begin
               random_PowerOn_count <= 0;
               random_PowerOn       <= $random + 8;
               state                <= PowerOn;
            end
            else begin
               random_LPCReqPD_count <= random_LPCReqPD_count + 1;
               state                 <= LPCReqPD;
            end
         end
       end

    StopClock  : begin
         if ( cactive== 1'b1 ) begin
                random_StartClock_count <= 0;
                random_StartClock       <= $random;
                state                   <= StartClock;
         end
         else begin
            if ( random_StopClock == random_StopClock_count ) begin
               random_PowerOff_count <= 0;
               random_PowerOff       <= $random + 8;
               clocklevel            <= $random;
               state                 <= PowerOff;
            end
            else begin
               random_StopClock_count <= random_StopClock_count + 1;
               state                  <= StopClock;
            end
         end
       end

    PowerOff   : begin
         if ( cactive==1'b1 ) begin
             random_StartClock_count <= 0;
             random_StartClock       <= $random;
             state                   <= StartClock;
         end
         else begin
            if ( random_PowerOff == random_PowerOff_count ) begin
               random_StartClock_count <= 0;
               random_StartClock       <= $random;
               state                   <= StartClock;
            end
            else begin
                random_PowerOff_count <= random_PowerOff_count + 1;
                state                 <= PowerOff;
            end
         end
       end

    StartClock : begin
         if ( random_StartClock == random_StartClock_count )
            state <= LPCReqPU;
         else begin
            random_StartClock_count <= random_StartClock_count + 1;
            state                   <= StartClock;
         end
       end
    LPCReqPU   : begin
         if ( cactive==1'b1 ) begin
             random_PowerOn_count <= 0;
             random_PowerOn       <= $random + 8;
             state                <= PowerOn;
         end
         else
            state <= LPCReqPU;
         end

    endcase
  end
end

always@(*)
  if ( ( state == PowerOn ) || ( state == PerReqPD ) || ( state == LPCReqPU ) )
    csysreq = 1'b1;
  else
    csysreq = 1'b0;

always@(*)
  if ( state == PowerOff )
    shutdown = 1'b1;
  else
    shutdown = 1'b0;

always@(negedge clk)
  shutdown_negclk = shutdown;

always@(*)
  begin
    if(shutdown && clocklevel)
      clk_lp = 1'b1;
    else
    begin
      if(shutdown_negclk && ~clocklevel)
        clk_lp = 1'b0;
      else
        clk_lp = clk;
    end
  end

endmodule
