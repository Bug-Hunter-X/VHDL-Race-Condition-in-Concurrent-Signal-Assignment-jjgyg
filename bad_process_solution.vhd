```vhdl
ENTITY good_process IS
  PORT ( clk : IN  STD_LOGIC;
              reset : IN STD_LOGIC;
              data_in : IN STD_LOGIC_VECTOR(7 DOWNTO 0);
              data_out : OUT STD_LOGIC_VECTOR(7 DOWNTO 0));
END ENTITY;

ARCHITECTURE behavioral OF good_process IS

  SIGNAL internal_data : STD_LOGIC_VECTOR(7 DOWNTO 0) := "00000000";
  SIGNAL data_out_int : STD_LOGIC_VECTOR(7 DOWNTO 0);

BEGIN

  PROCESS (clk, reset)
  BEGIN
    IF reset = '1' THEN
      internal_data <= "00000000";
    ELSIF rising_edge(clk) THEN
      internal_data <= data_in;
      data_out_int <= internal_data; 
    END IF;
  END PROCESS;

  data_out <= data_out_int;

END ARCHITECTURE;
```