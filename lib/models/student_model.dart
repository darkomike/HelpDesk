class StudentModelFields {
  static String surname = 'surname';
  static String otherNames = 'otherNames';
  static String email = 'email';
  static String telephone = 'telephone';
  static String studentID = 'studentID';
  static String indexNumber = 'indexNumber';
  static String studentReference = 'studentReference';
  static String studentYear = 'studentYear';
  static String createdAt = 'createdAt';
}

class StudentModel {
  String surname;
  String studentID;
  String otherNames;
  String email;
  String telephone;
  String studentReference;
  String indexNumber;
  String studentYear;
  String createdAt;

  StudentModel(
      {required this.surname,
      required this.otherNames,
      required this.email,
      required this.telephone,
      required this.studentID,
      required this.createdAt,
      required this.indexNumber,
      required this.studentReference,
      required this.studentYear});

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};

    data[StudentModelFields.surname] = surname;
    data[StudentModelFields.otherNames] = otherNames;
    data[StudentModelFields.email] = email;
    data[StudentModelFields.telephone] = telephone;
    data[StudentModelFields.studentID] = studentID;
    data[StudentModelFields.indexNumber] = indexNumber;
    data[StudentModelFields.studentReference] = studentReference;
    data[StudentModelFields.studentYear] = studentYear;
    data[StudentModelFields.createdAt] = createdAt;

    return data;
  }

  factory StudentModel.fromJson(Map<String, dynamic> json) {
    return StudentModel(
      surname: json[StudentModelFields.surname],
      otherNames: json[StudentModelFields.otherNames],
      email: json[StudentModelFields.email],
      telephone: json[StudentModelFields.telephone],
      studentID: json[StudentModelFields.studentID],
      indexNumber: json[StudentModelFields.indexNumber],
      studentReference: json[StudentModelFields.studentReference],
      studentYear: json[StudentModelFields.studentYear],
      createdAt: json[StudentModelFields.createdAt],
    );
  }
}
