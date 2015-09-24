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
    Port ( input : in STD_LOGIC_VECTOR (3 downto 0);
           output : out STD_LOGIC_VECTOR (6 downto 0));
end decoder;

architecture Behavioral of decoder is

constant zero_char : std_logic_vector (6 downto 0) := "0000001";
constant one_char : std_logic_vector (6 downto 0) := "1001111";
constant two_char : std_logic_vector (6 downto 0) := "0010010";
constant three_char : std_logic_vector (6 downto 0) := "0000110";
constant four_char : std_logic_vector (6 downto 0) := "1001100";
constant five_char : std_logic_vector (6 downto 0) := "0100100";
constant six_char : std_logic_vector (6 downto 0) := "0100000";
constant seven_char : std_logic_vector (6 downto 0) := "0001111";
constant eight_char : std_logic_vector (6 downto 0) := "0000000";
constant nine_char : std_logic_vector (6 downto 0) := "0000100";
constant a_char : std_logic_vector (6 downto 0) := "0001000";
constant b_char : std_logic_vector (6 downto 0) := "1100000";
constant c_char : std_logic_vector (6 downto 0) := "0110001";
constant d_char : std_logic_vector (6 downto 0) := "1000010";
constant e_char : std_logic_vector (6 downto 0) := "0110000";
constant f_char : std_logic_vector (6 downto 0) := "0111000";

begin

    output <= zero_char when input = "0000" else
        one_char when input = "0001" else
        two_char when input = "0010" else
        three_char when input = "0011" else
        four_char when input = "0100" else
        five_char when input = "0101" else
        six_char when input = "0110" else
        seven_char when input = "0111" else
        eight_char when input = "1000" else
        nine_char when input = "1001" else
        a_char when input = "1010" else
        b_char when input = "1011" else
        c_char when input = "1100" else
        d_char when input = "1101" else
        e_char when input = "1110" else
        f_char;

end Behavioral;
