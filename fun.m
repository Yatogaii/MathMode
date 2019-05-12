function Q = fun(W,R)
[n,m] = size(R)
Q  = zeros(1,m);
tmp = 0;
for i=1:m
    tmp = 0;
    for j=1:n
        tmp = tmp + W(j)*R(j,i);
    end
    Q(i) = min(1,tmp);
end
disp(Q)