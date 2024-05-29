/// status : "success"
/// data : []
/// message : "Image uploaded successfully"

class UploadResponse {
  UploadResponse({
      this.status, 
      this.data, 
      this.message,});

  UploadResponse.fromJson(dynamic json) {
    status = json['status'];
    message = json['message'];
  }
  String? status;
  List<dynamic>? data;
  String? message;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['status'] = status;
    map['message'] = message;
    return map;
  }

}