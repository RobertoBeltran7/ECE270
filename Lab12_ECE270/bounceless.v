module bounceless_switch(AR, AP,BFC);
input wire AR,AP; // Asynchronous Reset and Preset
output reg BFC; // Bounce Free Switch output

always @ ( posedge AR, posedge AP) begin
if (AR == 1'b1)
BFC <= 0;
else if (AP == 1'b1)
BFC <= 1;
end
endmodule

