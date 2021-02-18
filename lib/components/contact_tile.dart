
import 'package:flutter/material.dart';
import 'package:primeiro_pro/app/domain/entities/contact.dart';

class ContactTile extends StatelessWidget {
  
  final Contact contact;

  const ContactTile(this.contact);  
  @override
  Widget build(BuildContext context) {
    // Definindo um Avatar default caso o usuário não informe um avatar
    final avatar = contact.urlAvatar == null || contact.urlAvatar.isEmpty
      ? CircleAvatar(child: Icon(Icons.person))
      : CircleAvatar(backgroundImage: NetworkImage(contact.urlAvatar));

    return ListTile(
      leading: avatar,
    );
  }
}