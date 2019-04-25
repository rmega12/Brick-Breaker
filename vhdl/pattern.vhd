--Pattern module
--Still in development. currently has a border and a paddle based on an adjustable paddle_x location

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity pattern is
Port(
    valid : in std_logic;
    count_horz : in unsigned  (9 downto 0);
    count_vert : in unsigned  (9 downto 0);
    paddle_x : in unsigned (9 downto 0);
    RGB_pattern : out std_logic_vector (5 downto 0)
    );
 end pattern;
  
architecture synth of pattern is

signal RGB : std_logic_vector (5 downto 0);

begin

RGB <= "111111" when (count_horz < (paddle_x + 40) and count_horz > (paddle_x - 40) and count_vert < 450 and count_vert > 440) or
                     (count_horz < 4 or count_horz > 635 or count_vert < 4)
                     else "000000";

RGB_pattern <= RGB;
end synth;
