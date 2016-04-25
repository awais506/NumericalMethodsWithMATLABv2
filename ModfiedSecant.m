
%Author: Muhammad Awais
%UET Lahore, Electrical Engineering
%fb/awais12506

function [X1,iteration]=ModfiedSecant(delXi,Xi,f,e)
tic;
%Find Root of a equation by method of BiSection
%Input: Lower Limit, Upper Limit, Function, Error Tolerance
%Please Insert f as f=@(x)x.^2+9*x+3
%Output: Root of the equation with given precison
%Exception: Give error if Equation is not convergent or roots are dont give
%%
%postive and negative values of the function

%Variables initilization for later use
iteration=1;     %To see how many iterations, equation took to solve
X1=Xi;
error=1;
errorPercent=0;
itrMax=100;

%Matrices to store values in the while loop to make graph later
GraphX1=zeros(itrMax,1);
GraphError=zeros(itrMax,1);

%To check interval validation according to rules

fprintf('Itr         X1           Error\n')
while ( abs(error) > abs(e) && iteration<=itrMax )
    
    %Value of Xm and error stores here in each itr for graph
    GraphX1(iteration)=X1;
    GraphError(iteration)=abs(error);
    
    xOld=X1;
    X1=Xi-( (delXi*f(Xi)) /(f(Xi+delXi)-f(Xi)));   %Formula Implementation
    xNew=X1;
    Xi=X1;
    fprintf('%d',iteration)
    fprintf('           ')
    fprintf('%.4f',X1)
    
    fprintf('        ')
    fprintf('%.8f',errorPercent)
    fprintf('\n')
    
    
    %Error calculation
    error=(xNew-xOld)/xNew;
    errorPercent=abs(error)*100;
    %Iteration counter
    iteration=iteration+1;
end

toc;
%Graph making
GraphX1=GraphX1(1:iteration-1);
GraphError=GraphError(1:iteration-1);
xaxis=1:1:iteration-1;
figure
plot(xaxis,GraphX1,'blue-o',xaxis,GraphError,'red-o')
title('Modfied Secant Method to find roots')
xlabel('Iteration Number')
ylabel('Value of the root')
legend('Root','Relative Error')
end