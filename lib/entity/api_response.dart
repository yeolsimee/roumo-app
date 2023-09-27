import 'package:freezed_annotation/freezed_annotation.dart';

part 'api_response.g.dart';

@JsonSerializable(explicitToJson: true)
class ApiResponse {
  ApiResponse({required this.data, this.code, this.success, this.message});

  factory ApiResponse.fromJson(Map<String, dynamic> json) =>
      _$ApiResponseFromJson(json);

  factory ApiResponse.fromDynamic(dynamic data) =>
      ApiResponse.fromJson(data as Map<String, dynamic>);

  final int? code;
  final bool? success;
  final String? message;
  final Map<String, dynamic> data;

  Map<String, dynamic> toJson() => _$ApiResponseToJson(this);
}
