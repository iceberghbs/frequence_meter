----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 2020/12/26 21:08:34
-- Design Name: 
-- Module Name: frq_meter - Behavioral
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

entity frq_meter is
Port( 
           clk_frq_meter : in STD_LOGIC;
           signal_frq_meter : in STD_LOGIC;  -- 注释后内输出测试
           sel_frq_meter : out STD_LOGIC_VECTOR (3 downto 0);
           a : out STD_LOGIC;
           b : out STD_LOGIC;
           c : out STD_LOGIC;
           d : out STD_LOGIC;
           e : out STD_LOGIC;
           f : out STD_LOGIC;
           g : out STD_LOGIC
--            seg : out STD_LOGIC_VECTOR (6 downto 0)
           );
end frq_meter;

ARCHITECTURE Behavioral of frq_meter is


--component frq_div2
--    Port(   clk : in STD_LOGIC;
--            clkout : out std_logic);
--end component;

component frq_div
    Port(   clk : in STD_LOGIC;
            clkout : out std_logic);
end component;

component cnt410
    port(
            signal_in:in std_logic;
            clk_in: in std_logic;
            OUT3 : out std_logic_vector (3 downto 0);
            OUT2 : out std_logic_vector (3 downto 0);
            OUT1 : out std_logic_vector (3 downto 0);
            OUT0 : out std_logic_vector (3 downto 0));
end component;

component DFF
    Port (  D : in STD_LOGIC_VECTOR(3 downto 0);
            CLK_DFF : in STD_LOGIC;
            Q : out STD_LOGIC_VECTOR(3 downto 0));
end component;

component led7_refresh
    Port(   
            CLK : in STD_LOGIC;
            DATA3: in STD_LOGIC_VECTOR(3 downto 0);
            DATA2: in STD_LOGIC_VECTOR(3 downto 0);
            DATA1: in STD_LOGIC_VECTOR(3 downto 0);
            DATA0: in STD_LOGIC_VECTOR(3 downto 0);
            SEL : out STD_LOGIC_VECTOR(3 downto 0);
            A:out std_logic;
            B:out std_logic;
            C:out std_logic;
            D:out std_logic;
            E:out std_logic;
            F:out std_logic;
            G:out std_logic);
end component;

--component seven_seg_controller
--    Port (    
--          cclk : in STD_LOGIC;
--          segdata : in STD_LOGIC_VECTOR(3 downto 0);  --某一位的二进制输入
--          seg_select : out STD_LOGIC_VECTOR(1 downto 0);  -- 地址输出 to mux41
--          seg : out STD_LOGIC_VECTOR(6 downto 0);  -- 一个位的控制
--          an : out STD_LOGIC_VECTOR(3 downto 0));
--end component;

--component mux41
--    Port ( DATA3 : in STD_LOGIC_VECTOR (3 downto 0);
--       DATA2 : in STD_LOGIC_VECTOR (3 downto 0);
--       DATA1 : in STD_LOGIC_VECTOR (3 downto 0);
--       DATA0 : in STD_LOGIC_VECTOR (3 downto 0);
--       sel : in STD_LOGIC_VECTOR (1 downto 0);
--       data : out STD_LOGIC_VECTOR (3 downto 0));
--end component;

signal m:std_logic;
--signal n:std_logic;
--signal sel_mux:std_logic_vector(1 downto 0);
--signal segdata:std_logic_vector(3 downto 0);

signal dffin3:STD_LOGIC_VECTOR(3 downto 0);
signal dffin2:STD_LOGIC_VECTOR(3 downto 0);
signal dffin1:STD_LOGIC_VECTOR(3 downto 0);
signal dffin0:STD_LOGIC_VECTOR(3 downto 0);

signal dffout3:STD_LOGIC_VECTOR(3 downto 0);
signal dffout2:STD_LOGIC_VECTOR(3 downto 0);
signal dffout1:STD_LOGIC_VECTOR(3 downto 0);
signal dffout0:STD_LOGIC_VECTOR(3 downto 0);

BEGIN


--uut_frq_div2:frq_div2 port map
--(   clk => clk_frq_meter,
--    clkout => n);

uut_frq_div:frq_div port map
(   clk => clk_frq_meter,
    clkout => m);

uut_cnt410:cnt410 port map
(   signal_in => signal_frq_meter,
    clk_in => m,
    OUT3 =>dffin3,
    OUT2 =>dffin2,
    OUT1 =>dffin1,
    OUT0 =>dffin0);

uut_DFF3:DFF port map
(   D => dffin3,
    CLK_DFF => m,
    Q => dffout3);

uut_DFF2:DFF port map
(   D => dffin2,
    CLK_DFF => m,
    Q => dffout2);

uut_DFF1:DFF port map
(   D => dffin1,
    CLK_DFF => m,
    Q => dffout1);

uut_DFF0:DFF port map
(   D => dffin0,
    CLK_DFF => m,
    Q => dffout0);

uut_led7_refresh:led7_refresh port map
(   CLK => clk_frq_meter,
    DATA3 => dffout3,
    DATA2 => dffout2,
    DATA1 => dffout1,
    DATA0 => dffout0,
    SEL => sel_frq_meter,
    A => a,
    B => b,
    C => c,
    D => d,
    E => e,
    F => f,
    G => g);

--uut_mux41:mux41 port map
--(   DATA3 => dffout3,
--    DATA2 => dffout2,
--    DATA1 => dffout1,
--    DATA0 => dffout0,
--    sel => sel_mux,
--    data => segdata);

--uut_seven_seg_controller:seven_seg_controller port map
--(       cclk => n,
--        segdata => segdata,  --某一位的二进制输入
--        seg_select => sel_mux,  -- 位选输出 
--        seg => seg,  -- 一个位的控制
--        an => sel_frq_meter);

end Behavioral;
