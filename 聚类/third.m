clc
clear all;
close all;
sqjl = [281 210 280 215 282 284 150 110 260 110 120 140 295 210 290];
sqfwj = [810 2300 820 2325 830 825 2250 4000 2800 5120 4020 4800 480 2450 2900];
sqspsd = [250 300 245 320 255 250 300 300 215 210 280 220 292 230 272];
sqhxj = [202 310 201 324 200 204 155 50 260 52 52 18 245 210 350]; 
sqgd=[6.0 4.0 6.5 4.2 4.2 5.0 5.0 3.4 7.7 3.6 3.6 9.6 9.9 5.0 5.6]; 
mbyt1=[1 3 1 3 1 1 3 4 2 5 4 5 5 5 3];   
mbyt2=[1 3 1 3 1 1 3 4 2 5 4 5 5 5 3]; 
p=[sqjl;sqfwj;sqspsd;sqhxj;sqgd]; 
t=[mbyt1;mbyt2];  
[pn,minp,maxp,tn,mint,maxt]=premnmx(p,t); 
dx=[-1,1;-1,1;-1,1;-1,1;-1,1];
net=newff(dx,[4,8,2],{'tansig','tansig','tansig'},'traingdx');
net.trainParam.show=1000;   
net.trainParam.Lr=0.05;   
net.trainParam.epochs=50000; 
net.trainParam.goal=0.5*10^(-3); 
net=train(net,pn,tn); 
an=sim(net,pn);   
a=postmnmx(an,mint,maxt); 
pnew=[210 202 217 216 230 156 161 210 235 200 225 241      
    3990 5183 4373 5976 1268 431 1608 6081 3249 3057 742 1525      
    142 269 230 195 195 266 300 283 172 301 327 226      
    29 77 80 143 190 220 277 280 92 350 157 137      
    7.0 9.2 4.6 5.2 5.2 1.0 1.2 9.4 6.0 1.4 4.8 8.6]; 
pnewn=tramnmx(pnew,minp,maxp);
anewn=sim(net,pnewn); 
anew=postmnmx(anewn,mint,maxt);
for i =1:12
    q(i) = (anew(1,i)+anew(2,i))./2;
end

q = abs(q);
q = round(q);