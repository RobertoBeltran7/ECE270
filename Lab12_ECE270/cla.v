module cla(x, y, cin, sum, c);

input wire [3:0] x, y;
input wire cin;
output wire [3:0] sum;

output wire [3:0] c;
wire [3:0] p, g;

assign g = x & (y ^ cin);
assign p = x ^ (y ^ cin);

assign c[0] = g[0] | cin & p[0];
assign c[1] = g[1] | g[0] & p[1] | cin & p[0] & p[1];
assign c[2] = g[2] | g[1] & p[2] | g[0] & p[1] & p[2] | cin & p[0] & p[1] & p[2];
assign c[3] = g[3] | g[2] & p[3] | g[1] & p[2] & p[3] | g[0] & p[1] & p[2] & p[3] | cin & p[0] & p[1] & p[2] & p[3];

assign sum[0] = cin ^ p[0];
assign sum[3:1] = c[2:0] ^ p[3:1];
endmodule

