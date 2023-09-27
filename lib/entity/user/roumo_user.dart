import 'package:freezed_annotation/freezed_annotation.dart';

part 'roumo_user.freezed.dart';

part 'roumo_user.g.dart';

@freezed
class RoumoUser with _$RoumoUser {
  const factory RoumoUser({
    required String? name,
    required String? isNewUser,
  }) = _RoumoUser;

  factory RoumoUser.fromJson(Map<String, dynamic> json) =>
      _$RoumoUserFromJson(json);
}
