function W=plotFig3

load pLAMSs
load pLAMSa
load pLAMB
load pLAMA
load pLAMBG
load pLAMBS
load pLAMAL

subplot(7,1,1)
X=pLAMSs;
P=heatm3(X);
imagesc(P);
%xlabel('Attraction (c)')
ylabel('Polarization (\alpha)')
set(gca,'XTick',[1,6,11,16,21])
set(gca,'XTickLabel',{'','','','',''})
set(gca,'YTick',[1,25,50])
set(gca,'YTickLabel',{'0','0.5','1'})
set(gca,'XDir','normal','YDir','normal')
title('I')


subplot(7,1,3)
X=pLAMSa;
P=heatm3(X);
imagesc(P);
%xlabel('Attraction (c)')
ylabel('Polarization (\alpha)')
set(gca,'XTick',[1,6,11,16,21])
set(gca,'XTickLabel',{'','','','',''})
set(gca,'YTick',[1,25,50])
set(gca,'YTickLabel',{'0','0.5','1'})
set(gca,'XDir','normal','YDir','normal')
title('III')

subplot(7,1,2)
X=pLAMB;
P=heatm3(X);
imagesc(P);
%xlabel('Attraction (c)')
ylabel('Polarization (\alpha)')
set(gca,'XTick',[1,6,11,16,21])
set(gca,'XTickLabel',{'','','','',''})
set(gca,'YTick',[1,25,50])
set(gca,'YTickLabel',{'0','0.5','1'})
set(gca,'XDir','normal','YDir','normal')
title('II')

subplot(7,1,4)
X=pLAMA;
P=heatm3(X);
imagesc(P);
%xlabel('Attraction (c)')
ylabel('Polarization (\alpha)')
set(gca,'XTick',[1,6,11,16,21])
set(gca,'XTickLabel',{'','','','',''})
set(gca,'YTick',[1,25,50])
set(gca,'YTickLabel',{'0','0.5','1'})
set(gca,'XDir','normal','YDir','normal')
title('IV')

subplot(7,1,5)
X=pLAMBG;
P=heatm3(X);
imagesc(P);
%xlabel('Attraction (c)')
ylabel('Polarization (\alpha)')
set(gca,'XTick',[1,6,11,16,21])
set(gca,'XTickLabel',{'','','','',''})
set(gca,'YTick',[1,25,50])
set(gca,'YTickLabel',{'0','0.5','1'})
set(gca,'XDir','normal','YDir','normal')
title('V')

subplot(7,1,6)
X=pLAMBG;
P=heatm3(X);
imagesc(P);
%xlabel('Attraction (c)')
ylabel('Polarization (\alpha)')
set(gca,'XTick',[1,6,11,16,21])
set(gca,'XTickLabel',{'','','','',''})
set(gca,'YTick',[1,25,50])
set(gca,'YTickLabel',{'0','0.5','1'})
set(gca,'XDir','normal','YDir','normal')
title('VI')

subplot(7,1,7)
X=pLAMAL;
P=heatm3(X);
imagesc(P);
xlabel('Attraction (c)')
ylabel('Polarization (\alpha)')
set(gca,'XTick',[1,6,11,16,21])
set(gca,'XTickLabel',{'0','0.5','1','1.5','2'})
set(gca,'YTick',[1,25,50])
set(gca,'YTickLabel',{'0','0.5','1'})
set(gca,'XDir','normal','YDir','normal')
title('VII')
