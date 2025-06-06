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


`ifndef SKY130_FD_SC_MS__DLYMETAL6S6S_1_TIMING_V
`define SKY130_FD_SC_MS__DLYMETAL6S6S_1_TIMING_V

/**
 * dlymetal6s6s: 6-inverter delay with output from 6th inverter on
 *               horizontal route.
 *
 * Verilog simulation timing model.
 */

`timescale 1ns / 1ps
`default_nettype none

`celldefine
module sky130_fd_sc_ms__dlymetal6s6s_1 (
    X,
    A
);

    // Module ports
    output X;
    input  A;

    // Module supplies
    supply1 VPWR;
    supply0 VGND;
    supply1 VPB ;
    supply0 VNB ;

    // Local signals
    wire buf0_out_X;

    //  Name  Output      Other arguments
    buf buf0 (buf0_out_X, A              );
    buf buf1 (X         , buf0_out_X     );

specify
(A +=> X ) = (0:0:0,0:0:0);  // delays are tris,tfall
endspecify
endmodule
`endcelldefine

`default_nettype wire
`endif  // SKY130_FD_SC_MS__DLYMETAL6S6S_1_TIMING_V
