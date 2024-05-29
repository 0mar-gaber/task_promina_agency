/// images : ["https://flutter.prominaagency.com/media/1033/Screenshot-2024-05-28-203611.png","https://flutter.prominaagency.com/media/1034/Screenshot-2024-05-28-203611.png"]

class Data {
  Data({
      this.images,});

  Data.fromJson(dynamic json) {
    images = json['images'] != null ? json['images'].cast<String>() : [];
  }
  List<String>? images;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['images'] = images;
    return map;
  }

}