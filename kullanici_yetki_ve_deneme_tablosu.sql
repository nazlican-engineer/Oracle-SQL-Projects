GRANT CONNECT TO MEHMET;--Mehmet veri tabanına bağlandı
GRANT RESOURCE TO MEHMET;--Bu komut, Mehmet'e veritabanına giriş yapma (oturum açma) yetkisi verir.
GRANT CREATE SESSION TO MEHMET;--Bu komut, Mehmet'e içeride kendi masasını kurma yetkisi verir.


CREATE TABLE DENEME
(
ID NUMBER,
ADI VARCHAR(50)
);

INSERT INTO DENEME VALUES (1,'MEHMET')

SELECT *FROM DENEME