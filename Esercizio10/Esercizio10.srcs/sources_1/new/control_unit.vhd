----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 17.01.2022 12:30:08
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
    GENERIC(N : integer:= 2);
    port(
        clk: in std_logic;
        enable: in std_logic_vector(0 to 3);
        start: in std_logic;
        data_in: in std_logic_vector(0 to (N+2)*4-1);
        data_out: out std_logic_vector(0 to (N)*4-1);
        ind_source: out std_logic_vector(1 downto 0);
        ind_dest: out std_logic_vector(1 downto 0)
    );
end control_unit;

architecture Structural of control_unit is
    component mux_4_1
    generic( N: integer:= N+2);
    Port ( a1 : in STD_LOGIC_VECTOR (0 to N-1) ;
           a2 : in STD_LOGIC_VECTOR (0 to N-1) ;
           a3 : in STD_LOGIC_VECTOR (0 to N-1) ;
           a4 : in STD_LOGIC_VECTOR (0 to N-1) ; 
           s : in STD_LOGIC_VECTOR (0 to 1);
           o : out STD_LOGIC_VECTOR(0 to N-1));
    end component;
    
    component demux_4_1
    Generic (N: integer := N);
    Port ( output: out STD_LOGIC_VECTOR (0 to 4*N-1);
           source : in STD_LOGIC_VECTOR (0 to 1);
           input : in STD_LOGIC_VECTOR(0 to N-1));
    end component;
    
    component encoder is
        Port ( 
                input: in std_logic_vector(0 to 3);
                output: out std_logic_vector(0 to 1)
            );
    end component;
    
    component buffer_uscita is
    port(
        clk: in std_logic;
        data_in: in std_logic_vector(0 to 4*N-1);
        ind_source_in: in std_logic_vector(1 downto 0);
        ind_dest_in: in std_logic_vector(1 downto 0);
        data_out: out std_logic_vector(0 to 4*N-1);
        ind_source: out std_logic_vector(1 downto 0);
        ind_dest: out std_logic_vector(1 downto 0);
        start: in std_logic
    );
    end component;
    
    signal source: std_logic_vector(0 to 1);
    signal output_mux: std_logic_vector(0 to 3);
    signal output_demux: std_logic_vector(0 to 7);
begin

    mux: mux_4_1 port map(
                a1 => data_in(0 to 3),  
                a2 => data_in(4 to 7),
                a3 => data_in(8 to 11),
                a4 => data_in(12 to 15),
                s  => source,
                o => output_mux
    );
    
    demux: demux_4_1 port map(
                source => source, 
                input => output_mux(2 to 3),
                output => output_demux
    );
    
     enc: encoder 
        Port map( 
                input => enable,
                output => source
            );
            
    buffer_u: buffer_uscita
        port map(
            clk => clk,
            data_in => output_demux,
            ind_source_in => source,
            ind_dest_in => output_mux(0 to 1),
            data_out => data_out,
            ind_source => ind_source,
            ind_dest => ind_dest,
            start => start
    );
    
    
end Structural;
