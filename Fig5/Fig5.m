function X=Fig5(N,R,delta,L,beta,tau,a,T)

%Function to regenerate Figure 5 in Strömbom & Tulevech with option to 
%change auxillary parameters. The function will run a simulation for T time
%steps for each model, perturbing the group if the polarization exceeds
%the polarization threshold for that model, and collect the polarization 
%values over time in each simulation. 
%Default command Fig5(100,4,0.5,20,pi,2,0.1,35000000)


ALB0=LAMB2021pertnp(N,R,delta,L,beta,1,T); 
save ALB0 ALB0
ALC0=LAMS2021pertnp(N,N,R,delta,L,T,0.2);
save ALC0 ALC0
ALD0=LAMA2021pertnp(N,R,delta,L,tau,0.2,T);
save ALD0 ALD0
ALD20=LAMA2021pertnp(N,R,delta,L,tau,2,T);
save ALD20 ALD20
ALE0=LAMBG2021pertnp(N,R,delta,L,0.2,T);
save ALE0 ALE0
ALF0=LAMBS2021pertnp(N,R,delta,L,0.2,T);
save ALF0 ALF0
ALG=LAMAL2021pertnp(N,R,delta,L,a,0.2,T);
save ALG ALG
ALG0=LAMAL2021pertnp(N,R,delta,L,a,0.2,T);
save ALG0 ALG0

%Obtain the repolarization curves from the measured polarization over time

MB=curvePlotterA(ALB0,0.99);
save MB MB
MC=curvePlotterA(ALC0,0.99);
save MC MC
MD=curvePlotterA(ALD0,0.99);
save MD MD
MD2=curvePlotterA(ALD20,0.99);
save MD2 MD2
ME=curvePlotterA(ALE0,0.85);
save ME ME
MF=curvePlotterA(ALF0,0.9);
save MF MF
MG=curvePlotterA(ALG,0.99);
save MG MG
MG0=curvePlotterA(ALG0,0.99);
save MG0 MG0

plotFig5