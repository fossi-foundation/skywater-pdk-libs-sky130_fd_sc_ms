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


`ifndef SKY130_FD_SC_MS__O2111AI_2_FUNCTIONAL_V
`define SKY130_FD_SC_MS__O2111AI_2_FUNCTIONAL_V

/**
 * o2111ai: 2-input OR into first input of 4-input NAND.
 *
 *          Y = !((A1 | A2) & B1 & C1 & D1)
 *
 * Verilog simulation functional model.
 */

`timescale 1ns / 1ps
`default_nettype none

`celldefine
module sky130_fd_sc_ms__o2111ai_2 (
    Y ,
    A1,
    A2,
    B1,
    C1,
    D1
);

    // Module ports
    output Y ;
    input  A1;
    input  A2;
    input  B1;
    input  C1;
    input  D1;

    // Local signals
    wire or0_out    ;
    wire nand0_out_Y;

    //   Name   Output       Other arguments
    or   or0   (or0_out    , A2, A1             );
    nand nand0 (nand0_out_Y, C1, B1, D1, or0_out);
    buf  buf0  (Y          , nand0_out_Y        );

endmodule
`endcelldefine

`default_nettype wire
`endif  // SKY130_FD_SC_MS__O2111AI_2_FUNCTIONAL_V
