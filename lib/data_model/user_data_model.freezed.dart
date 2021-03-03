// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies

part of 'user_data_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;
UserDataModel _$UserDataModelFromJson(Map<String, dynamic> json) {
  return _UserDataModel.fromJson(json);
}

/// @nodoc
class _$UserDataModelTearOff {
  const _$UserDataModelTearOff();

// ignore: unused_element
  _UserDataModel call(
      {@required String name,
      @required String id,
      @required DateTime last_active,
      @required List<double> val,
      @required List<int> time}) {
    return _UserDataModel(
      name: name,
      id: id,
      last_active: last_active,
      val: val,
      time: time,
    );
  }

// ignore: unused_element
  UserDataModel fromJson(Map<String, Object> json) {
    return UserDataModel.fromJson(json);
  }
}

/// @nodoc
// ignore: unused_element
const $UserDataModel = _$UserDataModelTearOff();

/// @nodoc
mixin _$UserDataModel {
  String get name;
  String get id; // ignore: non_constant_identifier_names
  DateTime get last_active;
  List<double> get val;
  List<int> get time;

  Map<String, dynamic> toJson();
  @JsonKey(ignore: true)
  $UserDataModelCopyWith<UserDataModel> get copyWith;
}

/// @nodoc
abstract class $UserDataModelCopyWith<$Res> {
  factory $UserDataModelCopyWith(
          UserDataModel value, $Res Function(UserDataModel) then) =
      _$UserDataModelCopyWithImpl<$Res>;
  $Res call(
      {String name,
      String id,
      DateTime last_active,
      List<double> val,
      List<int> time});
}

/// @nodoc
class _$UserDataModelCopyWithImpl<$Res>
    implements $UserDataModelCopyWith<$Res> {
  _$UserDataModelCopyWithImpl(this._value, this._then);

  final UserDataModel _value;
  // ignore: unused_field
  final $Res Function(UserDataModel) _then;

  @override
  $Res call({
    Object name = freezed,
    Object id = freezed,
    Object last_active = freezed,
    Object val = freezed,
    Object time = freezed,
  }) {
    return _then(_value.copyWith(
      name: name == freezed ? _value.name : name as String,
      id: id == freezed ? _value.id : id as String,
      last_active:
          last_active == freezed ? _value.last_active : last_active as DateTime,
      val: val == freezed ? _value.val : val as List<double>,
      time: time == freezed ? _value.time : time as List<int>,
    ));
  }
}

/// @nodoc
abstract class _$UserDataModelCopyWith<$Res>
    implements $UserDataModelCopyWith<$Res> {
  factory _$UserDataModelCopyWith(
          _UserDataModel value, $Res Function(_UserDataModel) then) =
      __$UserDataModelCopyWithImpl<$Res>;
  @override
  $Res call(
      {String name,
      String id,
      DateTime last_active,
      List<double> val,
      List<int> time});
}

/// @nodoc
class __$UserDataModelCopyWithImpl<$Res>
    extends _$UserDataModelCopyWithImpl<$Res>
    implements _$UserDataModelCopyWith<$Res> {
  __$UserDataModelCopyWithImpl(
      _UserDataModel _value, $Res Function(_UserDataModel) _then)
      : super(_value, (v) => _then(v as _UserDataModel));

  @override
  _UserDataModel get _value => super._value as _UserDataModel;

  @override
  $Res call({
    Object name = freezed,
    Object id = freezed,
    Object last_active = freezed,
    Object val = freezed,
    Object time = freezed,
  }) {
    return _then(_UserDataModel(
      name: name == freezed ? _value.name : name as String,
      id: id == freezed ? _value.id : id as String,
      last_active:
          last_active == freezed ? _value.last_active : last_active as DateTime,
      val: val == freezed ? _value.val : val as List<double>,
      time: time == freezed ? _value.time : time as List<int>,
    ));
  }
}

@JsonSerializable()

/// @nodoc
class _$_UserDataModel extends _UserDataModel {
  const _$_UserDataModel(
      {@required this.name,
      @required this.id,
      @required this.last_active,
      @required this.val,
      @required this.time})
      : assert(name != null),
        assert(id != null),
        assert(last_active != null),
        assert(val != null),
        assert(time != null),
        super._();

  factory _$_UserDataModel.fromJson(Map<String, dynamic> json) =>
      _$_$_UserDataModelFromJson(json);

  @override
  final String name;
  @override
  final String id;
  @override // ignore: non_constant_identifier_names
  final DateTime last_active;
  @override
  final List<double> val;
  @override
  final List<int> time;

  @override
  String toString() {
    return 'UserDataModel(name: $name, id: $id, last_active: $last_active, val: $val, time: $time)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _UserDataModel &&
            (identical(other.name, name) ||
                const DeepCollectionEquality().equals(other.name, name)) &&
            (identical(other.id, id) ||
                const DeepCollectionEquality().equals(other.id, id)) &&
            (identical(other.last_active, last_active) ||
                const DeepCollectionEquality()
                    .equals(other.last_active, last_active)) &&
            (identical(other.val, val) ||
                const DeepCollectionEquality().equals(other.val, val)) &&
            (identical(other.time, time) ||
                const DeepCollectionEquality().equals(other.time, time)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(name) ^
      const DeepCollectionEquality().hash(id) ^
      const DeepCollectionEquality().hash(last_active) ^
      const DeepCollectionEquality().hash(val) ^
      const DeepCollectionEquality().hash(time);

  @JsonKey(ignore: true)
  @override
  _$UserDataModelCopyWith<_UserDataModel> get copyWith =>
      __$UserDataModelCopyWithImpl<_UserDataModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$_$_UserDataModelToJson(this);
  }
}

abstract class _UserDataModel extends UserDataModel {
  const _UserDataModel._() : super._();
  const factory _UserDataModel(
      {@required String name,
      @required String id,
      @required DateTime last_active,
      @required List<double> val,
      @required List<int> time}) = _$_UserDataModel;

  factory _UserDataModel.fromJson(Map<String, dynamic> json) =
      _$_UserDataModel.fromJson;

  @override
  String get name;
  @override
  String get id;
  @override // ignore: non_constant_identifier_names
  DateTime get last_active;
  @override
  List<double> get val;
  @override
  List<int> get time;
  @override
  @JsonKey(ignore: true)
  _$UserDataModelCopyWith<_UserDataModel> get copyWith;
}
