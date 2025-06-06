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


`ifndef SKY130_FD_SC_MS__NAND2_2_TIMING_V
`define SKY130_FD_SC_MS__NAND2_2_TIMING_V

/**
 * nand2: 2-input NAND.
 *
 * Verilog simulation timing model.
 */

`timescale 1ns / 1ps
`default_nettype none

`celldefine
module sky130_fd_sc_ms__nand2_2 (
    Y,
    A,
    B
);

    // Module ports
    output Y;
    input  A;
    input  B;

    // Module supplies
    supply1 VPWR;
    supply0 VGND;
    supply1 VPB ;
    supply0 VNB ;

    // Local signals
    wire nand0_out_Y;

    //   Name   Output       Other arguments
    nand nand0 (nand0_out_Y, B, A           );
    buf  buf0  (Y          , nand0_out_Y    );

specify
(A -=> Y) = (0:0:0,0:0:0);
(B -=> Y) = (0:0:0,0:0:0);
endspecify
endmodule
`endcelldefine

`default_nettype wire
`endif  // SKY130_FD_SC_MS__NAND2_2_TIMING_V
