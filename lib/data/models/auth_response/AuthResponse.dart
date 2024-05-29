import 'User.dart';

/// user : {"id":406,"name":"Laurianne Heathcote IV","email":"durgan.cleve@example.org","email_verified_at":"2024-03-31T22:07:03.000000Z","created_at":"2024-03-31T22:07:03.000000Z","updated_at":"2024-03-31T22:07:03.000000Z"}
/// error_message : "Invalid Credntials"
/// token : "eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiJ9.eyJhdWQiOiIxIiwianRpIjoiNDQ5MGZkMGRiNGNkNzQ4OWFiMDVlYTg3ZDAwMjk0NDI0MzQ0MDM2MTIxNjQ2YzMzZjY3NzRmMjExMWIxMDFiOGY2ZjA4YzNhN2JiZTU1OTMiLCJpYXQiOjE3MTY5MTQwNzcuMjA2NjQyLCJuYmYiOjE3MTY5MTQwNzcuMjA2NjQ0LCJleHAiOjE3NDg0NTAwNzcuMjA1Mjg5LCJzdWIiOiI0MDYiLCJzY29wZXMiOltdfQ.ZXPqUtXEjn0zc6TBJYqJsFcgeoKokzyEyAtZ2WgESPYTG9lASLJW7-dlD1A8ezvhUOYRGQreGfEQvOfTirbAibhiDQc0C4VYpbt9JfQLFt3FTHfcaYL4s7qWicOVSsd4AQJK4p80_iZiNxms1XSJj8wE1_S-KXC17eOTv4cC71jtw2LdbEHiH3Z4IT5spqKzWsq4tEH0jF0lvxLXrsidtVPDyQifOLy2265OsvSpDDx8FwdaFalPo538diOFukxSsnIIUo_SrJ7JljTO3WZaO550Cm6mX4KXlxHqqd7IdE36SFf9PEnQdq45HJyCK_LA3JlPNcxwIVg4D-r24lL6OhhH183RB5HqbqSXscYT9iF1R2KFoU_OmqO8JOISMUe4BJwX2R3juvd1cIjrnKmBhtR8138Cod-mQmmHXCYjPloiHewGzvmQBngx4HyUE6ui_U0fEMvSCrq7fZYklvUETZ337qAqN4scgrUNo2Or_EQgr_wJO5stA1GOEqCKkq4uQvy7B5rJZC_yAjioZq6JJIGUlmw_W10978B23OWsySgf81Zp5BFsQvJmU17lf0mh1QILUtaSG0fiBnVHE-l6DiRodaXznlqlZkyHC9UziiyFfGCg3yzCdtWltf91QfWocjhjLqFNaMf36MnPh5ZOcpoNmIUDSdBUmg23FMtibTA"

class AuthResponse {
  AuthResponse({
      this.user, 
      this.errorMessage, 
      this.token,});

  AuthResponse.fromJson(dynamic json) {
    user = json['user'] != null ? User.fromJson(json['user']) : null;
    errorMessage = json['error_message'];
    token = json['token'];
  }
  User? user;
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