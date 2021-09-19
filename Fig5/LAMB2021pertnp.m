function M = LAMB2021pertnp(N,R,delta,L,beta,c,t)

%Local attraction model with blind angle. Modified to include perturb.

rng('shuffle') %generate new random initial configuration each time

%PARAMETERS
%c = relative tendency to head for the center of mass of the neighbors
%beta=size of blind zone
%N = number of particles
%L = side length of square
%t = number of time steps
%R = interaction radius
%delta = displacement per time step


%INITIALIZE PARTICLE POSTIONS, HEADINGS and PREDICTED POSITIONS 
P=zeros(N,3); % Create initial population
G=zeros(N,3); % Predictions
L=2*L;
for i=1:N % Initiate each of the N individuals.
    P(i,1)=rand*L; % Initiates x-coordinate.
    P(i,2)=rand*L; % Initiates y-coordinate.
    P(i,3)=rand*2*pi-pi; % Initiates angle [-pi,pi].
end

%COLLECT ALIGNMENT VALUES
AL=[];

%INITIALIZE HELP VARIABLES
 k=1; %Timestep
kk=1;
S=0; %Turn off if got 5000 repolarizations
kS=0; %Repolarization counter

while k<=t  && S==0    %If k less than max time and not reached 1000 repolarizations
    
%     if mod(k,1000)==0
%                 %----Plotting------------------------------------------------
%             plot(P(:,1),P(:,2),'k.','markersize',10);
%             hold on
%             for r=1:N
%                 plot([P(r,1),P(r,1)+1*cos(P(r,3))],[P(r,2),P(r,2)+1*sin(P(r,3))],'r-');
%             end
%             hold off
%             axis([0 L 0 L]);
%             xlabel('X position')
%             ylabel('Y position')
%             axis manual
%             U(kk)=getframe; %makes a movie fram from the plot
%             %-------------------------------------------------------------
%             kk=kk+1;
%     end
    if mod(k,500000)==0
        k
    end
    
   PP=zeros(N,3); %Initiate array for simultaneous update

   for i=1:N %Update each particle


        %FIND NEIGHBOURS AND CALCULATE C (if tau=0) or aC if (tau>0)
        %nh2DL calculates for each particle i
        %1. its neighborhood (i.e. finds the particles in its neighborhood.) 
        %2. the direction from it toward the local center of mass of its (anticipated) neighborhood (C)

        CMAL=nh2DL(i,P,R,L,beta); 

        C=CMAL(1,:); % Direction toward the LCM
        n=CMAL(3,1); % Number of non-self neighbors

        D=[cos(P(i,3)),sin(P(i,3))]; %Previous heading

        if n==0 %If no neighbours no local interactions

            Dir=D; 

        else %if at least one neighbour local interactions C (or aC)

            Dir=c*C+D;

        end


        NormDir=(1/(Dir(1,1)^2+Dir(1,2)^2)^0.5)*Dir; %Normalized new direction

        PP(i,3)=atan2(NormDir(1,2),NormDir(1,1)); %New directional angle

        %Update position   
        PP(i,1)=mod(P(i,1)+delta*NormDir(1,1),L); %New x-coordinate
        PP(i,2)=mod(P(i,2)+delta*NormDir(1,2),L); %New y-coordinate

   end
   
   P(1:N,:)=PP(1:N,:); % Update all positions simultaneously
          

    %ALIGNMENT CALCULATION
    al=(1/N)*sqrt(sum(cos(P(:,3)))^2+sum(sin(P(:,3)))^2);

    if al>0.99
        P(1:N,3)=rand(N,1)*2*pi;
        kS=kS+1;
        if kS==5000 %If reached 5000 repolarizations
            S=1; %end simulation
        end
    end

    %COLLECT ALIGNMENT VALUES
    AL=[AL,al];

    %Prevent stuck in line configuration
    if k>50
        AL50=AL(k-49:k);
        if sum(AL50==al)==50 %If last 50 alignment values identical stuck in line, perturb.
            P(1:N,3)=rand(N,1)*2*pi;
            P(1:N,1)=rand*L; % Initiates x-coordinate.
            P(1:N,2)=rand*L; % Initiates y-coordinate.
           % 99999
        end
    end
    
    k=k+1;
    
    end   
    
   
    M=AL;
    
  %  plot(1:t,AL)

    