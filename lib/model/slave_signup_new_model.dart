class SlaveSignupNewModel {
  int? errNum;
  String? errFlag;
  String? errMsg;
  String? presenseChn;
  String? name;
  String? sid;
  String? token;
  String? email;
  String? countryCode;
  String? phone;
  String? paymentUrl;
  String? serverChn;
  String? chn;
  String? pub;
  String? sub;
  ConfigData? configData;
  String? pushTopic;

  SlaveSignupNewModel(
      {this.errNum,
        this.errFlag,
        this.errMsg,
        this.presenseChn,
        this.name,
        this.sid,
        this.token,
        this.email,
        this.countryCode,
        this.phone,
        this.paymentUrl,
        this.serverChn,
        this.chn,
        this.pub,
        this.sub,
        this.configData,
        this.pushTopic});

  SlaveSignupNewModel.fromJson(Map<String, dynamic> json) {
    errNum = json['errNum'];
    errFlag = json['errFlag'];
    errMsg = json['errMsg'];
    presenseChn = json['presenseChn'];
    name = json['name'];
    sid = json['sid'];
    token = json['token'];
    email = json['email'];
    countryCode = json['country_code'];
    phone = json['phone'];
    paymentUrl = json['PaymentUrl'];
    serverChn = json['serverChn'];
    chn = json['chn'];
    pub = json['pub'];
    sub = json['sub'];
    configData = json['configData'] != null
        ? new ConfigData.fromJson(json['configData'])
        : null;
    pushTopic = json['pushTopic'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['errNum'] = this.errNum;
    data['errFlag'] = this.errFlag;
    data['errMsg'] = this.errMsg;
    data['presenseChn'] = this.presenseChn;
    data['name'] = this.name;
    data['sid'] = this.sid;
    data['token'] = this.token;
    data['email'] = this.email;
    data['country_code'] = this.countryCode;
    data['phone'] = this.phone;
    data['PaymentUrl'] = this.paymentUrl;
    data['serverChn'] = this.serverChn;
    data['chn'] = this.chn;
    data['pub'] = this.pub;
    data['sub'] = this.sub;
    if (this.configData != null) {
      data['configData'] = this.configData!.toJson();
    }
    data['pushTopic'] = this.pushTopic;
    return data;
  }
}

class ConfigData {
  Versions? versions;
  String? eTAThreshold;
  int? bookingAmountAllowUpto;
  List<String>? googleKeysArray;
  String? pubnubIntervalHome;
  String? radiusOperating;
  String? radiusNotOperating;
  String? pubnubIntervalDispatch;
  String? distanceMatrixInterval;
  String? distanceThresholdForFareEstimate;
  String? paymentMode;
  String? distanceParameter;
  String? distanceParameterVal;
  String? currencySymbol;
  String? currencyType;

  ConfigData(
      {this.versions,
        this.eTAThreshold,
        this.bookingAmountAllowUpto,
        this.googleKeysArray,
        this.pubnubIntervalHome,
        this.radiusOperating,
        this.radiusNotOperating,
        this.pubnubIntervalDispatch,
        this.distanceMatrixInterval,
        this.distanceThresholdForFareEstimate,
        this.paymentMode,
        this.distanceParameter,
        this.distanceParameterVal,
        this.currencySymbol,
        this.currencyType});

  ConfigData.fromJson(Map<String, dynamic> json) {
    versions = json['versions'] != null
        ? new Versions.fromJson(json['versions'])
        : null;
    eTAThreshold = json['ETAThreshold'];
    bookingAmountAllowUpto = json['BookingAmountAllowUpto'];
    googleKeysArray = json['GoogleKeysArray'].cast<String>();
    pubnubIntervalHome = json['PubnubIntervalHome'];
    radiusOperating = json['RadiusOperating'];
    radiusNotOperating = json['RadiusNotOperating'];
    pubnubIntervalDispatch = json['PubnubIntervalDispatch'];
    distanceMatrixInterval = json['DistanceMatrixInterval'];
    distanceThresholdForFareEstimate = json['distanceThresholdForFareEstimate'];
    paymentMode = json['paymentMode'];
    distanceParameter = json['distanceParameter'];
    distanceParameterVal = json['distanceParameterVal'];
    currencySymbol = json['currencySymbol'];
    currencyType = json['currencyType'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.versions != null) {
      data['versions'] = this.versions!.toJson();
    }
    data['ETAThreshold'] = this.eTAThreshold;
    data['BookingAmountAllowUpto'] = this.bookingAmountAllowUpto;
    data['GoogleKeysArray'] = this.googleKeysArray;
    data['PubnubIntervalHome'] = this.pubnubIntervalHome;
    data['RadiusOperating'] = this.radiusOperating;
    data['RadiusNotOperating'] = this.radiusNotOperating;
    data['PubnubIntervalDispatch'] = this.pubnubIntervalDispatch;
    data['DistanceMatrixInterval'] = this.distanceMatrixInterval;
    data['distanceThresholdForFareEstimate'] =
        this.distanceThresholdForFareEstimate;
    data['paymentMode'] = this.paymentMode;
    data['distanceParameter'] = this.distanceParameter;
    data['distanceParameterVal'] = this.distanceParameterVal;
    data['currencySymbol'] = this.currencySymbol;
    data['currencyType'] = this.currencyType;
    return data;
  }
}

class Versions {
  String? andCust;
  String? iosCust;
  String? andDriver;
  String? iosDriver;

  Versions({this.andCust, this.iosCust, this.andDriver, this.iosDriver});

  Versions.fromJson(Map<String, dynamic> json) {
    andCust = json['andCust'];
    iosCust = json['iosCust'];
    andDriver = json['andDriver'];
    iosDriver = json['iosDriver'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['andCust'] = this.andCust;
    data['iosCust'] = this.iosCust;
    data['andDriver'] = this.andDriver;
    data['iosDriver'] = this.iosDriver;
    return data;
  }
}
