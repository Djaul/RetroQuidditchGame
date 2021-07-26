// VGA MODULE

module vga(
input wire vgaclk,           
    input wire pixelstb,       
    input wire inputreset,         
    output wire horizs,          
    output wire vertis,           
    output wire blnk,     
    output wire actv,   
    output wire endscreen,    
    output wire anm,    
    output wire [9:0] ox,      
    output wire [8:0] oy       
    );
    localparam horizsta = 16;              
    localparam horizontalend = 16 + 96;        
    localparam horizontalsta = 16 + 96 + 48;   
    localparam verticalsta = 480 + 10;       
    localparam verticalend = 480 + 10 + 2;    
    localparam verticalaend = 480;            
    localparam ciz   = 800;          
    localparam dis = 525;       
    reg [9:0] hcoun;  
    reg [9:0] vcoun;  
    assign horizs = ~((hcoun >= horizsta) & (hcoun < horizontalend));
    assign vertis = ~((vcoun >= verticalsta) & (vcoun < verticalend));
    assign ox = (hcoun < horizontalsta) ? 0 : (hcoun - horizontalsta);
    assign oy = (vcoun >= verticalaend) ? (verticalaend - 1) : (vcoun);
    assign blnk = ((hcoun < horizontalsta) | (vcoun > verticalaend - 1));
    assign actv = ~((hcoun < horizontalsta) | (vcoun > verticalaend - 1)); 
    assign endscreen = ((vcoun == dis - 1) & (hcoun == ciz));
    assign anm = ((vcoun == verticalaend - 1) & (hcoun == ciz));
    always @ (posedge vgaclk)
begin
if (inputreset)
begin
            hcoun <= 0;
            vcoun <= 0;
end
if (pixelstb)
begin
if (hcoun == ciz) 
begin
                hcoun <= 0;
                vcoun <= vcoun + 1;
end
else 
                hcoun <= hcoun + 1;

if (vcoun == dis) 
                vcoun <= 0;
end
end
endmodule
