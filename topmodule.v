///TOP MODULE
module top(
    input wire CLK,             
    input wire RST_BTN, 
    output wire VGA_HS_O,        
    output wire VGA_VS_O,       
    output wire [7:0] VGA_R,     
    output wire [7:0] VGA_G,    
    output wire [7:0] VGA_B,    
    output reg clk_en,
 output reg clka,
input wire button1, 
input wire button2, 
input wire button3, 
input wire button4,
input wire switch1,
input wire switch2,
input wire switch3,
input wire switch4
);

initial begin 
counter_clka = 0;
clka = 0;

end
integer counter_clka; 
integer counter_clk; 
reg k; 
reg l; 
reg on;
reg te;
reg hu;
//Generates 25Mhz clk_en for CLK with period 10ns
initial begin 
counter_clk = 0;
clk_en = 0;
end

always @(posedge CLK) 
begin
if(counter_clk == 1) begin
counter_clk <= 'd0;
clk_en <= 1;
end 
else begin
counter_clk <= counter_clk +1;
clk_en <= 0;
end
end


    reg [15:0] cnt;
   wire [9:0] x; 
    wire [8:0] y; 
reg [8:0] yson1;
reg [8:0] xson2;
reg [8:0] yson3;
reg [8:0] xson4;
reg [8:0] x_ball;
reg [8:0] y_ball;
reg [8:0] x_blod;
reg [8:0] y_blod;

    vga(
        .vgaclk(CLK),
    .pixelstb(clk_en),
        .inputreset(rst),
        .horizs(VGA_HS_O), 
        .vertis(VGA_VS_O), 
        .ox(x), 
        .oy(y)
    );



reg clk_en2;
integer a;
integer b;
integer c;
integer d;
integer v;
integer q;
integer w;
integer r;
integer t;
integer va;
integer qa;
integer wa;
integer ra;
integer ta;
integer goalred;
integer goalblue;

integer ones;
integer tens;
integer huns;
integer ballx;
integer bally;
integer blodx;
integer blody;
integer counter_clk2;
initial begin
counter_clk2=0;
clk_en2 = 0;
a = 350;
b= 330;
c= 150;
d= 330;
ballx=330;
bally=220;
blodx=175;
blody=240;
v <= 1;
va <= 1; ////////////////////////////////////////////////////////////////////////////////
goalred <=0;
goalblue <=0;
ones = 0;
tens=8;
huns=1;
end

always @(posedge CLK) 
begin
if(counter_clk2 == 500000) begin
counter_clk2<= 'd0;
clk_en2 <= 1;
end 
else begin
counter_clk2 <= counter_clk2 +1;
clk_en2 <= 0;
end
end


always @(posedge CLK) 
begin
if (clk_en2==1) begin
//////

if (button1 ==0 && switch1 ==0 && a < 440 ) begin
   a <= a +1;
end

if (button1 ==0 && switch1 ==0 && a > 440 ) begin
   a <= 440;
end

if (button1 ==0 && switch1 ==1  ) begin
   a <= a;
end


if (button1 ==1 && switch1 == 0) begin
   a <= a;
end


if (button1 ==1 && switch1 ==1 && a >192 ) begin
   a <= a -1;
end

if (button1 ==1 && switch1==1 && a < 192 ) begin
   a <= 192;
end
yson1 <= a;

///////////////
if (button2 ==0 && switch2==0 && b < 448 ) begin
   b <= b +1;
end

if (button2 ==0 && switch2==0 && b > 448 ) begin
   b <= 448;
end

if (button2 ==0 && switch2==1 ) begin
   b <= b;
end

if (button2 ==1 && switch2==0 ) begin
   b <= b;
end


if (button2 ==1 && switch2==1 && b >170 ) begin
   b <= b -1;
end

if (button2 ==1 && switch2 ==1 && b < 170 ) begin
   b <= 170;
end

xson2 <= b;
//////////////
if (button3 ==0 && switch3==0 && c < 308 ) begin
   c <= c +1;
end

if (button3 ==0 && switch3==0 && c > 308 ) begin
   c <= 308;
end

if (button3 ==0 && switch3==1 ) begin
   c <= c;
end
if (button3 ==1 && switch3==0 ) begin
   c <= c;
end

if (button3 ==1 && switch3==1 && c >50 ) begin
   c <= c -1;
end

if (button3 ==1 && switch3==1 && c < 50 ) begin
   c <= 50;
end

yson3 <= c;
/////////////
if (button4 ==0 && switch4== 0 && d < 490 ) begin
   d <= d +1;
end

if (button4 ==0 && switch4==0 && d > 490 ) begin
   d <= 490;
end

if (button4 ==0 && switch4==1 ) begin
   d <= d;
end
if (button4 ==1 && switch4==0 ) begin
   d <= d;
end

if (button4 ==1 && switch4== 1 &&  d >252 ) begin
   d <= d -1;
end

if (button4 ==1 && switch4== 1 &&  d < 252 ) begin
   d <= 252;
end

xson4 <= d;

////////////
if(q==0 && w==0 && r==0 && t==0) begin
if( v==1 && ballx < 500) begin
ballx <= ballx+1;
v <= 1;
end
if (ballx > 499) begin
v <= 0;
end
if  ( v ==0 && ballx > 160) begin
ballx <= ballx-1; 
end
if(ballx < 161) begin
v <= 1; 
end
end
// Player 1 ball col
if ((ballx-490)*(ballx-490)+(bally-yson1)*(bally-yson1)<=900) begin
if(ballx > 490 && bally < yson1)begin 
ballx <= ballx+1;
bally <= bally-1;
q <=1;
w <=0;
r <=0;
t <=0;
end
if(ballx > 490 && bally > yson1)begin
ballx <= ballx+1;
bally <= bally+1;
q <=0;
w <=1;
r <=0;
t <=0;
end
if(ballx < 490 && bally < yson1)begin
ballx <= ballx-1;
bally <= bally-1;
q <=0;
w <=0;
r <=1;
t <=0;
end
if(ballx < 490 && bally > yson1)begin
ballx <= ballx-1;
bally <= bally+1;
q <=0;
w <=0;
r <=0;
t <=1;
end
end
// Player 3 ball col
if ((ballx-210)*(ballx-210)+(bally-yson3)*(bally-yson3)<=900) begin
if(ballx > 210 && bally < yson3)begin 
ballx <= ballx+1;
bally <= bally-1;
q <=1;
w <=0;
r <=0;
t <=0;
end
if(ballx > 210 && bally > yson3)begin
ballx <= ballx+1;
bally <= bally+1;
q <=0;
w <=1;
r <=0;
t <=0;
end
if(ballx < 210 && bally < yson3)begin
ballx <= ballx-1;
bally <= bally-1;
q <=0;
w <=0;
r <=1;
t <=0;
end
if(ballx < 210 && bally > yson3)begin
ballx <= ballx-1;
bally <= bally+1;
q <=0;
w <=0;
r <=0;
t <=1;
end
end

// Player 2 (ball col)
if ((ballx-xson2)*(ballx-xson2)+(bally-350)*(bally-350)<=900) begin
if(ballx > xson2 && bally < 350)begin 
ballx <= ballx+1;
bally <= bally-1;
q <=1;
w <=0;
r <=0;
t <=0;
end
if(ballx > xson2 && bally > 350)begin
ballx <= ballx+1;
bally <= bally+1;
q <=0;
w <=1;
r <=0;
t <=0;
end
if(ballx < xson2 && bally < 350)begin
ballx <= ballx-1;
bally <= bally-1;
q <=0;
w <=0;
r <=1;
t <=0;
end
if(ballx < xson2 && bally > 350)begin
ballx <= ballx-1;
bally <= bally+1;
q <=0;
w <=0;
r <=0;
t <=1;
end
end
//
// Player 4 ball col.
if ((ballx-xson4)*(ballx-xson4)+(bally-150)*(bally-150)<=900) begin
if(ballx > xson4 && bally < 150)begin 
ballx <= ballx+1;
bally <= bally-1;
q <=1;
w <=0;
r <=0;
t <=0;
end
if(ballx > xson4 && bally > 150)begin
ballx <= ballx+1;
bally <= bally+1;
q <=0;
w <=1;
r <=0;
t <=0;
end
if(ballx < xson4 && bally < 150)begin
ballx <= ballx-1;
bally <= bally-1;
q <=0;
w <=0;
r <=1;
t <=0;
end
if(ballx < xson4 && bally > 150)begin
ballx <= ballx-1;
bally <= bally+1;
q <=0;
w <=0;
r <=0;
t <=1;
end
end

//

if(q==1)begin
ballx <= ballx+1;
bally <= bally-1;
if((ballx >= 500)) begin
q <=0;
w <=0;
r <=1;
t <=0;
end
if(bally <= 30)begin
q <=0;
w <=1;
r <=0;
t <=0;
end
end
if(w==1)begin
ballx <= ballx+1;
bally <= bally+1;
if(ballx>= 500)begin
q <=0;
w <=0;
r <=0;
t <=1;
end
if(bally >=450)begin
q <=1;
w <=0;
r <=0;
t <=0;
end
end
if(r==1)begin
ballx <= ballx-1;
bally <= bally-1;
if(ballx <=160)begin
q <=1;
w <=0;
r <=0;
t <=0;
end
if(bally <=30)begin
q <=0;
w <=0;
r <=0;
t <=1;
end
end
if(t==1)begin
ballx <= ballx-1;
bally <= bally+1;
if(ballx <=160)begin
q <=0;
w <=1;
r <=0;
t <=0;
end
if(bally >=450)begin
q <=0;
w <=0;
r <=1;
t <=0;
end
end


/////////blod
if(qa==0 && wa==0 && ra==0 && ta==0) begin
if( va==1 && blodx < 500) begin
blodx <= blodx+1;
blody <= blody+2;
va <= 1;
end
if (blodx > 499) begin
va <= 0;
end
if  ( va ==0 && blodx > 160) begin
blodx <= blodx-2; 
end
if(blodx < 161) begin
va <= 1; 
end
end
// Player 1 blod col
if ((blodx-490)*(blodx-490)+(blody-yson1)*(blody-yson1)<=35*35) begin

if(blodx > 490 && blody < yson1)begin 
blodx <= blodx+1;
blody <= blody-2;
qa <=1;
wa <=0;
ra <=0;
ta <=0;
end
if(blodx > 490 && blody > yson1)begin
blodx <= blodx+1;
blody <= blody+1;
qa <=0;
wa <=1;
ra <=0;
ta <=0;
end
if(blodx < 490 && blody < yson1)begin
blodx <= blodx-1;
blody <= blody-1;
qa <=0;
wa <=0;
ra <=1;
ta <=0;
end
if(blodx < 490 && blody > yson1)begin
blodx <= blodx-1;
blody <= blody+2;
qa <=0;
wa <=0;
ra <=0;
ta <=1;
end
end
// Player 3 blod col
if ((blodx-210)*(blodx-210)+(blody-yson3)*(blody-yson3)<=35*35) begin

if(blodx > 210 && blody < yson3)begin 
blodx <= blodx+1;
blody <= blody-2;
qa <=1;
wa <=0;
ra <=0;
ta <=0;
end
if(blodx > 210 && blody > yson3)begin
blodx <= blodx+1;
blody <= blody+2;
qa <=0;
wa <=1;
ra <=0;
ta <=0;
end
if(blodx < 210 && blody < yson3)begin
blodx <= blodx-1;
blody <= blody-1;
qa <=0;
wa <=0;
ra <=1;
ta <=0;
end
if(blodx < 210 && blody > yson3)begin
blodx <= blodx-2;
blody <= blody+1;
qa <=0;
wa <=0;
ra <=0;
ta <=1;
end
end
// Player 2 (blod col)
if ((blodx-xson2)*(blodx-xson2)+(blody-350)*(blody-350)<=35*35) begin

if(blodx > xson2 && blody < 350)begin 
blodx <= blodx+1;
blody <= blody-2;
qa <=1;
wa <=0;
ra <=0;
ta <=0;
end
if(blodx > xson2 && blody > 350)begin
blodx <= blodx+1;
blody <= blody+1;
qa <=0;
wa <=1;
ra <=0;
ta <=0;
end
if(blodx < xson2 && blody < 350)begin
blodx <= blodx-1;
blody <= blody-1;
qa <=0;
wa <=0;
ra <=1;
ta <=0;
end
if(blodx < xson2 && blody > 350)begin
blodx <= blodx-1;
blody <= blody+1;
qa <=0;
wa <=0;
ra <=0;
ta <=1;
end
end
// Player 4 blod col.
if ((blodx-xson4)*(blodx-xson4)+(blody-150)*(blody-150)<=35*35) begin

if(blodx > xson4 && blody < 150)begin 
blodx <= blodx+1;
blody <= blody-2;
qa <=1;
wa <=0;
ra <=0;
ta <=0;
end
if(blodx > xson4 && blody > 150)begin
blodx <= blodx+1;
blody <= blody+1;
qa <=0;
wa <=1;
ra <=0;
ta <=0;
end
if(blodx < xson4 && blody < 150)begin
blodx <= blodx-1;
blody <= blody-1;
qa <=0;
wa <=0;
ra <=1;
ta <=0;
end
if(blodx < xson4 && blody > 150)begin
blodx <= blodx-1;
blody <= blody+1;
qa <=0;
wa <=0;
ra <=0;
ta <=1;
end
end

//
if(qa==1)begin
blodx <= blodx+1;
blody <= blody-1;

if((blodx >= 495)) begin
qa <=0;
wa <=0;
ra <=1;
ta <=0;
end
if(blody <= 35)begin
qa <=0;
wa <=1;
ra <=0;
ta <=0;
end
end
if(wa==1)begin
blodx <= blodx+1;
blody <= blody+1;
if(blodx>= 495)begin
qa <=0;
wa <=0;
ra <=0;
ta <=1;
end
if(blody >=445)begin
qa <=1;
wa <=0;
ra <=0;
ta <=0;
end
end
if(ra==1)begin
blodx <= blodx-1;
blody <= blody-1;
if(blodx <=165)begin
qa <=1;
wa <=0;
ra <=0;
ta <=0;
end
if(blody <=35)begin
qa <=0;
wa <=0;
ra <=0;
ta <=1;
end
end
if(ta==1)begin
blodx <= blodx-1;
blody <= blody+2;

if(blodx <=160)begin
qa <=0;
wa <=1;
ra <=0;
ta <=0;
end
if(blody >=450)begin
qa <=0;
wa <=0;
ra <=1;
ta <=0;
end
end
///////////////Blod FİNİSH


//goal check
if (((ballx-330)*(ballx-330)+(bally-60)*(bally-60) <400) || ((ballx-225)*(ballx-225)+(bally-90)*(bally-90) <400) || ((ballx-435)*(ballx-435)+(bally-90)*(bally-90) <400) ) begin
goalred <= goalred+1;
ballx<=330;
bally<=220;
a <=350;
b <=330;
c <=150;
d <= 330;
q <=0;
w <=0;
r <=0;
t <=0;
end
if (((ballx-330)*(ballx-330)+(bally-430)*(bally-430) <400) || ((ballx-435)*(ballx-435)+(bally-410)*(bally-410) <400) || ((ballx-225)*(ballx-225)+(bally-410)*(bally-410) <400) ) begin
goalblue <= goalblue+1;
ballx<=330;
bally<=220;
a <=350;
b <=330;
c <=150;
d <= 330;
q <=0;
w <=0;
r <=0;
t <=0;
end

//goal check finish
end
//////// scoreboard
case(goalred)
0 : begin 
k <= ((x > 80) & (x < 85) & (y > 200) & (y < 250)|(x > 95) & (x < 100) & (y > 200) & (y < 250)| (x > 85) & (x < 95) & (y > 200) & (y < 205)|(x > 85) & (x < 95) & (y > 245) & (y < 250));
end
1 : begin 
k <= ((x > 95) & (x < 100) & (y > 200) & (y < 250));
end
2 : begin 
k <= ((x>80)& (x<100)&(y>245)&(y<250)|(y>200)&(y<205)&(x>80)&(x<100)|(x>80)&(x<85)&(y<245)&(y>228)|(x<100)&(x>95)&(y>205)&(y<223)|(x>80)&(x<100)&(y>223)&(y<228));
end
3 : begin 
k <= ((x > 95) & (x < 100) & (y > 200) & (y < 250)|(x>80)&(x<95)&(y>200)&(y<205)|(x>80)&(x<95)&(y>223)&(y<228)|(x>80)&(x<95)&(y>245)&(y<250));
end
4 : begin 
k <= ((x > 95) & (x < 100) & (y > 200) & (y < 250)|(x >85) & (x < 95) & (y > 223) &(y <228)|(x>80)&(x<85)&(y<223)&(y>200));
end
5 : begin 
k <= ((x>80)& (x<100)&(y>245)&(y<250)|(y>200)&(y<205)&(x>80)&(x<100)|(x<100)&(x>95)&(y>228)&(y<245)|(x>80)&(x<85)&(y>205)&(y<223)|(x>80)&(x<100)&(y<228)&(y>223));
end
6 : begin 
k <=  ((x>80)& (x<100)&(y>245)&(y<250)|(y>200)&(y<205)&(x>80)&(x<100)|(x>80)&(x<85)&(y<245)&(y>228)|(x<100)&(x>95)&(y>228)&(y<245)|(x>80)&(x<85)&(y>205)&(y<223)|(x>80)&(x<100)&(y<228)&(y>223));
end
7 : begin 
k <= ((x > 95) & (x < 100) & (y > 200) & (y < 250)|(x>80)&(x<95)&(y>200)&(y<205));
end
8 : begin 
k <= ((x > 80) & (x < 85) & (y > 200) & (y < 250)|(x > 95) & (x < 100) & (y > 200) & (y < 250)| (x > 85) & (x < 95) & (y > 200) & (y < 205)|(x > 85) & (x < 95) & (y > 245) & (y < 250) | (x >85) & (x < 95) & (y > 223) &(y <228) );
end
9 : begin 
k <= ((x > 95) & (x < 100) & (y > 200) & (y < 250)|(x>80)&(x<95)&(y>200)&(y<205)|(x>80)&(x<95)&(y>223)&(y<228)|(x>80)&(x<95)&(y>245)&(y<250)|(x > 80)&(x<85)&(y>205)&(y<223));
end
  10 : begin 
k <= ((x > 70) & (x < 75) & (y > 200) & (y < 250))|((x > 80) & (x < 85) & (y > 200) & (y < 250)|(x > 95) & (x < 100) & (y > 200) & (y < 250)| (x > 85) & (x < 95) & (y > 200) & (y < 205)|(x > 85) & (x < 95) & (y > 245) & (y < 250));
end
11 : begin 
k <= ((x > 70) & (x < 75) & (y > 200) & (y < 250))| ((x > 95) & (x < 100) & (y > 200) & (y < 250)) ;  
end
12 : begin 
k <=  ((x > 70) & (x < 75) & (y > 200) & (y < 250))| ((x>80)& (x<100)&(y>245)&(y<250)|(y>200)&(y<205)&(x>80)&(x<100)|(x>80)&(x<85)&(y<245)&(y>228)|(x<100)&(x>95)&(y>205)&(y<223)|(x>80)&(x<100)&(y>223)&(y<228));
end
13 : begin 
k <= ((x > 70) & (x < 75) & (y > 200) & (y < 250)) | ((x > 95) & (x < 100) & (y > 200) & (y < 250)|(x>80)&(x<95)&(y>200)&(y<205)|(x>80)&(x<95)&(y>223)&(y<228)|(x>80)&(x<95)&(y>245)&(y<250)) ;  
end
14 : begin 
k <= ((x > 70) & (x < 75) & (y > 200) & (y < 250)) | ((x > 95) & (x < 100) & (y > 200) & (y < 250)|(x >85) & (x < 95) & (y > 223) &(y <228)|(x>80)&(x<85)&(y<223)&(y>200)) ;
end
15 : begin 
k <=  ((x > 70) & (x < 75) & (y > 200) & (y < 250)) | ((x>80)& (x<100)&(y>245)&(y<250)|(y>200)&(y<205)&(x>80)&(x<100)|(x<100)&(x>95)&(y>228)&(y<245)|(x>80)&(x<85)&(y>205)&(y<223)|(x>80)&(x<100)&(y<228)&(y>223)) ;
end
16 : begin 
k <= ((x > 70) & (x < 75) & (y > 200) & (y < 250))| ((x>80)& (x<100)&(y>245)&(y<250)|(y>200)&(y<205)&(x>80)&(x<100)|(x>80)&(x<85)&(y<245)&(y>228)|(x<100)&(x>95)&(y>228)&(y<245)|(x>80)&(x<85)&(y>205)&(y<223)|(x>80)&(x<100)&(y<228)&(y>223)) ;
end
17 : begin 
k <= ((x > 70) & (x < 75) & (y > 200) & (y < 250)) | ((x > 95) & (x < 100) & (y > 200) & (y < 250)|(x>80)&(x<95)&(y>200)&(y<205));
end
18 : begin 
k <= ((x > 70) & (x < 75) & (y > 200) & (y < 250)) | ((x > 80) & (x < 85) & (y > 200) & (y < 250)|(x > 95) & (x < 100) & (y > 200) & (y < 250)| (x > 85) & (x < 95) & (y > 200) & (y < 205)|(x > 85) & (x < 95) & (y > 245) & (y < 250) | (x >85) & (x < 95) & (y > 223) &(y <228) ) ;
end
19 : begin 
k <= ((x > 70) & (x < 75) & (y > 200) & (y < 250))| ((x > 95) & (x < 100) & (y > 200) & (y < 250)|(x>80)&(x<95)&(y>200)&(y<205)|(x>80)&(x<95)&(y>223)&(y<228)|(x>80)&(x<95)&(y>245)&(y<250)|(x > 80)&(x<85)&(y>205)&(y<223))  ;
end
20 : begin 
k <= ((x > 80) & (x < 85) & (y > 200) & (y < 250)|(x > 95) & (x < 100) & (y > 200) & (y < 250)| (x > 85) & (x < 95) & (y > 200) & (y < 205)|(x > 85) & (x < 95) & (y > 245) & (y < 250)) | ((x>80)& (x<100)&(y>245)&(y<250)|(y>200)&(y<205)&(x>80)&(x<100)|(x>80)&(x<85)&(y<245)&(y>228)|(x<100)&(x>95)&(y>205)&(y<223)|(x>80)&(x<100)&(y>223)&(y<228))    ;
end
endcase
//////// scoreboard
case(goalblue)
0 : begin 
l <= ((x > 80) & (x < 85) & (y > 130) & (y < 180)|(x > 95) & (x < 100) & (y > 130) & (y < 180)| (x > 85) & (x < 95) & (y > 130) & (y < 135)|(x > 85) & (x < 95) & (y > 175) & (y < 180));
end
1 : begin 
l <= ((x > 95) & (x < 100) & (y > 130) & (y < 180)) ;
end
2 : begin 
l <= ((x>80)& (x<100)&(y>175)&(y<180)|(y>130)&(y<135)&(x>80)&(x<100)|(x>80)&(x<85)&(y<175)&(y>158)|(x<100)&(x>95)&(y>135)&(y<153)|(x>80)&(x<100)&(y>153)&(y<158)) ;
end
3 : begin 
l <= ((x > 95) & (x < 100) & (y > 130) & (y < 180)|(x>80)&(x<95)&(y>130)&(y<135)|(x>80)&(x<95)&(y>153)&(y<158)|(x>80)&(x<95)&(y>175)&(y<180)) ;
end
4 : begin 
l <=  ((x > 95) & (x < 100) & (y > 130) & (y < 180)|(x >85) & (x < 95) & (y > 153) &(y <158)|(x>80)&(x<85)&(y<153)&(y>130)) ;
end
5 : begin 
l <=  ((x>80)& (x<100)&(y>175)&(y<180)|(y>130)&(y<135)&(x>80)&(x<100)|(x<100)&(x>95)&(y>158)&(y<175)|(x>80)&(x<85)&(y>135)&(y<153)|(x>80)&(x<100)&(y<158)&(y>153)) ;
end
6 : begin 
l <=  ((x>80)& (x<100)&(y>175)&(y<180)|(y>130)&(y<135)&(x>80)&(x<100)|(x>80)&(x<85)&(y<175)&(y>158)|(x<100)&(x>95)&(y>158)&(y<175)|(x>80)&(x<85)&(y>135)&(y<153)|(x>80)&(x<100)&(y<158)&(y>153)) ;
end
7 : begin 
l <= ((x > 95) & (x < 100) & (y > 130) & (y < 180)|(x>80)&(x<95)&(y>130)&(y<135)) ;
end
8 : begin 
l <=  ((x > 80) & (x < 85) & (y > 130) & (y < 180)|(x > 95) & (x < 100) & (y > 130) & (y < 180)| (x > 85) & (x < 95) & (y > 130) & (y < 135)|(x > 85) & (x < 95) & (y > 175) & (y < 180) | (x >85) & (x < 95) & (y > 153) &(y <158) ) ;
end
9 : begin 
l <= ((x > 95) & (x < 100) & (y > 130) & (y < 180)|(x>80)&(x<95)&(y>130)&(y<135)|(x>80)&(x<95)&(y>153)&(y<158)|(x>80)&(x<95)&(y>175)&(y<180)|(x > 80)&(x<85)&(y>135)&(y<153));
end
  10 : begin 
l <=  ((x > 70) & (x <75) & (y > 130) & (y < 180)) | ((x > 80) & (x < 85) & (y > 130) & (y < 180)|(x > 95) & (x < 100) & (y > 130) & (y < 180)| (x > 85) & (x < 95) & (y > 130) & (y < 135)|(x > 85) & (x < 95) & (y > 175) & (y < 180)) ;
end
11 : begin 
l <=  ((x > 70) & (x <75) & (y > 130) & (y < 180)) | ((x > 95) & (x < 100) & (y > 130) & (y < 180))  ;  
end
12 : begin 
l <=  ((x > 70) & (x <75) & (y > 130) & (y < 180)) | ((x>80)& (x<100)&(y>175)&(y<180)|(y>130)&(y<135)&(x>80)&(x<100)|(x>80)&(x<85)&(y<175)&(y>158)|(x<100)&(x>95)&(y>135)&(y<153)|(x>80)&(x<100)&(y>153)&(y<158)) ;
end
13 : begin 
l <=  ((x > 70) & (x <75) & (y > 130) & (y < 180)) | ((x > 95) & (x < 100) & (y > 130) & (y < 180)|(x>80)&(x<95)&(y>130)&(y<135)|(x>80)&(x<95)&(y>153)&(y<158)|(x>80)&(x<95)&(y>175)&(y<180)) ;  
end
14 : begin 
l <=  ((x > 70) & (x <75) & (y > 130) & (y < 180)) | ((x > 95) & (x < 100) & (y > 130) & (y < 180)|(x >85) & (x < 95) & (y > 153) &(y <158)|(x>80)&(x<85)&(y<153)&(y>130))  ;
end
15 : begin 
l <=  ((x > 70) & (x <75) & (y > 130) & (y < 180)) | ((x>80)& (x<100)&(y>175)&(y<180)|(y>130)&(y<135)&(x>80)&(x<100)|(x<100)&(x>95)&(y>158)&(y<175)|(x>80)&(x<85)&(y>135)&(y<153)|(x>80)&(x<100)&(y<158)&(y>153))  ;
end
16 : begin 
l <=  ((x > 70) & (x <75) & (y > 130) & (y < 180)) | ((x>80)& (x<100)&(y>175)&(y<180)|(y>130)&(y<135)&(x>80)&(x<100)|(x>80)&(x<85)&(y<175)&(y>158)|(x<100)&(x>95)&(y>158)&(y<175)|(x>80)&(x<85)&(y>135)&(y<153)|(x>80)&(x<100)&(y<158)&(y>153))  ;
end
17 : begin 
l <=  ((x > 70) & (x <75) & (y > 130) & (y < 180)) | ((x > 95) & (x < 100) & (y > 130) & (y < 180)|(x>80)&(x<95)&(y>130)&(y<135)) ;
end
18 : begin 
l <=   ((x > 70) & (x <75) & (y > 130) & (y < 180)) | ((x > 80) & (x < 85) & (y > 130) & (y < 180)|(x > 95) & (x < 100) & (y > 130) & (y < 180)| (x > 85) & (x < 95) & (y > 130) & (y < 135)|(x > 85) & (x < 95) & (y > 175) & (y < 180) | (x >85) & (x < 95) & (y > 153) &(y <158) );
end
19 : begin 
l <=   ((x > 70) & (x <75) & (y > 130) & (y < 180)) | ((x > 95) & (x < 100) & (y > 130) & (y < 180)|(x>80)&(x<95)&(y>130)&(y<135)|(x>80)&(x<95)&(y>153)&(y<158)|(x>80)&(x<95)&(y>175)&(y<180)|(x > 80)&(x<85)&(y>135)&(y<153)) ;
end
20 : begin
l <= ((x>55)& (x<75)&(y>175)&(y<180)|(y>130)&(y<135)&(x>55)&(x<75)|(x>55)&(x<60)&(y<175)&(y>158)|(x<75)&(x>70)&(y>135)&(y<153)|(x>55)&(x<75)&(y>153)&(y<158)) | ((x > 80) & (x < 85) & (y > 130) & (y < 180)|(x > 95) & (x < 100) & (y > 130) & (y < 180)| (x > 85) & (x < 95) & (y > 130) & (y < 135)|(x > 85) & (x < 95) & (y > 175) & (y < 180));
end
endcase
//////////

 ///////////BCD COUNTER
if(counter_clka == 49999999) begin
counter_clka <= 'd0;
clka <= 1;
end 
else begin
counter_clka <= counter_clka +1;
clka<= 0;
end
if(clka==1)begin
if(ones>0) begin
ones <= ones-1;
end
if(ones==0) begin
ones<=9;
tens <= tens-1;
end
if(tens==0 && ones==0) begin
tens <=9;
huns <= 0;
end
if(huns==0 && tens==0 && ones==1) begin
huns<=1;
tens<=8;
ones<=0;
goalred <=0;
goalblue <=0;
ballx<=330;
bally<=220;
a <=350;
b <=330;
c <=150;
d <= 330;
q <=0;
w <=0;
r <=0;
t <=0;
end
end
//////// Timer
case(ones)
0 : begin 
on <= ((x > 580) & (x < 585) & (y > 130) & (y < 180)|(x > 595) & (x < 600) & (y > 130) & (y < 180)| (x > 575) & (x < 595) & (y > 130) & (y < 135)|(x > 575) & (x < 595) & (y > 175) & (y < 180)) ;
end
1 : begin 
on <=  ((x > 595) & (x <600) & (y > 130) & (y < 180));
end
2 : begin 
on <= ((x>580)& (x<600)&(y>175)&(y<180)|(y>130)&(y<135)&(x>580)&(x<600)|(x>580)&(x<585)&(y<175)&(y>158)|(x<600)&(x>595)&(y>135)&(y<153)|(x>580)&(x<600)&(y>153)&(y<158));
end
3 : begin 
on <=  ((x > 595) & (x < 600) & (y > 130) & (y < 180)|(x>580)&(x<595)&(y>130)&(y<135)|(x>580)&(x<595)&(y>153)&(y<158)|(x>580)&(x<595)&(y>175)&(y<180));
end
4 : begin 
on <= ((x > 595) & (x < 600) & (y > 130) & (y < 180)|(x >575) & (x < 595) & (y > 153) &(y <158)|(x>580)&(x<585)&(y<153)&(y>130));
end
5 : begin 
on <= ((x>580)& (x<600)&(y>175)&(y<180)|(y>130)&(y<135)&(x>580)&(x<600)|(x<600)&(x>595)&(y>158)&(y<175)|(x>580)&(x<585)&(y>135)&(y<153)|(x>580)&(x<600)&(y<158)&(y>153));
end
6 : begin 
on <=  ((x>580)& (x<600)&(y>175)&(y<180)|(y>130)&(y<135)&(x>580)&(x<600)|(x>580)&(x<585)&(y<175)&(y>158)|(x<600)&(x>595)&(y>158)&(y<175)|(x>580)&(x<585)&(y>135)&(y<153)|(x>580)&(x<600)&(y<158)&(y>153));
end
7 : begin 
on <= ((x > 595) & (x <600) & (y > 130) & (y < 180)|(x>580)&(x<595)&(y>130)&(y<135));
end
8 : begin 
on <=  ((x > 580) & (x < 585) & (y > 130) & (y < 180)|(x > 595) & (x < 600) & (y > 130) & (y < 180)| (x > 575) & (x < 595) & (y > 130) & (y < 135)|(x > 585) & (x < 595) & (y > 175) & (y < 180) | (x >585) & (x < 595) & (y > 153) &(y <158) );
end
9 : begin 
on <= ((x > 595) & (x < 600) & (y > 130) & (y < 180)|(x>580)&(x<595)&(y>130)&(y<135)|(x>580)&(x<595)&(y>153)&(y<158)|(x>580)&(x<595)&(y>175)&(y<180)|(x > 580)&(x<585)&(y>135)&(y<153)) ;
end
endcase

case(tens)
0 : begin 
te <= ((x > 555) & (x < 560) & (y > 130) & (y < 180)|(x > 570) & (x < 575) & (y > 130) & (y < 180)| (x > 550) & (x < 570) & (y > 130) & (y < 135)|(x > 550) & (x < 570) & (y > 175) & (y < 180));
end
1 : begin 
te <=  ((x > 570) & (x <575) & (y > 130) & (y < 180));
end
2 : begin 
te <=  ((x>555)& (x<575)&(y>175)&(y<180)|(y>130)&(y<135)&(x>555)&(x<575)|(x>555)&(x<560)&(y<175)&(y>158)|(x<575)&(x>570)&(y>135)&(y<153)|(x>555)&(x<575)&(y>153)&(y<158));
end
3 : begin 
te <=   ((x > 570) & (x < 575) & (y > 130) & (y < 180)|(x>555)&(x<570)&(y>130)&(y<135)|(x>555)&(x<570)&(y>153)&(y<158)|(x>555)&(x<570)&(y>175)&(y<180));
end
4 : begin 
te <= ((x > 570) & (x < 575) & (y > 130) & (y < 180)|(x >550) & (x < 570) & (y > 153) &(y <158)|(x>555)&(x<560)&(y<153)&(y>130));
end
5 : begin 
te <= ((x>555)& (x<575)&(y>175)&(y<180)|(y>130)&(y<135)&(x>555)&(x<575)|(x<575)&(x>570)&(y>158)&(y<175)|(x>555)&(x<560)&(y>135)&(y<153)|(x>555)&(x<575)&(y<158)&(y>153));
end
6 : begin 
te <=   ((x>555)& (x<575)&(y>175)&(y<180)|(y>130)&(y<135)&(x>555)&(x<575)|(x>555)&(x<560)&(y<175)&(y>158)|(x<575)&(x>570)&(y>158)&(y<175)|(x>555)&(x<560)&(y>135)&(y<153)|(x>555)&(x<575)&(y<158)&(y>153));
end
7 : begin 
te <=  ((x > 570) & (x <575) & (y > 130) & (y < 180)|(x>555)&(x<570)&(y>130)&(y<135));
end
8 : begin 
te <=   ((x > 555) & (x < 560) & (y > 130) & (y < 180)|(x > 570) & (x < 575) & (y > 130) & (y < 180)| (x > 550) & (x < 570) & (y > 130) & (y < 135)|(x > 560) & (x < 570) & (y > 175) & (y < 180) | (x >560) & (x < 570) & (y > 153) &(y <158) );
end
9 : begin 
te <=  ((x > 570) & (x < 575) & (y > 130) & (y < 180)|(x>555)&(x<570)&(y>130)&(y<135)|(x>555)&(x<570)&(y>153)&(y<158)|(x>555)&(x<570)&(y>175)&(y<180)|(x > 555)&(x<560)&(y>135)&(y<153)) ;
end
endcase

case(huns)
0 : begin 
hu <=  ((x > 530) & (x < 535) & (y > 130) & (y < 180)|(x > 545) & (x < 550) & (y > 130) & (y < 180)| (x > 535) & (x < 545) & (y > 130) & (y < 135)|(x > 535) & (x < 545) & (y > 175) & (y < 180));
end
1 : begin 
hu <=  ((x > 545) & (x <550) & (y > 130) & (y < 180));
end
endcase
//////////////////

y_ball <= bally;
x_ball <= ballx;

y_blod <= blody;
x_blod <= blodx;
end

//ball finish 



    wire  b_y1, b_y2, b_x1, b_x2, ball, kale1, kale2, kale3, kale4, kale5, kale6, b_m, player1, player2, player3, player4, scorered, dones,dtens,dhuns ;
assign dones = on ? 1:0;
assign dtens = te ? 1:0;
assign dhuns = hu ? 1:0;
assign scorered = k ? 1:0;
assign scoreblue = l ? 1:0;
assign kale1 = ( (x-330)*(x-330)+(y-60)*(y-60)>400 &&(x-330)*(x-330)+(y-60)*(y-60)<625) ? 1 : 0;
assign kale2 = ( (x-330)*(x-330)+(y-430)*(y-430)>400 &&(x-330)*(x-330)+(y-430)*(y-430)<625) ? 1 : 0;
assign kale3 = ( (x-225)*(x-225)+(y-410)*(y-410)>400 &&(x-225)*(x-225)+(y-410)*(y-410)<625) ? 1 : 0;
assign kale4 = ( (x-435)*(x-435)+(y-410)*(y-410)>400 &&(x-435)*(x-435)+(y-410)*(y-410)<625) ? 1 : 0;
assign kale5 = ( (x-225)*(x-225)+(y-90)*(y-90)>400 &&(x-225)*(x-225)+(y-90)*(y-90)<625) ? 1 : 0;
assign kale6 = ( (x-435)*(x-435)+(y-90)*(y-90)>400 &&(x-435)*(x-435)+(y-90)*(y-90)<625) ? 1 : 0;
    assign player1 = ((x-490)*(x-490)+(y-yson1)*(y-yson1)<400) ? 1 : 0;
 assign player2 = ((x-xson2)*(x-xson2)+(y-350)*(y-350)<400) ? 1 : 0;
    assign player3 = ((x-210)*(x-210)+(y-yson3)*(y-yson3)<400) ? 1 : 0;
 assign player4 = ((x-xson4)*(x-xson4)+(y-150)*(y-150)<400) ? 1 : 0;
 assign blod = ((x-x_blod)*(x-x_blod)+(y-y_blod)*(y-y_blod)<225) ? 1 : 0;
assign ball = ((x-x_ball)*(x-x_ball)+(y-y_ball)*(y-y_ball)<100) ? 1 : 0;
assign b_y1 = ((x > 140) & (y >  10) & (x < 150) & (y < 470)) ? 1 : 0;
 assign b_y2 = ((x > 510) & (y >  10) & (x < 520) & (y < 470)) ? 1 : 0;
  assign b_x1 = ((x > 140) & (y >  10) & (x < 520) & (y < 20)) ? 1 : 0;
assign b_x2 = ((x > 140) & (y >  460) & (x < 520) & (y < 470)) ? 1 : 0;
 assign b_m = ((x > 140) & (y >  238) & (x < 520) & (y < 242)) ? 1 : 0;

    assign VGA_R[7] =  b_y1 | b_y2 | b_x1 | b_x2 | kale1 | kale2 | kale3 | kale4 | kale5 | kale6 | b_m | player1  | player2 | scorered | dones | dtens | dhuns | blod  ;         // square b is red
    assign VGA_G[7] =  b_y1 | b_y2 | b_x1 | b_x2 | kale1 | kale2 | kale3 | kale4 | kale5 | kale6 | b_m | ball | dones | dtens | dhuns ;   // squares a and d are green
    assign VGA_B[7] = b_y1 | b_y2 | b_x1 | b_x2 | b_m | player3  | player4 | scoreblue | dones | dtens | dhuns | blod ;          // square c is blue
endmodule
