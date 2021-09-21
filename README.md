# AttractionVsAlignment
Code for Strömbom &amp; Tulevech. Attraction versus alignment as drivers of collective motion. Submitted.

Here you can find all code necessary to regenerate figures 3, 4, 5, S1 and S2 in Strömbom & Tulevech's manuscript Attraction versus alignment as drivers of collective motion. Instructions for how to perform the same analyses with parameters other than those used in the paper is also described.

FIGURE 3
To regenerate Figure 3 from new simulations with the parameters in the manuscript (2) or other parameters (3) 

1. Download all files in the folder Fig3 and set current folder in Matlab to the folder containing the files.
2. To regenerate Figure 3 in the manuscript run the command Fig3(100,4,0.5,20,pi,1,0.01,100). 
3. To perform the same analysis as in the manuscript with different auxillary parameter values run the command Fig3(N,R,delta,L,beta,tau,a,T) by substituting the desired values for each of the parameters specified below

N = number of particles. 
R = interaction radius. 
delta = displacement per time step. 
L = side length of simulation square.
beta = size of blind zone for model II.
tau = anticipation time for model IV.
a = relative strength of explicit alignment in model VII.
T = number of simulations.

FIGURE 4 (polarization behavior)
To regenerate Figure 4 (and S1) from new simulations with the parameters in the manuscript (2) or other parameters (3) 

1. Download all files in the folder Fig4 and set current folder in Matlab to the folder containing the files.
2. To regenerate Figure 4 in the manuscript run the command Fig4(100,4,0.5,20,pi,2,0.1,1300). 
3. To perform the same analysis as in the manuscript with different auxillary parameter values run the command Fig4(N,R,delta,L,beta,tau,a,T) by substituting the desired values for each of the parameters (specified above).

FIGURE 5 (repolarization behavior)
To regenerate Figure 5 (and S2) from new simulations with the parameters in the manuscript (2) or other parameters (3) 

1. Download all files in the folder Fig5 and set current folder in Matlab to the folder containing the files.
2. To regenerate Figure 5 in the manuscript run the command Fig5(100,4,0.5,20,pi,2,0.1,35000000).
3. To perform the same analysis as in the manuscript with different auxillary parameter values run the command Fig5(N,R,delta,L,beta,tau,a,T) by substituting the desired values for each of the parameters (specified above).


NOTE that with the default parameters, especially for Figs 4 and 5, the simulations may take several days even on a very fast computer. Decreasing T will speed things up. For Fig 4 even relatively small T (e.g. 20) typically produce curves whose general shape match those in the manuscript, but noisier. Similarly, for Fig 5 relatively small T (e.g. 100000) generates curves whose general shape match those in the manuscript, but noisier.
