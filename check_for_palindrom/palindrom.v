module pd (a,y);
  input [4:0]a;
  output y;
  assign y=(a[4]==a[0] && a[3]==a[1]);
endmodule
//y=1 --- palindrom
//y=0 --- not a palindrom
