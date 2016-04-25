%Author: Muhammad Awais
%UET Lahore, Electrical Engineering
%fb/awais12506

%Gauss Seidal Method Method 
%All the equation are defined here correspondigly
tic;
f1=@(x2,x3)(1-3*x2+5*x3)/12;
f2=@(x1,x3)(28-x1-3*x3)/5;
f3=@(x1,x2)(76-3*x1-7*x2)/13;
%Initial Guess
x1i=1;
x2i=0;
x3i=1;

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
  x1i=f1(x2i,x3i);
  x2i=f2(x1i,x3i);
  x3i=f3(x1i,x2i);
  
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
toc
xaxis=1:1:itrMax;
figure
plot(xaxis,Graphx1,'green-o',xaxis,Graphx2,'blue-o',xaxis,Graphx3,'red-o')
title('Gauss Seidal Method to find roots')
xlabel('Iteration Number')
ylabel('Value of the root')

