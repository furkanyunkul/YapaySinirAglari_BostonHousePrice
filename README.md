# YapaySinirAglari_BostonHousePrice

Matlab ile Yapay sinir ağları kullanarak konut fiyatları tahmin edilmiştir.

Boston konut verileri 1978 yılında toplanmış ve 506 girişin her biri Boston, Massachusetts'teki çeşitli banliyölerden evler için 14 özellik hakkında toplu verileri temsil etmektedir. 

boston.xls dosyasının özellikleri

CRIM: Kişi başı suç oranı
ZN: 25,000 fit kare üssü imarlı konut alanı oranı
INDUS: Şehirde perakende olmayan işletme dönüm oranı
CHAS: Charles River dummy verisi (x)
NOX: Nitrik oksit yoğunluğu 10 milyon parça başına
RM: Konut başına ortalama oda sayısı
AGE: 1940 dan önce inşa edilmiş oranı
DIS: 5 Boston iş merkezine ağırlıklandırılmış uzaklıkları
RAD: Radyal otoyollara erişilebilirlik indeksi
TAX: Her bir 10 000 $ için emlak veri oranı
PTRATIO: Bölgedeki öğrenci öğretmen oranı
B:  1000(Bk - 0.63)^2 Bk bölgedeki siyahların oranı
LSTAT: Nüfusun düşük statüsü
MEDV: 1000 $ ev sahiplerinin medyanı


![data](https://miro.medium.com/max/1394/1*5KmVaL6NijJI3rWZrbGvnA.png)

Verideki örnek kolonlar için medv karışlaştırılması

Dağılım Grafiği

Ev fiyatları arttıkça suç oranlarının düştüğü görünmektedir.

![sucOraniMedvKarsilastirilmasi](https://github.com/furkanyunkul/YapaySinirAglari_BostonHousePrice/blob/master/sucOraniniMedvKarsilasitirmasi.png)

Ev fiyatları arttıkça evdeki oda sayılarının arttığı görünmektedir.

![odaSayisininMedvKarsilastirilmasi](https://github.com/furkanyunkul/YapaySinirAglari_BostonHousePrice/blob/master/odaSayisininMedvKarsilasitirilmasi.png)

Kod Açıklama

![k1](https://github.com/furkanyunkul/YapaySinirAglari_BostonHousePrice/blob/master/kodAciklama1.PNG)
![k2](https://github.com/furkanyunkul/YapaySinirAglari_BostonHousePrice/blob/master/kodAciklama2.PNG)
![k3](https://github.com/furkanyunkul/YapaySinirAglari_BostonHousePrice/blob/master/kodAciklama3.PNG)
![k4](https://github.com/furkanyunkul/YapaySinirAglari_BostonHousePrice/blob/master/kodAciklama4.PNG)
![k5](https://github.com/furkanyunkul/YapaySinirAglari_BostonHousePrice/blob/master/kodAciklama5.PNG)
![k6](https://github.com/furkanyunkul/YapaySinirAglari_BostonHousePrice/blob/master/kodAciklama6.PNG)


Eğitim algoritması,layer sayısı,aktivasyon fonksiyonu,epoch sayısı,öğrenme oranı değişiklik gösterebilir.
Aşağıda örnek olması bakımından tek hidden layer 8 nöron ,trainbr (Bayesian regularization backpropagation) eğitim algoritması,epoch sayısı 1000,öğrenme oranı 10^-3 ,train oranı %75,test oranı %25 sonuçları yer almaktadır.

![p](https://github.com/furkanyunkul/YapaySinirAglari_BostonHousePrice/blob/master/trainbrPerformance.png)

Performans grafiği

![r](https://github.com/furkanyunkul/YapaySinirAglari_BostonHousePrice/blob/master/trainbrRegression.png)

Regresyon grafiği

![trn](https://github.com/furkanyunkul/YapaySinirAglari_BostonHousePrice/blob/master/trainbrTrain.png)

Train grafiği

![tst](https://github.com/furkanyunkul/YapaySinirAglari_BostonHousePrice/blob/master/trainbrTest.png)

Test grafiği
