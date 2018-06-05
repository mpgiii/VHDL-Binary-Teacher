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
				DONE <= '0';
				LEDS <= "1000000000000000";
				NS <= b;
            when b =>
				DONE <= '0';
				LEDS <= "0100000000000000";
				NS <= c;
            when c =>
				DONE <= '0';
				LEDS <= "0010000000000000";
				NS <= d;
            when d =>
				DONE <= '0';
				LEDS <= "0001000000000000";
				NS <= e;
            when e =>
				DONE <= '0';
				LEDS <= "0000100000000000";
				NS <= f;
            when f =>
				DONE <= '0';
				LEDS <= "0000010000000000";
				NS <= g;
            when g =>
				DONE <= '0';
				LEDS <= "0000001000000000";
				NS <= h;
            when h =>
				DONE <= '0';
				LEDS <= "0000000100000000";
				NS <= i;
            when i =>
				DONE <= '0';
				LEDS <= "0000000010000000";
				NS <= j;
            when j =>
				DONE <= '0';
				LEDS <= "0000000001000000";
				NS <= k;
            when k =>
				DONE <= '0';
				LEDS <= "0000000000100000";
				NS <= l;
            when l =>
				DONE <= '0';
				LEDS <= "0000000000010000";
				NS <= m;
            when m =>
				DONE <= '0';
				LEDS <= "0000000000001000";
				NS <= n;
            when n =>
				DONE <= '0';
				LEDS <= "0000000000000100";
				NS <= o;
            when o =>
				DONE <= '0';
				LEDS <= "0000000000000010";
				NS <= p;
            when p =>
				DONE <= '1';
				LEDS <= "1111111111111111";
				NS <= p;
					
            when others =>
                NS <= a;
        end case;

    end process comb_proc_1;

end Behavioral;
