class GetCityListModel {
  String? message;
  List<Data>? data;
  List<Cities>? cities;

  GetCityListModel({this.message, this.data, this.cities});

  GetCityListModel.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    if (json['data'] != null) {
      data = new List<Data>.empty(growable: true);
      json['data'].forEach((v) {
        data!.add(new Data.fromJson(v));
      });
    }
    if (json['cities'] != null) {
      cities = new List<Cities>.empty(growable: true);
      json['cities'].forEach((v) {
        cities!.add(new Cities.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['message'] = this.message;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    if (this.cities != null) {
      data['cities'] = this.cities!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Data {
  int? cityId;
  String? cityName;
  int? companyId;
  String? companyname;

  Data({this.cityId, this.cityName, this.companyId, this.companyname});

  Data.fromJson(Map<String, dynamic> json) {
    cityId = json['City_Id'];
    cityName = json['City_Name'];
    companyId = json['company_id'];
    companyname = json['companyname'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['City_Id'] = this.cityId;
    data['City_Name'] = this.cityName;
    data['company_id'] = this.companyId;
    data['companyname'] = this.companyname;
    return data;
  }
}

class Cities {
  int? cityId;
  String? cityName;
  int? companyId;
  String? companyname;

  Cities({this.cityId, this.cityName, this.companyId, this.companyname});

  Cities.fromJson(Map<String, dynamic> json) {
    cityId = json['City_Id'];
    cityName = json['City_Name'];
    companyId = json['company_id'];
    companyname = json['companyname'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['City_Id'] = this.cityId;
    data['City_Name'] = this.cityName;
    data['company_id'] = this.companyId;
    data['companyname'] = this.companyname;
    return data;
  }
}