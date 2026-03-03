 CREATE TABLE PERSONEL (
   PERSONEL_ID NUMBER,
    FIRST_NAME CHAR(30),
    LAST_NAME VARCHAR2(30),
    JOB_TITLE VARCHAR(15),
    YEAR_OF_EXPERIENCE INTERVAL YEAR TO MONTH,
    FLIGHT_TIME INTERVAL DAY TO SECOND,
    APPROVAL_DATE TIMESTAMP,
    HIRE_DATE DATE,
   PRIMARY KEY(PERSONEL_ID)
  );

 SELECT *FROM PERSONEL 
 
/*

1. Sayısal ve Metinsel Veri Tipleri
NUMBER (PERSONEL_ID): Bu tip hem tam sayıları hem de ondalıklı sayıları saklar. 
Burada ID için kullandığın için benzersiz tam sayıları tutacaktır.

CHAR(30) (FIRST_NAME): Sabit uzunluklu metin tipidir.
Eğer isim 5 harfliyse bile, Oracle hafızada 30 karakterlik yer ayırır ve boş kalan yerleri boşlukla doldurur.
Genellikle uzunluğu hiç değişmeyen (TC No gibi) veriler için kullanılır.

VARCHAR2(30) (LAST_NAME): Değişken uzunluklu metin tipidir.
Eğer soyadı 5 harfliyse, sadece 5 harflik yer kaplar.
Hafıza yönetimi açısından CHARdan çok daha verimlidir ve Oracle'da isim/soyisim için standarttır.

VARCHAR(15) (JOB_TITLE): VARCHAR2 ile neredeyse aynıdır. 
Oracle'da gelecekteki standartlara uyum için tutulur ancak genellikle VARCHAR2 kullanımı önerilir.


2. Zaman ve Süre (Interval) Veri Tipleri
Bu kısım biraz daha teknik ama çok işlevseldir:

INTERVAL YEAR TO MONTH (YEAR_OF_EXPERIENCE): Bir tarih değil, bir süre aralığıdır.
"5 yıl 3 ay" gibi yıl ve ay bazındaki tecrübe sürelerini saklamak için kullanılır.

INTERVAL DAY TO SECOND (FLIGHT_TIME): Bu da bir süredir ama çok daha hassastır.
"2 gün 4 saat 30 dakika 15 saniye" gibi gün bazından başlayıp saniyeye kadar giden hassas süreleri tutar.

TIMESTAMP (APPROVAL_DATE): DATE tipine benzer ama çok daha detaylıdır. 
Saniyenin milyonda birine kadar (milisaniye/mikrosaniye) hassasiyetle zamanı ve tarihi saklar.

DATE (HIRE_DATE): Klasik tarih tipidir. Gün, ay, yıl, saat, dakika ve saniyeyi saklar. 
İşe giriş tarihlerinde milisaniye hassasiyetine gerek olmadığı için en doğru seçimdir.
*/

 INSERT INTO PERSONEL (
    PERSONEL_ID,
    FIRST_NAME,
    LAST_NAME,
    JOB_TITLE,
    YEAR_OF_EXPERIENCE,
    FLIGHT_TIME,
    APPROVAL_DATE,
    HIRE_DATE
) 
VALUES (
    1,
    'NAZLI',
    'PUSKULLU',
    'SQL DEVELOPER',
    INTERVAL '30-2' YEAR TO MONTH,
    INTERVAL '16 11:09:08.555' DAY TO SECOND,
    CURRENT_TIMESTAMP,
    TRUNC(SYSDATE)
);
/*
CURRENT_TIMESTAMP: Sana her şeyi söyler; gün, ay, yıl, saat, dakika, saniye ve saniyenin
çok küçük parçaları (milisaniyeler).
Sanki bir kronometre tutuyormuşsun gibi düşün.
TRUNC(SYSDATE): Sadece "Bugün hangi gün?" sorusuna cevap verir.
Saat, dakika ve saniye gibi detayları "kesip atar" (truncate) ve hepsini 00:00:00 yapar
*/
  
SELECT *FROM PERSONEL 

INSERT INTO PERSONEL (
    PERSONEL_ID,
    FIRST_NAME,
    LAST_NAME,
    JOB_TITLE,
    YEAR_OF_EXPERIENCE,
    FLIGHT_TIME,
    APPROVAL_DATE,
    HIRE_DATE
)
VALUES (
    2,
    'Mehmet',
    'CELEBOGLU',
    'PL/SQL Dev',
    INTERVAL '8' MONTH,
    INTERVAL '16 10:09:08.555' DAY TO SECOND,
    SYSTIMESTAMP,
    SYSDATE
);

/*Tarih Bilgileri İle İlgili Kodlar*/
/*DUAL, Oracle’da bulunan tek satırlık, tek sütunlu özel bir sistem tablosudur.*/
SELECT SYSDATE FROM dual;
SELECT SYSTIMESTAMP FROM dual;
SELECT CURRENT_TIMESTAMP FROM dual;
SELECT TRUNC(SYSDATE) FROM dual;
