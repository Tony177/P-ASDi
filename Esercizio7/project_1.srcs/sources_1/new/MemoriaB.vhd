----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 03.01.2022 12:07:03
-- Design Name: 
-- Module Name: MemoriaB - Behavioral
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
use IEEE.math_real."log2";
use IEEE.math_real."ceil";
use IEEE.std_logic_unsigned.all;
use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity MemoriaB is
  Generic(N:positive; M:positive);--N è il numero di locazioni delle Y, la memoria totale sarà quindi 2N
  Port (clk: in std_logic;
        read, write: in std_logic:='0';
        Data_read: out std_logic_vector(0 to M-1):=(others=> '0');
        Data_write: in std_logic_vector(0 to M-1):=(others =>'0');
        counter_value: in std_logic_vector ( 1 to integer( ceil( log2(real(N) ) ) ) ));
end MemoriaB;

architecture Behavioral of MemoriaB is
type memoria is array (0 to 2*N-1) of std_logic_vector(0 to M-1);
signal mem: memoria :=("0001",
                    "0010",
                    "0011",
                    "0100",
                    "0000",
                    "0000",
                    "0000",
                    "0000");
signal temp_Data_read:std_logic_vector(0 to M-1):=(others=> '0');
begin
process(clk)
variable fine: integer:= integer(ceil(log2(real(N))));
    begin
        if(clk='1' and clk'event) then
            if(read='1') then
                temp_Data_read<= mem(to_integer(unsigned(counter_value(1 to fine))));
             elsif(write ='1') then
                mem(to_integer(unsigned(counter_value(1 to fine)))+N)<= Data_write;
             end if;
          end if;
    end process;

Data_read <= temp_data_read;
end Behavioral;
