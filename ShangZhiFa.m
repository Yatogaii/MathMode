%�����ɵ� �ο�https://blog.csdn.net/u013713294/article/details/53407087
clc; clear;
%Xij��ʾ��i����λ�ĵ�j��ָ�����ֵ
%�����ʾ��λ�������ʾ��ֵ
x = input('������ÿ����ݶ�Ӧ��ָ����');
[n,m] = size(x);
p=zeros(n,m);          %ָ��ı���
X=zeros(n,m); %��׼������֮�������
e=zeros(1,m);     %��j��ָ�����ֵ
d=zeros(1,m);     %�����
w=zeros(1,m);       %Ȩֵ
k=1/log(n);
[X,ps]=mapminmax(x');
ps.ymin=0.002; % ��һ�������Сֵ
ps.ymax=0.996; % ��һ��������ֵ
ps.yrange=ps.ymax-ps.ymin; % ��һ����ļ���,����������ֵ, ������������
X=mapminmax(x',ps);
% mapminmax('reverse',xx,ps); % ����һ��, �ص�ԭ����
X=X';  % XΪ��һ���������, 23��(����), 5��(ָ��)
%�����j��ָ���µ�i������ֵռ��ָ��ı���
for i=1:n  
    for j=1:m
        %Ϊ�˱�֤���ȣ�ʹ��ԭʼ����
        %����Ϊi������jָ�����ݣ���ĸΪ����ָ��֮��
        p(i,j)=X(i,j)/sum(x(:,j));
    end
end
%�����j��ָ�����ֵ
for j=1:m
    e(j)=-k*sum(p(:,j).*log(p(:,j)));
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