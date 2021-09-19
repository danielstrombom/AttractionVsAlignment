function X = LAMBS2021pertnp(N,R,delta,L,c,T)

%Function to simulate repolarization behavior of Burst-and-stop LAM.

    rng('shuffle') %generate new random initial configuration

    % PARAMETERS

    % N = Total number of particles
    % T = maximum simulation time
    % c = relative strength of attraction to the local center of mass
    % R = interaction radius
    % delta = displacement per timestep
    % L = side length of square w periodic bc
    
    %INIT TIMESTEP AND COUNT
    ts=1;
    k=1;
    
    %BURST TIME DISTRIBUTION
    XX=0:1:15; 
    Gamma=wblpdf(XX,4,3); %PDF for distribution Gamma
%    size(Gamma)
    
    NS=[]; %for collecting glide times in simulations to test that works
    SP=[]; %To collect particle speed over time
    AL=[]; %To collect alignment values
  %  CP=cell(1,T+1);

    %INITIATE PARTICLE POSITIONS AND HEADINGS

    P=zeros(N,6); % N particle matrix
    for i=1:N %For each particle
        P(i,1)=rand*L; %Initiate x-coordinate.
        P(i,2)=rand*L; %Initiate y-coordinate.
        P(i,3)=rand*2*pi-pi; %Initiate heading [-pi,pi].
        P(i,4)=round(5*rand); %Initiate time steps until next update
        P(i,5)=delta;%*exp(-0.1*rand); %initiate speed
        P(i,6)=0; %Last update timestep
    end

    CP{1,1}=P;
    
    kk=1;
    S=0; %Turn off if got 1000 repolarizations
kS=0; %Repolarization counter
    
    while k<=T && S==0    %If k less than max time and not reached 1000 repolarizations

     %   if mod(k,1000)==0
%         
%         %----Plotting------------------------------------------------
%            plot(P(:,1),P(:,2),'k.','markersize',10);
%            hold on
%            for r=1:N
%                 plot([P(r,1),P(r,1)+cos(P(r,3))],[P(r,2),P(r,2)+sin(P(r,3))],'r-');
%            end            
%            hold off
%            axis([0 L 0 L]);
%            xlabel('X position')
%            ylabel('Y position')
%            axis manual
%            U(kk)=getframe; %makes a movie fram from the plot
%            kk=kk+1;
%     %     %-------------------------------------------------------------
%     al
%    end

       PP=zeros(N,4); %Initiate temporary matrix to store updated positions and headings for Synchronously updating particles

       for i=1:N % 

            CMAL=nhS(i,P,R,L); 
            CM=CMAL(1,:); % Direction to the LCM
            n=CMAL(2,1); % Number of non-self neighbors

            D=[cos(P(i,3)),sin(P(i,3))]; 

            
            if P(i,4)<k %if update heading in this time step

                if n==0 %If no neighbours no local interactions

                    Dir=D; 

                else %if at least one neighbour local interactions

                    Dir=c*CM+D;

                end

                NormDir=(1/(Dir(1,1)^2+Dir(1,2)^2)^0.5)*Dir; %Normalized new heading

                PP(i,3)=atan2(NormDir(1,2),NormDir(1,1)); %Store new heading angle in temp matrix PP
                
                PP(i,5)=delta*1.5;
                PP(i,6)=k; %
                
                % Store new position in temp matrix PP
                PP(i,1)=mod(P(i,1)+PP(i,5)*cos(PP(i,3)),L); %New x-coordinate
                PP(i,2)=mod(P(i,2)+PP(i,5)*sin(PP(i,3)),L); %New y-coordinate
                
                %Glide time from Gamma
                r=rand;
                zz=1;
                zzt=0;
                while zzt==0
                    if r<=sum(Gamma(1,1:zz))                  
                        ns=zz;
                       zzt=1;
                    end
                    zz=zz+1;    
                end  
                    NS=[NS,ns];
                    
                
                PP(i,4)=k+ns; %New update time with glide time poisson distributed with mean 4
                
            else
                PP(i,5)=0; %glide and STOP delta*exp(0.5*(P(i,6)-k)); %speed in this ts %THIS LINE
                PP(i,6)=P(i,6); %Last update time does not change
                
                PP(i,1)=mod(P(i,1)+PP(i,5)*cos(P(i,3)),L); %New x-coordinate
                PP(i,2)=mod(P(i,2)+PP(i,5)*sin(P(i,3)),L); %New y-coordinate
                
                PP(i,3)=P(i,3);
                PP(i,4)=P(i,4);           
                
             %   PP(i,5)%
             
             

            end
       end
       
       %ALIGNMENT CALCULATION
       al=(1/N)*sqrt(sum(cos(P(:,3)))^2+sum(sin(P(:,3)))^2);
       
       %COLLECT ALIGNMENT VALUES
       AL=[AL,al];
       
       %Collect speeds of 2 particles
       SP=[SP,[PP(1,5);PP(2,5)]];
       
       

       %UPDATE P MATRIX 
       
        P=PP; %Insert all Synchronously updated positions/angles (in PP) into the particle matrix P.

        if al>0.9
        P(1:N,3)=rand(N,1)*2*pi;
        kS=kS+1;
        if kS==1000 %If reached 1000 repolarizations
            S=1; %end simulation
        end
    end
        
       % CP{1,k}=P;
        
         k=k+1; %Increase plot index

    end   
    
    X=AL;
    
  %  plot(1:T,AL)
    
%     X={SP,NS};
%     
%     figure;
%     subplot(3,1,1)
%     histogram(NS);
%     subplot(3,1,2)
%     plot([1:T],SP(1,:),'-r');
%     hold on
%     plot([1:T],SP(2,:),'-b');
%     subplot(3,1,3)
%     plot([1:T],AL(1,:),'-b');



   