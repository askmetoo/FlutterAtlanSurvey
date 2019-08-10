import 'package:flutter_atlan_survey/modals/FormData.dart';

import 'DatabaseHelper.dart';

abstract class FormDataRepository {
  DatabaseProvider databaseProvider;
  Future<FormData> insert(FormData data);
}