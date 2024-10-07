class UserModel {
  final String? fullName;
  final String userEmail;
  final String? userPassword;

  UserModel({this.fullName, required this.userEmail, this.userPassword});

  // Convert model to JSON for sending data to the server
  Map<String, dynamic> toJson({bool isSignUp = false, bool isLogIn = false}) {
    if (isSignUp) {
      return {
        'fullName': fullName?.trim() ?? '',
        'userEmail': userEmail.trim(),
        'userPassword': userPassword,
      };
    } else if (isLogIn) {
      return {
        'userEmail': userEmail.trim(),
        'userPassword': userPassword,
      };
    } else {
      return {
        'userEmail': userEmail.trim(),
      };
    }
  }

  // Factory method to create a UserModel from JSON (if needed)
  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      fullName: json['fullName'],
      userEmail: json['userEmail'],
      userPassword: json['userPassword'],
    );
  }
}
