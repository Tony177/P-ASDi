----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 13.01.2022 19:25:39
-- Design Name: 
-- Module Name: control_unit - Behavioral
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

entity control_unit is
    Port ( 
           clk, reset, start, s: in STD_LOGIC;
           wr_AQ: out STD_LOGIC:='0'; 
           incr: out std_LOGIC;     --incrementa contatore
           subtract: out std_logic; --tipo di operazione da effettuare (se alta allora è una sottrazione altrimenti somma)
           shift: out std_logic;    -- shifta a sx di 1
           en_load : out std_logic;
           q_i: out std_logic;   -- valore della cifra q_i da porre nel registro AQ
           stop: in std_logic --indica la fine delle iterazioni
          );
end control_unit;

architecture Behavioral of control_unit is
type stato is (q_start,q0,shift1, shift2, q_wait, check, restore, complete_restore, write,load);
signal stato_corrente : stato := q_start;

begin
    process(clk)
    begin
        if(clk = '1' and clk'event) then
         case stato_corrente is
                when q_start => if(reset = '1') then
                                    stato_corrente <= q0;
                                 else 
                                    stato_corrente <= q_start;
                                 end if;
                when q0 => if(start = '1')  then 
                            stato_corrente <= shift1;
                           else
                            stato_corrente <= q0;
                            end if;
                            
                when shift1 =>   en_load <= '0';
                                  subtract <= '1';
                                 if(stop = '1') then                                    
                                  stato_corrente <= q_start;
                                 else
                                  shift <= '1';
                                  incr <='1';
                                  stato_corrente <= shift2;
                                 end if;
                                 
                                 
               when shift2 =>     shift <= '0';
                                  incr <= '0';
                                 stato_corrente <= q_wait;    
                                 
                when q_wait =>   stato_corrente <= check;  
                                 
                when check =>    if(s = '0') then
                                   q_i <= '1';
                                   stato_corrente <= write;    
                                 else     
                                   q_i <= '0'; 
                                   wr_AQ <= '1';
                                   stato_corrente <= restore;  
                                 end if;  
                                 
                                 
               when restore =>   wr_AQ <= '0';
                                 subtract <= '0';
                                 stato_corrente <= complete_restore;
                   
               when complete_restore =>  stato_corrente <= write; 
                                         
               when write => wr_AQ <= '1';
                             stato_corrente <= load; 
               
               when load => wr_AQ <= '0';
                            en_load <= '1';
                            stato_corrente <= shift1; 
                                                                 
               when others =>   stato_corrente <= q_start;      
               end case;     
           end if;
    end process;

end Behavioral;
