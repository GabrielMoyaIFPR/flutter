import 'package:flutter/material.dart';
import 'package:primeiro_pro/app/domain/entities/contact.dart';
import 'package:primeiro_pro/app/view/contact_details_back.dart';
import 'package:url_launcher/url_launcher.dart';

class ContactDetails extends StatelessWidget {
  launchApp(String url, context) async{
    await canLaunch(url)? await launch(url): showDialog(
      context: context,
      builder: (BuildContext context){
        return AlertDialog(
          title: Text('Alerta'),
          content: Text('Não foi possível encontrar um APP compatível'),

        );
      }
    );
  }
  @override
  Widget build(BuildContext context) {
      var _back = ContactDetailsBack(context);
      Contact contact = _back.contact;
      return LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints){
          var width = constraints.biggest.width;
          var radius = width/3;

          return Scaffold(
            body: ListView(
              padding: EdgeInsets.all(60),
              children: [
                (Uri.tryParse(contact.urlAvatar).isAbsolute)?
                CircleAvatar(
                  backgroundImage: NetworkImage(contact.urlAvatar),
                  radius: radius,
                  ):
                CircleAvatar(child: Icon(Icons.person,
                size: width/2
                ),
                radius: radius,
                ),
                Center(
                child : Text('${contact.nome}', style: TextStyle(fontSize: 30),)
                ),
                Card(
                  child: ListTile(
                    title: Text("Telefone:"),
                    subtitle: Text('${contact.telefone}'),
                    trailing: Container(
                      width: width/4,
                      child: Row(
                        children: [
                          IconButton(
                            color: Colors.blue,
                            icon: Icon(Icons.message),
                            onPressed: (){
                              launchApp('sms:${contact.telefone}', context);
                            },
                          ),
                          IconButton(
                            color: Colors.blue,
                            icon: Icon(Icons.phone),
                            onPressed: (){
                              launchApp('tel:${contact.telefone}', context);
                            }
                          )
                        ],
                      ),
                      ),
                    ),
                ),
                Card(
                  child: ListTile(
                    title: Text("E-mail:"),
                    onTap: (){
                      launchApp('mailto${contact.email}', context);

                    },
                    subtitle: Text('${contact.email}')
                    ),
                )
              ],
            )
            ,
            floatingActionButton: FloatingActionButton(
              child: Icon(Icons.arrow_back),
              onPressed: (){
                _back.goToBack();
              }
            ),
        );
        },
      );
  }
}