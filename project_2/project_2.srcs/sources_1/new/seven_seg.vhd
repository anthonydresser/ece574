----------------------------------------------------------------------------------
-- Company: WPI
-- Engineer: Anthony Dresser Mailbox # 87
-- 
-- Create Date: 09/08/2015 02:33:46 PM
-- Design Name: Seven Segment Display
-- Module Name: seven_seg - Behavioral
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

entity seven_seg is
    Port ( SW : in STD_LOGIC_VECTOR (3 downto 0);
           SEG : out STD_LOGIC_VECTOR (6 downto 0));
end seven_seg;

architecture Behavioral of seven_seg is

begin

    SEG <= "0000001" when SW = "0000" else
        "1001111" when SW = "0001" else
        "0010010" when SW = "0010" else
        "0000110" when SW = "0011" else
        "1001100" when SW = "0100" else
        "0100100" when SW = "0101" else
        "0100000" when SW = "0110" else
        "0001111" when SW = "0111" else
        "0000000" when SW = "1000" else
        "0000100" when SW = "1001" else
        "0001000" when SW = "1010" else
        "1100000" when SW = "1011" else
        "0110001" when SW = "1100" else
        "1000010" when SW = "1101" else
        "0110000" when SW = "1110" else 
        "0111000";
        


end Behavioral;
