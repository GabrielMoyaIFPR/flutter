import 'package:flutter/material.dart';
import 'package:primeiro_pro/app/database/script.dart';
import 'package:path/path.dart';
import 'package:primeiro_pro/app/my_app.dart';
import 'package:sqflite/sqflite.dart';

class ContactList extends StatelessWidget {
  final lista = [
    {'nome':'Pietro', "telefone":'(44) 999597866', 'avatar': 'https://cdn.pixabay.com/photo/2014/04/03/10/32/businessman-310819_1280.png'},

  ];

Future<List<Map< String,dynamic>>> _buscar()async {
  String path = join(await getDatabasesPath(),'banco');
  Database db = await openDatabase(
  path,
    version: 1,
    onCreate : (db, v){
      db.execute(createTable);
      db.execute(insert1);
    }
    
  );
  return db.query('contact');
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: _buscar(),
      builder: (context, futuro){
        if(futuro.hasData){
          var lista = futuro.data;
          return Scaffold(
                appBar: AppBar(
                  title: Text('Lista de Contatos'),
                  actions: [
                    IconButton(
                      icon: Icon(Icons.add),
                      onPressed: () {
                        Navigator.of(context).pushNamed(MyApp.CONTACT_FORM);
                      },
                    ),
                  ],
                ),
                body: ListView.builder(
                    itemCount: lista.length,
                    itemBuilder: (context, i) {
                      var contato = lista[i];
                      var avatar = CircleAvatar(
                          backgroundImage: NetworkImage(contato['url_avatar']));
                      return ListTile(
                        leading: avatar,
                        title: Text(contato['nome']),
                        subtitle: Text(contato['telefone']),
                        trailing: Container(
                          width: 100,
                          child: Row(
                            children: [
                              IconButton(
                                  icon: Icon(Icons.edit), onPressed: null),
                              IconButton(
                                  icon: Icon(Icons.delete), onPressed: null)
                            ],
                          ),
                        ),
                      );
                    }));
        } 
        else {
            return Scaffold();
          }
      }
    );
    
    
  }
}