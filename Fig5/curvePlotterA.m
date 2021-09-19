function M=curvePlotterA(AL,th)

%Function to plot the standardized polarization curves from alignment data
%(AL) and polarization threshold (th).

T=size(AL,2);

C=[];
for i=1:T
    if AL(1,i)>th %If alignment is above threshold
        C=[C,i+1]; %Record first step when random config
    end
end
size(C)
% MC=[]; %find max length
% for i=1:size(C,2)-1
%     MC=[MC,C(1,i+1)-C(1,i)];
% end
% mc=max(MC); %max length of run

    M=[];
    for i=1:size(C,2)-1
        A=AL(1,C(1,i):C(1,i+1)-1);
        n=size(A,2);
        x=1:1:n;
        y=A;
        AI = interp1(x,y,1:0.001:n); %Interpolate antic vector first because short
        
        n=size(AI,2);
        n;
        Y=AI;
        X=(1/n)*[1:n];
        %X=0:n-1;
        IV = interp1(X,Y,0:0.001:1,'linear','extrap');
        
        M=[M;IV];
    end

plot(0:0.001:1,M)