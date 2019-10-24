library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity DTriggerSyncSetAsyncReset is
    Port ( D : in  STD_LOGIC;
           C : in  STD_LOGIC;
           S : in  STD_LOGIC;
           R : in  STD_LOGIC;
           Q : out  STD_LOGIC);
end DTriggerSyncSetAsyncReset;

architecture Behavioral of DTriggerSyncSetAsyncReset is
   signal dtssar : STD_LOGIC;
begin
   Main : process (D, C, S, R)
   begin
      if R = '1' then
         dtssar <= '0';
      elsif rising_edge(C) then
         if S = '1' then
            dtssar <= '1';
         else
            dtssar <= D;
         end if;
      end if;
   end process;

   Q <= dtssar;
end Behavioral;
