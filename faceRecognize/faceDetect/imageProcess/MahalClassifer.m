function [ClassRate] = MahalClassifer(train_pattern, train_label, test_pattern,test_label,a)
%%%%%%%%%%%%%%%%% this function is for mean nearest classifier
% a for mix mahal distance
% m for eachnum
  L= length(train_label);
  allmean=mean(train_pattern')';
  Mt=train_pattern-allmean*ones(1,size(train_pattern,2));
  Mt=Mt/sqrt(L);
  St=Mt*Mt';
  m=length(train_label)/length(unique(train_label));
  % for the nonmix
  if size(train_pattern,1)==1
        for i=1:size(test_pattern,2)
              for j=1:L
                  M=(test_pattern(i)+train_pattern(j))/2;
                  TM=(test_pattern(i)-M)*(test_pattern(i)-M)'+(train_pattern(j)-M)*(train_pattern(j)-M)';
                  TM=TM/2;
                  l=1e-13;
                  while rank(TM)~=size(TM,1)
                      TM=TM+eye(size(TM)).*l;
                      l=l*10;
                  end
                  dist(j)=(test_pattern(i)-train_pattern(j))'*inv(TM)*((test_pattern(i)-train_pattern(j)));
              end
              pritarget(i)=findtarget(dist,train_label);               
        end
      else
        for i=1:size(test_pattern,2)
            for j=1:L
                  M=(test_pattern(:,i)+train_pattern(:,j))/2;
                  TM=(test_pattern(:,i)-M)*(test_pattern(:,i)-M)'+(train_pattern(:,j)-M)*(train_pattern(:,j)-M)';
                  TM=TM/2;
                  l=1e-13;
                  while rank(TM)~=size(TM,1)
                      TM=TM+eye(size(TM)).*l;
                      l=l*10;
                  end
                  dist(j)=(test_pattern(:,i)-train_pattern(:,j))'*inv(TM)*((test_pattern(:,i)-train_pattern(:,j)));
              end
              pritarget(i)=findtarget(dist,train_label);         
        end
    end
      num=0;
for i=1:size(test_pattern,2)
    if pritarget(i)==test_label(i)
        num=num+1;
    end
end
ClassRate(1)=num/size(test_pattern,2);
% for bayes
 if size(train_pattern,1)==1
        for i=1:size(test_pattern,2)
              for j=1:L
                  M=(test_pattern(i)+train_pattern(j))/2;
                  TM=(test_pattern(i)-M)*(test_pattern(i)-M)'+(train_pattern(j)-M)*(train_pattern(j)-M)';
                  TM=TM/2;
                  l=1e-13;
                  while rank(TM)~=size(TM,1)
                      TM=TM+eye(size(TM)).*l;
                      l=l*10;
                  end
                  dist(j)=(log(abs(det(TM))))+(test_pattern(i)-train_pattern(j))'*inv(TM)*((test_pattern(i)-train_pattern(j)));
              end
              pritarget(i)=findtarget(dist,train_label);               
          end
      else
        for i=1:size(test_pattern,2)
            for j=1:L
                  M=(test_pattern(:,i)+train_pattern(:,j))/2;
                  TM=(test_pattern(:,i)-M)*(test_pattern(:,i)-M)'+(train_pattern(:,j)-M)*(train_pattern(:,j)-M)';
                  TM=TM/2;
                  l=1e-13;
                  while rank(TM)~=size(TM,1)
                      TM=TM+eye(size(TM)).*l;
                      l=l*10;
                  end
                  dist(j)=(log(abs(det(TM))))+(test_pattern(:,i)-train_pattern(:,j))'*inv(TM)*((test_pattern(:,i)-train_pattern(:,j)));
              end
              pritarget(i)=findtarget(dist,train_label);         
        end
    end
      num=0;
for i=1:size(test_pattern,2)
    if pritarget(i)==test_label(i)
        num=num+1;
    end
end
ClassRate(2)=num/size(test_pattern,2);
% for mix
  if size(train_pattern,1)==1
        for i=1:size(test_pattern,2)
              for j=1:L
                  M=(test_pattern(i)+train_pattern(j))/2;
                  TM=(test_pattern(i)-M)*(test_pattern(i)-M)'+(train_pattern(j)-M)*(train_pattern(j)-M)';
                  TM=TM/2;
                  TM=((1-a)*TM+a*L*St)/((1-a)+a*L);
                  l=1e-13;
                  while rank(TM)~=size(TM,1)
                      TM=TM+eye(size(TM)).*l;
                      l=l*10;
                  end
                  dist(j)=(test_pattern(i)-train_pattern(j))'*inv(TM)*((test_pattern(i)-train_pattern(j)));
              end
              pritarget(i)=findtarget(dist,train_label);               
        end
      else
        for i=1:size(test_pattern,2)
            for j=1:L
                  M=(test_pattern(:,i)+train_pattern(:,j))/2;
                  TM=(test_pattern(:,i)-M)*(test_pattern(:,i)-M)'+(train_pattern(:,j)-M)*(train_pattern(:,j)-M)';
                  TM=TM/2;
                  TM=((1-a)*TM+a*L*St)/((1-a)+a*L);
                  l=1e-13;
                  while rank(TM)~=size(TM,1)
                      TM=TM+eye(size(TM)).*l;
                      l=l*10;
                  end
                  dist(j)=(test_pattern(:,i)-train_pattern(:,j))'*inv(TM)*((test_pattern(:,i)-train_pattern(:,j)));
              end
              pritarget(i)=findtarget(dist,train_label);         
        end
    end
      num=0;
for i=1:size(test_pattern,2)
    if pritarget(i)==test_label(i)
        num=num+1;
    end
end
ClassRate(3)=num/size(test_pattern,2);
% for bayes
 if size(train_pattern,1)==1
        for i=1:size(test_pattern,2)
              for j=1:L
                  M=(test_pattern(i)+train_pattern(j))/2;
                  TM=(test_pattern(i)-M)*(test_pattern(i)-M)'+(train_pattern(j)-M)*(train_pattern(j)-M)';
                  TM=TM/2;
                  TM=((1-a)*TM+a*L*St)/((1-a)+a*L);
                  l=1e-13;
                  while rank(TM)~=size(TM,1)
                      TM=TM+eye(size(TM)).*l;
                      l=l*10;
                  end
                  dist(j)=(log(abs(det(TM))))+(test_pattern(i)-train_pattern(j))'*inv(TM)*((test_pattern(i)-train_pattern(j)));
              end
              pritarget(i)=findtarget(dist,train_label);               
        end
      else
        for i=1:size(test_pattern,2)
            for j=1:L
                  M=(test_pattern(:,i)+train_pattern(:,j))/2;
                  TM=(test_pattern(:,i)-M)*(test_pattern(:,i)-M)'+(train_pattern(:,j)-M)*(train_pattern(:,j)-M)';
                  TM=TM/2;
                  TM=((1-a)*TM+a*L*St)/((1-a)+a*L);
                  l=1e-13;
                  while rank(TM)~=size(TM,1)
                      TM=TM+eye(size(TM)).*l;
                      l=l*10;
                  end
                  dist(j)=(log(abs(det(TM))))+(test_pattern(:,i)-train_pattern(:,j))'*inv(TM)*((test_pattern(:,i)-train_pattern(:,j)));
              end
              pritarget(i)=findtarget(dist,train_label);         
        end
    end
      num=0;
for i=1:size(test_pattern,2)
    if pritarget(i)==test_label(i)
        num=num+1;
    end
end
ClassRate(4)=num/size(test_pattern,2);
function [target]=findtarget(dist,label)
        [m, indices] = sort(dist);
if dist(indices(1))~=dist(indices(2))
    target=label(indices(1));
else
    p=zeros(1,length(unique(label)));
    index=find(dist==dist(indices(1)));
    for i=1:length(index)
        p(label(index(i)))=p(label(index(i)))+1;  
    end
   [c target]=max(p);
end