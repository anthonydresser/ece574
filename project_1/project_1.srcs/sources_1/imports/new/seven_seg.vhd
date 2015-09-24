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
use ieee.std_logic_unsigned.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity seven_seg is
    Port ( SW : in STD_LOGIC_VECTOR (15 downto 0);
           CLK : in STD_LOGIC;
           RS: in STD_LOGIC;
           AN : out STD_LOGIC_VECTOR (7 downto 0);
           SEG : out STD_LOGIC_VECTOR (6 downto 0));
end seven_seg;

architecture Behavioral of seven_seg is

component decoder port(
    input : in STD_LOGIC_VECTOR (3 downto 0);
    output : out STD_LOGIC_VECTOR (6 downto 0)
);
end component;

type state_type is (s0, s1, s2, s3);
signal current_state : state_type;
signal next_state : state_type;
signal switch_1 : std_logic_vector (6 downto 0);
signal switch_2 : std_logic_vector (6 downto 0);
signal switch_3 : std_logic_vector (6 downto 0);
signal switch_4 : std_logic_vector (6 downto 0);

signal count_1k : std_logic_vector (15 downto 0);
signal update : std_logic;

begin

    decoder1 : decoder port map (
        input => SW (3 downto 0),
        output => switch_1
    );
    
    decoder2 : decoder port map (
        input => SW (7 downto 4),
        output => switch_2
    );
    
    decoder3 : decoder port map (
        input => SW (11 downto 8),
        output => switch_3
    );
    
    decoder4 : decoder port map (
        input => SW (15 downto 12),
        output => switch_4
    );
    
    process(CLK, update, RS)
    begin
        if RS = '1' then
            current_state <= s0;
        elsif rising_edge(CLK) and update = '1' then
            current_state <= next_state;
        end if;
    end process;

    process(CLK, update)
    begin
        if rising_edge(CLK) and update = '1' then
            case current_state is
                when s0 =>
                    next_state <= s1;
                when s1 =>
                    next_state <= s2;
                when s2 =>
                    next_state <= s3;
                when s3 =>
                    next_state <= s0;
            end case;
        end if;
    end process;
    
    process(CLK, update)
    begin
        if rising_edge(CLK) and update = '1' then
            case current_state is
                when s0 =>
                    AN <= "11111110";
                    SEG <= switch_1;
                when s1 =>
                    AN <= "11111101";
                    SEG <= switch_2;
                when s2 =>
                    AN <= "11111011";
                    SEG <= switch_3;
                when s3 =>
                    AN <= "11110111";
                    SEG <= switch_4;
            end case;
        end if;
    end process;
    
     process (CLK, rs)
     begin
            if rs = '1' then
                count_1k <= (OTHERS => '0');
            elsif rising_edge(CLK) then
                if count_1k = 9999 then
                    count_1k <= (OTHERS => '0');
                else
                    count_1k <= count_1k + 1;
                end if;
            end if;
     end process;
     
     update <= '1' when count_1k = 0 else '0';

end Behavioral;
