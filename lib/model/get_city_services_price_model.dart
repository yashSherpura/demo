class GetCityServicesPriceModel {
  String? message;
  int? status;
  List<Result>? result;

  GetCityServicesPriceModel({this.message, this.status, this.result});

  GetCityServicesPriceModel.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    status = json['status'];
    if (json['result'] != null) {
      result = new List<Result>.empty(growable: true);
      json['result'].forEach((v) {
        result!.add(new Result.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['message'] = this.message;
    data['status'] = this.status;
    if (this.result != null) {
      data['result'] = this.result!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Result {
  String? sId;
  int? userID;
  String? serviceName;
  int? price;
  String? includes;
  String? excludes;
  String? driverName;
  String? serviceType;
  String? proPic;
  String? city;

  Result(
      {this.sId,
        this.userID,
        this.serviceName,
        this.price,
        this.includes,
        this.excludes,
        this.driverName,
        this.serviceType,
        this.proPic,
        this.city});

  Result.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    userID = json['userID'];
    serviceName = json['serviceName'];
    price = json['price'];
    includes = json['includes'];
    excludes = json['excludes'];
    driverName = json['driverName'];
    serviceType = json['serviceType'];
    proPic = json['proPic'];
    city = json['city'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['userID'] = this.userID;
    data['serviceName'] = this.serviceName;
    data['price'] = this.price;
    data['includes'] = this.includes;
    data['excludes'] = this.excludes;
    data['driverName'] = this.driverName;
    data['serviceType'] = this.serviceType;
    data['proPic'] = this.proPic;
    data['city'] = this.city;
    return data;
  }
}
