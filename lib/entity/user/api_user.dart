import 'package:freezed_annotation/freezed_annotation.dart';

part 'api_user.g.dart';

@JsonSerializable()
class ApiUser {
  ApiUser(this.name, this.isNewUser);

  factory ApiUser.fromJson(Map<String, dynamic> json) =>
      _$ApiUserFromJson(json);

  final String name;
  final String isNewUser;

  Map<String, dynamic> toJson() => _$ApiUserToJson(this);
}
