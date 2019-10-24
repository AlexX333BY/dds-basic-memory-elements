library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity DTrigger is
    Port ( D : in  STD_LOGIC;
           C : in  STD_LOGIC;
           Q : out  STD_LOGIC);
end DTrigger;

architecture Behavioral of DTrigger is
   signal dt : STD_LOGIC;
begin
   Main : process (D, C)
   begin
      if rising_edge(C) then
         dt <= D;
      end if;
   end process;
   
   Q <= dt;
end Behavioral;
