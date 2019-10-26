--------------------------------------------------------------------------------
-- Copyright (c) 1995-2013 Xilinx, Inc.  All rights reserved.
--------------------------------------------------------------------------------
--   ____  ____
--  /   /\/   /
-- /___/  \  /    Vendor: Xilinx
-- \   \   \/     Version: P.20131013
--  \   \         Application: netgen
--  /   /         Filename: RsLatch_timesim.vhd
-- /___/   /\     Timestamp: Sat Oct 26 10:27:35 2019
-- \   \  /  \ 
--  \___\/\___\
--             
-- Command	: -intstyle ise -s 3 -pcf RsLatch.pcf -rpw 100 -tpw 0 -ar Structure -tm RsLatch -insert_pp_buffers true -w -dir netgen/par -ofmt vhdl -sim RsLatch.ncd RsLatch_timesim.vhd 
-- Device	: 7a100tcsg324-3 (PRODUCTION 1.10 2013-10-13)
-- Input file	: RsLatch.ncd
-- Output file	: /home/alexx333by/Documents/dds-basic-memory-elements/netgen/par/RsLatch_timesim.vhd
-- # of Entities	: 1
-- Design Name	: RsLatch
-- Xilinx	: /home/alexx333by/.bin/Xilinx/14.7/ISE_DS/ISE/
--             
-- Purpose:    
--     This VHDL netlist is a verification model and uses simulation 
--     primitives which may not represent the true implementation of the 
--     device, however the netlist is functionally correct and should not 
--     be modified. This file cannot be synthesized and should only be used 
--     with supported simulation tools.
--             
-- Reference:  
--     Command Line Tools User Guide, Chapter 23
--     Synthesis and Simulation Design Guide, Chapter 6
--             
--------------------------------------------------------------------------------

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library SIMPRIM;
use SIMPRIM.VCOMPONENTS.ALL;
use SIMPRIM.VPACKAGE.ALL;

entity RsLatchPlaceRoute is
  port (
    S : in STD_LOGIC := '0'; 
    R : in STD_LOGIC := '1'; 
    nQ : out STD_LOGIC; 
    Q : out STD_LOGIC 
  );
end RsLatchPlaceRoute;

architecture Structure of RsLatchPlaceRoute is
  signal rs : STD_LOGIC; 
  signal R_IBUF_21 : STD_LOGIC; 
  signal S_IBUF_22 : STD_LOGIC; 
  signal rsnors : STD_LOGIC; 
  signal ProtoComp1_INTERMDISABLE_GND_0 : STD_LOGIC; 
  signal S_ProtoComp1_INTERMDISABLE_GND_0 : STD_LOGIC; 
  signal NlwBufferSignal_Q_OBUF_I : STD_LOGIC; 
  signal NlwBufferSignal_nQ_OBUF_I : STD_LOGIC; 
begin
  Q_OBUF : X_OBUF
    generic map(
      LOC => "IOB_X1Y148"
    )
    port map (
      I => NlwBufferSignal_Q_OBUF_I,
      O => Q
    );
  ProtoComp1_INTERMDISABLE_GND : X_ZERO
    generic map(
      LOC => "IOB_X1Y146"
    )
    port map (
      O => ProtoComp1_INTERMDISABLE_GND_0
    );
  R_IBUF : X_IBUF_INTERMDISABLE_TPWRGT
    generic map(
      LOC => "IOB_X1Y146"
    )
    port map (
      IBUFDISABLE => '0',
      INTERMDISABLE => ProtoComp1_INTERMDISABLE_GND_0,
      O => R_IBUF_21,
      I => R,
      TPWRGT => '1'
    );
  ProtoComp1_INTERMDISABLE_GND_1 : X_ZERO
    generic map(
      LOC => "IOB_X1Y149"
    )
    port map (
      O => S_ProtoComp1_INTERMDISABLE_GND_0
    );
  S_IBUF : X_IBUF_INTERMDISABLE_TPWRGT
    generic map(
      LOC => "IOB_X1Y149"
    )
    port map (
      IBUFDISABLE => '0',
      INTERMDISABLE => S_ProtoComp1_INTERMDISABLE_GND_0,
      O => S_IBUF_22,
      I => S,
      TPWRGT => '1'
    );
  nQ_OBUF : X_OBUF
    generic map(
      LOC => "IOB_X1Y147"
    )
    port map (
      I => NlwBufferSignal_nQ_OBUF_I,
      O => nQ
    );
  RS3 : X_LUT6
    generic map(
      LOC => "SLICE_X89Y146",
      INIT => X"000000000000FFFF"
    )
    port map (
      ADR0 => '1',
      ADR1 => '1',
      ADR2 => '1',
      ADR3 => '1',
      ADR4 => rsnors,
      ADR5 => R_IBUF_21,
      O => rs
    );
  RS1 : X_LUT6
    generic map(
      LOC => "SLICE_X89Y147",
      INIT => X"00000F0F00000F0F"
    )
    port map (
      ADR0 => '1',
      ADR1 => '1',
      ADR5 => '1',
      ADR3 => '1',
      ADR2 => rs,
      ADR4 => S_IBUF_22,
      O => rsnors
    );
  NlwBufferBlock_Q_OBUF_I : X_BUF
    generic map(
      PATHPULSE => 50 ps
    )
    port map (
      I => rs,
      O => NlwBufferSignal_Q_OBUF_I
    );
  NlwBufferBlock_nQ_OBUF_I : X_BUF
    generic map(
      PATHPULSE => 50 ps
    )
    port map (
      I => rsnors,
      O => NlwBufferSignal_nQ_OBUF_I
    );
  NlwBlockROC : X_ROC
    generic map (ROC_WIDTH => 100 ns)
    port map (O => GSR);
  NlwBlockTOC : X_TOC
    port map (O => GTS);

end Structure;

