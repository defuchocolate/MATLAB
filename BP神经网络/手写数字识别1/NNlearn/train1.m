clear ;
%ÑµÁ·Éñ¾­ÍøÂç
%{
net = newlin([-1 1;-1 1],1,0,0);
net.IW{1,1} = [0 0];
net.b{1} = 0;
P={[1;2] [2;1] [2;3] [3;1] };
%A=sim(net,P);
%disp(A);

%}
T={4 5 7 7};
net = newlin([-1 1],1,[0 1]);
net.IW{1,1} = [1 2];
net.biasConnect=0;
P={2 1 3 4};
A=sim(net,P);
disp(A);

[net ,a ,e ,pf ]=adapt(net,P,T);
