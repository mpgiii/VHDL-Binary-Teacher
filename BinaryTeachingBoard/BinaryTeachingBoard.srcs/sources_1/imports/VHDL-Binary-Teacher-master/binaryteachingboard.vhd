----------------------------------------------------------------------------------
-- Engineer: Michael Georgariou
-- 
-- Create Date: 06/05/2018 04:40:36 PM
-- Project Name: Binary Teaching Board
----------------------------------------------------------------------------------

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;

entity game is
    Port ( reset : in STD_LOGIC;
           switches : in STD_LOGIC_VECTOR (7 downto 0);
           clk : in STD_LOGIC;
           leds : out STD_LOGIC_VECTOR (15 downto 0);
           segments : out STD_LOGIC_VECTOR (7 downto 0);
           disp_en : out STD_LOGIC_VECTOR (3 downto 0));
end game;

architecture Behavioral of game is

    component scoreFSM is
        Port ( RESET : in STD_LOGIC;
               INPUT : in STD_LOGIC_VECTOR (7 downto 0);
               CLK : in STD_LOGIC;
               SCORE : out STD_LOGIC_VECTOR (7 downto 0);
               DISPLAY : out STD_LOGIC_VECTOR (7 downto 0) );
    end component scoreFSM;
	
    component LEDFSM is
        Port ( RESET : in STD_LOGIC;
               CLK : in STD_LOGIC;
               DONE : out STD_LOGIC;
               LEDs : out STD_LOGIC_VECTOR (15 downto 0) );
    end component LEDFSM;
	
	component MUX is
		Port ( S : in STD_LOGIC;
			   D0 : in STD_LOGIC_VECTOR(7 downto 0);
			   D1 : in STD_LOGIC_VECTOR(7 downto 0);
			   F : out STD_LOGIC_VECTOR(7 downto 0));
	end component MUX;
	
    component clk_div2 is
        Port (  clk : in std_logic;
               sclk : out std_logic);
    end component clk_div2;
    
    component sseg_dec is
        Port (      ALU_VAL : in std_logic_vector(7 downto 0); 
                       SIGN : in std_logic;
                      VALID : in std_logic;
                        CLK : in std_logic;
                    DISP_EN : out std_logic_vector(3 downto 0);
                   SEGMENTS : out std_logic_vector(7 downto 0));
    end component sseg_dec;
    
    signal slow : std_logic;
	signal realinput : std_logic_vector (7 downto 0);
	signal thescore, nextnumber : std_logic_vector (7 downto 0);
	signal doneformux : std_logic;
	signal whattodisplay : std_logic_vector (7 downto 0);

begin

    slowdown : clk_div2 port map ( clk => CLK,
                                   sclk => slow );
	
	LEDclock : LEDFSM port map ( RESET => reset,
								 CLK => slow,
								 DONE => doneformux,
								 LEDs => leds );
	
	MUX1 : MUX port map ( S => doneformux,
						  D0 => switches,
						  D1 => "00000000",
						  F => realinput );
						  
	TheGameItself : scoreFSM port map ( RESET => reset,
										INPUT => realinput,
										CLK => clk,
										SCORE => thescore,
										DISPLAY => nextnumber );
	
	MUX2 : MUX port map ( S => doneformux,
						  D1 => thescore,
						  D0 => nextnumber,
						  F => whattodisplay );
						  
	DisplayIt : sseg_dec port map ( ALU_VAL => whattodisplay,
									SIGN => '0',
									VALID => '1',
									CLK => clk,
									DISP_EN => disp_en,
									SEGMENTS => segments );

end Behavioral;