class GetNewServiceModel {
  String? message;
  int? status;
  List<GetNewServices>? getNewServices;

  GetNewServiceModel({this.message, this.status, this.getNewServices});

  GetNewServiceModel.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    status = json['status'];
    if (json['getNewServices'] != null) {
      getNewServices = new List<GetNewServices>.empty(growable: true);
      json['getNewServices'].forEach((v) {
        getNewServices!.add(new GetNewServices.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['message'] = this.message;
    data['status'] = this.status;
    if (this.getNewServices != null) {
      data['getNewServices'] =
          this.getNewServices!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class GetNewServices {
  String? sId;
  String? serviceName;
  String? city;
  String? endService;
  int? lastLevel;
  String? driverFlag;
  String? custFlag;
  String? serviceImage;
  String? serviceHeader;
  String? docAssigned;

  GetNewServices(
      {this.sId,
        this.serviceName,
        this.city,
        this.endService,
        this.lastLevel,
        this.driverFlag,
        this.custFlag,
        this.serviceImage,
        this.serviceHeader,
        this.docAssigned});

  GetNewServices.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    serviceName = json['serviceName'];
    city = json['city'];
    endService = json['endService'];
    lastLevel = json['lastLevel'];
    driverFlag = json['driverFlag'];
    custFlag = json['custFlag'];
    serviceImage = json['serviceImage'];
    serviceHeader = json['serviceHeader'];
    docAssigned = json['docAssigned'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['serviceName'] = this.serviceName;
    data['city'] = this.city;
    data['endService'] = this.endService;
    data['lastLevel'] = this.lastLevel;
    data['driverFlag'] = this.driverFlag;
    data['custFlag'] = this.custFlag;
    data['serviceImage'] = this.serviceImage;
    data['serviceHeader'] = this.serviceHeader;
    data['docAssigned'] = this.docAssigned;
    return data;
  }
}
