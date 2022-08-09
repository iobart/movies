import 'package:json_annotation/json_annotation.dart';

part 'user_model.g.dart';

@JsonSerializable()
class UserModel {
  const UserModel({
    this.user = '',
    this.password = '',
  });

  @JsonKey(defaultValue: '')
  final String user;

  @JsonKey(defaultValue: '')
  final String password;

  UserModel copyWith({
    String? user,
    String? password,
  }) =>
      UserModel(
        user: user ?? this.user,
        password: password ?? this.password,
      );

  Map<String, dynamic> toJson() => _$UserModelToJson(this);

  static UserModel fromJson(Map<String, dynamic> json) =>
      _$UserModelFromJson(json);
}
