function X=Fig4(N,R,delta,L,beta,tau,a,T)

    %Function to regenerate Figure 4 in Strömbom & Tulevech with option to 
    %change auxillary parameters. The function will run T simulations for 
    %each model and collect the polarization values over time in each
    %simulation. The average of the polarization processes for each model
    %over the T simulations will then be plotted via the plotFig4.m
    %function called at the end. 
    %Default command Fig4(100,4,0.5,20,pi,2,0.1,1300)
    
    %PARAMETERS 
    %N = number of particles
    %R = interaction radius
    %delta = displacement per time step
    %L = side length of square
    %beta = size of blind zone for model II.
    %tau = anticipation time for model IV.
    %a = relative strength of explicit alignment in model VII.
    %T = number of simulations.
    
    
    %II. LAM + BLIND ZONE
    t=8000;
    % beta=pi;
    c=2;

    pLAMBP0=[]; %Matrix for collecting polarization measurements

    for k=1:T
            M=LAMB(N,R,delta,L,beta,c,t); %Run one simulation 
            pLAMBP0=[pLAMBP0;M]; %The polarization measurement returned from the k:th run for the i:th value of c.
            save pLAMBP0 pLAMBP0
            [k,0]
    end


    % III. ASYNCHRONOUS LAM 
    t=15000;
    c=0.2; %c value vector
    pLAMSaP0=[]; %Matrix for collecting polarization measurements for LAM synchronous

    for k=1:T
            M=LAMS(N,N,R,delta,L,t,c); %Run one simulation with Asynch updates for the i:th value of c using the function SynchS.m
            sM=size(M,2);
            pLAMSaP0=[pLAMSaP0;M]; %The polarization measurement returned from the k:th run for the i:th value of c.
            save pLAMSaP0 pLAMSaP0
             [k,1]
    end



    % IV. LAM + ANTICIPATION weak
    t=2000;
    %  tau=2;
    c=0.2;

    pLAMAP0=[]; %Matrix for collecting polarization measurements for LAM synchronous

    for k=1:T
         M=LAMA(N,R,delta,L,tau,c,t);
         pLAMAP0=[pLAMAP0;M]; %The polarization measurement returned from the k:th run for the i:th value of c.
         save pLAMAP0 pLAMAP0
         [k,2]
    end


    %IV. LAM + ANTICIPATION strong
    t=2000;
    %  tau=2;
    c=2;

    pLAMAP20=[]; %Matrix for collecting polarization measurements for LAM synchronous

    for k=1:T
         M=LAMA(N,R,delta,L,tau,c,t);
         pLAMAP20=[pLAMAP20;M]; %The polarization measurement returned from the k:th run for the i:th value of c.
         save pLAMAP20 pLAMAP20
         [k,3]
    end

    %V. BURST-AND-GLIDE LAM
    t=40000;
    pLAMBGP0=[]; %Matrix for collecting polarization measurements for LAM synchronous
    c=0.2;
    for k=1:T
            M=LAMBG(N,R,delta,L,c,t);
            pLAMBGP0=[pLAMBGP0;M]; %The polarization measurement returned from the k:th run for the i:th value of c.
         save pLAMBGP0 pLAMBGP0
         [k,4]
    end


    %VI. BURST-AND-STOP LAM
    t=20000;
    c=0.2;
    pLAMBSP0=[]; %Matrix for collecting polarization measurements for LAM synchronous

    for k=1:T
            M=LAMBS(N,R,delta,L,c,t);
            pLAMBSP0=[pLAMBSP0;M]; %The polarization measurement returned from the k:th run for the i:th value of c.
         save pLAMBSP0 pLAMBSP0
          [k,5]
    end


    %VII. LAM + EXPLICIT ALIGNMENT
    t=2000;
    %   a=0.1; %alignment strength
    c=0.2;
    pLAMALP=[]; %Matrix for collecting polarization measurements for LAM synchronous

    for k=1:T
            M=LAMAL(N,R,delta,L,a,c,t);
            pLAMALP=[pLAMALP;M]; %The polarization measurement returned from the k:th run for the i:th value of c.
         save pLAMALP pLAMALP
          [k,6]
    end

    %VIII. EXPLICIT ALIGNMENT ALONE
    t=2000;
    %   a=0.1; %alignment strength
    c=0;
    pLAMALP0=[]; %Matrix for collecting polarization measurements for LAM synchronous

    for k=1:T
            M=LAMAL(N,R,delta,L,a,c,t);
            pLAMALP0=[pLAMALP0;M]; %The polarization measurement returned from the k:th run for the i:th value of c.
         save pLAMALP0 pLAMALP0
          [k,7]
    end

    plotFig4