/*
 * Copyright 2020 The SkyWater PDK Authors
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     https://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 *
 * SPDX-License-Identifier: Apache-2.0
*/


`ifndef SKY130_FD_SC_MS__DFBBN_2_FUNCTIONAL_PP_V
`define SKY130_FD_SC_MS__DFBBN_2_FUNCTIONAL_PP_V

/**
 * dfbbn: Delay flop, inverted set, inverted reset, inverted clock,
 *        complementary outputs.
 *
 * Verilog simulation functional model.
 */

`timescale 1ns / 1ps
`default_nettype none

// Import user defined primitives.
`include "../../models/udp_dff_nsr_pp_pg_n/sky130_fd_sc_ms__udp_dff_nsr_pp_pg_n.v"

`celldefine
module sky130_fd_sc_ms__dfbbn_2 (
    Q      ,
    Q_N    ,
    D      ,
    CLK_N  ,
    SET_B  ,
    RESET_B,
    VPWR   ,
    VGND   ,
    VPB    ,
    VNB
);

    // Module ports
    output Q      ;
    output Q_N    ;
    input  D      ;
    input  CLK_N  ;
    input  SET_B  ;
    input  RESET_B;
    input  VPWR   ;
    input  VGND   ;
    input  VPB    ;
    input  VNB    ;

    // Local signals
    wire RESET;
    wire SET  ;
    wire CLK  ;
    wire buf_Q;

    //                                   Delay       Name  Output  Other arguments
    not                                              not0 (RESET , RESET_B                         );
    not                                              not1 (SET   , SET_B                           );
    not                                              not2 (CLK   , CLK_N                           );
    sky130_fd_sc_ms__udp_dff$NSR_pp$PG$N `UNIT_DELAY dff0 (buf_Q , SET, RESET, CLK, D, , VPWR, VGND);
    buf                                              buf0 (Q     , buf_Q                           );
    not                                              not3 (Q_N   , buf_Q                           );

endmodule
`endcelldefine

`default_nettype wire
`endif  // SKY130_FD_SC_MS__DFBBN_2_FUNCTIONAL_PP_V
