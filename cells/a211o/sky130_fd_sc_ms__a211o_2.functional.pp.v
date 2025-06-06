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


`ifndef SKY130_FD_SC_MS__A211O_2_FUNCTIONAL_PP_V
`define SKY130_FD_SC_MS__A211O_2_FUNCTIONAL_PP_V

/**
 * a211o: 2-input AND into first input of 3-input OR.
 *
 *        X = ((A1 & A2) | B1 | C1)
 *
 * Verilog simulation functional model.
 */

`timescale 1ns / 1ps
`default_nettype none

// Import user defined primitives.
`include "../../models/udp_pwrgood_pp_pg/sky130_fd_sc_ms__udp_pwrgood_pp_pg.v"

`celldefine
module sky130_fd_sc_ms__a211o_2 (
    X   ,
    A1  ,
    A2  ,
    B1  ,
    C1  ,
    VPWR,
    VGND,
    VPB ,
    VNB
);

    // Module ports
    output X   ;
    input  A1  ;
    input  A2  ;
    input  B1  ;
    input  C1  ;
    input  VPWR;
    input  VGND;
    input  VPB ;
    input  VNB ;

    // Local signals
    wire and0_out         ;
    wire or0_out_X        ;
    wire pwrgood_pp0_out_X;

    //                                 Name         Output             Other arguments
    and                                and0        (and0_out         , A1, A2               );
    or                                 or0         (or0_out_X        , and0_out, C1, B1     );
    sky130_fd_sc_ms__udp_pwrgood_pp$PG pwrgood_pp0 (pwrgood_pp0_out_X, or0_out_X, VPWR, VGND);
    buf                                buf0        (X                , pwrgood_pp0_out_X    );

endmodule
`endcelldefine

`default_nettype wire
`endif  // SKY130_FD_SC_MS__A211O_2_FUNCTIONAL_PP_V
