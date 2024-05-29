/// id : 406
/// name : "Laurianne Heathcote IV"
/// email : "durgan.cleve@example.org"
/// email_verified_at : "2024-03-31T22:07:03.000000Z"
/// created_at : "2024-03-31T22:07:03.000000Z"
/// updated_at : "2024-03-31T22:07:03.000000Z"

class EntityUser {
  EntityUser({
      this.id, 
      this.name, 
      this.email,});

  EntityUser.fromJson(dynamic json) {
    id = json['id'];
    name = json['name'];
    email = json['email'];
  }
  int? id;
  String? name;
  String? email;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['name'] = name;
    map['email'] = email;
    return map;
  }

}