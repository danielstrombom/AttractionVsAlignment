function W=plotFig4

%Function to create Figure 4 and Figure S1

load pLAMBP0
load pLAMSaP0
load pLAMAP0
load pLAMAP20
load pLAMBGP0
load pLAMBSP0
load pLAMALP
load pLAMALP0

subplot(4,2,1)
X=pLAMBP0;
sX1=size(X,2);
Y=median(X);
Y1=Y;
E=mad(X,1).*ones(1,size(X,2));
errorbar(1:size(X,2),Y,E,'-r');
hold on
plot(1:size(X,2),Y,'-k','LineWidth',2);
ylabel('Polarization (\alpha)')
%xlabel('Time (t)')
title('(II)')
ylim([0 1])

subplot(4,2,2)
X=pLAMSaP0;
sX2=size(X,2);
Y=median(X);
Y2=Y;
E=mad(X,1).*ones(1,size(X,2));
errorbar(1:size(X,2),Y,E,'-r');
hold on
plot(1:size(X,2),Y,'-k','LineWidth',2);
%ylabel('Polarization (\alpha)')
%xlabel('Time (t)')
title('(III)')
ylim([0 1])

subplot(4,2,3)
X=pLAMAP0;
sX3=size(X,2);
Y=median(X);
Y3=Y;
E=mad(X,1).*ones(1,size(X,2));
errorbar(1:size(X,2),Y,E,'-r');
hold on
plot(1:size(X,2),Y,'-k','LineWidth',2);
ylabel('Polarization (\alpha)')
%xlabel('Time (t)')
title('(IV) with c=0.2')
ylim([0 1])

subplot(4,2,4)
X=pLAMAP20;
sX4=size(X,2);
Y=median(X);
Y4=Y;
E=mad(X,1).*ones(1,size(X,2));
errorbar(1:size(X,2),Y,E,'-r');
hold on
plot(1:size(X,2),Y,'-k','LineWidth',2);
%ylabel('Polarization (\alpha)')
%xlabel('Time (t)')
title('(IV) with c=2')
ylim([0 1])

subplot(4,2,5)
X=pLAMBGP0;
sX5=size(X,2);
Y=median(X);
Y5=Y;
E=mad(X,1).*ones(1,size(X,2));
errorbar(1:size(X,2),Y,E,'-r');
hold on
plot(1:size(X,2),Y,'-k','LineWidth',2);
ylabel('Polarization (\alpha)')
xlabel('Time (t)')
title('(V)')
ylim([0 1])

subplot(4,2,6)
X=pLAMBSP0;
sX6=size(X,2);
Y=median(X);
Y6=Y;
E=mad(X,1).*ones(1,size(X,2));
errorbar(1:size(X,2),Y,E,'-r');
hold on
plot(1:size(X,2),Y,'-k','LineWidth',2);
%ylabel('Polarization (\alpha)')
%xlabel('Time (t)')
title('(VI)')
ylim([0 1])

subplot(4,2,7)
X=pLAMALP;
sX7=size(X,2);
Y=median(X);
Y7=Y;
E=mad(X,1).*ones(1,size(X,2));
errorbar(1:size(X,2),Y,E,'-r');
hold on
plot(1:size(X,2),Y,'-k','LineWidth',2);
ylabel('Polarization (\alpha)')
%xlabel('Time (t)')
title('(VII)')
ylim([0 1])

subplot(4,2,8)
X=pLAMALP0;
sX8=size(X,2);
Y=median(X);
Y8=Y;
E=mad(X,1).*ones(1,size(X,2));
errorbar(1:size(X,2),Y,E,'-r');
hold on
plot(1:size(X,2),Y,'-k','LineWidth',2);
%ylabel('Polarization (\alpha)')
xlabel('Time (t)')
title('(VIII)')
ylim([0 1])


figure;
plot(1:sX1,Y1,'-g','LineWidth',2);
hold on
plot(1:sX2,Y2,'-b','LineWidth',2);
hold on
plot(1:sX3,Y3,'-r','LineWidth',2);
hold on
plot(1:sX4,Y4,'-.r','LineWidth',2);
hold on
plot(1:sX5,Y5,'-m','LineWidth',2);
hold on
plot(1:sX6,Y6,'-c','LineWidth',2);
hold on
plot(1:sX7,Y7,'-k','LineWidth',2);
hold on
plot(1:sX8,Y8,'-.k','LineWidth',2);
ylabel('Polarization (\alpha)')
ylim([0 1])
xlabel('Time (t)')
