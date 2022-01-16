----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 13.01.2022 15:02:04
-- Design Name: 
-- Module Name: divisore - Structural
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
use work.all;
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;
--vedere bene dim registro AQ e quali bit prendere
entity divisore is
     generic( N: integer := 4);  --(N è la lunghezza del dividendo, M è la lunghezza del divisore)
     port(
            clk:in std_logic;
            start: in std_logic;
            reset: in std_logic;
            input_dividendo: in std_logic_vector(N-1 downto 0); 
            input_divisore: in std_logic_vector(N-1 downto 0); 
            output: out std_logic_vector(2*N-1 downto 0) --op1 resto,op2 quoz
        );
end divisore;

architecture Structural of divisore is

    component registroAQ 
    generic( N: integer := N); 
    port(
        clk:in std_logic;
        reset: in std_logic;
        start: in std_logic;
        en_load : in std_logic;
        input: in std_logic_vector(N-1 downto 0); 
        input_resto_parziale: in std_logic_vector(N-1 downto 0) := (others => '0'); 
        shift: in std_logic := '0';    -- shifta a sx di 1
        q_i: in std_logic := '0';   -- valore della cifra q_i
        write: in std_logic;
        output: out std_logic_vector(2*N-1 downto 0)
    );
    end component;
    
    component registroV 
    generic( N: integer:= N); 
    port(
        clk:in std_logic;
        reset: in std_logic;
        input: in std_logic_vector(N-1 downto 0); 
        start: in std_logic;
        output: out std_logic_vector(N-1 downto 0)
    );
    end component;
    
    
    component contatore
     Generic ( N : integer:= N);
    Port ( clock : in STD_LOGIC;
           reset : in STD_LOGIC; 
           ab : in STD_LOGIC:='0'; 
           output : out STD_LOGIC_VECTOR (1 to integer( ceil( log2(real(N) ) ) )):=(others =>'0');
           div : out STD_LOGIC:='0');
    end component;
    
    component control_unit
    Port ( 
           clk, reset, start, s: in STD_LOGIC;
           wr_AQ: out STD_LOGIC:='0'; 
           en_load : out std_logic;
           incr: out std_LOGIC;     --incrementa contatore
           subtract: out std_logic; --tipo di operazione da effettuare (se alta allora è una sottrazione altrimenti somma)
           shift: out std_logic;    -- shifta a sx di 1
           q_i: out std_logic;   -- valore della cifra q_i da porre nel registro AQ
           stop: in std_logic
          );
    end component;
   
--   component xor_inversione 
--    Generic ( M : integer:= M);
--    Port ( 
--          -- clock : in STD_LOGIC;
--           input1 : in STD_LOGIC_VECTOR (M-1 downto 0); 
--           input2 : in std_logic:='0'; 
--           output : out STD_LOGIC_VECTOR (M-1 downto 0)
--          );
   
--   end component;
   
   component adder_subtracter 
    Generic ( N : integer:= N);
    Port ( 
           X : in STD_LOGIC_VECTOR (N-1 downto 0);
           Y : in STD_LOGIC_VECTOR (N-1 downto 0);
           c_in : in STD_LOGIC;
           c_out : out STD_LOGIC;
           Z : out STD_LOGIC_VECTOR (N-1 downto 0)
          );
   end component;

--signal input_dividendo: std_logic_vector(N-1 downto 0);
signal shift,q_i,wr_AQ,subtract,segno,incr,stop,en_load: std_logic;
signal Ri: std_logic_vector(N-1 downto 0);
signal AQ_uscitacompleta: std_logic_vector(2*N-1 downto 0);
signal output_Ri_next: std_logic_vector(N-1 downto 0);
signal output_V: std_logic_vector(N-1 downto 0);

begin


reg_AQ:  registroAQ 
    port map(
        clk => clk,
        reset => reset,
        start => start,
        en_load => en_load,
        input => input_dividendo,   --N
        input_resto_parziale => output_Ri_next,
        shift => shift,
        q_i => q_i,
        write => wr_AQ,
        output => AQ_uscitacompleta  --N+M (in uscita tutto il registro)
    );
    
    Ri <= AQ_uscitacompleta(2*N-1 downto N);
    output <= AQ_uscitacompleta(2*N-1 downto 0);
    
    
reg_V:  registroV 
    generic map( N => N)
    port map(
        clk => clk,
        reset => reset,
        start => start,
        input => input_divisore,    --M
        output => output_V          --M
    );

-- xor_1: xor_inversione 
--    Generic map ( M =>  M)
--    Port map( 
--          -- clock : in STD_LOGIC;
--           input1 => output_V,
--           input2 => subtract,
--           output => output_V_xor
--          );
  
sommatore:  adder_subtracter 
    Port map ( 
           X => Ri, 
           Y => output_V,
           c_in => subtract,
           c_out => open,
           Z => output_Ri_next
          );
        
 segno <= output_Ri_next(N-1);
          
cu: control_unit
    Port map( 
           clk => clk, 
           reset => reset, 
           start => start, 
           s => segno,
           en_load => en_load,
           wr_AQ => wr_AQ, 
           incr => incr,
           subtract => subtract,
           shift => shift,
           q_i => q_i,
           stop => stop
          );
     
 contat: contatore
        Generic map( N => N)
        Port map( 
               clock => clk,
               reset => reset,
               ab => incr,
               output => open,
               div => stop
           );
    
  
end Structural;
