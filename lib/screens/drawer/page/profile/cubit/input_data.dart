import 'package:dio/dio.dart';

class UpdateProfileInputData {
  String? firstName,
      lastName,
      nameArabic,
      joinDate,
      birthDate,
      userName,
      email,
      phoneNumber;
  var profilePic;

  Map<String, dynamic> toJson() {
    return {
      "firstName": firstName,
      "lastName": lastName,
      "nameArabic": nameArabic,
      "facebookId": null,
      "googleKey": null,
      "pictureUrl": profilePic is String
          ? profilePic
          : MultipartFile.fromFileSync(profilePic.path,
              filename: profilePic.path),
      "joinDate": joinDate,
      "birthDate": birthDate,
      "countryId": null,
      "country": null,
      "active": true,
      "userRoles": null,
      "id": "275b12b8-f898-4e69-8a80-f8f23ebee2f5",
      "userName": userName,
      "normalizedUserName": "MORASHAD0@GMAIL.COM",
      "email": email,
      "normalizedEmail": "MORASHAD0@GMAIL.COM",
      "emailConfirmed": false,
      "passwordHash":
          "AQAAAAEAACcQAAAAEJQnjfF9x+waCLsGjFeKg0lG+FFeijmwGKE8UTj5pLghl1p8Ucs++Eej+3IB1RF5cg==",
      "securityStamp": "QEZO6EIVHY3KRQ4KGOD5IOCXOZW6YMBN",
      "concurrencyStamp": "22357c5d-af06-4a17-8086-a43a2ec84753",
      "phoneNumber": phoneNumber,
      "phoneNumberConfirmed": false,
      "twoFactorEnabled": false,
      "lockoutEnd": null,
      "lockoutEnabled": true,
      "accessFailedCount": 0
    };
  }
}
