grades = [
            3      14       15     8        
                7      11       18     4        
              10     12       17     1        
            16     12       11     1          
        1      16       10     13        
            20     8       12     0          
             1      12       14     13       
               1      13       13     13        
                  4      10       12     14        
                    4      13       12     11        
          6      10       12     12        
                 0      10       11     19       
             10     12       17     1        
                4      13       12     11       
            1      16       10     13        ];
 %qiu������
 [n,m]=size(grades);
 R = zeros(n,m);
 for i=1:n
     for j=1:m
        R(i,j) = grades(i,j)/40;
     end
 end
 for i=1:n
    sum(R(i,:))
 end
 disp(R)       