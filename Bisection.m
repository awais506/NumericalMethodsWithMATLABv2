
%Author: Muhammad Awais
%UET Lahore, Electrical Engineering
%fb/awais12506

function [iteration,xm]=Bisection(xl,xu,f,e)

%Find Root of a equation by method of BiSection
%Input: Lower Limit, Upper Limit, Function, Error Tolerance
%Please Insert f as f=@(x)x.^2+9*x+3
%Output: Root of the equation with given precison and Number of iterations
%Exception: Give error if Equation is not convergent or roots are dont give
%%
%postive and negative values of the function

tic;

%Variables initilization for later use
iteration=1;     %To see how many iterations, equation took to solve
xm=xl;
error=1;
errorPercent=0;
itrMax=100;

%Matrices to store values in the while loop to make graph later
GraphXm=zeros(itrMax,1);
GraphError=zeros(itrMax,1);

%To check interval validation according to rules
if  (f(xl)*f(xu)>0)
    disp('Interval have some error')
    
    
else
    fprintf('Itr         Xl           Xu           Xm          Error\n')
    while ( abs(error) >= e && iteration<=itrMax   )
        
        %Value of Xm and error stores here in each itr for graph
        GraphXm(iteration)=xm;
        GraphError(iteration)=abs(error);
        
        
        xmOld=xm;
        xm=(xl+xu)/2;   %Mid point formula
        xmNew=xm;
        
        %For table
        fprintf('%d',iteration)
        fprintf('           ')
        fprintf('%.4f',xl)
        
        fprintf('        ')
        fprintf('%.4f',xu)
        
        fprintf('        ')
        fprintf('%.4f',xm)
        
        fprintf('        ')
        fprintf('%.8f',errorPercent)
        fprintf('\n')
        
        %For next interval
        %if f(xm) is neg, equate xu with xm
        if(  ( f(xl)*f(xm) ) <0  && (f(xu)*f(xm)) >0 )   
            xu=xm;
        %if f(xm) is pos, equate xl with xm    
        else if (f(xl)*f(xm)>0 && (f(xu)*f(xm)) <0 )
                xl=xm;
            %Root found    
            else            
                break
                
            end
        end
        %Error calculation
        error=((xmNew-xmOld)/xmNew);   
        errorPercent=abs(error)*100;
        %Iteration counter
        iteration=iteration+1;   
    end
    
end
%Time taken to solve this s
toc;

%Graph making
GraphXm=GraphXm(1:iteration-1);
GraphError=GraphError(1:iteration-1);
xaxis=1:1:iteration-1;
figure
plot(xaxis,GraphXm,'blue-o',xaxis,GraphError,'red-o')
title('Bisection Method to find roots')
xlabel('Iteration Number')
ylabel('Value of the root')
legend('Root','Relative Error')
end