%Jaccobi Method 
%All the equation are defined here correspondigly
f1=@(x2,x3)(12+x2-2*x3)/5;
f2=@(x1,x3)(-25-3*x1+2*x3)/8;
f3=@(x1,x2)(6-x1-x2)/4;
%Initial Guess
x1i=0;
x2i=0;
x3i=0;
%Defining all the variables that are being used in loop
x1temp=0;
x2temp=0;
x3temp=0;
i=0; %iteration number 
itrMax=10;  %Maximum Iteration to be done
%Variabe for Graph plotting
Graphx1=zeros(itrMax);
Graphx2=zeros(itrMax);
Graphx3=zeros(itrMax);

fprintf('Itr         X1           X2           X3\n')
%Loop 
while(i<itrMax)
i=i+1;
%x1,x2,x3 values are being find
  x1temp=f1(x2i,x3i);
  x2temp=f2(x1i,x3i);
  x3temp=f3(x1i,x2i);
  x1i=x1temp;
  x2i=x2temp;
  x3i=x3temp;
%To Table all the values 
fprintf('%d',i)
fprintf('           ')
fprintf('%.2f',x1i)

fprintf('        ')
fprintf('%.2f',x2i)

fprintf('        ')
fprintf('%.2f',x3i)
fprintf('\n')
%These array are used to store values to make graph later
Graphx1(i)=x1i;
Graphx2(i)=x2i;
Graphx3(i)=x3i;

end
xaxis=1:1:itrMax;
figure
plot(xaxis,Graphx1,'green-o',xaxis,Graphx2,'blue-o',xaxis,Graphx3,'red-o')
title('Jaccobian Method to find Roots')
xlabel('Iteration Number')
ylabel('Value of the root')

