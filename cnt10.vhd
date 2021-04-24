----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 2020/12/26 10:28:48
-- Design Name: 
-- Module Name: cnt10 - Behavioral
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

entity cnt10 is
    port(
        CIN:in std_logic;
        CLK: in std_logic;
        DOUT : out std_logic_vector (3 downto 0);
        COUT : OUT std_logic  -- ½øÎ»ÐÅºÅ
    );
end cnt10;

architecture behav of cnt10 is
begin
    process(CIN,CLK)
    variable Q : std_logic_vector (3 downto 0);
    begin
    if CLK = '0' then Q := "0000";
    elsif CLK = '1' then
            if CIN 'event and CIN = '1' then
                if Q = "1001" then 
                    Q := "0000";
                    COUT <= '1';
                else
                    Q := Q+1;
                    COUT <= '0';
                end if;
            end if;
        DOUT <= Q;
    end if;
    end process;
    
end behav;
