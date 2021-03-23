
import 'package:flutter/widgets.dart';
import 'package:primeiro_pro/app/domain/entities/contact.dart';

class ContactDetailsBack{
  BuildContext context;
  Contact contact;

  ContactDetailsBack(this.context){
    contact = ModalRoute.of(context).settings.arguments;
  }
  

  
  goToBack(){
    Navigator.of(context).pop();
  }

}