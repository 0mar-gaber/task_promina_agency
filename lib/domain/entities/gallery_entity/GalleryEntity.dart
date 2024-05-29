import 'DataEntity.dart';

/// data : {"images":["https://flutter.prominaagency.com/media/1033/Screenshot-2024-05-28-203611.png","https://flutter.prominaagency.com/media/1034/Screenshot-2024-05-28-203611.png"]}

class GalleryEntity {
  GalleryEntity({
      this.data,});

  GalleryEntity.fromJson(dynamic json) {
    data = json['data'] != null ? DataEntity.fromJson(json['data']) : null;
  }
  DataEntity? data;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (data != null) {
      map['data'] = data?.toJson();
    }
    return map;
  }

}