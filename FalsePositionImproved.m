
%Author: Muhammad Awais
%UET Lahore, Electrical Engineering
%fb/awais12506

function [xr,iteration]=FalsePositionImproved(xl,xu,f,e)

%Find Root of a equation by method of BiSection
%Input: Lower Limit, Upper Limit, Function, Error Tolerance
%Please Insert f as f=@(x)x.^2+9*x+3
%Output: Root of the equation with given precison
%Exception: Give error if Equation is not convergent or roots are dont give
%%
%postive and negative values of the function

%Variables initilization for later use
iteration=1;     %To see how many iterations, equation took to solve
xr=xl;
error=1;
errorPercent=0;
itrMax=100;
xlCounter=0;
xuCounter=0;

%Matrices to store values in the while loop to make graph later
GraphXr=zeros(itrMax,1);
GraphError=zeros(itrMax,1);

%To check interval validation according to rules
if  (f(xl)*f(xu)>0)
    disp('Interval have some error')
    
else
    fprintf('Itr         Xl           Xu           Xr          Error\n')
    while ( abs(error) > abs(e) && iteration<=itrMax )
        
        %Value of Xm and error stores here in each itr for graph
        GraphXr(iteration)=xr;
        GraphError(iteration)=abs(error);
        
        xrOld=xr;
        
        
        if(xlCounter>0)
            xr=xu-( (f(xu)*(xl-xu)) /  ((f(xl)/ 2^xlCounter) - f(xu)));
        else if(xuCounter>0)
                xr=xu-( ((f(xu)/2^xuCounter)*(xl-xu)) /  (f(xl) -  ( f(xu)/2^xuCounter  )));
            else
                xr=xu-( (f(xu)*(xl-xu)) /(f(xl)-f(xu)));   %Formula Implementation
            end
        end
            xrNew=xr;
            
            fprintf('%d',iteration)
            fprintf('           ')
            fprintf('%.4f',xl)
            
            fprintf('        ')
            fprintf('%.4f',xu)
            
            fprintf('        ')
            fprintf('%.4f',xr)
            
            fprintf('        ')
            fprintf('%.8f',errorPercent)
            fprintf('\n')
            
            %if f(xm) is neg, equate xu with xm
            if f(xl)*f(xr)<0
                xu=xr;
                xuCounter=xuCounter+1;
                xlCounter=0;
                %if f(xr) is pos, equate xl with xm
            else if f(xl)*f(xr)>0
                    xl=xr;
                    xuCounter=0;
                    xlCounter=xlCounter+1;
                else            %it means xm is our root
                    break
                end
                
                
            end
            %Error calculation
            error=(xrNew-xrOld)/xrNew;
            errorPercent=abs(error)*100;
            %Iteration counter
            iteration=iteration+1;
        end
        
    end

%Graph making
GraphXr=GraphXr(1:iteration-1);
GraphError=GraphError(1:iteration-1);
xaxis=1:1:iteration-1;
figure
plot(xaxis,GraphXr,'blue-o',xaxis,GraphError,'red-o')
title('Improved False Position  Method to find roots')
xlabel('Iteration Number')
ylabel('Value of the root')
legend('Root','Relative Error')
end