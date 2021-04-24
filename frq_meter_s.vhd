----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 2020/12/26 23:06:40
-- Design Name: 
-- Module Name: frq_meter_s - Behavioral
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

entity frq_meter_s is
--  Port ( );
end frq_meter_s;

architecture Behavioral of frq_meter_s is
 --------------------------------------------------------¶¥²ã·ÂÕæ
--component frq_meter
--Port( 
--           clk_frq_meter : in STD_LOGIC;
--           signal_frq_meter : in STD_LOGIC;
--           sel_frq_meter : out STD_LOGIC_VECTOR (3 downto 0);
--           a : out STD_LOGIC;
--           b : out STD_LOGIC;
--           c : out STD_LOGIC;
--           d : out STD_LOGIC;
--           e : out STD_LOGIC;
--           f : out STD_LOGIC;
--           g : out STD_LOGIC
----           seg : out STD_LOGIC_VECTOR (6 downto 0)
--           );
--end component;
-------------------------------------------------------------------------

signal clk_frq_meter:STD_LOGIC;
signal signal_frq_meter:STD_LOGIC;
signal sel_frq_meter:STD_LOGIC_VECTOR(3 downto 0):="0000";
signal a : STD_LOGIC;
signal b : STD_LOGIC;
signal c : STD_LOGIC;
signal d : STD_LOGIC;
signal e : STD_LOGIC;
signal f : STD_LOGIC;
signal g : STD_LOGIC;
--signal seg : STD_LOGIC_VECTOR (6 downto 0);
--  °ëÖÜÆÚ
constant period_signal:time:= 100 ms;
constant period_clk:time:= 10 ms;

-- ---------------------------------------------------µ×²ã·ÂÕæ    
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

signal m:std_logic;
--signal n:std_logic;

signal dffin3:STD_LOGIC_VECTOR(3 downto 0);
signal dffin2:STD_LOGIC_VECTOR(3 downto 0);
signal dffin1:STD_LOGIC_VECTOR(3 downto 0);
signal dffin0:STD_LOGIC_VECTOR(3 downto 0);

signal dffout3:STD_LOGIC_VECTOR(3 downto 0);
signal dffout2:STD_LOGIC_VECTOR(3 downto 0);
signal dffout1:STD_LOGIC_VECTOR(3 downto 0);
signal dffout0:STD_LOGIC_VECTOR(3 downto 0);
----------------------------------------------------------------


BEGIN
-------------------------------------------------------¶¥²ã·ÂÕæ
--uut_frq_meter:frq_meter port map
--(   clk_frq_meter => clk_frq_meter,
--    signal_frq_meter => signal_frq_meter,
--    sel_frq_meter => sel_frq_meter,
--    a => a,
--    b => a,
--    c => a,
--    d => a,
--    e => a,
--    f => a,
--    g => a
----    seg => seg
--               );
----------------------------------------------------------------

-- -----------------------------------------------------------µ×²ã·ÂÕæ
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
-------------------------------------------------------------------------

signal_frq_meter_process:process
begin
    signal_frq_meter <= '0';
    wait for period_signal;
    signal_frq_meter <= '1';
    wait for period_signal;
end process;

clk_frq_meter_process:process
begin
    clk_frq_meter <= '0';
    wait for period_clk;
    clk_frq_meter <= '1';
    wait for period_clk;
end process;

end Behavioral;
