class LoginModel {
  LoginModel({
    this.status,
    this.message,
    this.data,
  });

  int? status;
  String? message;
  Data? data;

  factory LoginModel.fromJson(Map<String, dynamic> json) => LoginModel(
        status: json["status"],
        message: json['message'],
        data: json["data"] != null ? Data.fromJson(json["data"]) : null,
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
        "data": data != null ? data!.toJson() : null,
      };
}

class Data {
  Data({
    this.token,
    this.user,
  });

  String? token;
  User? user;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        token: json["token"],
        user: User.fromJson(json["user"]),
      );

  Map<String, dynamic> toJson() => {
        "token": token,
        "user": user!.toJson(),
      };
}

class User {
  User({
    this.id,
    this.companyId,
    this.companySite,
    this.isHolding,
    this.email,
    this.employeeId,
    this.fullName,
    this.companyName,
    this.roleId,
    this.roleName,
  });

  dynamic id;
  int? companyId;
  List<CompanySite>? companySite;
  int? isHolding;
  String? email;
  String? employeeId;
  String? fullName;
  String? companyName;

  int? roleId;
  String? roleName;

  factory User.fromJson(Map<String, dynamic> json) => User(
        id: json["id"],
        companyId: json["company_id"],
        companySite: List<CompanySite>.from(
            json["company_site"].map((x) => CompanySite.fromJson(x))),
        isHolding: json["is_holding"],
        email: json["email"],
        employeeId: json["employeeID"],
        fullName: json["full_name"],
        companyName: json["company_name"],
        roleId: json["role_id"],
        roleName: json["role_name"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "company_id": companyId,
        "company_site": List<dynamic>.from(companySite!.map((x) => x.toJson())),
        "is_holding": isHolding,
        "email": email,
        "employeeID": employeeId,
        "full_name": fullName,
        "company_name": companyName,
        "role_id": roleId,
        "role_name": roleName,
      };
}

class CompanySite {
  CompanySite({
    this.id,
    this.name,
    this.description,
  });

  int? id;
  String? name;
  String? description;

  factory CompanySite.fromJson(Map<String, dynamic> json) => CompanySite(
        id: json["id"],
        name: json["name"],
        description: json["description"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "description": description,
      };
}
