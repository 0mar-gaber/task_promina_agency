/// status : "success"
/// message : "Image uploaded successfully"

class UploadEntity {
  UploadEntity({
      this.status, 
      this.message,});

  UploadEntity.fromJson(dynamic json) {
    status = json['status'];
    message = json['message'];
  }
  String? status;
  String? message;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['status'] = status;
    map['message'] = message;
    return map;
  }

}