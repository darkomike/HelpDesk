class AdminModelFields {
  static String surname = 'surname';
  static String otherNames = 'otherNames';
  static String email = 'email';
  static String telephone = 'telephone';
  static String userID = 'userID';
}

class AdminModel {
  String surname;
  String userID;
  String otherNames;
  String email;
  String telephone;

  AdminModel({
    required this.surname,
    required this.otherNames,
    required this.email,
    required this.telephone,
    required this.userID,
  });

  Map<String, dynamic> toJson() => {
        AdminModelFields.surname: surname,
        AdminModelFields.otherNames: otherNames,
        AdminModelFields.email: email,
        AdminModelFields.telephone: telephone,
        AdminModelFields.userID: userID,
      };

  factory AdminModel.fromJson(Map<String, dynamic> json) {
    return AdminModel(
      surname: json[AdminModelFields.surname],
      otherNames: json[AdminModelFields.otherNames],
      email: json[AdminModelFields.email],
      telephone: json[AdminModelFields.telephone],
      userID: json[AdminModelFields.userID],
    );
  }
}
