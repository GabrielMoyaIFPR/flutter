import 'package:flutter/material.dart';
import 'package:primeiro_pro/app/view/contact_form.dart';
import 'package:primeiro_pro/app/view/contact_list.dart';

class MyApp extends StatelessWidget {
  static const HOME = '/';
  static const CONTACT_FORM = 'contact-form';
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Aula Flutter',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      routes: {
      HOME : (context) => ContactList(),
      CONTACT_FORM: (context) => ContactForm(),
      }
    );
  }
}
