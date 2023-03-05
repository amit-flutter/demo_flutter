import 'User.dart';

class Data {
  Data({
      this.userToken, 
      this.user,});

  Data.fromJson(dynamic json) {
    userToken = json['user_token'];
    user = json['user'] != null ? User.fromJson(json['user']) : null;
  }
  String? userToken;
  User? user;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['user_token'] = userToken;
    if (user != null) {
      map['user'] = user!.toJson();
    }
    return map;
  }

}