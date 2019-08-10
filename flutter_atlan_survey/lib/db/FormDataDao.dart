import 'package:flutter_atlan_survey/modals/FormData.dart';

class FormDataDao extends Dao<FormData> {
  final tableName = 'FormDataTable';
  final columnId = 'id';
  final email = 'email';
  final age = 'age';
  final name = 'name';
  final gender = 'gender';
  final phoneNumber = 'phoneNumber';
  final rating = 'rating';
  final date = 'date';
  final YesNo = 'yesNo';

  @override
  // TODO: implement createTableQuery
  String get createTableQuery =>
      "CREATE TABLE $tableName($columnId INTEGER PRIMARY KEY autoincrement,"
      " $email TEXT,"
      " $age TEXT,"
      " $name TEXT,"
      " $gender TEXT,"
      " $phoneNumber TEXT,"
      " $rating TEXT,"
      " $date TEXT,"
      " $YesNo TEXT)";

  @override
  List<FormData> fromList(List<Map<String, dynamic>> query) {
    List<FormData> data = List<FormData>();
    for (Map map in query) {
      data.add(fromMap(map));
    }
    return data;
  }

  @override
  FormData fromMap(Map<String, dynamic> query) {
    FormData data = FormData();
    data.id = query[columnId];
    data.email = query[email];
    data.age = query[age];
    data.name = query[name];
    data.gender = query[gender];
    data.phoneNumber = query[phoneNumber];
    data.rating = query[rating];
    data.date = query[date];
    data.YesNo = query[YesNo];
    return data;
  }

  @override
  Map<String, dynamic> toMap(FormData object) {
    return <String, dynamic>{
      email: object.email,
      age: object.age,
      name: object.name,
      gender: object.gender,
      phoneNumber: object.phoneNumber,
      rating: object.rating,
      date: object.date,
      YesNo: object.YesNo,
      columnId: object.id
    };
  }
}

abstract class Dao<T> {
  //queries
  String get createTableQuery;

  //abstract mapping methods
  T fromMap(Map<String, dynamic> query);

  List<T> fromList(List<Map<String, dynamic>> query);

  Map<String, dynamic> toMap(T object);
}
