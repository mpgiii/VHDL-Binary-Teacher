----------------------------------------------------------------------------------
-- Company: 
-- Engineer: Michael Georgariou
-- 
-- Create Date: 06/05/2018 04:34:36 PM
-- Design Name: 
-- Module Name: scoreFSM - Behavioral
-- Project Name: 
-- Target Devices: 
-- Tool Versions: 
-- Description: 
-- 
-- Dependencies: 
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
-- 
----------------------------------------------------------------------------------


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;


entity scoreFSM is
	Port ( RESET : in STD_LOGIC;
		   INPUT : in STD_LOGIC_VECTOR (7 downto 0);
		   CLK : in STD_LOGIC;
		   SCORE : out STD_LOGIC_VECTOR (7 downto 0);
		   DISPLAY : out STD_LOGIC_VECTOR (7 downto 0) );
end scoreFSM;

architecture Behavioral of scoreFSM is
    type state_type is (a, b, c, d, e, f, g, h, i, j, k, l, m, n, o);
    signal PS, NS : state_type;

begin

sync_proc: process (CLK, NS, RESET)
    begin
        if (RESET = '1') then 
            PS <= a;
        elsif (rising_edge(CLK)) then 
            PS <= NS;
        end if;
    end process sync_proc;
    
comb_proc_1: process (PS, INPUT)
    begin
        SCORE <= "00000000";
        DISPLAY <= "00000000";
        case PS is
            when a =>
				SCORE <= "00000000";
				DISPLAY <= "00000001";
                if (INPUT = "00000001") then
					NS <= b;
				else 
					NS <= a;
                end if;
            when b =>
				SCORE <= "00000001";
				DISPLAY <= "00000101";
                if (INPUT = "00000101") then
					NS <= c;
				else 
					NS <= b;
                end if;
            when c =>
				SCORE <= "00000010";
				DISPLAY <= "00011001";
                if (INPUT = "00011001") then
					NS <= d;
				else 
					NS <= c;
                end if;
            when d =>
				SCORE <= "00000011";
				DISPLAY <= "00000111";
                if (INPUT = "00000111") then
					NS <= e;
				else 
					NS <= d;
                end if;
            when e =>
				SCORE <= "00000100";
				DISPLAY <= "10000000";
                if (INPUT = "10000000") then
					NS <= f;
				else 
					NS <= e;
                end if;
			when f =>
				SCORE <= "00000101";
				DISPLAY <= "01100100";
                if (INPUT = "01100100") then
					NS <= g;
				else 
					NS <= f;
                end if;
			when g =>
				SCORE <= "00000110";
				DISPLAY <= "01100100";
                if (INPUT = "01100100") then
					NS <= h;
				else 
					NS <= g;
                end if;
			when h =>
				SCORE <= "00000111";
				DISPLAY <= "01010101";
                if (INPUT = "01010101") then
					NS <= i;
				else 
					NS <= h;
                end if;
			when i =>
				SCORE <= "00001000";
				DISPLAY <= "00010110";
                if (INPUT = "00010110") then
					NS <= j;
				else 
					NS <= i;
                end if;
			when j =>
				SCORE <= "00001001";
				DISPLAY <= "00000100";
                if (INPUT = "00000100") then
					NS <= k;
				else 
					NS <= j;
                end if;
			when k =>
				SCORE <= "00001011";
				DISPLAY <= "00001000";
                if (INPUT = "00001000") then
					NS <= l;
				else 
					NS <= k;
                end if;
			when l =>
				SCORE <= "00001100";
				DISPLAY <= "00011101";
                if (INPUT = "00011101") then
					NS <= m;
				else 
					NS <= l;
                end if;
			when m =>
				SCORE <= "00001101";
				DISPLAY <= "11010100";
                if (INPUT = "11010100") then
					NS <= n;
				else 
					NS <= m;
                end if;
			when n =>
				SCORE <= "00001110";
				DISPLAY <= "00001100";
                if (INPUT = "00001100") then
					NS <= o;
				else 
					NS <= n;
                end if;
			when o =>
				SCORE <= "00001111";
				DISPLAY <= "00000000";
				NS <= o;
					
            when others =>
                NS <= a;
        end case;

    end process comb_proc_1;

end Behavioral;