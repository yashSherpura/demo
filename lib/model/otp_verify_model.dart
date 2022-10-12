class OTPVerify {
  String? errorCode;
  String? error;

  OTPVerify({this.errorCode, this.error});

  OTPVerify.fromJson(Map<String, dynamic> json) {
    errorCode = json['errorCode'];
    error = json['error'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['errorCode'] = this.errorCode;
    data['error'] = this.error;
    return data;
  }
}