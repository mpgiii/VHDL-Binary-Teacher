----------------------------------------------------------------------------------
-- Company: 
-- Engineer: Michael Georgariou
-- 
-- Create Date: 05/10/2018 04:14:00 PM

----------------------------------------------------------------------------------


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;


entity MUX is
    Port ( S : in STD_LOGIC;
           D0 : in STD_LOGIC_VECTOR(7 downto 0);
           D1 : in STD_LOGIC_VECTOR(7 downto 0);
           F : out STD_LOGIC_VECTOR(7 downto 0));
end MUX;

architecture Behavioral of MUX is

begin

    with S select
    F <= D0 when '0',
         D1 when others;

end Behavioral;

