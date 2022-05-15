class LoginModelError {
  LoginModelError({
    this.message,
    this.errors,
    this.statusCode,
    this.debug,
  });

  String? message;
  Errors? errors;
  int? statusCode;
  Debug? debug;

  factory LoginModelError.fromJson(Map<String, dynamic> json) =>
      LoginModelError(
        message: json["message"],
        errors: Errors.fromJson(json["errors"]),
        statusCode: json["status_code"],
        debug: Debug.fromJson(json["debug"]),
      );
}

class Debug {
  Debug({
    this.line,
    this.file,
    this.debugClass,
    this.trace,
  });

  int? line;
  String? file;
  String? debugClass;
  List<String>? trace;

  factory Debug.fromJson(Map<String, dynamic> json) => Debug(
        line: json["line"],
        file: json["file"],
        debugClass: json["class"],
        trace: List<String>.from(json["trace"].map((x) => x)),
      );
}

class Errors {
  Errors({
    this.email,
  });

  List<String>? email;

  factory Errors.fromJson(Map<String, dynamic> json) => Errors(
        email: List<String>.from(json["email"].map((x) => x)),
      );
}
