function W=plotFig5

load MB
load MC
load MD
load MD2
load ME
load MF
load MG
load MG0

x=0:0.001:1;
subplot(4,2,1)
X=MB;
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
xlim([0 1000])
xticks([0 500 1000])
xticklabels({'','',''})

subplot(4,2,2)
X=MC;
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
xticks([0 500 1000])
xticklabels({'','',''})

subplot(4,2,3)
X=MD;
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
xticks([0 500 1000])
xticklabels({'','',''})

subplot(4,2,4)
X=MD2;
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
xticks([0 500 1000])
xticklabels({'','',''})

subplot(4,2,5)
X=ME;
Y=median(X);
Y5=Y;
E=mad(X,1).*ones(1,size(X,2));
errorbar(1:size(X,2),Y,E,'-r');
hold on
plot(1:size(X,2),Y,'-k','LineWidth',2);
ylabel('Polarization (\alpha)')
%xlabel('Time (t)')
title('(V)')
ylim([0 1])
xticks([0 500 1000])
xticklabels({'','',''})

subplot(4,2,6)
X=MF;
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
xticks([0 500 1000])
xticklabels({'','',''})

subplot(4,2,7)
X=MG;
Y=median(X);
Y7=Y;
E=mad(X,1).*ones(1,size(X,2));
errorbar(1:size(X,2),Y,E,'-r');
hold on
plot(1:size(X,2),Y,'-k','LineWidth',2);
ylabel('Polarization (\alpha)')
xlabel('Standardized repolarization time')
title('(VII)')
ylim([0 1])
xticks([0 500 1000])
xticklabels({'0','0.5','1'})


subplot(4,2,8)
X=MG0;
Y=median(X);
Y8=Y;
E=mad(X,1).*ones(1,size(X,2));
errorbar(1:size(X,2),Y,E,'-r');
hold on
plot(1:size(X,2),Y,'-k','LineWidth',2);
%ylabel('Polarization (\alpha)')
xlabel('Standardized repolarization time')
title('(VIII)')
ylim([0 1])
xticks([0 500 1000])
xticklabels({'0','0.5','1'})


figure;
plot(1:size(X,2),Y1,'-g','LineWidth',2);
hold on
plot(1:size(X,2),Y2,'-b','LineWidth',2);
hold on
plot(1:size(X,2),Y3,'-r','LineWidth',2);
hold on
plot(1:size(X,2),Y4,'-.r','LineWidth',2);
hold on
plot(1:size(X,2),Y5,'-m','LineWidth',2);
hold on
plot(1:size(X,2),Y6,'-c','LineWidth',2);
hold on
plot(1:size(X,2),Y7,'-k','LineWidth',2);
hold on
plot(1:size(X,2),Y8,'-.k','LineWidth',2);
ylabel('Polarization (\alpha)')
ylim([0 1])
xlim([0 1000])
xlabel('Standardized repolarization time')
xticks([0 500 1000])
xticklabels({'0','0.5','1'})
