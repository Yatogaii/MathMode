%�����ɵ� �ο�https://blog.csdn.net/u013713294/article/details/53407087
clc; clear;
%Xij��ʾ��i����λ�ĵ�j��ָ�����ֵ
%�����ʾ��λ�������ʾ��ֵ
data = input('������ÿ����ݶ�Ӧ��ָ����');
[n,m] = size(data);
p=zeros(n,m);          %ָ��ı���
formatData=zeros(n,m); %��׼������֮�������
e=zeros(1,m);     %��j��ָ�����ֵ
d=zeros(1,m);     %�����
w=zeros(1,m);       %Ȩֵ
k=1/log(n);
for i=1:n  %��ָ����й�һ�����������Ϊ����ָ��
    for j=1:m
        formatData(i,j) = (data(i,j)-min(data(:,j))) /...
                        max(data(:,j)) - min(data(:,j)); %��ָ���ȥ��С��ָ��ֵ�ٳ���ָ��ľ�ֵ
    end
end
%�����j��ָ���µ�i������ֵռ��ָ��ı���
for i=1:n  
    for j=1:m
        %Ϊ�˱�֤���ȣ�ʹ��ԭʼ����
        %����Ϊi������jָ�����ݣ���ĸΪ����ָ��֮��
        p(i,j)=data(i,j)/sum(data(:,j));
    end
end
%�����j��ָ�����ֵ
for j=1:m
    tmp=0;
    for i=1:n
        e(j)=-k*sum(p(:,j).*log(p(:,j)));
        %tmp = tmp+p(i,j)*log(p(i,j));
    end
    %e(j)=-k*tmp;
end
%e
%������Ϣ�������
for j=1:m
    d(j) = 1-e(j);
end
%�������ָ���Ȩֵ
for j=1:m
    w(j)=d(j)/sum(d);
end
%�����ۺϵ÷�  �ò���
grades=zeros(1,n);
for i=1:n
    tmp=0;
    for j=1:m
        tmp = tmp + w(j)*p(i,j);
    end
    grades(i)=tmp;
end