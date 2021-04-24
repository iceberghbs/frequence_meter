----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 2020/12/26 11:25:38
-- Design Name: 
-- Module Name: cnt410 - Behavioral
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
use ieee.std_logic_unsigned.all;
use ieee.std_logic_arith.all;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity cnt410 is
    port(
            signal_in:in std_logic;
            clk_in: in std_logic;
            OUT3 : out std_logic_vector (3 downto 0);
            OUT2 : out std_logic_vector (3 downto 0);
            OUT1 : out std_logic_vector (3 downto 0);
            OUT0 : out std_logic_vector (3 downto 0));
end cnt410;

architecture Behavioral of cnt410 is
component cnt10
port(
        CIN:in std_logic;
        CLK: in std_logic;
        DOUT : out std_logic_vector (3 downto 0);
        COUT : OUT std_logic);
end component;

signal a:std_logic;
signal b:std_logic;
signal c:std_logic;
signal d:std_logic;


begin
uut0_cnt10:cnt10 port map
(   CIN => signal_in,
    CLK => clk_in,
    DOUT => OUT0,
    COUT => a);
    
uut1_cnt10:cnt10 port map
(   CIN => a,
    CLK => clk_in,
    DOUT => OUT1,
    COUT => b);
        
uut2_cnt10:cnt10 port map
(   CIN => b,
    CLK => clk_in,
    DOUT => OUT2,
    COUT => c);

uut3_cnt10:cnt10 port map
(   CIN => c,
    CLK => clk_in,
    DOUT => OUT3,
    COUT => d);

end Behavioral;
