

class ErrorServer{
  final bool? status;
  final String message;
  ErrorServer({required this.status, required this.message});
  factory ErrorServer.fromService(Map<String, dynamic> json){
    return ErrorServer(
      status: json['status'],
      message: json['message'],
    );
  }
  Map<String, dynamic> toJson() => {
    "status": status,
    "message": message,
  };
}