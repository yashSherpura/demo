class LoginModel {
  int? errNum;
  int? errFlag;
  String? errMsg;
  Otp? otp;
  String? errorCode;
  String? error;

  LoginModel({this.errNum, this.errFlag, this.errMsg, this.otp, this.errorCode , this.error});

  LoginModel.fromJson(Map<String, dynamic> json) {
    errNum = json['errNum'];
    errFlag = json['errFlag'];
    errMsg = json['errMsg'];
    otp = json['otp'] != null ? new Otp.fromJson(json['otp']) : null;
    errorCode = json['errorCode'];
    error = json['error'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['errNum'] = this.errNum;
    data['errFlag'] = this.errFlag;
    data['errMsg'] = this.errMsg;
    if (this.otp != null) {
      data['otp'] = this.otp!.toJson();
    }
    data['errorCode'] = this.errorCode;
    data['error'] = this.error;
    return data;
  }
}

class Otp {
  String? errorCode;
  String? error;

  Otp({this.errorCode, this.error});

  Otp.fromJson(Map<String, dynamic> json) {
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


// }
// class LoginModel {

// String? errorCode;
// String? error;
//
// LoginModel({this.errorCode, this.error});
//
// LoginModel.fromJson(Map<String, dynamic> json) {
// errorCode = json['errorCode'];
// error = json['error'];
// }
//
// Map<String, dynamic> toJson() {
// final Map<String, dynamic> data = new Map<String, dynamic>();
// data['errorCode'] = this.errorCode;
// data['error'] = this.error;
// return data;
// }
// }
