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


`ifndef SKY130_FD_SC_MS__XNOR2_1_TIMING_PP_V
`define SKY130_FD_SC_MS__XNOR2_1_TIMING_PP_V

/**
 * xnor2: 2-input exclusive NOR.
 *
 *        Y = !(A ^ B)
 *
 * Verilog simulation timing model.
 */

`timescale 1ns / 1ps
`default_nettype none

// Import user defined primitives.
`include "../../models/udp_pwrgood_pp_pg/sky130_fd_sc_ms__udp_pwrgood_pp_pg.v"

`celldefine
module sky130_fd_sc_ms__xnor2_1 (
    Y   ,
    A   ,
    B   ,
    VPWR,
    VGND,
    VPB ,
    VNB
);

    // Module ports
    output Y   ;
    input  A   ;
    input  B   ;
    input  VPWR;
    input  VGND;
    input  VPB ;
    input  VNB ;

    // Local signals
    wire xnor0_out_Y      ;
    wire pwrgood_pp0_out_Y;

    //                                 Name         Output             Other arguments
    xnor                               xnor0       (xnor0_out_Y      , A, B                   );
    sky130_fd_sc_ms__udp_pwrgood_pp$PG pwrgood_pp0 (pwrgood_pp0_out_Y, xnor0_out_Y, VPWR, VGND);
    buf                                buf0        (Y                , pwrgood_pp0_out_Y      );

specify
if ((B)) (A +=> Y ) = (0:0:0,0:0:0);  // delays are tris,tfall
if ((!B)) (A -=> Y ) = (0:0:0,0:0:0);  // delays are tris,tfall
if ((A)) (B +=> Y ) = (0:0:0,0:0:0);  // delays are tris,tfall
if ((!A)) (B -=> Y ) = (0:0:0,0:0:0);  // delays are tris,tfall
endspecify
endmodule
`endcelldefine

`default_nettype wire
`endif  // SKY130_FD_SC_MS__XNOR2_1_TIMING_PP_V
