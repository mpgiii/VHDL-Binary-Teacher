----------------------------------------------------------------------------------
-- Company: 
-- Engineer: Michael Georgariou
-- 
-- Create Date: 06/05/2018 04:34:36 PM
-- Design Name: 
-- Module Name: LEDFSM - Behavioral
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


entity LEDFSM is
	Port ( RESET : in STD_LOGIC;
		   CLK : in STD_LOGIC;
		   DONE : out STD_LOGIC;
		   LEDs : out STD_LOGIC_VECTOR (15 downto 0) );
end component LEDFSM;

architecture Behavioral of FSM is
    type state_type is (a, b, c, d, e, f, g, h, i, j, k, l, m, n, o, p);
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
        case PS is
            when a =>
				SCORE <= "0000";
				DISPLAY <= "00000001";
                if (INPUT = "00000001") then
					NS <= b;
				else 
					NS <= a;
            when b =>
				SCORE <= "0001";
				DISPLAY <= "00000101";
                if (INPUT = "00000101") then
					NS <= c;
				else 
					NS <= b;
            when c =>
				SCORE <= "0010";
				DISPLAY <= "00011001";
                if (INPUT = "00011001") then
					NS <= d;
				else 
					NS <= c;
            when d =>
				SCORE <= "0011";
				DISPLAY <= "00000111";
                if (INPUT = "00000111") then
					NS <= e;
				else 
					NS <= d;
            when e =>
				SCORE <= "0100";
				DISPLAY <= "10000000";
                if (INPUT = "10000000") then
					NS <= f;
				else 
					NS <= e;
			when f =>
				SCORE <= "0101";
				DISPLAY <= "01100100";
                if (INPUT = "01100100") then
					NS <= g;
				else 
					NS <= f;
			when g =>
				SCORE <= "0110";
				DISPLAY <= "01100100";
                if (INPUT = "01100100") then
					NS <= h;
				else 
					NS <= g;
			when h =>
				SCORE <= "0111";
				DISPLAY <= "01010101";
                if (INPUT = "01010101") then
					NS <= i;
				else 
					NS <= h;
			when i =>
				SCORE <= "1000";
				DISPLAY <= "00010110";
                if (INPUT = "00010110") then
					NS <= j;
				else 
					NS <= i;
			when j =>
				SCORE <= "1001";
				DISPLAY <= "00000100";
                if (INPUT = "00000100") then
					NS <= k;
				else 
					NS <= j;
			when k =>
				SCORE <= "1011";
				DISPLAY <= "00001000";
                if (INPUT = "00001000") then
					NS <= l;
				else 
					NS <= k;
			when l =>
				SCORE <= "1100";
				DISPLAY <= "00011101";
                if (INPUT = "00011101") then
					NS <= m;
				else 
					NS <= l;
			when m =>
				SCORE <= "1101";
				DISPLAY <= "11010100";
                if (INPUT = "11010100") then
					NS <= n;
				else 
					NS <= m;
			when n =>
				SCORE <= "1110";
				DISPLAY <= "00001100";
                if (INPUT = "00001100") then
					NS <= o;
				else 
					NS <= n;
			when o =>
				SCORE <= "1111";
				DISPLAY <= "00000000";
				NS <= o;
					
            when others =>
                NS <= a;
        end case;

    end process comb_proc_1;

end Behavioral;
