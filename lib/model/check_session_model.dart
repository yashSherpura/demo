class CheckSessionModel {
  int? errNum;
  String? errFlag;
  String? errMsg;

  CheckSessionModel({this.errNum, this.errFlag, this.errMsg});

  CheckSessionModel.fromJson(Map<String, dynamic> json) {
    errNum = json['errNum'];
    errFlag = json['errFlag'];
    errMsg = json['errMsg'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['errNum'] = this.errNum;
    data['errFlag'] = this.errFlag;
    data['errMsg'] = this.errMsg;
    return data;
  }
}
