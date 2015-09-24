----------------------------------------------------------------------------------
-- Company: WPI
-- Engineer: Anthony Dresser Mailbox # 87
-- 
-- Create Date: 09/07/2015 05:55:32 PM
-- Design Name: 4 to 16 Decoder
-- Module Name: decoder - Behavioral
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

entity decoder is
    Port ( SW : in STD_LOGIC_VECTOR (3 downto 0);
           LED : out STD_LOGIC_VECTOR (15 downto 0));
end decoder;

architecture Behavioral of decoder is

begin

    LED <= "0000000000000001" when SW = "0000" else
        "0000000000000010" when SW = "0001" else
        "0000000000000100" when SW = "0010" else
        "0000000000001000" when SW = "0011" else
        "0000000000010000" when SW = "0100" else
        "0000000000100000" when SW = "0101" else
        "0000000001000000" when SW = "0110" else
        "0000000010000000" when SW = "0111" else
        "0000000100000000" when SW = "1000" else
        "0000001000000000" when SW = "1001" else
        "0000010000000000" when SW = "1010" else
        "0000100000000000" when SW = "1011" else
        "0001000000000000" when SW = "1100" else
        "0010000000000000" when SW = "1101" else
        "0100000000000000" when SW = "1110" else
        "1000000000000000";

end Behavioral;
