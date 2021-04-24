----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 2020/12/29 20:11:35
-- Design Name: 
-- Module Name: mux41 - Behavioral
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

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity mux41 is
    Port ( DATA3 : in STD_LOGIC_VECTOR (3 downto 0);
           DATA2 : in STD_LOGIC_VECTOR (3 downto 0);
           DATA1 : in STD_LOGIC_VECTOR (3 downto 0);
           DATA0 : in STD_LOGIC_VECTOR (3 downto 0);
           sel : in STD_LOGIC_VECTOR (1 downto 0);
           data : out STD_LOGIC_VECTOR (3 downto 0));
end mux41;

architecture Behavioral of mux41 is

begin

    data <=     DATA0 when sel(1 downto 0) = "00"else  
			    DATA1 when sel(1 downto 0) = "01"else
				DATA2 when sel(1 downto 0) = "10"else
				DATA3 when sel(1 downto 0) = "11";			


end Behavioral;
