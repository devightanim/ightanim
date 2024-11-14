

import 'package:ightanim/core/models/validation/error_validation.dart';

class ValidationError{
  final String message;
  final List<ErrorValidation> errors;

  ValidationError({required this.message, required this.errors});

  factory ValidationError.fromService(Map<String, dynamic> json){
    Map<String, dynamic> errors = json['errors'];
    return ValidationError(
      message: json['message'],
      errors: errors.entries.map((e)  {
        return ErrorValidation(key: e.key, value: e.value[0]);
      }).toList(),
    );
  }

  Map<String, dynamic> toJson() => {
    "message": message,
    "errors": errors.map((e) => e.toJson()).toList()
  };
}