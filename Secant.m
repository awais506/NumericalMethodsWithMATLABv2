
%Author: Muhammad Awais
%UET Lahore, Electrical Engineering
%fb/awais12506

function [xr,iteration]=Secant(x0,x1,f,e)

%Find Root of a equation by method of BiSection
%Input: Lower Limit, Upper Limit, Function, Error Tolerance
%Please Insert f as f=@(x)x.^2+9*x+3
%Output: Root of the equation with given precison
%Exception: Give error if Equation is not convergent or roots are dont give
%%
%postive and negative values of the function
tic;
%Variables initilization for later use
iteration=1;     %To see how many iterations, equation took to solve
xr=x0;
error=1;
errorPercent=0;
itrMax=100;

%Matrices to store values in the while loop to make graph later
GraphXr=zeros(itrMax,1);
GraphError=zeros(itrMax,1);

fprintf('Itr         x0           x1           Xr          Error\n')
while ( abs(error) > abs(e) && iteration<=itrMax )
    
    %Value of Xm and error stores here in each itr for graph
    GraphXr(iteration)=xr;
    GraphError(iteration)=abs(error);
    
    xrOld=xr;
    xr=x1-( (f(x1)*(x0-x1)) /(f(x0)-f(x1)));   %Formula Implementation
    xrNew=xr;
    
    fprintf('%d',iteration)
    fprintf('           ')
    fprintf('%.4f',x0)
    
    fprintf('        ')
    fprintf('%.4f',x1)
    
    fprintf('        ')
    fprintf('%.4f',xr)
    
    fprintf('        ')
    fprintf('%.8f',errorPercent)
    fprintf('\n')
    
    %swaping of variables
    x0=x1;
    x1=xr;
    
    %Error calculation
    error=(xrNew-xrOld)/xrNew;
    errorPercent=abs(error)*100;
    %Iteration counter
    iteration=iteration+1;
end
toc;

%Graph making
GraphXr=GraphXr(1:iteration-1);
GraphError=GraphError(1:iteration-1);
xaxis=1:1:iteration-1;
figure
plot(xaxis,GraphXr,'blue-o',xaxis,GraphError,'red-o')
title('Secant Method to find roots')
xlabel('Iteration Number')
ylabel('Value of the root')
legend('Root','Relative Error')
end