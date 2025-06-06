/**
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

`ifndef SKY130_FD_SC_MS__OR3B_TB_V
`define SKY130_FD_SC_MS__OR3B_TB_V

/**
 * or3b: 3-input OR, first input inverted.
 *
 * Autogenerated test bench.
 *
 * WARNING: This file is autogenerated, do not modify directly!
 */

`timescale 1ns / 1ps
`default_nettype none

`include "sky130_fd_sc_ms__or3b.v"

module top();

    // Inputs are registered
    reg A;
    reg B;
    reg C_N;
    reg VPWR;
    reg VGND;
    reg VPB;
    reg VNB;

    // Outputs are wires
    wire X;

    initial
    begin
        // Initial state is x for all inputs.
        A    = 1'bX;
        B    = 1'bX;
        C_N  = 1'bX;
        VGND = 1'bX;
        VNB  = 1'bX;
        VPB  = 1'bX;
        VPWR = 1'bX;

        #20   A    = 1'b0;
        #40   B    = 1'b0;
        #60   C_N  = 1'b0;
        #80   VGND = 1'b0;
        #100  VNB  = 1'b0;
        #120  VPB  = 1'b0;
        #140  VPWR = 1'b0;
        #160  A    = 1'b1;
        #180  B    = 1'b1;
        #200  C_N  = 1'b1;
        #220  VGND = 1'b1;
        #240  VNB  = 1'b1;
        #260  VPB  = 1'b1;
        #280  VPWR = 1'b1;
        #300  A    = 1'b0;
        #320  B    = 1'b0;
        #340  C_N  = 1'b0;
        #360  VGND = 1'b0;
        #380  VNB  = 1'b0;
        #400  VPB  = 1'b0;
        #420  VPWR = 1'b0;
        #440  VPWR = 1'b1;
        #460  VPB  = 1'b1;
        #480  VNB  = 1'b1;
        #500  VGND = 1'b1;
        #520  C_N  = 1'b1;
        #540  B    = 1'b1;
        #560  A    = 1'b1;
        #580  VPWR = 1'bx;
        #600  VPB  = 1'bx;
        #620  VNB  = 1'bx;
        #640  VGND = 1'bx;
        #660  C_N  = 1'bx;
        #680  B    = 1'bx;
        #700  A    = 1'bx;
    end

    sky130_fd_sc_ms__or3b dut (.A(A), .B(B), .C_N(C_N), .VPWR(VPWR), .VGND(VGND), .VPB(VPB), .VNB(VNB), .X(X));

endmodule

`default_nettype wire
`endif  // SKY130_FD_SC_MS__OR3B_TB_V
