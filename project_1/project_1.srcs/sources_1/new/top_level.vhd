----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 09/12/2015 01:47:46 PM
-- Design Name: 
-- Module Name: top_level - Behavioral
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
use ieee.std_logic_unsigned.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity top_level is
  Port ( SW: in std_logic_vector (15 downto 0);
         CLK: in std_logic;
         RS: in std_logic;
         AN: out std_logic_vector (7 downto 0);
         SEG: out std_logic_vector (6 downto 0);
         colors: out std_logic_vector (11 downto 0);
         HS: out std_logic;
         VS: out std_logic);
end top_level;

architecture Behavioral of top_level is

component seven_seg
port
(
    SW : in STD_LOGIC_VECTOR (15 downto 0);
    CLK : in STD_LOGIC;
    RS: in STD_LOGIC;
    AN : out STD_LOGIC_VECTOR (7 downto 0);
    SEG : out STD_LOGIC_VECTOR (6 downto 0)
);
end component;

component colorlogic
port
(
    blank : in STD_LOGIC;
    sw : in STD_LOGIC_VECTOR (3 downto 0);
    hcount : in STD_LOGIC_VECTOR (10 downto 0);
    vcount : in STD_LOGIC_VECTOR (10 downto 0);
    colors : in STD_LOGIC_VECTOR (11 downto 0)
);
end component;

component vga_controller_640_60
port(
   rst         : in std_logic;
   pixel_clk   : in std_logic;

   HS          : out std_logic;
   VS          : out std_logic;
   hcount      : out std_logic_vector(10 downto 0);
   vcount      : out std_logic_vector(10 downto 0);
   blank       : out std_logic
);
end component;

component clk_wiz_0
port
 (-- Clock in ports
  clk_in1           : in     std_logic;
  -- Clock out ports
  clk_10M          : out    std_logic;
    clk_25M          : out    std_logic;
  -- Status and control signals
  reset             : in     std_logic;
  locked            : out    std_logic
 );
end component;

ATTRIBUTE SYN_BLACK_BOX : BOOLEAN;
ATTRIBUTE SYN_BLACK_BOX OF clk_wiz_0 : COMPONENT IS TRUE;


ATTRIBUTE BLACK_BOX_PAD_PIN : STRING;
ATTRIBUTE BLACK_BOX_PAD_PIN OF clk_wiz_0 : COMPONENT IS "clk_in1,clk_10M,reset,locked";

signal clk_10M : std_logic;
signal clk_25M : std_logic;
signal blank : std_logic;
signal hcount : std_logic_vector (10 downto 0);
signal vcount : std_logic_vector (10 downto 0);

begin

    clk_wiz_10M : clk_wiz_0
       port map ( 
    
       -- Clock in ports
       clk_in1 => CLK,
      -- Clock out ports  
       clk_10M => clk_10M,
       clk_25M => clk_25M,
      -- Status and control signals                
       reset => RS           
     );
     
     vga : vga_controller_640_60
     port map (
        rst => RS,
        pixel_clk => clk_25M,
        HS => HS,
        VS => VS,
        hcount => hcount,
        vcount => vcount,
        blank => blank
     );
     
     color : colorlogic
     port map (
        blank => blank,
        sw => SW (3 downto 0),
        hcount => hcount,
        vcount => vcount,
        colors => colors
     );
     
--     seven_seg_dis : seven_seg
--        port map (
        
--            SW => SW,
--            CLK => clk_10M,
--            RS => RS,
--            AN => AN,
--            SEG => SEG
        
--        );

end Behavioral;
