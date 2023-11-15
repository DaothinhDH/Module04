CREATE TABLE phieuxuat (
sopx INT AUTO_INCREMENT PRIMARY KEY,
ngayxuat DATE
);

CREATE TABLE vattu(
mavtu INT AUTO_INCREMENT PRIMARY KEY,
tenvtu VARCHAR(50)
);

CREATE TABLE phieunhap(
sopn INT AUTO_INCREMENT PRIMARY KEY,
ngaynhap DATE
);

CREATE TABLE dondh(
sodh INT AUTO_INCREMENT PRIMARY KEY,
ngaydh date
);

CREATE TABLE nhacc(
mancc  INT AUTO_INCREMENT PRIMARY KEY,
tenncc varchar(50),
diachi TEXT,
sdt VARCHAR(20)
);

CREATE TABLE chitietpx(
id_sopx INT,
FOREIGN KEY (id_sopx) REFERENCES phieuxuat(sopx),
id_vattu INT,
FOREIGN KEY (id_vattu) REFERENCES vattu(mavtu),
dgxuat FLOAT,
slxuat INT
);

CREATE TABLE chitietpn(
id_vattu INT,
FOREIGN KEY (id_vattu) REFERENCES vattu(mavtu),
id_pn INT,
FOREIGN KEY (id_pn) REFERENCES phieunhap(sopn),
dgnhap FLOAT,
slnhap INT
);

CREATE TABLE chitietdh(
id_vattu INT,
FOREIGN KEY (id_vattu) REFERENCES vattu(mavtu),
id_dh INT,
FOREIGN KEY (id_dh) REFERENCES dondh(sodh)
);