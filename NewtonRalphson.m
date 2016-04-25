%Author: Muhammad Awais 2012-ee-506 UET Lahore
%This Function uses Newton Ralphson Method to find root of a function
%Input: Function , initial guess, minmum tolerace
%Output: Roots of function, Number of iterations used.
%Please input function in following way...
%syms x
%f=x.^3-20
function [y,iteration]=NewtonRalphson(f,x0,itrMax,e)
tic;
g=diff(f);      %Differentiation of f
%older and new is to hold values of x in each iteration and last iteration.
old=0;
new=1;
error=1;
errorPercent=0;
%Matrices to store values in the while loop to make graph later
GraphX1=zeros(itrMax,1);
GraphError=zeros(itrMax,1);

%Iteration Counter
iteration=1;
 fprintf('Itr         X0           X1           Error\n')
while (abs(error) >= e && iteration<itrMax    )
    
   
    
    old=x0;
    %Newton Ralphson Formula
    x1=x0-(double(subs(f,x0))/double(subs(g,x0)));  
    
    %For table
        fprintf('%d',iteration)
        fprintf('           ')
        fprintf('%.4f',x0)
        
        fprintf('        ')
        fprintf('%.4f',x1)
        
        fprintf('        ')
        fprintf('%.8f',errorPercent)
        fprintf('\n')
    %Swaping of variables
    new=x1;
    x0=x1;
    %Error Calculation
    error=((new-old)/new);
    errorPercent=error*100;
    %Variables Storage for Graphs
    GraphX1(iteration)=x1;
    GraphError(iteration)=abs(error);
    %iteration Counter
    iteration=iteration+1;
    
end
y=0;
toc
%Graph making
GraphX1=GraphX1(1:iteration-1);
GraphError=GraphError(1:iteration-1);
xaxis=1:1:iteration-1;
figure
plot(xaxis,GraphX1,'blue-o',xaxis,GraphError,'red-o')
title('Newton Ralphson Method to find roots')
xlabel('Iteration Number')
ylabel('Value of the root')
legend('Root','Relative Error')
end

