% A=[   3  -0.1   -0.2   7.85
%     0.1     7   -0.3  -19.3    
%    0.3  -0.2    10    71.4
%     ];
function G=GaussElimination(A)
%Eliminates A into guass
orginalA=A;
[row,col]=size(A);
G=zeros(row,col)
%for each operation
for opN=2:1:row
    %for each row
    for k=opN:1:row
        
        A(k,:)=A(k,:)-( A(opN-1,:) *  ( A(k,opN-1) /  A(opN-1,opN-1) ) )
    end
end 

G=A;
A=orginalA;
end