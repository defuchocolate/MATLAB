clear;
clc;
tic
diert = 0.1;
i0 = 30;
i1 = 47.3;
i= i0:diert:i1;
s=size(i);
y=zeros(s);
for i = 1:1:s(2)
    syms x;
    R = i0+(i-1)*diert;
    f = first(x,R);
    r = solve(f);
    result = subs(r);
    result = eval(result);
    y(1,i) = max(result);
end

i=i0:diert:i1;
plot(i,y,'linewidth',3);
xlabel('R1','fontsize',14);
ylabel('Rd','fontsize',14);
set(gca,'fontsize',14);
[m,n]=max(y);
x=i0+(n-1)*diert;
toc