----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 31.12.2021 15:20:40
-- Design Name: 
-- Module Name: interfaccia - Behavioral
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

entity interfacciaA is
    generic( M: positive);
    Port ( 
            clk : in STD_LOGIC;
            ris : in STD_LOGIC;
            div : in STD_LOGIC;
            datain : in STD_LOGIC_VECTOR(0 to M-1):=(others => '0');
            r : out STD_LOGIC;
            read : out STD_LOGIC:='0';
            dataout : out STD_LOGIC_VECTOR(0 to M-1):=(others => '0'));
end interfacciaA;

architecture Behavioral of interfacciaA is
 type state is (q0,q1,q2,q3,q4,q5,q6);
 signal stato_corrente,stato_prossimo: state:= q0;
 signal r_temp : std_logic := '0';
 signal data_temp: STD_LOGIC_VECTOR(0 to M-1):=(others => '0');
begin
    process(clk)
    begin
        if(clk = '1' and clk'event) then
            case stato_corrente is
                when q0 => if(div = '1') then 
                                stato_corrente <= q0;
                            else 
                                stato_corrente <= q1; 
                                read <= '1'; 
                            end if;
                when q1 => read <= '0';
                           --data_temp <= datain;
                           stato_corrente <= q2;
                           --read <= '1';
                when q2=>  data_temp <= datain;
                           r_temp <= '1';
                           stato_corrente <= q3;
                when q3=>  if(ris = '0') then 
                                stato_corrente <= q3; 
                           else 
                                stato_corrente <= q4; 
                           end if;
                           
                when q4 => r_temp <= '0';
                           stato_corrente <= q5;
                           
                when q5 => if(div = '1') then
                                stato_corrente <= q0;
                            else 
                                read <= '1';
                                stato_corrente <= q6;
                            end if;
                when q6 =>  read <= '0';
                            --data_temp<= datain;
                            if(ris = '0') then
                                stato_corrente <= q2;
                            else 
                                 stato_corrente <= q6;
                            end if;                          
                when others => stato_corrente <= q0;
             end case;
          end if;
    end process;
    
    r <= r_temp;
    dataout <= data_temp;


end Behavioral;
-- ricorda, la lettura del dato ci mette 3 colpi di clock