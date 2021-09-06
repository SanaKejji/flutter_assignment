class User {
  User({
    this.userImg,
    this.name,
    this.phone,
    required this.email,
    required this.password,
    required this.fcmToken,
  });

  String? userImg;
  String? name;
  String? phone;
  String email;
  String password;
  String fcmToken;

  factory User.fromJson(Map<String, dynamic> json) => User(
        userImg: json["userImg"],
        name: json["name"],
        phone: json["phone"],
        email: json["email"],
        password: json["password"],
        fcmToken: json["FCM_token"],
      );

  Map<String, dynamic> toJson() => {
        "userImg": userImg,
        "name": name,
        "phone": phone,
        "email": email,
        "password": password,
        "FCM_token": fcmToken,
      };
}
