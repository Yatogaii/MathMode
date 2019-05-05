%还有疑点 参考https://blog.csdn.net/u013713294/article/details/53407087
clc; clear;
%Xij表示第i个单位的第j个指标的数值
%纵轴表示单位，横轴表示数值
data = input('请输入每个年份对应的指标量');
[n,m] = size(data);
p=zeros(n,m);          %指标的比重
formatData=zeros(n,m); %标准化处理之后的数据
e=zeros(1,m);     %第j项指标的熵值
d=zeros(1,m);     %冗余度
w=zeros(1,m);       %权值
k=1/log(n);
for i=1:n  %对指标进行归一化处理，假设均为正向指标
    for j=1:m
        formatData(i,j) = (data(i,j)-min(data(:,j))) /...
                        max(data(:,j)) - min(data(:,j)); %用指标减去最小的指标值再除以指标的均值
    end
end
%计算第j项指标下第i个样本值占该指标的比重
for i=1:n  
    for j=1:m
        %为了保证精度，使用原始数据
        %分子为i样本的j指标数据，分母为所有指标之和
        p(i,j)=data(i,j)/sum(data(:,j));
    end
end
%计算第j项指标的熵值
for j=1:m
    tmp=0;
    for i=1:n
        e(j)=-k*sum(p(:,j).*log(p(:,j)));
        %tmp = tmp+p(i,j)*log(p(i,j));
    end
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