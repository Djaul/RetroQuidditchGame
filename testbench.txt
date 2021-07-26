//// TESTBENCH

`timescale 1ns / 1ns
module testbench  ; 

parameter dis  = 525 ;
parameter horizsta  = 16 ;
parameter verticalend  = 492 ;
parameter horizontalend  = 112 ;
parameter ciz  = 800 ;
parameter verticalaend  = 480 ;
parameter verticalsta  = 490 ;
parameter horizontalsta  = 160 ; 
  wire  [8:0]  oy   ; 
  wire    anm   ; 
  reg    vgaclk   ; 
  wire    vertis   ; 
  wire    actv   ; 
  reg    clk_en2   ; 
  wire  [9:0]  ox   ; 
  wire    endscreen   ; 
  wire    blnk   ; 
  wire    horizs   ; 
  reg    inputreset   ; 
  vga    #( dis , horizsta , verticalend , horizontalend , ciz , verticalaend , verticalsta , horizontalsta  )
   DUT  ( 
       .oy (oy ) ,
      .anm (anm ) ,
      .vgaclk (vgaclk ) ,
      .vertis (vertis ) ,
      .actv (actv ) ,
      .clk_en2 (clk_en2 ) ,
      .ox (ox ) ,
      .endscreen (endscreen ) ,
      .blnk (blnk ) ,
      .horizs (horizs ) ,
      .inputreset (inputreset ) ); 



// "Clock Pattern" : dutyCycle = 50
// Start Time = 0 ns, End Time = 1 us, Period = 20 ns
  initial
  begin
	  vgaclk  = 1'b1  ;
	 # 1 ;
// dumped values till 1 ns
  end


// "Clock Pattern" : dutyCycle = 50
// Start Time = 0 ns, End Time = 1 us, Period = 100 ns
  initial
  begin
	  clk_en2  = 1'b1  ;
	 # 1 ;
// dumped values till 1 ns
  end


// "Constant Pattern"
// Start Time = 0 ns, End Time = 1 us, Period = 0 ns
  initial
  begin
	  inputreset  = 1'b0  ;
	 # 1 ;
// dumped values till 1 ns
  end

  initial
	#2 $stop;
endmodule
