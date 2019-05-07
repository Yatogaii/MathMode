%还有疑点 参考https://blog.csdn.net/u013713294/article/details/53407087
clc; clear;
%Xij表示第i个单位的第j个指标的数值
%纵轴表示单位，横轴表示数值
x = input('请输入每个年份对应的指标量');
[n,m] = size(x);
p=zeros(n,m);          %指标的比重
X=zeros(n,m); %标准化处理之后的数据
e=zeros(1,m);     %第j项指标的熵值
d=zeros(1,m);     %冗余度
w=zeros(1,m);       %权值
k=1/log(n);
[X,ps]=mapminmax(x');
ps.ymin=0.002; % 归一化后的最小值
ps.ymax=0.996; % 归一化后的最大值
ps.yrange=ps.ymax-ps.ymin; % 归一化后的极差,若不调整该值, 则逆运算会出错
X=mapminmax(x',ps);
% mapminmax('reverse',xx,ps); % 反归一化, 回到原数据
X=X';  % X为归一化后的数据, 23行(国家), 5列(指标)
%计算第j项指标下第i个样本值占该指标的比重
for i=1:n  
    for j=1:m
        %为了保证精度，使用原始数据
        %分子为i样本的j指标数据，分母为所有指标之和
        p(i,j)=X(i,j)/sum(x(:,j));
    end
end
%计算第j项指标的熵值
for j=1:m
    e(j)=-k*sum(p(:,j).*log(p(:,j)));
    %e(j)=-k*tmp;
end
%e
%计算信息熵冗余度
for j=1:m
    d(j) = 1-e(j);
end
%计算各项指标的权值
for j=1:m
    w(j)=d(j)/sum(d);
end
%计算综合得分  用不到
grades=zeros(1,n);
for i=1:n
    tmp=0;
    for j=1:m
        tmp = tmp + w(j)*p(i,j);
    end
    grades(i)=tmp;
end