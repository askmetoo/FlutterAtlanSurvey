class FormData{
  int id;
  String email;
  String name;
  String gender;
  String age;
  String phoneNumber;
  String rating;
  String date;
  String YesNo;


  FormData({this.email, this.name, this.gender, this.age, this.phoneNumber,
      this.rating, this.date, this.YesNo,this.id});

  Map<String, dynamic> toMap() {
    return {
      'id' : this.id,
      'email': this.email,
      'name': this.name,
      'gender': this.gender,
      'age': this.age,
      'phoneNumber': this.phoneNumber,
      'rating': this.rating,
      'date': this.date,
      'YesNo': this.YesNo,
    };
  }

  factory FormData.fromMap(Map<String, dynamic> map) {
    return new FormData(
      id: map['id'] as int,
      email: map['email'] as String,
      name: map['name'] as String,
      gender: map['gender'] as String,
      age: map['age'] as String,
      phoneNumber: map['phoneNumber'] as String,
      rating: map['rating'] as String,
      date: map['date'] as String,
      YesNo: map['YesNo'] as String,
    );
  }

}