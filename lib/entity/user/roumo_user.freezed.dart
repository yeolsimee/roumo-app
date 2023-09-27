// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'roumo_user.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

RoumoUser _$RoumoUserFromJson(Map<String, dynamic> json) {
  return _RoumoUser.fromJson(json);
}

/// @nodoc
mixin _$RoumoUser {
  String? get name => throw _privateConstructorUsedError;
  String? get isNewUser => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $RoumoUserCopyWith<RoumoUser> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RoumoUserCopyWith<$Res> {
  factory $RoumoUserCopyWith(RoumoUser value, $Res Function(RoumoUser) then) =
      _$RoumoUserCopyWithImpl<$Res, RoumoUser>;
  @useResult
  $Res call({String? name, String? isNewUser});
}

/// @nodoc
class _$RoumoUserCopyWithImpl<$Res, $Val extends RoumoUser>
    implements $RoumoUserCopyWith<$Res> {
  _$RoumoUserCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = freezed,
    Object? isNewUser = freezed,
  }) {
    return _then(_value.copyWith(
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      isNewUser: freezed == isNewUser
          ? _value.isNewUser
          : isNewUser // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_RoumoUserCopyWith<$Res> implements $RoumoUserCopyWith<$Res> {
  factory _$$_RoumoUserCopyWith(
          _$_RoumoUser value, $Res Function(_$_RoumoUser) then) =
      __$$_RoumoUserCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String? name, String? isNewUser});
}

/// @nodoc
class __$$_RoumoUserCopyWithImpl<$Res>
    extends _$RoumoUserCopyWithImpl<$Res, _$_RoumoUser>
    implements _$$_RoumoUserCopyWith<$Res> {
  __$$_RoumoUserCopyWithImpl(
      _$_RoumoUser _value, $Res Function(_$_RoumoUser) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = freezed,
    Object? isNewUser = freezed,
  }) {
    return _then(_$_RoumoUser(
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      isNewUser: freezed == isNewUser
          ? _value.isNewUser
          : isNewUser // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_RoumoUser implements _RoumoUser {
  const _$_RoumoUser({required this.name, required this.isNewUser});

  factory _$_RoumoUser.fromJson(Map<String, dynamic> json) =>
      _$$_RoumoUserFromJson(json);

  @override
  final String? name;
  @override
  final String? isNewUser;

  @override
  String toString() {
    return 'RoumoUser(name: $name, isNewUser: $isNewUser)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_RoumoUser &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.isNewUser, isNewUser) ||
                other.isNewUser == isNewUser));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, name, isNewUser);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_RoumoUserCopyWith<_$_RoumoUser> get copyWith =>
      __$$_RoumoUserCopyWithImpl<_$_RoumoUser>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_RoumoUserToJson(
      this,
    );
  }
}

abstract class _RoumoUser implements RoumoUser {
  const factory _RoumoUser(
      {required final String? name,
      required final String? isNewUser}) = _$_RoumoUser;

  factory _RoumoUser.fromJson(Map<String, dynamic> json) =
      _$_RoumoUser.fromJson;

  @override
  String? get name;
  @override
  String? get isNewUser;
  @override
  @JsonKey(ignore: true)
  _$$_RoumoUserCopyWith<_$_RoumoUser> get copyWith =>
      throw _privateConstructorUsedError;
}
