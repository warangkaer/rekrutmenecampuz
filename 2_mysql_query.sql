CREATE DATABASE code_test;

use code_test;

CREATE TABLE tb_mahasiswa (
  mhs_id int NOT NULL AUTO_INCREMENT,
  mhs_nim int NOT NULL,
  mhs_nama VARCHAR(100) NOT NULL,
  mhs_angkatan YEAR,
  PRIMARY KEY(mhs_id)
);

CREATE TABLE tb_matakuliah (
  mk_id int NOT NULL AUTO_INCREMENT,
  mk_kode VARCHAR(5),
  mk_sks int,
  mk_nama VARCHAR(20),
  PRIMARY KEY(mk_id)
);

CREATE TABLE tb_mahasiswa_nilai (
  mhs_nilai_id int NOT NULL AUTO_INCREMENT,
  mhs_id int NOT NULL,
  mk_id int NOT NULL,
  nilai double(5, 2),
  PRIMARY KEY(mhs_nilai_id),
  FOREIGN KEY (mhs_id) REFERENCES tb_mahasiswa(mhs_id),
  FOREIGN KEY (mk_id) REFERENCES tb_matakuliah(mk_id)
);

INSERT INTO tb_mahasiswa(mhs_nim, mhs_nama, mhs_angkatan) 
VALUES (2018001, 'Jono', 2018), (2018002, 'Taufik', 2018), (2018003, 'Maria', 2018), (2018004, 'Sari', 2019), (2018005, 'Bambang', 2019);

INSERT INTO tb_matakuliah(mk_kode, mk_sks, mk_nama) 
VALUES ('MK202', 3, 'OOP'), ('MK303', 2, 'Basis Data');

CREATE INDEX index_mk_kode ON tb_matakuliah (mk_kode);

INSERT INTO tb_mahasiswa_nilai(mhs_id, mk_id, nilai) 
VALUES (1, 1, 70), (1, 1, 80), (2, 1, 82), (2, 2, 74), (4, 1, 76), (4, 2, 80), (5, 1, 60);

SELECT mhs.mhs_nama as nama_mahasiswa, mk.mk_kode as kode_mata_kuliah, mhs_nilai.nilai 
FROM tb_mahasiswa mhs
INNER JOIN tb_mahasiswa_nilai mhs_nilai ON mhs_nilai.mhs_id = mhs.mhs_id
INNER JOIN tb_matakuliah mk ON mk.mk_id = mhs_nilai.mk_id
WHERE mk.mk_kode = 'MK303'
ORDER BY mhs_nilai.nilai DESC
LIMIT 1;

