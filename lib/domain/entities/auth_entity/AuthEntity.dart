import 'EntityUser.dart';

/// user : {"id":406,"name":"Laurianne Heathcote IV","email":"durgan.cleve@example.org","email_verified_at":"2024-03-31T22:07:03.000000Z","created_at":"2024-03-31T22:07:03.000000Z","updated_at":"2024-03-31T22:07:03.000000Z"}
/// error_message : "Invalid Credntials"
/// token : "eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiJ9.eyJhdWQiOiIxIiwianRpIjoiYjQ1OTA3ZjM4ZTAzZDc1ZDhhYzg5ZTFjZjQwMzIzMDEwYTAyZWFjYzg0MDZmZDQwZWU2NTI4M2NlZTAyNDMxNGZiODliNWE4NWE0NmFlZjIiLCJpYXQiOjE3MTY5MTQ1MjMuNzcyODM2LCJuYmYiOjE3MTY5MTQ1MjMuNzcyODM3LCJleHAiOjE3NDg0NTA1MjMuNzcwNzI3LCJzdWIiOiI0MDYiLCJzY29wZXMiOltdfQ.Hw5yGIwXz0PwV15pe8zK8N3ObcZbPzZszEPfbLUJt0OE6wZBkqGfKPURYN2n-6pUB7iyVhArYte10q5negwmVJlrQfqz_n_VhJtSJK8N1k_38sFDfopJ8NGmRk_NwaeUBWFPBrWHjgF6R0FHXuJqWgeTdaLBopAhtDvCU1z2QGF49yR7JIGk12G7Nz1_TaPoXTs2cRN3lg-uolrB_QLtzy1LJePoIQu0dsk35gvPoG_GS8y8wpDBCuAVkP1p3L8OrUwBnTZ9Cm_OpoEUJ1HT_8iNizEFOVpKUsh1gE6D1jV35gQl5xFLGdV_BwU6zm10hcPO9mxeC0_KbmjzTiMRpoIQmfmaQ2tqH2msb151wTSoPMwnhJksZgzQsTZGJapRJEkUPb5kwaDZiAV0ZqKLtSP526Zwfp1Af83toVIJgLC9YW0IOSNN9Wp8dcWxVOLOzeTcDOwjki2mey8j-jvz45PqARDi0pMHoCeSuaoJttO5pvIJTgZz5XrY55zIglYeU7fVPBMhWjle9XxoL6RTcu34MMJc_4BCLqyX9fYI8EdlAmQKCzDYdIiGt6ezmrtUHSWDVqGz-CTBHkURDMWokbIuhaBq4Xalxd2DeW2zmkas0bKQnqur3OIOb1s4gz3SrVQXBPX0IkIPoGdVm4FT9DZqGsNoNR_-C5_mrcyuLuA"

class AuthEntity {
  AuthEntity({
      this.user, 
      this.errorMessage, 
      this.token,});

  AuthEntity.fromJson(dynamic json) {
    user = json['user'] != null ? EntityUser.fromJson(json['user']) : null;
    errorMessage = json['error_message'];
    token = json['token'];
  }
  EntityUser? user;
  String? errorMessage;
  String? token;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (user != null) {
      map['user'] = user?.toJson();
    }
    map['error_message'] = errorMessage;
    map['token'] = token;
    return map;
  }

}