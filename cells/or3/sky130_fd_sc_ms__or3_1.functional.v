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


`ifndef SKY130_FD_SC_MS__OR3_1_FUNCTIONAL_V
`define SKY130_FD_SC_MS__OR3_1_FUNCTIONAL_V

/**
 * or3: 3-input OR.
 *
 * Verilog simulation functional model.
 */

`timescale 1ns / 1ps
`default_nettype none

`celldefine
module sky130_fd_sc_ms__or3_1 (
    X,
    A,
    B,
    C
);

    // Module ports
    output X;
    input  A;
    input  B;
    input  C;

    // Local signals
    wire or0_out_X;

    //  Name  Output     Other arguments
    or  or0  (or0_out_X, B, A, C        );
    buf buf0 (X        , or0_out_X      );

endmodule
`endcelldefine

`default_nettype wire
`endif  // SKY130_FD_SC_MS__OR3_1_FUNCTIONAL_V
