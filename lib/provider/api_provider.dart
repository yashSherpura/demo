
import 'dart:convert';

import 'package:nearme/model/check_session_model.dart';
import 'package:nearme/model/get_city_services_price_model.dart';
import 'package:nearme/model/get_new_service_model.dart';
import 'package:nearme/model/get_slave_offline_booking_leads_model.dart';
import 'package:nearme/model/login_model.dart';
import 'package:nearme/model/otp_verify_model.dart';
import 'package:nearme/model/slave_login_new_model.dart';
import 'package:nearme/model/slave_signup_new_model.dart';
import 'package:nearme/service/api_service.dart';
import 'package:nearme/utils/url_utils.dart';
import 'package:nearme/model/get_city_list_model.dart';

class APIProvider {
  void loginAPI({
    Map<String, dynamic>? params,
    Function()? beforeSend,
    Function(LoginModel data)? onSuccess,
    Function(dynamic error)? onError,
  }) {
    ApiRequest(url: urlLogin, params: params).post(
      beforeSend: () => {if (beforeSend != null) beforeSend()},
      onSuccess: (data) {
        LoginModel res = LoginModel.fromJson(json.decode (data.toString()));
        onSuccess!(res);
        print("Response : ${res.errorCode}");
      },
      onError: (error) => {if (onError != null) onError(error)},
    );
  }

  void OTPVerifyAPI({
    Map<String, dynamic>? params,
    Function()? beforeSend,
    Function(OTPVerify data)? onSuccess,
    Function(dynamic error)? onError,
  }) {
    ApiRequest(url: urlOtpVerify, params: params).post(
      beforeSend: () => {if (beforeSend != null) beforeSend()},
      onSuccess: (data) {
        OTPVerify res = OTPVerify.fromJson(json.decode (data.toString()));
        onSuccess!(res);
        print("Response : ${res.errorCode}");
      },
      onError: (error) => {if (onError != null) onError(error)},
    );
  }

  void slaveSignupNewAPI({
    Map<String, dynamic>? params,
    Function()? beforeSend,
    Function(SlaveSignupNewModel data)? onSuccess,
    Function(dynamic error)? onError,
  }) {
    ApiRequest(url: urlSlaveSignUpNew, params: params).post(
      beforeSend: () => {if (beforeSend != null) beforeSend()},
      onSuccess: (data) {
        SlaveSignupNewModel res = SlaveSignupNewModel.fromJson(json.decode (data.toString()));
        onSuccess!(res);
        print("slaveSignupNewAPI Response : ${res.name}");
      },
      onError: (error) => {if (onError != null) onError(error)},
    );
  }

  void slaveLoginNewAPI({
    Map<String, dynamic>? params,
    Function()? beforeSend,
    Function(SlaveLoginNewModel data)? onSuccess,
    Function(dynamic error)? onError,
  }) {
    ApiRequest(url: urlSlaveLoginUpNew, params: params).post(
      beforeSend: () => {if (beforeSend != null) beforeSend()},
      onSuccess: (data) {
        SlaveLoginNewModel res = SlaveLoginNewModel.fromJson(json.decode (data.toString()));
        onSuccess!(res);
        print("slaveLoginNewAPI Response : ${res.name}");
      },
      onError: (error) => {if (onError != null) onError(error)},
    );
  }

  void getSlaveOfflineBookingLeadsAPI({
    Map<String, dynamic>? params,
    Function()? beforeSend,
    Function(GetSlaveOfflineBookingLeadsModel data)? onSuccess,
    Function(dynamic error)? onError,
  }) {
    ApiRequest(url: urlGetSlaveOfflineBookingLeads, params: params).post(
      beforeSend: () => {if (beforeSend != null) beforeSend()},
      onSuccess: (data) {
        GetSlaveOfflineBookingLeadsModel res = GetSlaveOfflineBookingLeadsModel.fromJson(json.decode (data.toString()));
        onSuccess!(res);
        print("getSlaveOfflineBookingLeads Response : ${res.message}");
      },
      onError: (error) => {if (onError != null) onError(error)},
    );
  }

  void checkSessionAPI({
    Map<String, dynamic>? params,
    Function()? beforeSend,
    Function(CheckSessionModel data)? onSuccess,
    Function(dynamic error)? onError,
  }) {
    ApiRequest(url: urlCheckSession, params: params).post(
      beforeSend: () => {if (beforeSend != null) beforeSend()},
      onSuccess: (data) {
        CheckSessionModel res = CheckSessionModel.fromJson(json.decode (data.toString()));
        onSuccess!(res);
        print("CheckSession Response : ${res.errMsg}");
      },
      onError: (error) => {if (onError != null) onError(error)},
    );
  }

  void getCityListAPI({
    Map<String, dynamic>? params,
    Function()? beforeSend,
    Function(GetCityListModel data)? onSuccess,
    Function(dynamic error)? onError,
  }) {
    ApiRequest(url: urlGetCityList, params: params).post(
      beforeSend: () => {if (beforeSend != null) beforeSend()},
      onSuccess: (data) {
        GetCityListModel res = GetCityListModel.fromJson(json.decode (data.toString()));
        onSuccess!(res);
        print("CheckSession Response : ${res.message}");
      },
      onError: (error) => {if (onError != null) onError(error)},
    );
  }

  void getNewServiceAPI({
    Map<String, dynamic>? params,
    Function()? beforeSend,
    Function(GetNewServiceModel data)? onSuccess,
    Function(dynamic error)? onError,
  }) {
    ApiRequest(url: urlGetNewServices, params: params).get(
      beforeSend: () => {if (beforeSend != null) beforeSend()},
      onSuccess: (data) {
        GetNewServiceModel res = GetNewServiceModel.fromJson(json.decode (data.toString()));
        onSuccess!(res);
        print("CheckSession Response : ${res.message}");
      },
      onError: (error) => {if (onError != null) onError(error)},
    );
  }

  void getCityServicesPriceAPI({
    Map<String, dynamic>? params,
    Function()? beforeSend,
    Function(GetCityServicesPriceModel data)? onSuccess,
    Function(dynamic error)? onError,
  }) {
    ApiRequest(url: urlGetCityServicesPrice, params: params).post(
      beforeSend: () => {if (beforeSend != null) beforeSend()},
      onSuccess: (data) {
        GetCityServicesPriceModel res = GetCityServicesPriceModel.fromJson(json.decode (data.toString()));
        onSuccess!(res);
        print("CheckSession Response : ${res.message}");
      },
      onError: (error) => {if (onError != null) onError(error)},
    );
  }
}



