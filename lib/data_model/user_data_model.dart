import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_data_model.freezed.dart';
part 'user_data_model.g.dart';

@freezed
abstract class UserDataModel with _$UserDataModel {
  const UserDataModel._();
  const factory UserDataModel({
    @required String name,
    @required String id,
    // ignore: non_constant_identifier_names
    @required DateTime last_active,
    @required List<double> val,
    @required List<int> time,
  }) = _UserDataModel;

  factory UserDataModel.fromJson(Map<String, dynamic> json) => _$UserDataModelFromJson(json);

  String getName() => name;
  String getId() => id;
  DateTime getLastActive() => last_active;
  List<double> getValues() => val;
  List<int> getTime() => time;

  List<double> getModifiedValues() => val.sublist(0, time.length);
  List<int> getModifiedTime() => time.sublist(0, val.length);
}
