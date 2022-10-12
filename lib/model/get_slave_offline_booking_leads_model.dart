class GetSlaveOfflineBookingLeadsModel {
  String? message;
  int? status;
  List<Data>? data;

  GetSlaveOfflineBookingLeadsModel({this.message, this.status, this.data});

  GetSlaveOfflineBookingLeadsModel.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    status = json['status'];
    if (json['data'] != null) {
      data = new List<Data>.empty(growable: true);
      json['data'].forEach((v) {
        data!.add(new Data.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['message'] = this.message;
    data['status'] = this.status;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Data {
  num? approxFare;
  String? driversArray;
  String? driverName;
  String? driverPhone;
  AppointmentLocation? appointmentLocation;
  AppointmentLocation? dropLocation;
  String? appointmentDt;
  String? scheduledTime;
  String? estimatedTripDistance;
  String? appointmentAddress;
  String? dropAddress;
  VehicleData? vehicleData;
  String? locationType;
  int? rideStatus;
  String? bookingId;
  int? masId;
  String? dropTime;
  String? vehicleId;
  String? typeName;

  Data(
      {this.approxFare,
        this.driversArray,
        this.driverName,
        this.driverPhone,
        this.appointmentLocation,
        this.dropLocation,
        this.appointmentDt,
        this.scheduledTime,
        this.estimatedTripDistance,
        this.appointmentAddress,
        this.dropAddress,
        this.vehicleData,
        this.locationType,
        this.rideStatus,
        this.bookingId,
        this.masId,
        this.dropTime,
        this.vehicleId,
        this.typeName});

  Data.fromJson(Map<String, dynamic> json) {
    approxFare = json['approxFare'];
    driversArray = json['driversArray'];
    driverName = json['driverName'];
    driverPhone = json['driverPhone'];
    appointmentLocation = json['appointment_location'] != null
        ? new AppointmentLocation.fromJson(json['appointment_location'])
        : null;
    dropLocation = json['drop_location'] != null
        ? new AppointmentLocation.fromJson(json['drop_location'])
        : null;
    appointmentDt = json['appointment_dt'];
    scheduledTime = json['scheduled_time'];
    estimatedTripDistance = json['estimatedTripDistance'];
    appointmentAddress = json['appointment_address'];
    dropAddress = json['drop_address'];
    vehicleData = json['vehicle_data'] != null
        ? new VehicleData.fromJson(json['vehicle_data'])
        : null;
    locationType = json['location_type'];
    rideStatus = json['rideStatus'];
    bookingId = json['bookingId'];
    masId = json['mas_id'];
    dropTime = json['dropTime'];
    vehicleId = json['vehicleId'];
    typeName = json['typeName'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['approxFare'] = this.approxFare;
    data['driversArray'] = this.driversArray;
    data['driverName'] = this.driverName;
    data['driverPhone'] = this.driverPhone;
    if (this.appointmentLocation != null) {
      data['appointment_location'] = this.appointmentLocation!.toJson();
    }
    if (this.dropLocation != null) {
      data['drop_location'] = this.dropLocation!.toJson();
    }
    data['appointment_dt'] = this.appointmentDt;
    data['scheduled_time'] = this.scheduledTime;
    data['estimatedTripDistance'] = this.estimatedTripDistance;
    data['appointment_address'] = this.appointmentAddress;
    data['drop_address'] = this.dropAddress;
    if (this.vehicleData != null) {
      data['vehicle_data'] = this.vehicleData!.toJson();
    }
    data['location_type'] = this.locationType;
    data['rideStatus'] = this.rideStatus;
    data['bookingId'] = this.bookingId;
    data['mas_id'] = this.masId;
    data['dropTime'] = this.dropTime;
    data['vehicleId'] = this.vehicleId;
    data['typeName'] = this.typeName;
    return data;
  }
}

class AppointmentLocation {
  double? longitude;
  double? latitude;

  AppointmentLocation({this.longitude, this.latitude});

  AppointmentLocation.fromJson(Map<String, dynamic> json) {
    longitude = json['longitude'];
    latitude = json['latitude'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['longitude'] = this.longitude;
    data['latitude'] = this.latitude;
    return data;
  }
}

class VehicleData {
  int? type;
  String ? numberPlate;
  String ? vehicleModel;
  String ? vehicleYear;
  String ? driverImage;
  String ? vehicleMake;

  VehicleData(
      {this.type,
        this.numberPlate,
        this.vehicleModel,
        this.vehicleYear,
        this.driverImage,
        this.vehicleMake});

  VehicleData.fromJson(Map<String, dynamic> json) {
    type = json['type'];
    numberPlate = json['numberPlate'];
    vehicleModel = json['vehicleModel'];
    vehicleYear = json['vehicleYear'];
    driverImage = json['Driver_image'];
    vehicleMake = json['vehicleMake'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['type'] = this.type;
    data['numberPlate'] = this.numberPlate;
    data['vehicleModel'] = this.vehicleModel;
    data['vehicleYear'] = this.vehicleYear;
    data['Driver_image'] = this.driverImage;
    data['vehicleMake'] = this.vehicleMake;
    return data;
  }
}
