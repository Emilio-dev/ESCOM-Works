library ieee;
use ieee.std_logic_1164.all;
use work.ctrl.all;
use ieee.numeric_std.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;


entity SYNC2 is
  port (
    CLK: in std_logic;
    HSYNC, VSYNC: out std_logic;
    R, G, B: out std_logic_vector(7 downto 0)
  ) ;
end SYNC2;


architecture MAIN of SYNC2 is

    signal HPOS: integer Range 0 to 1688 := 0;
    signal VPOS: integer Range 0 to 1688 := 0;
    signal cont: integer Range 0 to 10   := 0;
    signal sdiv: std_logic_vector(20 downto 0);
begin
    process(CLK)

        begin

            if (CLK'Event and CLK = '1') then

                if (sdiv >  "000000000010000000000") then
                    sdiv <= "000000000000000000000";
                    if (cont > 9) then
                        cont <= 0;
                    else
                        cont <= cont + 1;
                    end if; 
                else
                    sdiv <= sdiv + 1;
                end if;

                if (HPOS >= 400 and HPOS <= 409 ) then
                    if ((VPOS >= 100 and VPOS <= 169) or (VPOS >= 200 and VPOS <= 269) or (VPOS >= 300 and VPOS <= 369) or (VPOS >= 400 and VPOS <= 469) or (VPOS >= 500 and VPOS <= 549) or (VPOS >= 640 and VPOS <= 689)) then
                        if (cont = 0) then
                            R <= "00000001";
                            G <= "11111111";
                            B <= "11111111";
                        else
                            R <= "01011000";
                            G <= "00011000";
                            B <= "01000101";
                        end if;
                    else
                        R <= (OTHERS => '0');
                        G <= (OTHERS => '0');
                        B <= (OTHERS => '0');
                    end if;
                elsif (HPOS >= 410 and HPOS <= 419 ) then
                    if ((VPOS >= 100 and VPOS <= 169) or (VPOS >= 200 and VPOS <= 269) or (VPOS >= 300 and VPOS <= 369) or (VPOS >= 400 and VPOS <= 469) or (VPOS >= 500 and VPOS <= 569) or (VPOS >= 620 and VPOS <= 689)) then
                        if (cont = 1) then
                            R <= "00000001";
                            G <= "11111111";
                            B <= "11111111";
                        else
                            R <= "01011000";
                            G <= "00011000";
                            B <= "01000101";
                        end if;
                    else
                        R <= (OTHERS => '0');
                        G <= (OTHERS => '0');
                        B <= (OTHERS => '0');
                    end if;
                elsif (HPOS >= 420 and HPOS <= 429 ) then
                    if ((VPOS >= 100 and VPOS <= 139) or (VPOS >= 200 and VPOS <= 229) or (VPOS >= 300 and VPOS <= 339) or (VPOS >= 450 and VPOS <= 469) or (VPOS >= 400 and VPOS <= 419) or (VPOS >= 500 and VPOS <= 529) or (VPOS >= 550 and VPOS <= 579) or (VPOS >= 610 and VPOS <= 639) or (VPOS >= 660 and VPOS <= 689)) then
                        if (cont = 2) then
                            R <= "00000001";
                            G <= "11111111";
                            B <= "11111111";
                        else
                            R <= "10010000";
                            G <= "00001100";
                            B <= "00111111";
                        end if;
                    else
                        R <= (OTHERS => '0');
                        G <= (OTHERS => '0');
                        B <= (OTHERS => '0');
                    end if;
                elsif (HPOS >= 430 and HPOS <= 439 ) then
                    if ((VPOS >= 100 and VPOS <= 139) or (VPOS >= 200 and VPOS <= 229) or (VPOS >= 300 and VPOS <= 339) or (VPOS >= 450 and VPOS <= 469) or (VPOS >= 400 and VPOS <= 419) or (VPOS >= 500 and VPOS <= 529) or (VPOS >= 560 and VPOS <= 629) or (VPOS >= 660 and VPOS <= 689)) then
                        if (cont = 3) then
                            R <= "00000001";
                            G <= "11111111";
                            B <= "11111111";
                        else
                            R <= "10010000";
                            G <= "00001100";
                            B <= "00111111";
                        end if;
                    else
                        R <= (OTHERS => '0');
                        G <= (OTHERS => '0');
                        B <= (OTHERS => '0');
                    end if;
                elsif (HPOS >= 440 and HPOS <= 449 ) then
                    if ((VPOS >= 100 and VPOS <= 169) or (VPOS >= 200 and VPOS <= 269) or (VPOS >= 300 and VPOS <= 339) or (VPOS >= 450 and VPOS <= 469) or (VPOS >= 400 and VPOS <= 419) or (VPOS >= 500 and VPOS <= 529) or (VPOS >= 660 and VPOS <= 689)) then
                        if (cont = 4) then
                            R <= "00000001";
                            G <= "11111111";
                            B <= "11111111";
                        else
                            R <= "11000111";
                            G <= "00000000";
                            B <= "00111001";
                        end if;
                    else
                        R <= (OTHERS => '0');
                        G <= (OTHERS => '0');
                        B <= (OTHERS => '0');
                    end if;
                elsif (HPOS >= 450 and HPOS <= 459 ) then
                    if ((VPOS >= 100 and VPOS <= 169) or (VPOS >= 200 and VPOS <= 269) or (VPOS >= 300 and VPOS <= 339) or (VPOS >= 450 and VPOS <= 469) or (VPOS >= 400 and VPOS <= 419) or (VPOS >= 500 and VPOS <= 529) or (VPOS >= 660 and VPOS <= 689)) then
                        if (cont = 5) then
                            R <= "00000001";
                            G <= "11111111";
                            B <= "11111111";
                        else
                            R <= "11000111";
                            G <= "00000000";
                            B <= "00111001";
                        end if;
                    else
                        R <= (OTHERS => '0');
                        G <= (OTHERS => '0');
                        B <= (OTHERS => '0');
                    end if;
                elsif (HPOS >= 460 and HPOS <= 469 ) then
                    if ((VPOS >= 100 and VPOS <= 139) or (VPOS >= 240 and VPOS <= 269) or (VPOS >= 300 and VPOS <= 339) or (VPOS >= 450 and VPOS <= 469) or (VPOS >= 400 and VPOS <= 419) or (VPOS >= 500 and VPOS <= 529) or (VPOS >= 660 and VPOS <= 689)) then
                        if (cont = 6) then
                            R <= "00000001";
                            G <= "11111111";
                            B <= "11111111";
                        else
                            R <= "11111111";
                            G <= "01010111";
                            B <= "00110011";
                        end if;
                    else
                        R <= (OTHERS => '0');
                        G <= (OTHERS => '0');
                        B <= (OTHERS => '0');
                    end if;
                elsif (HPOS >= 470 and HPOS <= 479 ) then
                    if ((VPOS >= 100 and VPOS <= 139) or (VPOS >= 240 and VPOS <= 269) or (VPOS >= 300 and VPOS <= 339) or (VPOS >= 450 and VPOS <= 469) or (VPOS >= 400 and VPOS <= 419) or (VPOS >= 500 and VPOS <= 529) or (VPOS >= 660 and VPOS <= 689)) then
                        if (cont = 7) then
                            R <= "00000001";
                            G <= "11111111";
                            B <= "11111111";
                        else
                            R <= "11111111";
                            G <= "01010111";
                            B <= "00110011";
                        end if;
                    else
                        R <= (OTHERS => '0');
                        G <= (OTHERS => '0');
                        B <= (OTHERS => '0');
                    end if;
                elsif (HPOS >= 480 and HPOS <= 489 ) then
                    if ((VPOS >= 100 and VPOS <= 169) or (VPOS >= 200 and VPOS <= 269) or (VPOS >= 300 and VPOS <= 369) or (VPOS >= 400 and VPOS <= 469) or (VPOS >= 500 and VPOS <= 529) or (VPOS >= 660 and VPOS <= 689)) then
                        if (cont = 8) then
                            R <= "00000001";
                            G <= "11111111";
                            B <= "11111111";
                        else
                            R <= "11111111";
                            G <= "11000011";
                            B <= "00000000";
                        end if;
                    else
                        R <= (OTHERS => '0');
                        G <= (OTHERS => '0');
                        B <= (OTHERS => '0');
                    end if;
                elsif (HPOS >= 490 and HPOS <= 499 ) then
                    if ((VPOS >= 100 and VPOS <= 169) or (VPOS >= 200 and VPOS <= 269) or (VPOS >= 300 and VPOS <= 369) or (VPOS >= 400 and VPOS <= 469) or (VPOS >= 500 and VPOS <= 529) or (VPOS >= 660 and VPOS <= 689)) then
                        if (cont = 9) then
                            R <= "00000001";
                            G <= "11111111";
                            B <= "11111111";
                        else
                            R <= "11111111";
                            G <= "11000011";
                            B <= "00000000";
                        end if;
                    else
                        R <= (OTHERS => '0');
                        G <= (OTHERS => '0');
                        B <= (OTHERS => '0');
                    end if;
                else

                    R <= (OTHERS => '0');
                    G <= (OTHERS => '0');
                    B <= (OTHERS => '0');

                end if;

                if (HPOS < 1688) then 
                    HPOS <= HPOS + 1;
                else
                    HPOS <= 0;

                    if(VPOS < 1066) then
                        VPOS <= VPOS + 1;
                    else
                        VPOS <= 0;                        
                    end if;

                end if;
                
                if(HPOS > 48 and HPOS < 160) then
                    HSYNC <= '0';
                else 
                    HSYNC <= '1';
                end if;

                if(VPOS > 0 and VPOS < 4) then
                    VSYNC <= '0';
                else
                    VSYNC <= '1';
                end if;

            end if;
    end process;


end MAIN ; -- MAIN