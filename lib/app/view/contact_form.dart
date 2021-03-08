import 'package:flutter/material.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

class ContactForm extends StatelessWidget {

  Widget fieldName(){
    return TextFormField(
      decoration: InputDecoration(
        labelText: 'Nome:'
      ),
    );
  }
  Widget fieldEmail(){
    return TextFormField(
      decoration: InputDecoration(
        labelText: 'E-mail:'
        , hintText: 'email@email.com'
      ),
    );
  }
  Widget fieldTelefone(){
    var mask = MaskTextInputFormatter(mask:'(##)# ####-####');
    return TextFormField(
      inputFormatters: [mask],
      keyboardType: TextInputType.number,
      decoration: InputDecoration(
        labelText: 'Telefone:',
        hintText: '(99)9 9999-9999'
      ),
    );
  }
  Widget fieldURLImage(){
    return TextFormField(
      decoration: InputDecoration(
        labelText: 'Endereço Foto:'
        , hintText: 'http://foto.com'
      ),
    );
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Cadastro de contato'),
      actions:[
        IconButton(icon: Icon(Icons.save), onPressed: null)
      ],
      ),
      body: Padding(
        padding: EdgeInsets.all(10),
        child: Form(
          child: Column(
            children: [
              fieldName(),
              fieldEmail(),
              fieldTelefone(),
              fieldURLImage()

            ],) 
        ,),
      ),
    );
  }
}