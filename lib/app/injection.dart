

import 'package:get_it/get_it.dart';
import 'package:primeiro_pro/app/database/sqlite/dao/contact_dao_impl.dart';
import 'package:primeiro_pro/app/domain/entities/contact_service.dart';
import 'package:primeiro_pro/interfaces/contact_dao.dart';

setupInjection(){
  GetIt getit = GetIt.I;

  getit.registerSingleton<ContactDAO>(ContactDAOimpl());
  getit.registerSingleton<ContactService>(ContactService());
}