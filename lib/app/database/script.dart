

final createTable ='''
 CREATE TABLE contact(
   id INT PRIMARY KEY
   ,nome VARCHAR(200) NOT NULL
   ,telefone CHAR(16) NOT NULL
   ,email VARCHAR(150) NOT NULL
   ,url_avatar VARCHAR(300) NOT NULL
 )
''';

final insert1 ='''
INSERT INTO contact(nome,telefone,email,url_avatar)
VALUES('Pietro','(44) 999597866','pietro@gmail.com','https://cdn.pixabay.com/photo/2014/04/03/10/32/businessman-310819_1280.png')
''';