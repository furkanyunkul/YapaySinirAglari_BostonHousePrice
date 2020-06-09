function [inputMinmax2,targetMinMax2,net,tr,trainTarget,trainOut,valTarget,valOut,testTarget,testOut,performans,input_layer_weight,layer_weight,bias,MAPE,SSTotal,SSError,R2Test] = nnFonksiyonu(input,target,n1,activationFunc1,trainingFunc,epochSayi,lrate,trainOran,valOran,testOran)

input2=input';
target2=target';
%Normalize edildi.
inputMinmax=mapminmax(input2);
[targetMinMax,ps]=mapminmax(target2);

inputMinmax2=inputMinmax';
targetMinMax2=targetMinMax';

net=newff(inputMinmax,targetMinMax,[n1],{activationFunc1},trainingFunc);


net.trainParam.lr=lrate;
net.trainParam.epochs=epochSayi; %epoch sayisi
net.trainParam.goal=1e-10; %iterasyondan once istedigin yakýnsama olusuyor ise dur
net.trainParam.show=1 %her epochda sonus goster
net.trainParam.showWindow=true;

%Random paramlara dagitildi.
net.divideParam.trainRatio=trainOran;
net.divideParam.valRatio=valOran;
net.divideParam.testRatio=testOran;
net.trainParam.showCommandLine=true;


%Egitme 
[net,tr]=train(net,inputMinmax,targetMinMax);
%Cikti
yen=sim(net,inputMinmax);
%Denormalizasyon
ye=mapminmax('reverse',yen,ps);

testTarget=target(tr.testInd);
testOut=ye(tr.testInd);
valTarget=target(tr.valInd);
valOut=ye(tr.valInd);
trainTarget=target(tr.trainInd);
trainOut=ye(tr.trainInd);
performans=perform(net,input2,target2)
perform(net,input2,input2)
%Agirliklar
input_layer_weight=net.iw{1,1};
layer_weight=net.lw;
bias=net.b;

%Testing mse

MAPE=mean(abs(testOut-testTarget)./testTarget);

%SSTotal gerceklesen sapma toplami
%SSError hatasnýn sapma toplami,hata=gerceklesen-tahmin edilen
SSTotal=sum((testTarget-mean(testTarget)).^2);
SSError=sum((testOut-testTarget).^2);
R2Test=1-SSError/SSTotal;
end

