class ErrorValidation {
  final String key;
  final String value;

  ErrorValidation({required this.key, required this.value});

  Map<String, dynamic> toJson() => {"key": key, "value": value};
}