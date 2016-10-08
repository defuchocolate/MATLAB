function F = TemplateEigenvalueCalculation(ii)
%�������ܣ��������ii��harr-like����ģ�������ֵ
%���������ii��ʾҪ���д���ľ���
%���������F��ʾͼ���harr-like����ģ�������ֵ����һ��1*21000������

%-------------------------------harr-like����ģ���ѡ��---------------------------------------%
%ѡȡ��2,1������ģ��
minw = 1; %��С��
minh = 2; %��С��
aw=1; %��������,w����
ah=1; %��������,h����
%_____________________________________________________________________________________________%

F=[];
F1=[];
w=minw;
h=minh;
[row,col]=size(ii);

%minh*ah&minw*aw��ʾharr-like����ģ�壬����ah&aw������������w&h��������
%row-h&col-w��ʾ��������ͼ����harr-like����ģ�������ֵ
while(minh*ah<=row) 
    while(minw*aw<=col)
        for i=1:row-h
           for j=1:col-w
              white = ii(i,j)+ii(i+h/2,j+w)-ii(i+h/2,j)-ii(i,j+w);
              black = ii(i+h/2,j)+ii(i+h,j+w)-ii(i+h,j)-ii(i+h/2,j+w);
              F1((i-1)*(col-w)+j)=white-black;
           end
         end
        F=[F,F1];
        F1=[];
        aw=aw+1;
        w=minw*aw;
   end
   ah=ah+1;
   h=minh*ah;
   w=minw; %��λ
   aw=1; %��λ
end