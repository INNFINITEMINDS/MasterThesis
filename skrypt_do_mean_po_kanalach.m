%pacjenci= {'widmo_MD219.mat', 'widmo_MD220.mat', 'widmo_MD223.mat','widmo_MD224.mat','widmo_MD226.mat','widmo_MD227.mat', 'widmo_MD229.mat', 'widmo_MD230.mat', 'widmo_MD231.mat', 'widmo_MD236.mat', 'widmo_MD237.mat', 'widmo_MD238.mat'};
pacjenci = {'widmo_WD219.mat', 'widmo_WD223.mat','widmo_WD224.mat','widmo_WD226.mat','widmo_WD234.mat','widmo_WD235.mat','widmo_WD236.mat','widmo_WD237.mat' ,'widmo_WD238.mat'}
%pacjenci = {'widmo_4064.mat','widmo_4087.mat','widmo_4100.mat','widmo_4110.mat','widmo_4116.mat','widmo_4123.mat','widmo_4138.mat','widmo_4150.mat','widmo_4203.mat','widmo_4266.mat','widmo_4317.mat','widmo_4325.mat','widmo_4333.mat','widmo_4335.mat'}

y_d = -15;
y_g = 15;
fig_zam1 = figure('name','Zam1')
fig_zam2 = figure('name','Zam2')
fig_zam3 = figure('name','Zam3')
fig_rum = figure('name','Rum')
zam1_p1=[];
zam1_p2=[];
zam2_p1=[];
zam2_p2=[];
zam3_p1=[];
zam3_p2=[];
ruma_p1=[];
ruma_p2=[]; 

x = 1:1:40;

for p= 1:length(pacjenci)
    
    load(pacjenci{p})
    pac = pacjenci{p}
    eval(['widmo=',pac(1:end-4);]);%widmo

    zam1_p1(:,:,p) = widmo.spectra_zam1_p1(:,:);
    zam2_p1(:,:,p) = widmo.spectra_zam2_p1(:,:);
    zam3_p1(:,:,p) = widmo.spectra_zam3_p1(:,:);
    ruma_p1(:,:,p) = widmo.spectra_ruma_p1(:,:);
    
    zam1_p2(:,:,p) = widmo.spectra_zam1_p2(:,:);
    zam2_p2(:,:,p) = widmo.spectra_zam2_p2(:,:);
    zam3_p2(:,:,p) = widmo.spectra_zam3_p2(:,:);
    ruma_p2(:,:,p) = widmo.spectra_ruma_p2(:,:);
    
end
% srednia i std dla kazdego wariantu
zam1_p1_mean = mean(zam1_p1,3);
zam1_p2_mean = mean(zam1_p2,3);
zam1_p1_std = std(zam1_p1,[],3);
zam1_p2_std = std(zam1_p2,[],3);

zam2_p1_mean = mean(zam2_p1,3);
zam2_p2_mean = mean(zam2_p2,3);
zam2_p1_std = std(zam2_p1,[],3);
zam2_p2_std = std(zam2_p2,[],3);

zam3_p1_mean = mean(zam3_p1,3);
zam3_p2_mean = mean(zam3_p2,3);
zam3_p1_std = std(zam3_p1,[],3);
zam3_p2_std = std(zam3_p2,[],3);

ruma_p1_mean = mean(ruma_p1,3);
ruma_p2_mean = mean(ruma_p2,3);
ruma_p1_std = std(ruma_p1,[],3);
ruma_p2_std = std(ruma_p2,[],3);


figure(fig_zam1)

    
    curve1 = zam1_p1_mean + zam1_p1_std;
    curve2 =  zam1_p1_mean - zam1_p1_std;
    curve1_p2 = zam1_p2_mean + zam1_p2_std;
    curve2_p2 =  zam1_p2_mean - zam1_p2_std;
for  i =1 :58
    subplot(8,8,i)
    
%     inBetweenRegionX = [1:length(curve1(i,:)), length(curve2(i,:)):-1:1];
%     inBetweenRegionY = [curve1(i,:), fliplr(curve2(i,:))];
%     fill(inBetweenRegionX, inBetweenRegionY, [1 0.8 0.8]);
%     hold on;
% %     
% %     plot(x,curve1(i,:), 'b.');
% %     plot(x,curve2(i,:), 'b.');
%     plot(x,zam1_p1_mean(i,:),'r', 'LineWidth', 3);
    
    inBetweenRegionX_p2 = [1:length(curve1_p2(i,:)), length(curve2_p2(i,:)):-1:1];
    inBetweenRegionY_p2 = [curve1_p2(i,:), fliplr(curve2_p2(i,:))];
   
    fill(inBetweenRegionX_p2, inBetweenRegionY_p2, [0.8 1 0.8]);
    hold on;

%     plot(x,curve1_p2(i,:), 'b.');
%     plot(x,curve2_p2(i,:), 'b.');
    plot(x,zam1_p2_mean(i,:),'g', 'LineWidth', 3);
    
    grid on;
    set(gca,'XtickLabel','')
    set(gca,'YtickLabel','')
    ylim([y_d,y_g])
    title(i)
    
end

figure(fig_zam2)

    curve1 = zam2_p1_mean + zam2_p1_std;
    curve2 =  zam2_p1_mean - zam2_p1_std;
    curve1_p2 = zam2_p2_mean + zam2_p2_std;
    curve2_p2 =  zam2_p2_mean - zam2_p2_std;
   
for  i =1 :58
    subplot(8,8,i)
    
%     inBetweenRegionX = [1:length(curve1(i,:)), length(curve2(i,:)):-1:1];
%     inBetweenRegionY = [curve1(i,:), fliplr(curve2(i,:))];
% 
%     fill(inBetweenRegionX, inBetweenRegionY, [1 0.8 0.8]);
%     hold on;
% 
% %     plot(x,curve1(i,:), 'b.');
% %     plot(x,curve2(i,:), 'b.');
%     plot(x,zam2_p1_mean(i,:),'r', 'LineWidth', 3);
    
    inBetweenRegionX_p2 = [1:length(curve1_p2(i,:)), length(curve2_p2(i,:)):-1:1];
    inBetweenRegionY_p2 = [curve1_p2(i,:), fliplr(curve2_p2(i,:))];

    fill(inBetweenRegionX_p2, inBetweenRegionY_p2, [0.8 1 0.8]);
    hold on;

%     plot(x,curve1_p2(i,:), 'b.');
%     plot(x,curve2_p2(i,:), 'b.');
    plot(x,zam2_p2_mean(i,:),'g', 'LineWidth', 3);
    
    grid on;
    set(gca,'XtickLabel','')
    set(gca,'YtickLabel','')
    ylim([y_d,y_g])
    title(i)
end

figure(fig_zam3)
    curve1 = zam3_p1_mean + zam3_p1_std;
    curve2 = zam3_p1_mean - zam3_p1_std;
    curve1_p2 = zam3_p2_mean + zam3_p2_std;
    curve2_p2 =  zam3_p2_mean - zam3_p2_std;
for  i =1 :58
    subplot(8,8,i)
%   
%     inBetweenRegionX = [1:length(curve1(i,:)), length(curve2(i,:)):-1:1];
%     inBetweenRegionY = [curve1(i,:), fliplr(curve2(i,:))];
% 
%     fill(inBetweenRegionX, inBetweenRegionY, [1 0.8 0.8]);
%     hold on;
% 
% %     plot(x,curve1(i,:), 'b.');
% %     plot(x,curve2(i,:), 'b.');
%     plot(x,zam3_p1_mean(i,:),'r', 'LineWidth', 3);
    
    inBetweenRegionX_p2 = [1:length(curve1_p2(i,:)), length(curve2_p2(i,:)):-1:1];
    inBetweenRegionY_p2 = [curve1_p2(i,:), fliplr(curve2_p2(i,:))];

    fill(inBetweenRegionX_p2, inBetweenRegionY_p2, [0.8 1 0.8]);
    hold on;

%     plot(x,curve1_p2(i,:), 'b.');
%     plot(x,curve2_p2(i,:), 'b.');
    plot(x,zam3_p2_mean(i,:),'g', 'LineWidth', 3);
    
    grid on;
    set(gca,'XtickLabel','')
    set(gca,'YtickLabel','')
    ylim([y_d,y_g])
    title(i)
end


figure(fig_rum)
    curve1 = ruma_p1_mean + ruma_p1_std;
    curve2 =  ruma_p1_mean - ruma_p1_std;
    curve1_p2 = ruma_p2_mean + ruma_p2_std;
    curve2_p2 =  ruma_p2_mean - ruma_p2_std;
for  i =1 :58
   subplot(8,8,i)
 
%     inBetweenRegionX = [1:length(curve1(i,:)), length(curve2(i,:)):-1:1];
%     inBetweenRegionY = [curve1(i,:), fliplr(curve2(i,:))];
% 
%     fill(inBetweenRegionX, inBetweenRegionY, [1 0.8 0.8]);
%     hold on;
%   
% %     plot(x,curve1(i,:), 'b.');
% %     plot(x,curve2(i,:), 'b.');
%     plot(x,ruma_p1_mean(i,:),'r', 'LineWidth', 3);
    
    
    inBetweenRegionX_p2 = [1:length(curve1_p2(i,:)), length(curve2_p2(i,:)):-1:1];
    inBetweenRegionY_p2 = [curve1_p2(i,:), fliplr(curve2_p2(i,:))];
    
    fill(inBetweenRegionX_p2, inBetweenRegionY_p2, [0.8 1 0.8]);
    hold on;

%     plot(x,curve1_p2(i,:), 'b.');
%     plot(x,curve2_p2(i,:), 'b.');
    plot(x,ruma_p2_mean(i,:),'g', 'LineWidth', 3);
    
    grid on;
    set(gca,'XtickLabel','')
    set(gca,'YtickLabel','')
    ylim([y_d,y_g])
    title(i)
end

