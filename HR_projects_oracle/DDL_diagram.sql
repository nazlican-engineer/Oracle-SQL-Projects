ALTER TABLE REGIONS ADD(
CONSTRAINT reg_id_pk PRIMARY KEY(region_id)
)

ALTER TABLE COUNTRIES ADD(
CONSTRAINT countr_reg_fk FOREIGN KEY (region_id) REFERENCES regions(region_id)
)

ALTER TABLE COUNTRIES ADD(
CONSTRAINT countr_id_pk PRIMARY KEY (COUNTRY_ID)
);

ALTER TABLE LOCATIONS ADD(
CONSTRAINT loc_id_pk PRIMARY KEY(LOCATION_ID),
CONSTRAINT loc_c_id_fk FOREIGN KEY(COUNTRY_ID) REFERENCES COUNTRIES (COUNTRY_ID)
);


ALTER TABLE DEPARTMENTS ADD(
CONSTRAINT dept_id_pk PRIMARY KEY (DEPARTMENT_ID),
CONSTRAINT dep_loc_fk FOREIGN KEY (LOCATION_ID) REFERENCES LOCATIONS (LOCATION_ID)
);


ALTER TABLE JOBS ADD
(CONSTRAINT job_id_pk PRIMARY KEY(JOB_ID)
);

ALTER TABLE EMPLOYEES ADD (
CONSTRAINT emp_emp_id_pk PRIMARY KEY (EMPLOYEE_ID),
CONSTRAINT emp_dept_fk FOREIGN KEY (DEPARTMENT_ID) REFERENCES DEPARTMENTS (DEPARTMENT_ID),
CONSTRAINT emp_job_fk FOREIGN KEY (JOB_ID) REFERENCES JOBS (JOB_ID),
CONSTRAINT emp_manager_fk FOREIGN KEY (MANAGER_ID) REFERENCES EMPLOYEES(EMPLOYEE_ID)
/*Self-Referencing" (Kendi Kendine Referans Verme)
 1. Şirket Hiyerarşisini Korumak
Bir şirkette her çalışanın (genellikle) bir yöneticisi vardır. 
Ancak o yönetici de aslında o şirketin bir çalışanıdır. 
Bu yüzden MANAGER_ID kolonunda yazan numara,aslında yine aynı 
tablodaki başka bir EMPLOYEE_ID (Çalışan Numarası) ile eşleşmek zorundadır.
Yani bu kısıtlama (constraint) şunu der: "Eğer bu çalışanın yöneticisi
105 numaralı kişiyse, gidip bak bakalım; 105 numaralı kişi gerçekten bizim çalışanlar listemizde var mı?"
 */
);

ALTER TABLE DEPARTMENTS ADD(
CONSTRAINT dept_mgr_id FOREIGN KEY (manager_id) REFERENCES EMPLOYEES(EMPLOYEE_ID)
);

ALTER TABLE JOB_HISTORY ADD(
CONSTRAINT jhist_emp_id_st_date_pk PRIMARY KEY (EMPLOYEE_ID,START_DATE),
CONSTRAINT jhist_job_id_fk FOREIGN KEY (JOB_ID ) REFERENCES JOBS (JOB_ID),
CONSTRAINT jhist_emp_id_fk FOREIGN KEY (EMPLOYEE_ID) REFERENCES EMPLOYEES (EMPLOYEE_ID),
CONSTRAINT jhist_dept_fk FOREIGN KEY (DEPARTMENT_ID) REFERENCES DEPARTMENTS(DEPARTMENT_ID)
);

--DROP KOMUTU
--ALTER TABLE DEPARTMENTS DROP CONSTRAINT dept_mgr_id F Bu komut tablolar arasındaki ilişkiyi kaldırmak içim kullanılır.

--DROP TABLE REGIONS CASCADE CONSTRAINT;Tabloları kaldırmak için kullanılır.
--cascade constraint kulllanırsan hem kendisini hemde bağlı olduğu tablolardaki foreign keylerini kaldıracak
--cascade kullanmazsan tabloyu silemez başka tablolarla bağlantısı olduğu için  

--DROP  USER nazlı CASCADE kullanıcı ve içindekileri kalıcı siler.
