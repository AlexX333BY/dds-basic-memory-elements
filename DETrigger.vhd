library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity DETrigger is
    Port ( D : in  STD_LOGIC;
           E : in  STD_LOGIC;
           C : in  STD_LOGIC;
           Q : out  STD_LOGIC);
end DETrigger;

architecture Behavioral of DETrigger is
   signal det : STD_LOGIC;
begin
   Main : process(D, E, C)
   begin
      if rising_edge(C) and E = '1' then
         det <= D;
      end if;
   end process;
   
   Q <= det;
end Behavioral;
