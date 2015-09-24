----------------------------------------------------------------------------------
-- Company: WPI
-- Engineer: Anthony Dresser Mailbox # 87
-- 
-- Create Date: 09/08/2015 02:49:39 PM
-- Design Name: Seven Segment Control
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

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity top_level is
    Port ( SW : in STD_LOGIC_VECTOR (3 downto 0);
           AN : out STD_LOGIC_VECTOR (7 downto 0);
           LED : out STD_LOGIC_VECTOR (15 downto 0);
           SEG : out STD_LOGIC_VECTOR (6 downto 0));
end top_level;

architecture Behavioral of top_level is
    component seven_seg
        port(SW : in STD_LOGIC_VECTOR (3 downto 0);
             SEG : out STD_LOGIC_VECTOR (6 downto 0));
    end component;
    component decoder
        port(SW: in STD_LOGIC_VECTOR (3 downto 0);
             LED : out STD_LOGIC_VECTOR (15 downto 0));
    end component;

begin

    AN <= "11111110";

    DISPLAY1: seven_seg port map
        (SW=>SW, SEG=>SEG);
        
    DECODER1: decoder port map
        (SW=>SW, LED=>LED);

end Behavioral;
