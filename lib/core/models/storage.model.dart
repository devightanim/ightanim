
class StorageModel{
  String? authToken;
  String? email;

  bool getStartedShow;
  bool rememberMe;


  StorageModel({this.authToken, this.email, required this.getStartedShow, required this.rememberMe});

  factory StorageModel.fromMap(Map<String, dynamic> json) => StorageModel(
    authToken: json['auth_token'],
    email: json['email'],
    getStartedShow: json['get_started_show'],
    rememberMe: json['remember_me'],
  );

  Map<String, dynamic> toJson() => {
    'auth_token': authToken,
    'email': email,
    'get_started_show': getStartedShow,
    'remember_me': rememberMe,
  };

}