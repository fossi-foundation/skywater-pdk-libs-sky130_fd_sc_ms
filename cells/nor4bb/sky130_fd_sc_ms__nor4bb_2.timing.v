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


`ifndef SKY130_FD_SC_MS__NOR4BB_2_TIMING_V
`define SKY130_FD_SC_MS__NOR4BB_2_TIMING_V

/**
 * nor4bb: 4-input NOR, first two inputs inverted.
 *
 * Verilog simulation timing model.
 */

`timescale 1ns / 1ps
`default_nettype none

`celldefine
module sky130_fd_sc_ms__nor4bb_2 (
    Y  ,
    A  ,
    B  ,
    C_N,
    D_N
);

    // Module ports
    output Y  ;
    input  A  ;
    input  B  ;
    input  C_N;
    input  D_N;

    // Module supplies
    supply1 VPWR;
    supply0 VGND;
    supply1 VPB ;
    supply0 VNB ;

    // Local signals
    wire nor0_out  ;
    wire and0_out_Y;

    //  Name  Output      Other arguments
    nor nor0 (nor0_out  , A, B              );
    and and0 (and0_out_Y, nor0_out, C_N, D_N);
    buf buf0 (Y         , and0_out_Y        );

specify
(A -=> Y) = (0:0:0,0:0:0);
(B -=> Y) = (0:0:0,0:0:0);
(C_N +=> Y) = (0:0:0,0:0:0);
(D_N +=> Y) = (0:0:0,0:0:0);
endspecify
endmodule
`endcelldefine

`default_nettype wire
`endif  // SKY130_FD_SC_MS__NOR4BB_2_TIMING_V
