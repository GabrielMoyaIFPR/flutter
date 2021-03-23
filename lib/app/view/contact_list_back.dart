import 'package:flutter/widgets.dart';
import 'package:get_it/get_it.dart';
import 'package:mobx/mobx.dart';
import 'package:primeiro_pro/app/domain/entities/contact.dart';
import 'package:primeiro_pro/app/domain/entities/contact_service.dart';
import 'package:primeiro_pro/app/my_app.dart';

part 'contact_list_back.g.dart';

class ContactListBack = _ContactListBack with _$ContactListBack;

abstract class _ContactListBack with Store{
  var _service = GetIt.I.get<ContactService>();
  
  //lista de contatos
  @observable
  Future<List<Contact>>list;

  //metodo para atualizar a lista de contatos
  @action
  refreshList([dynamic value]){
    list = _service.find();
  }
  _ContactListBack(){
    refreshList();
  }

  //metodo para chamar o form salvar/alterar
  goToForm(BuildContext context, [Contact contact]){
    Navigator.of(context).pushNamed(MyApp.CONTACT_FORM, arguments: contact).then(refreshList);
  }

  goToDetails(BuildContext context, [Contact contact]){
    Navigator.of(context).pushNamed(MyApp.CONTACT_DETAILS, arguments: contact);

  }

  //excluir
  remove(int id){
    _service.remove(id);
    refreshList();
  }



}