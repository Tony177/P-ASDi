----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 14.12.2021 15:53:52
-- Design Name: 
-- Module Name: debouncer - Behavioral
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

entity debouncer is
    generic (                       
        CLK_period:   integer := 10;  -- periodo del clock della board 10 nanosecondi
        button_noise_time:   integer := 20 --intervallo di tempo in cui si ha l'oscillazione del bottone
                                         --assumo che duri 6.5ms=6500microsec=6500000ns
    );
    Port ( button : in STD_LOGIC;
           clk : in STD_LOGIC;
           cleared_button : out STD_LOGIC);
end debouncer;

architecture Behavioral of debouncer is
type stato is (NOT_PRESSED, PRESSED);
signal button_state : stato := NOT_PRESSED;

constant max_count : integer := button_noise_time/CLK_period; -- 6500000/10= conto 650000 colpi di clock
begin

deb: process (CLK)
variable count: integer := 0;

begin
   if(CLK'event and CLK = '1') then
	   	  case button_state is
			when NOT_PRESSED =>
			    cleared_button<= '0';
				if( button = '1' ) then
					button_state <= PRESSED;
				else 
					button_state <= NOT_PRESSED;
				end if;
            when PRESSED =>  --in questo modo ho una finestra del button pari proprio a quanto clicco il button e non una finestra pari al periodo di clk
               if(count = max_count-1) then   -- se premo il pulsante per un tempo maggiore di quello di noise
                       count :=0;
                       cleared_button <= '1';
                       button_state <= NOT_PRESSED;
               else if( button = '0') then
                           count:= count+1;
                     end if;
               end if;
            when others => 
                button_state <= NOT_PRESSED;
		  end case;
    --end if;  
  end if;  
end process;


end Behavioral;

