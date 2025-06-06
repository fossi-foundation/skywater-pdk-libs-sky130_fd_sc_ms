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


`ifndef SKY130_FD_SC_MS__SDFSTP_1_FUNCTIONAL_V
`define SKY130_FD_SC_MS__SDFSTP_1_FUNCTIONAL_V

/**
 * sdfstp: Scan delay flop, inverted set, non-inverted clock,
 *         single output.
 *
 * Verilog simulation functional model.
 */

`timescale 1ns / 1ps
`default_nettype none

// Import user defined primitives.
`include "../../models/udp_dff_ps/sky130_fd_sc_ms__udp_dff_ps.v"
`include "../../models/udp_mux_2to1/sky130_fd_sc_ms__udp_mux_2to1.v"

`celldefine
module sky130_fd_sc_ms__sdfstp_1 (
    Q    ,
    CLK  ,
    D    ,
    SCD  ,
    SCE  ,
    SET_B
);

    // Module ports
    output Q    ;
    input  CLK  ;
    input  D    ;
    input  SCD  ;
    input  SCE  ;
    input  SET_B;

    // Local signals
    wire buf_Q  ;
    wire SET    ;
    wire mux_out;

    //                            Delay       Name       Output   Other arguments
    not                                       not0      (SET    , SET_B            );
    sky130_fd_sc_ms__udp_mux_2to1             mux_2to10 (mux_out, D, SCD, SCE      );
    sky130_fd_sc_ms__udp_dff$PS   `UNIT_DELAY dff0      (buf_Q  , mux_out, CLK, SET);
    buf                                       buf0      (Q      , buf_Q            );

endmodule
`endcelldefine

`default_nettype wire
`endif  // SKY130_FD_SC_MS__SDFSTP_1_FUNCTIONAL_V
