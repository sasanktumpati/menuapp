import 'package:freezed_annotation/freezed_annotation.dart';

part 'response_model.freezed.dart';
part 'response_model.g.dart';

@freezed
class MenuResponseModel with _$MenuResponseModel {
  const factory MenuResponseModel({
    DateTime? date,
    String? day,
    List<String>? breakfast,
    List<String>? lunch,
    List<String>? dinner,
  }) = _MenuResponseModel;

  factory MenuResponseModel.fromJson(Map<String, dynamic> json) =>
      _$MenuResponseModelFromJson(json);
}
