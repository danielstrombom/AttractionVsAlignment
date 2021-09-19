function X=Fig3(N,R,delta,L,beta,tau,a,T)

    %Function to regenerate Figure 3 in Strömbom & Tulevech with option to 
    %change auxillary parameters. The function will run T simulations for 
    %each c in 0 to 2 (in increments of 0.1) and collect the polarization
    %value of the group over the last 40 time steps. 
    %Default command Fig3(100,4,0.5,20,pi,1,0.01,3)
    
    %PARAMETERS 
    %N = number of particles
    %R = interaction radius
    %delta = displacement per time step
    %L = side length of square
    %beta = size of blind zone for model II.
    %tau = anticipation time for model IV.
    %a = relative strength of explicit alignment in model VII.
    %T = number of simulations.
   
    


    %I. SYNCHRONOUS LAM
    t=8000; %Simulation time
    c=0:0.1:2; %c value vector
    sc=size(c,2); %number of c values
    pLAMSs=zeros(T,sc); %Matrix for collecting polarization measurements for LAM synchronous

    for k=1:T
        for i=1:sc
            M=LAMS(N,0,R,delta,L,t,c(1,i)); %Runs one simulation with for the i:th value of c
            sM=size(M,2);
            pLAMSs(k,i)=mean(M(1,((sM-50):sM))); %The polarization measurement returned from the k:th run for the i:th value of c.
        end
        [1 k c(1,i)] %Print to command window to keep track of progress [Model,simulation,c-value]  
        save pLAMSs pLAMSs 
    end

    %II. LAM + BLIND ZONE
    t=8000;
    %beta=pi;
    c=0:0.1:2; %c value vector
    sc=size(c,2); %number of c values
    pLAMB=zeros(T,sc); %Matrix for collecting polarization measurements

    for k=1:T
        for i=1:sc
            M=LAMB(N,R,delta,L,beta,c(1,i),t);
            sM=size(M,2);
            pLAMB(k,i)=mean(M(1,((sM-50):sM))); %The polarization measurement returned from the k:th run for the i:th value of c.
        end
        [2 k c(1,i)] %Print to command window to keep track of progress
         save pLAMB pLAMB
    end

    %III. ASYNCHRONOUS LAM
    t=15000;
    c=0:0.1:2; %c value vector
    sc=size(c,2); %number of c values
    pLAMSa=zeros(T,sc); %Matrix for collecting polarization measurements for LAM synchronous

    for k=1:T
        for i=1:sc
            M=LAMS(N,N,R,delta,L,t,c(1,i)); %Run one simulation with Asynch updates for the i:th value of c using the function SynchS.m
            sM=size(M,2);
            pLAMSa(k,i)=mean(M(1,((sM-50):sM))); %The polarization measurement returned from the k:th run for the i:th value of c.
        end
        [3 k c(1,i)] %Print to command window to keep track of progress
         save pLAMSa pLAMSa
    end


    %IV. LAM + ANTICIPATION
    t=5000;
   % tau=1;
    c=0:0.1:2; %c value vector
    sc=size(c,2); %number of c values
    pLAMA=zeros(T,sc); %Matrix for collecting polarization measurements for LAM synchronous

    for k=1:T
        for i=1:sc
            M=LAMA(N,R,delta,L,tau,c(1,i),t);
            sM=size(M,2);
            pLAMA(k,i)=mean(M(1,((sM-50):sM))); %The polarization measurement returned from the k:th run for the i:th value of c.
        end
        [4 k c(1,i)] %Print to command window to keep track of progress
         save pLAMA pLAMA
    end

    %V. BURST-AND-GLIDE LAM
    t=40000;
    c=0:0.1:2; %c value vector
    sc=size(c,2); %number of c values
    pLAMBG=zeros(T,sc); %Matrix for collecting polarization measurements for LAM synchronous

    for k=1:T
        for i=1:sc
            M=LAMBG(N,R,delta,L,c(1,i),t);
            sM=size(M,2);
            pLAMBG(k,i)=mean(M(1,((sM-50):sM))); %The polarization measurement returned from the k:th run for the i:th value of c.
        end
        [5 k c(1,i)] %Print to command window to keep track of progress
         save pLAMBG pLAMBG
    end

    %VI. BURST-AND-STOP LAM
    t=20000;
    c=0:0.1:2; %c value vector
    sc=size(c,2); %number of c values
    pLAMBS=zeros(T,sc); %Matrix for collecting polarization measurements for LAM synchronous

    for k=1:T
        for i=1:sc
            M=LAMBS(N,R,delta,L,c(1,i),t);
            sM=size(M,2);
            pLAMBS(k,i)=mean(M(1,((sM-50):sM))); %The polarization measurement returned from the k:th run for the i:th value of c.
        end
        [6 k c(1,i)] %Print to command window to keep track of progress
         save pLAMBS pLAMBS
    end

    %VII. LAM + EXPLICIT ALIGNMENT
    t=2000;
    c=0:0.1:2; %c value vector
   % a=0.01; %alignment strength
    sc=size(c,2); %number of c values
    pLAMAL=zeros(T,sc); %Matrix for collecting polarization measurements for LAM synchronous

    for k=1:T
        for i=1:sc
            M=LAMAL(N,R,delta,L,a,c(1,i),t);
            sM=size(M,2);
            pLAMAL(k,i)=mean(M(1,((sM-50):sM))); %The polarization measurement returned from the k:th run for the i:th value of c.
        end
        [7 k c(1,i)] %Print to command window to keep track of progress
         save pLAMAL pLAMAL
    end



    plotFig3







