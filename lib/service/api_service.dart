import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';

class ApiRequest {
  final String? url;
  final Map<String, dynamic>? params;
  var formdataParams;

  ApiRequest({
    @required this.url,
    this.params,
    this.formdataParams
  });

  Dio _dio() {
    // Put your authorization token here
    return Dio(BaseOptions(headers: {
    "Content-Type": "application/json",
    //"Authorization": "${PreferenceUtils.getString(AUTH_CODE)}"},
    //    "Authorization": "Bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiJ9.eyJhdWQiOiIzIiwianRpIjoiNDExYjBkYjdmZTEwYTllODU1MDcwMTU4NGYyZDI2ODBmNTA3NTMzNThkYWNiZjEyMDdhYjExY2FkOGVkNjNkNDA5MTc4ODg2YmMxMTIxMWQiLCJpYXQiOjE2MjIwOTY0OTgsIm5iZiI6MTYyMjA5NjQ5OCwiZXhwIjoxNjUzNjMyNDk4LCJzdWIiOiI3OCIsInNjb3BlcyI6W119.IaBCKSRWQ_T-oajlloWa-wzSyOH6vmUXNOwU12VXfvGr0PA_ypve1UlD0QzwiNZ9em3BpnbKZyYv7RjdgDIcZId9Ke2FmrljWw5LrjeDGsKBiJwONxIyQIW5V-_-YqcY8O6swoEW6VfxKyJZCRGF1ODh-_CpIOnroZL42C5TJS6EHxZvVJwI_DOdWPHLe70UxpKQz3mmnSQ24pJ8GwfqrA78r5F1gPbcm0VC9HfWhlSPmV3HENRopPose0zbJYHNu_iV4X87-nF4845MSgZ-96ZIWQW4ugh4Ps6_e4V2lk4EdSegRkGw3MLfwEEvGFNrctoZsFPQ0ZLyOA9DWfK6sI1fZnttKB6Pl3qFs6tGGziexFKOd4qr8BDqO-hIkOnc2VvY0sRkb6XtjcoaxCo4FoibvI5ChF3oTERM7gOOEJpTKzlaObyFTPvSlpdoLYhw8jLb631kUlmJeXU6f3jwhYxf64ghsUXkIakToHClFGyjtmWcgM4ztd6vqYFHVzCckVfY6rU3Z2CSst4B11IWgr0auN2NWQ_tNAX8HC5zJ5aN1vpPDdVSdq4m4OXUnapUx5GWVsRWqzqJE3afhbUgBGfALHqAyAdDAkK1l8ShhwqqNpKAiDLbgLVbhRRhdsAa6z4NjomVQ_s1UAm4ot0_9MrCJPktQHmRpYdVJe_CAt0"
       },
      responseType: ResponseType.json,
      connectTimeout: 30000,
      receiveTimeout: 30000,));
  }

  void get({
    Function() ?beforeSend,
    Function(dynamic data)? onSuccess,
    Function(dynamic error) ?onError,
  }) {

    print('GET METHOD DATA  URLS :- $url \n PARAMS :- $params');
    _dio().get(this.url!, queryParameters: this.params).then((res) {
      if (onSuccess != null) onSuccess(res);
    }).catchError((error) {
      if (onError != null) onError(_handleError(error));
    });
  }

  void post({
    Function() ?beforeSend,
    Function(dynamic data) ?onSuccess,
    Function(dynamic error) ?onError,
  }) {  print(' POST METHOD  DATA  URLS :- $url \n PARAMS :- $params');
      //print("Authorization : ${PreferenceUtils.getString(AUTH_CODE)}");
    _dio().post(url!, data: params).then((res) {
      if (onSuccess != null) onSuccess(res);
    }).catchError((error) {
      print('ERROR VALUE $error');
      if (onError != null) onError(_handleError(error));
    });
  }

  void postWithfile({
    Function()? beforeSend,
    Function(dynamic data)? onSuccess,
    Function(dynamic error) ?onError,
  }) {  print(' POST METHOD WITH FILE  DATA  URLS :- $url \n PARAMS :- $formdataParams');

  _dio().post(this.url!, data: this.formdataParams).then((res) {
    if (onSuccess != null) onSuccess(res);
  }).catchError((error) {
    print('ERROR VALUE $error');
    if (onError != null) onError(_handleError(error));
  });
  }

}


String _handleError(DioError error) {
  String errorDescription = "";

  switch (error.type) {
    case DioErrorType.cancel:
      errorDescription = "Request to API server was cancelled";
      break;
    case DioErrorType.connectTimeout:
      errorDescription = "Connection timeout with API server";
      break;
    case DioErrorType.other:
      errorDescription =
      "Connection to API server failed due to internet connection";
      break;
    case DioErrorType.receiveTimeout:
      errorDescription = "Receive timeout in connection with API server";
      break;
    case DioErrorType.response:
      errorDescription =
      "Error : ${error.response!.statusCode} - ${error.response!.statusMessage}";
      break;
    case DioErrorType.sendTimeout:
      errorDescription = "Send timeout in connection with API server";
      break;
  }
      return errorDescription;

}
