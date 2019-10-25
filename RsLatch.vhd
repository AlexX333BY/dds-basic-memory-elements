library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

library UNISIM;
use UNISIM.VComponents.all;

entity RsLatch is
    Port ( S : in  STD_LOGIC;
           R : in  STD_LOGIC;
           nQ : out  STD_LOGIC;
           Q : out  STD_LOGIC);
end RsLatch;

architecture Behavioral of RsLatch is
   signal rs, rsnors: STD_LOGIC;
begin
   rsnors <= rs nor S;
   nQ <= rsnors;
   rs <= rsnors nor R;
   Q <= rs;
end Behavioral;

architecture Structural of RsLatch is
   signal rs, rsnors: STD_LOGIC;
begin
   RS1: NOR2 port map (I0 => rs, I1 => S, O => rsnors);
   RS2: BUF port map (I => rsnors, O => nq);
   RS3: NOR2 port map (I0 => rsnors, I1 => R, O => rs);
   RS4: BUF port map (I => rs, O => Q);
end Structural;

architecture Delayed of RsLatch is
   signal rs, rsnors: STD_LOGIC;
   constant transport_delay: time := 1 ns;
   constant inertial_delay: time := 1 ns;
begin
   rsnors <= inertial rs nor S after inertial_delay;
   rs <= inertial rsnors nor R after inertial_delay;
   nQ <= transport rsnors after transport_delay;
   Q <= transport rs after transport_delay;
end Delayed;
