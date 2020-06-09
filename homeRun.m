clear all
clc

veri=xlsread('boston.xls');

%Veri genel bilgi
xCrim=datastats(veri(:,1:1));
xZn=datastats(veri(:,2:2));
xIndus=datastats(veri(:,3:3));
xChas=datastats(veri(:,4:4));
xNox=datastats(veri(:,5:5));
xRm=datastats(veri(:,6:6));
xAge=datastats(veri(:,7:7));
xDis=datastats(veri(:,8:8));
xRad=datastats(veri(:,9:9));
xTax=datastats(veri(:,10:10));
xPtraitio=datastats(veri(:,11:11));
xB=datastats(veri(:,12:12));
xLstat=datastats(veri(:,13:13));
yMedv=datastats(veri(:,14:14));

%Input target
input=veri(:,1:13);
target=veri(:,14:14);

%Histogram
%h=histogram(target);

%Scatter
%---------------------------------------------------
%Suc Orani
% scatter(veri(:,1:1),veri(:,14:14));
% title('Suc Oranýnýn Medv ile Karþýlaþtýrýlmasý');

%25,000 Fit Kare Üssü Ýmarlý Konut Alan
% scatter(veri(:,2:2),veri(:,14:14));
% title('25,000 Fit Kare Üssü Ýmarlý Konut Alaný Oranýnýn Medv ile Karþýlaþtýrýlmasý');

% Þehirde Perakende Olmayan Ýþletme Dönüm Oraný
% scatter(veri(:,3:3),veri(:,14:14));
% title('Þehirde Perakende Olmayan Ýþletme Dönüm Oraný Medv ile Karþýlaþtýrýlmasý');

% Eðer Nehir Sýnýrý Yolu Üzerinde ise 1,Deðil ise
% scatter(veri(:,4:4),veri(:,14:14));
% title('Eðer Nehir Sýnýrý Yolu Üzerinde ise 1,Deðil ise 0 Medv ile Karþýlaþtýrýlmasý');

% Nitrik Oksit Yoðunluðu
% scatter(veri(:,5:5),veri(:,14:14));
% title('Nitrik Oksit Yoðunluðu Medv ile Karþýlaþtýrýlmasý');

% Konut Baþýna Ortalama Oda Sayýsý
% scatter(veri(:,6:6),veri(:,14:14));
% title('Konut Baþýna Ortalama Oda Sayýsý Medv ile Karþýlaþtýrýlmasý');

% 1940 dan Önce Ýnþa Edilmiþ Oraný
% scatter(veri(:,7:7),veri(:,14:14));
% title('1940 dan Önce Ýnþa Edilmiþ Oraný Medv ile Karþýlaþtýrýlmasý');

% 5 Boston Ýþ Merkezine Aðýrlýklandýrýlmýþ Uzaklýklarý
% scatter(veri(:,8:8),veri(:,14:14));
% title('5 Boston Ýþ Merkezine Aðýrlýklandýrýlmýþ Uzaklýklarý Medv ile Karþýlaþtýrýlmasý')

% Radyal otoyollara eriþilebilirlik indeksi
% scatter(veri(:,9:9),veri(:,14:14));
% title('Radyal Otoyollara Eriþilebilirlik Ýndeksiý Medv ile Karþýlaþtýrýlmasý')

% title('Emlak Vergi Oraný
% scatter(veri(:,10:10),veri(:,14:14))
% title('Emlak Vergi Oraný Medv ile Karþýlaþtýrýlmasý')

% Bölgedeki öðrenci öðretmen oraný
% scatter(veri(:,11:11),veri(:,14:14))
% title('Bölgedeki Öðrenci Öðretmen Oraný Medv ile Karþýlaþtýrýlmasý')

% bölgedeki siyahlarýn oraný
% scatter(veri(:,12:12),veri(:,14:14))
% title('Bölgedeki Siyahlarýn  Medv ile Karþýlaþtýrýlmasý')

%  Nüfusun düþük statüsü
%  scatter(veri(:,13:13),veri(:,14:14))
% title(' Nüfusun Düþük Statüsü Medv ile Karþýlaþtýrýlmasý')

n1=8;
n2=8;

%Back pro
%   trainlm   - Levenberg-Marquardt backpropagation.
%   trainbr   - Bayesian Regulation backpropagation.
% trainbfg  - BFGS quasi-Newton backpropagation.

%   Backpropagation training functions that use gradient derivatives
%  
%     These algorithms may not be as fast as Jacobian backpropagation.
%     They are supported on GPU hardware with the Parallel Computing Toolbox.
%  
%     trainbfg  - BFGS quasi-Newton backpropagation.
%     traincgb  - Conjugate gradient backpropagation with Powell-Beale restarts.
%     traincgf  - Conjugate gradient backpropagation with Fletcher-Reeves updates.
%     traincgp  - Conjugate gradient backpropagation with Polak-Ribiere updates.
%     traingd   - Gradient descent backpropagation.
%     traingda  - Gradient descent with adaptive lr backpropagation.
%     traingdm  - Gradient descent with momentum.
%     traingdx  - Gradient descent w/momentum & adaptive lr backpropagation.
%     trainoss  - One step secant backpropagation.
%     trainrp   - RPROP backpropagation.
%     trainscg  - Scaled conjugate gradient backpropagation.

%Supervised
%trainr    - Random order weight/bias training.

activationFunc1='tansig';
activationFunc2='tansig';
trainingFunc='trainbr';

epochSayi=1000;
lrate=1e-100;


%Oranlar
trainOran=0.75;
valOran=0.0;
testOran=0.25;

[inputMinmax2,targetMinMax2,net,tr,trainTarget,trainOut,valTarget,valOut,testTarget,testOut,performans,input_layer_weight,layer_weight,bias,MAPE,SSTotal,SSError,R2Test] = nnFonksiyonu(input,target,n1,activationFunc1,trainingFunc,epochSayi,lrate,trainOran,valOran,testOran)


%Train Grafik
plot(trainTarget,'-b');
hold on
plot(trainOut,'-r');
legend('Train Target','Train Out')
grid on
xlabel('\it Sira no','fontsize',12)
ylabel('Sonuc','fontsize',12)

fprintf('Program paused. Press enter to continue.\n');
pause;
%Test Grafik
plot(testTarget,'-b');
hold on
plot(testOut,'-r');
legend('Test Target','Test Out')
grid on
xlabel('\it Sira no','fontsize',12)
ylabel('Sonuc','fontsize',12)
title('Test Sonuclarýnýn Karsilastirilmasi')

karsilastirma=[tr.testInd' testTarget testOut'];
karsilastirmaTrain=[tr.trainInd' trainTarget trainOut'];
karsilastirmaFull =[karsilastirma
                   karsilastirmaTrain ];              