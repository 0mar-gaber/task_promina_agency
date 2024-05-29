import 'Data.dart';

/// status : "success"
/// data : {"images":["https://flutter.prominaagency.com/media/1033/Screenshot-2024-05-28-203611.png","https://flutter.prominaagency.com/media/1034/Screenshot-2024-05-28-203611.png"]}
/// message : "Gallery retrieved successfully"

class GalleryResponse {
  GalleryResponse({
      this.status, 
      this.data, 
      this.message,});

  GalleryResponse.fromJson(dynamic json) {
    status = json['status'];
    data = json['data'] != null ? Data.fromJson(json['data']) : null;
    message = json['message'];
  }
  String? status;
  Data? data;
  String? message;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['status'] = status;
    if (data != null) {
      map['data'] = data?.toJson();
    }
    map['message'] = message;
    return map;
  }

}