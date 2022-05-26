// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'hauler_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

HaulerResponse _$HaulerResponseFromJson(Map<String, dynamic> json) {
  return _HaulerResponse.fromJson(json);
}

/// @nodoc
class _$HaulerResponseTearOff {
  const _$HaulerResponseTearOff();

  _HaulerResponse call(
      {@JsonKey(name: 'status') int? status,
      @JsonKey(name: 'data') List<HaulerModel>? data,
      @JsonKey(name: 'message') String? message}) {
    return _HaulerResponse(
      status: status,
      data: data,
      message: message,
    );
  }

  HaulerResponse fromJson(Map<String, Object?> json) {
    return HaulerResponse.fromJson(json);
  }
}

/// @nodoc
const $HaulerResponse = _$HaulerResponseTearOff();

/// @nodoc
mixin _$HaulerResponse {
  @JsonKey(name: 'status')
  int? get status => throw _privateConstructorUsedError;
  @JsonKey(name: 'data')
  List<HaulerModel>? get data => throw _privateConstructorUsedError;
  @JsonKey(name: 'message')
  String? get message => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $HaulerResponseCopyWith<HaulerResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $HaulerResponseCopyWith<$Res> {
  factory $HaulerResponseCopyWith(
          HaulerResponse value, $Res Function(HaulerResponse) then) =
      _$HaulerResponseCopyWithImpl<$Res>;
  $Res call(
      {@JsonKey(name: 'status') int? status,
      @JsonKey(name: 'data') List<HaulerModel>? data,
      @JsonKey(name: 'message') String? message});
}

/// @nodoc
class _$HaulerResponseCopyWithImpl<$Res>
    implements $HaulerResponseCopyWith<$Res> {
  _$HaulerResponseCopyWithImpl(this._value, this._then);

  final HaulerResponse _value;
  // ignore: unused_field
  final $Res Function(HaulerResponse) _then;

  @override
  $Res call({
    Object? status = freezed,
    Object? data = freezed,
    Object? message = freezed,
  }) {
    return _then(_value.copyWith(
      status: status == freezed
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as int?,
      data: data == freezed
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as List<HaulerModel>?,
      message: message == freezed
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
abstract class _$HaulerResponseCopyWith<$Res>
    implements $HaulerResponseCopyWith<$Res> {
  factory _$HaulerResponseCopyWith(
          _HaulerResponse value, $Res Function(_HaulerResponse) then) =
      __$HaulerResponseCopyWithImpl<$Res>;
  @override
  $Res call(
      {@JsonKey(name: 'status') int? status,
      @JsonKey(name: 'data') List<HaulerModel>? data,
      @JsonKey(name: 'message') String? message});
}

/// @nodoc
class __$HaulerResponseCopyWithImpl<$Res>
    extends _$HaulerResponseCopyWithImpl<$Res>
    implements _$HaulerResponseCopyWith<$Res> {
  __$HaulerResponseCopyWithImpl(
      _HaulerResponse _value, $Res Function(_HaulerResponse) _then)
      : super(_value, (v) => _then(v as _HaulerResponse));

  @override
  _HaulerResponse get _value => super._value as _HaulerResponse;

  @override
  $Res call({
    Object? status = freezed,
    Object? data = freezed,
    Object? message = freezed,
  }) {
    return _then(_HaulerResponse(
      status: status == freezed
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as int?,
      data: data == freezed
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as List<HaulerModel>?,
      message: message == freezed
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_HaulerResponse implements _HaulerResponse {
  _$_HaulerResponse(
      {@JsonKey(name: 'status') this.status,
      @JsonKey(name: 'data') this.data,
      @JsonKey(name: 'message') this.message});

  factory _$_HaulerResponse.fromJson(Map<String, dynamic> json) =>
      _$$_HaulerResponseFromJson(json);

  @override
  @JsonKey(name: 'status')
  final int? status;
  @override
  @JsonKey(name: 'data')
  final List<HaulerModel>? data;
  @override
  @JsonKey(name: 'message')
  final String? message;

  @override
  String toString() {
    return 'HaulerResponse(status: $status, data: $data, message: $message)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _HaulerResponse &&
            const DeepCollectionEquality().equals(other.status, status) &&
            const DeepCollectionEquality().equals(other.data, data) &&
            const DeepCollectionEquality().equals(other.message, message));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(status),
      const DeepCollectionEquality().hash(data),
      const DeepCollectionEquality().hash(message));

  @JsonKey(ignore: true)
  @override
  _$HaulerResponseCopyWith<_HaulerResponse> get copyWith =>
      __$HaulerResponseCopyWithImpl<_HaulerResponse>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_HaulerResponseToJson(this);
  }
}

abstract class _HaulerResponse implements HaulerResponse {
  factory _HaulerResponse(
      {@JsonKey(name: 'status') int? status,
      @JsonKey(name: 'data') List<HaulerModel>? data,
      @JsonKey(name: 'message') String? message}) = _$_HaulerResponse;

  factory _HaulerResponse.fromJson(Map<String, dynamic> json) =
      _$_HaulerResponse.fromJson;

  @override
  @JsonKey(name: 'status')
  int? get status;
  @override
  @JsonKey(name: 'data')
  List<HaulerModel>? get data;
  @override
  @JsonKey(name: 'message')
  String? get message;
  @override
  @JsonKey(ignore: true)
  _$HaulerResponseCopyWith<_HaulerResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

HaulerModel _$HaulerModelFromJson(Map<String, dynamic> json) {
  return _HaulerModel.fromJson(json);
}

/// @nodoc
class _$HaulerModelTearOff {
  const _$HaulerModelTearOff();

  _HaulerModel call(
      {@JsonKey(name: 'id') int? id,
      @JsonKey(name: 'name') String? name,
      @JsonKey(name: 'description') String? description,
      @JsonKey(name: 'code') String? code}) {
    return _HaulerModel(
      id: id,
      name: name,
      description: description,
      code: code,
    );
  }

  HaulerModel fromJson(Map<String, Object?> json) {
    return HaulerModel.fromJson(json);
  }
}

/// @nodoc
const $HaulerModel = _$HaulerModelTearOff();

/// @nodoc
mixin _$HaulerModel {
  @JsonKey(name: 'id')
  int? get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'name')
  String? get name => throw _privateConstructorUsedError;
  @JsonKey(name: 'description')
  String? get description => throw _privateConstructorUsedError;
  @JsonKey(name: 'code')
  String? get code => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $HaulerModelCopyWith<HaulerModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $HaulerModelCopyWith<$Res> {
  factory $HaulerModelCopyWith(
          HaulerModel value, $Res Function(HaulerModel) then) =
      _$HaulerModelCopyWithImpl<$Res>;
  $Res call(
      {@JsonKey(name: 'id') int? id,
      @JsonKey(name: 'name') String? name,
      @JsonKey(name: 'description') String? description,
      @JsonKey(name: 'code') String? code});
}

/// @nodoc
class _$HaulerModelCopyWithImpl<$Res> implements $HaulerModelCopyWith<$Res> {
  _$HaulerModelCopyWithImpl(this._value, this._then);

  final HaulerModel _value;
  // ignore: unused_field
  final $Res Function(HaulerModel) _then;

  @override
  $Res call({
    Object? id = freezed,
    Object? name = freezed,
    Object? description = freezed,
    Object? code = freezed,
  }) {
    return _then(_value.copyWith(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      description: description == freezed
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      code: code == freezed
          ? _value.code
          : code // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
abstract class _$HaulerModelCopyWith<$Res>
    implements $HaulerModelCopyWith<$Res> {
  factory _$HaulerModelCopyWith(
          _HaulerModel value, $Res Function(_HaulerModel) then) =
      __$HaulerModelCopyWithImpl<$Res>;
  @override
  $Res call(
      {@JsonKey(name: 'id') int? id,
      @JsonKey(name: 'name') String? name,
      @JsonKey(name: 'description') String? description,
      @JsonKey(name: 'code') String? code});
}

/// @nodoc
class __$HaulerModelCopyWithImpl<$Res> extends _$HaulerModelCopyWithImpl<$Res>
    implements _$HaulerModelCopyWith<$Res> {
  __$HaulerModelCopyWithImpl(
      _HaulerModel _value, $Res Function(_HaulerModel) _then)
      : super(_value, (v) => _then(v as _HaulerModel));

  @override
  _HaulerModel get _value => super._value as _HaulerModel;

  @override
  $Res call({
    Object? id = freezed,
    Object? name = freezed,
    Object? description = freezed,
    Object? code = freezed,
  }) {
    return _then(_HaulerModel(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      description: description == freezed
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      code: code == freezed
          ? _value.code
          : code // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_HaulerModel implements _HaulerModel {
  _$_HaulerModel(
      {@JsonKey(name: 'id') this.id,
      @JsonKey(name: 'name') this.name,
      @JsonKey(name: 'description') this.description,
      @JsonKey(name: 'code') this.code});

  factory _$_HaulerModel.fromJson(Map<String, dynamic> json) =>
      _$$_HaulerModelFromJson(json);

  @override
  @JsonKey(name: 'id')
  final int? id;
  @override
  @JsonKey(name: 'name')
  final String? name;
  @override
  @JsonKey(name: 'description')
  final String? description;
  @override
  @JsonKey(name: 'code')
  final String? code;

  @override
  String toString() {
    return 'HaulerModel(id: $id, name: $name, description: $description, code: $code)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _HaulerModel &&
            const DeepCollectionEquality().equals(other.id, id) &&
            const DeepCollectionEquality().equals(other.name, name) &&
            const DeepCollectionEquality()
                .equals(other.description, description) &&
            const DeepCollectionEquality().equals(other.code, code));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(id),
      const DeepCollectionEquality().hash(name),
      const DeepCollectionEquality().hash(description),
      const DeepCollectionEquality().hash(code));

  @JsonKey(ignore: true)
  @override
  _$HaulerModelCopyWith<_HaulerModel> get copyWith =>
      __$HaulerModelCopyWithImpl<_HaulerModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_HaulerModelToJson(this);
  }
}

abstract class _HaulerModel implements HaulerModel {
  factory _HaulerModel(
      {@JsonKey(name: 'id') int? id,
      @JsonKey(name: 'name') String? name,
      @JsonKey(name: 'description') String? description,
      @JsonKey(name: 'code') String? code}) = _$_HaulerModel;

  factory _HaulerModel.fromJson(Map<String, dynamic> json) =
      _$_HaulerModel.fromJson;

  @override
  @JsonKey(name: 'id')
  int? get id;
  @override
  @JsonKey(name: 'name')
  String? get name;
  @override
  @JsonKey(name: 'description')
  String? get description;
  @override
  @JsonKey(name: 'code')
  String? get code;
  @override
  @JsonKey(ignore: true)
  _$HaulerModelCopyWith<_HaulerModel> get copyWith =>
      throw _privateConstructorUsedError;
}
