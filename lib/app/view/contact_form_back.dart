import 'package:flutter/cupertino.dart';
import 'package:get_it/get_it.dart';
import 'package:mobx/mobx.dart';
import 'package:primeiro_pro/app/domain/entities/contact.dart';
import 'package:primeiro_pro/app/domain/entities/contact_service.dart';

part'contact_form_back.g.dart';

class ContactFormBack = _ContactFormBack with _$ContactFormBack;

abstract class _ContactFormBack with Store{
  Contact contact;
  var _service = GetIt.I.get<ContactService>();
  bool _nameIsValid;
  bool _emailIsValid;
  bool _telefoneIsValid;

  
  bool get isValid=> _nameIsValid && _emailIsValid && _telefoneIsValid;

  //diferenciar novo com alteração
  @action
  _ContactFormBack(BuildContext context){
    var parameter = ModalRoute.of(context).settings.arguments;
    contact=(parameter==null)? Contact(): parameter;
  }
  
  

  //salvar
  save()async{
    await _service.save(contact);
  }

  //validações
  String validateName(String name){
    try{
      _service.validateName(name);
      _nameIsValid =true;
      return null;
    }catch(e){
      _nameIsValid= false;
      return e.toString();
    }
  }

  String validateEmail(String email){
    try{
      _service.validateEmail(email);
      _emailIsValid =true;
      return null;
    }catch(e){
      _emailIsValid = false;
      return e.toString();
    }
  }
  String validatePhone(String phone){
    try{
      _service.validatePhone(phone);
      _telefoneIsValid =true;
      return null;
    }catch(e){
      _telefoneIsValid= false;
      return e.toString();
    }
  }

}