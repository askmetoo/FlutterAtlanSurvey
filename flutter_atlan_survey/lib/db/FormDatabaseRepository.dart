import 'package:flutter_atlan_survey/db/DatabaseHelper.dart';

import 'package:flutter_atlan_survey/modals/FormData.dart';

import 'FormDataDao.dart';
import 'FormDataRepository.dart';

class FormDatabaseRepository implements FormDataRepository{

  final dao = FormDataDao();

  @override
  DatabaseProvider  databaseProvider = new DatabaseProvider();

  @override
  Future<FormData> insert(FormData data) async {

    final db = await databaseProvider.db();
    data.id = await db.insert(dao.tableName, dao.toMap(data));
    return data;
  }


}