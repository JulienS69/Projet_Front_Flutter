import 'package:freezed_annotation/freezed_annotation.dart';

part 'user.freezed.dart';
part 'user.g.dart';

@Freezed(makeCollectionsUnmodifiable: false)
class User with _$User {
  const factory User({
    @JsonKey(name: 'id') required String uuid,
    @JsonKey(name: 'firstname') required String firstName,
    @JsonKey(name: 'lastname') required String lastName,
  }) = _User;

  factory User.empty() {
    return User(
      uuid: "",
      firstName: "",
      lastName: "",
    );
  }

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);
}

extension OnUser on User {
  String get fullName => '$firstName ${lastName.toUpperCase()}';
}

extension OnUserJson on Map<String, dynamic> {
  User get toUser {
    return User.fromJson(this);
  }
}

extension OnListUserJson on List<Map<String, dynamic>> {
  List<User> get toUser {
    return map<User>((Map<String, dynamic> e) => e.toUser).toList();
  }
}
