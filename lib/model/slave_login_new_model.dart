class SlaveLoginNewModel {
  int? errNum;
  String? errFlag;
  String? errMsg;
  int? walletAmt;
  String? presenseChn;
  String? sid;
  String? token;
  String? name;
  String? email;
  String? countryCode;
  String? phone;
  String? profilePic;
  String? pushTopic;
  String? serverChn;
  //List<Null>? languages;
  String? chn;
  String? pub;
  String? sub;
  //List<Null>? addresses;
  ConfigData? configData;

  SlaveLoginNewModel(
      {this.errNum,
        this.errFlag,
        this.errMsg,
        this.walletAmt,
        this.presenseChn,
        this.sid,
        this.token,
        this.name,
        this.email,
        this.countryCode,
        this.phone,
        this.profilePic,
        this.pushTopic,
        this.serverChn,
        //this.languages,
        this.chn,
        this.pub,
        this.sub,
        //this.addresses,
        this.configData});

  SlaveLoginNewModel.fromJson(Map<String, dynamic> json) {
    errNum = json['errNum'];
    errFlag = json['errFlag'];
    errMsg = json['errMsg'];
    walletAmt = json['walletAmt'];
    presenseChn = json['presenseChn'];
    sid = json['sid'];
    token = json['token'];
    name = json['name'];
    email = json['email'];
    countryCode = json['country_code'];
    phone = json['phone'];
    profilePic = json['profilePic'];
    pushTopic = json['pushTopic'];
    serverChn = json['serverChn'];
    // if (json['Languages'] != null) {
    //   languages = List<Null>.empty(growable: true);
    //   json['Languages'].forEach((v) {
    //     languages!.add( Null.fromJson(v));
    //   });
    // }
    chn = json['chn'];
    pub = json['pub'];
    sub = json['sub'];
    // if (json['addresses'] != null) {
    //   addresses =  List<Null>.empty(growable: true);
    //   json['addresses'].forEach((v) {
    //     addresses!.add(new Null.fromJson(v));
    //   });
    // }
    configData = json['configData'] != null
        ? new ConfigData.fromJson(json['configData'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data =  Map<String, dynamic>();
    data['errNum'] = this.errNum;
    data['errFlag'] = this.errFlag;
    data['errMsg'] = this.errMsg;
    data['walletAmt'] = this.walletAmt;
    data['presenseChn'] = this.presenseChn;
    data['sid'] = this.sid;
    data['token'] = this.token;
    data['name'] = this.name;
    data['email'] = this.email;
    data['country_code'] = this.countryCode;
    data['phone'] = this.phone;
    data['profilePic'] = this.profilePic;
    data['pushTopic'] = this.pushTopic;
    data['serverChn'] = this.serverChn;
    // if (this.languages != null) {
    //   data['Languages'] = this.languages!.map((v) => v.toJson()).toList();
    // }
    data['chn'] = this.chn;
    data['pub'] = this.pub;
    data['sub'] = this.sub;
    // if (this.addresses != null) {
    //   data['addresses'] = this.addresses!.map((v) => v.toJson()).toList();
    // }
    if (this.configData != null) {
      data['configData'] = this.configData!.toJson();
    }
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
  String? defaultPaymentType;
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
        this.defaultPaymentType,
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
    defaultPaymentType = json['defaultPaymentType'];
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
    data['defaultPaymentType'] = this.defaultPaymentType;
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
