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


`ifndef SKY130_FD_SC_MS__DLRTN_4_FUNCTIONAL_PP_V
`define SKY130_FD_SC_MS__DLRTN_4_FUNCTIONAL_PP_V

/**
 * dlrtn: Delay latch, inverted reset, inverted enable, single output.
 *
 * Verilog simulation functional model.
 */

`timescale 1ns / 1ps
`default_nettype none

// Import user defined primitives.
`include "../../models/udp_dlatch_pr_pp_pg_n/sky130_fd_sc_ms__udp_dlatch_pr_pp_pg_n.v"

`celldefine
module sky130_fd_sc_ms__dlrtn_4 (
    Q      ,
    RESET_B,
    D      ,
    GATE_N ,
    VPWR   ,
    VGND   ,
    VPB    ,
    VNB
);

    // Module ports
    output Q      ;
    input  RESET_B;
    input  D      ;
    input  GATE_N ;
    input  VPWR   ;
    input  VGND   ;
    input  VPB    ;
    input  VNB    ;

    // Local signals
    wire RESET  ;
    wire intgate;
    wire buf_Q  ;

    //                                     Delay       Name     Output   Other arguments
    not                                                not0    (RESET  , RESET_B                        );
    not                                                not1    (intgate, GATE_N                         );
    sky130_fd_sc_ms__udp_dlatch$PR_pp$PG$N `UNIT_DELAY dlatch0 (buf_Q  , D, intgate, RESET, , VPWR, VGND);
    buf                                                buf0    (Q      , buf_Q                          );

endmodule
`endcelldefine

`default_nettype wire
`endif  // SKY130_FD_SC_MS__DLRTN_4_FUNCTIONAL_PP_V
