function M = LAMS(N,Na,R,delta,L,T,c)

    %Function to simulate the synchronous and sequential random
    %asynchronous LAM (Strömbom et al. 2019. RSOS).

    rng('shuffle') %generate new random initial configuration

    % PARAMETERS

    % N = Total number of particles
    % Na = number of particles using the Asynchronous heading/position update (so N-Na are using Synchronous update)
    % T = maximum simulation time
    % c = relative strength of attraction to the local center of mass
    % R = interaction radius
    % delta = displacement per timestep
    % L = side length of square w periodic bc

    %TO COLLECT ALIGNMENT VALUES
    AL=[];

    %INITIATE PARTICLE POSITIONS AND HEADINGS

    P=zeros(N,3); % N particle matrix
    for i=1:N %For each particle
        P(i,1)=rand*L; %Initiate x-coordinate.
        P(i,2)=rand*L; %Initiate y-coordinate.
        P(i,3)=rand*2*pi-pi; %Initiate heading [-pi,pi].
    end

    k=1;
    kk=1;

    while k<=T 
        
%         %----Plotting------------------------------------------------
%         if mod(k,100)==0
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
%            U(k)=getframe; %makes a movie fram from the plot
%            
%            kk=kk+1;
%         end
%     %     %-------------------------------------------------------------


        % UPDATE THE Na ASYNCHRONOUSLY UPDATING PARTICLES

        for i=1:Na 

            %FIND THE NEIGHBORS AND CALCULATE THE LOCAL ATTRACTION VECTOR (CM)
            %for particle i using the nhS.m function.

            %nhS.m calculates (for particle i)
            %1. the direction from it to the local center of mass of its neighbors (CM)
            %2. the number of non-self neighbors (n)

            CMAL=nhS(i,P,R,L); 

            CM=CMAL(1,:); % Direction to the LCM
            n=CMAL(2,1); % Number of non-self neighbors

            %PARTICLE i's CURRENT HEADING (D)

            D=[cos(P(i,3)),sin(P(i,3))]; 


            %PARTICLE i's NEW HEADING (Dir) 

            if n==0 %If no neighbours no local interactions

                Dir=D; 

            else %if at least one neighbour local interactions occur

                Dir=c*CM+D;

            end

            NormDir=(1/(Dir(1,1)^2+Dir(1,2)^2)^0.5)*Dir; %Normalized new heading

            P(i,3)=atan2(NormDir(1,2),NormDir(1,1)); %New heading angle

            %Update position   
            P(i,1)=mod(P(i,1)+delta*NormDir(1,1),L); %New x-coordinate
            P(i,2)=mod(P(i,2)+delta*NormDir(1,2),L); %New y-coordinate

        end


       % UPDATE THE N-Na SYNCHRONOUSLY UPDATING PARTICLES

       PP=zeros(N,3); %Initiate temporary matrix to store updated positions and headings for Synchronously updating particles

       for i=Na+1:N % 

            %FIND THE NEIGHBORS AND CALCULATE THE LOCAL ATTRACTION VECTOR (CM)
            %for particle i using the nhS.m function.

            %nhS.m calculates (for particle i)
            %1. the direction from it to the local center of mass of its neighbors (CM)
            %2. the number of non-self neighbors (n)

            CMAL=nhS(i,P,R,L); 

            CM=CMAL(1,:); % Direction to the LCM
            n=CMAL(2,1); % Number of non-self neighbors


            %PARTICLE i's CURRENT HEADING (D)

            D=[cos(P(i,3)),sin(P(i,3))]; 


            %PARTICLE i's NEW HEADING (Dir)

            if n==0 %If no neighbours no local interactions

                Dir=D; 

            else %if at least one neighbour local interactions

                Dir=c*CM+D;

            end

            NormDir=(1/(Dir(1,1)^2+Dir(1,2)^2)^0.5)*Dir; %Normalized new heading

            PP(i,3)=atan2(NormDir(1,2),NormDir(1,1)); %Store new heading angle in temp matrix PP

            % Store new position in temp matrix PP
            PP(i,1)=mod(P(i,1)+delta*NormDir(1,1),L); %New x-coordinate
            PP(i,2)=mod(P(i,2)+delta*NormDir(1,2),L); %New y-coordinate

       end

       %UPDATE P MATRIX 

       P(Na+1:N,:)=PP(Na+1:N,:); %Insert all Synchronously updated positions/angles (in PP) into the particle matrix P. 


       %PERMUTE THE ROWS IN THE P MATRIX (To avoid particles being updated in a specific order in every time step)

       Q=P;
       dd=randperm(N); % d is a random permutation of the vector [1,2,3,..,N]
       for i=1:N % This loop randomly change the order of the rows, and hence the individual particles, in P.
          P(i,:)=Q(dd(i),:); 
       end


       %MEASUREMENT CALCULATIONS

        % Polarization calculation
        al=(1/N)*sqrt(sum(cos(P(:,3)))^2+sum(sin(P(:,3)))^2);
        
        AL=[AL,al];

        k=k+1; %Increase time 

    end   

    M=AL;
    

   