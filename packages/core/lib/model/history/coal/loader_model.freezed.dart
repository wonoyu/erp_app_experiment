// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'loader_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

LoaderResponse _$LoaderResponseFromJson(Map<String, dynamic> json) {
  return _LoaderResponse.fromJson(json);
}

/// @nodoc
class _$LoaderResponseTearOff {
  const _$LoaderResponseTearOff();

  _LoaderResponse call(
      {@JsonKey(name: 'status') int? status,
      @JsonKey(name: 'data') List<LoaderModel>? data,
      @JsonKey(name: 'message') String? message}) {
    return _LoaderResponse(
      status: status,
      data: data,
      message: message,
    );
  }

  LoaderResponse fromJson(Map<String, Object?> json) {
    return LoaderResponse.fromJson(json);
  }
}

/// @nodoc
const $LoaderResponse = _$LoaderResponseTearOff();

/// @nodoc
mixin _$LoaderResponse {
  @JsonKey(name: 'status')
  int? get status => throw _privateConstructorUsedError;
  @JsonKey(name: 'data')
  List<LoaderModel>? get data => throw _privateConstructorUsedError;
  @JsonKey(name: 'message')
  String? get message => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $LoaderResponseCopyWith<LoaderResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LoaderResponseCopyWith<$Res> {
  factory $LoaderResponseCopyWith(
          LoaderResponse value, $Res Function(LoaderResponse) then) =
      _$LoaderResponseCopyWithImpl<$Res>;
  $Res call(
      {@JsonKey(name: 'status') int? status,
      @JsonKey(name: 'data') List<LoaderModel>? data,
      @JsonKey(name: 'message') String? message});
}

/// @nodoc
class _$LoaderResponseCopyWithImpl<$Res>
    implements $LoaderResponseCopyWith<$Res> {
  _$LoaderResponseCopyWithImpl(this._value, this._then);

  final LoaderResponse _value;
  // ignore: unused_field
  final $Res Function(LoaderResponse) _then;

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
              as List<LoaderModel>?,
      message: message == freezed
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
abstract class _$LoaderResponseCopyWith<$Res>
    implements $LoaderResponseCopyWith<$Res> {
  factory _$LoaderResponseCopyWith(
          _LoaderResponse value, $Res Function(_LoaderResponse) then) =
      __$LoaderResponseCopyWithImpl<$Res>;
  @override
  $Res call(
      {@JsonKey(name: 'status') int? status,
      @JsonKey(name: 'data') List<LoaderModel>? data,
      @JsonKey(name: 'message') String? message});
}

/// @nodoc
class __$LoaderResponseCopyWithImpl<$Res>
    extends _$LoaderResponseCopyWithImpl<$Res>
    implements _$LoaderResponseCopyWith<$Res> {
  __$LoaderResponseCopyWithImpl(
      _LoaderResponse _value, $Res Function(_LoaderResponse) _then)
      : super(_value, (v) => _then(v as _LoaderResponse));

  @override
  _LoaderResponse get _value => super._value as _LoaderResponse;

  @override
  $Res call({
    Object? status = freezed,
    Object? data = freezed,
    Object? message = freezed,
  }) {
    return _then(_LoaderResponse(
      status: status == freezed
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as int?,
      data: data == freezed
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as List<LoaderModel>?,
      message: message == freezed
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_LoaderResponse implements _LoaderResponse {
  _$_LoaderResponse(
      {@JsonKey(name: 'status') this.status,
      @JsonKey(name: 'data') this.data,
      @JsonKey(name: 'message') this.message});

  factory _$_LoaderResponse.fromJson(Map<String, dynamic> json) =>
      _$$_LoaderResponseFromJson(json);

  @override
  @JsonKey(name: 'status')
  final int? status;
  @override
  @JsonKey(name: 'data')
  final List<LoaderModel>? data;
  @override
  @JsonKey(name: 'message')
  final String? message;

  @override
  String toString() {
    return 'LoaderResponse(status: $status, data: $data, message: $message)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _LoaderResponse &&
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
  _$LoaderResponseCopyWith<_LoaderResponse> get copyWith =>
      __$LoaderResponseCopyWithImpl<_LoaderResponse>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_LoaderResponseToJson(this);
  }
}

abstract class _LoaderResponse implements LoaderResponse {
  factory _LoaderResponse(
      {@JsonKey(name: 'status') int? status,
      @JsonKey(name: 'data') List<LoaderModel>? data,
      @JsonKey(name: 'message') String? message}) = _$_LoaderResponse;

  factory _LoaderResponse.fromJson(Map<String, dynamic> json) =
      _$_LoaderResponse.fromJson;

  @override
  @JsonKey(name: 'status')
  int? get status;
  @override
  @JsonKey(name: 'data')
  List<LoaderModel>? get data;
  @override
  @JsonKey(name: 'message')
  String? get message;
  @override
  @JsonKey(ignore: true)
  _$LoaderResponseCopyWith<_LoaderResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

LoaderModel _$LoaderModelFromJson(Map<String, dynamic> json) {
  return _LoaderModel.fromJson(json);
}

/// @nodoc
class _$LoaderModelTearOff {
  const _$LoaderModelTearOff();

  _LoaderModel call(
      {@JsonKey(name: 'id') int? id,
      @JsonKey(name: 'name') String? name,
      @JsonKey(name: 'description') String? description}) {
    return _LoaderModel(
      id: id,
      name: name,
      description: description,
    );
  }

  LoaderModel fromJson(Map<String, Object?> json) {
    return LoaderModel.fromJson(json);
  }
}

/// @nodoc
const $LoaderModel = _$LoaderModelTearOff();

/// @nodoc
mixin _$LoaderModel {
  @JsonKey(name: 'id')
  int? get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'name')
  String? get name => throw _privateConstructorUsedError;
  @JsonKey(name: 'description')
  String? get description => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $LoaderModelCopyWith<LoaderModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LoaderModelCopyWith<$Res> {
  factory $LoaderModelCopyWith(
          LoaderModel value, $Res Function(LoaderModel) then) =
      _$LoaderModelCopyWithImpl<$Res>;
  $Res call(
      {@JsonKey(name: 'id') int? id,
      @JsonKey(name: 'name') String? name,
      @JsonKey(name: 'description') String? description});
}

/// @nodoc
class _$LoaderModelCopyWithImpl<$Res> implements $LoaderModelCopyWith<$Res> {
  _$LoaderModelCopyWithImpl(this._value, this._then);

  final LoaderModel _value;
  // ignore: unused_field
  final $Res Function(LoaderModel) _then;

  @override
  $Res call({
    Object? id = freezed,
    Object? name = freezed,
    Object? description = freezed,
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
    ));
  }
}

/// @nodoc
abstract class _$LoaderModelCopyWith<$Res>
    implements $LoaderModelCopyWith<$Res> {
  factory _$LoaderModelCopyWith(
          _LoaderModel value, $Res Function(_LoaderModel) then) =
      __$LoaderModelCopyWithImpl<$Res>;
  @override
  $Res call(
      {@JsonKey(name: 'id') int? id,
      @JsonKey(name: 'name') String? name,
      @JsonKey(name: 'description') String? description});
}

/// @nodoc
class __$LoaderModelCopyWithImpl<$Res> extends _$LoaderModelCopyWithImpl<$Res>
    implements _$LoaderModelCopyWith<$Res> {
  __$LoaderModelCopyWithImpl(
      _LoaderModel _value, $Res Function(_LoaderModel) _then)
      : super(_value, (v) => _then(v as _LoaderModel));

  @override
  _LoaderModel get _value => super._value as _LoaderModel;

  @override
  $Res call({
    Object? id = freezed,
    Object? name = freezed,
    Object? description = freezed,
  }) {
    return _then(_LoaderModel(
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
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_LoaderModel implements _LoaderModel {
  _$_LoaderModel(
      {@JsonKey(name: 'id') this.id,
      @JsonKey(name: 'name') this.name,
      @JsonKey(name: 'description') this.description});

  factory _$_LoaderModel.fromJson(Map<String, dynamic> json) =>
      _$$_LoaderModelFromJson(json);

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
  String toString() {
    return 'LoaderModel(id: $id, name: $name, description: $description)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _LoaderModel &&
            const DeepCollectionEquality().equals(other.id, id) &&
            const DeepCollectionEquality().equals(other.name, name) &&
            const DeepCollectionEquality()
                .equals(other.description, description));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(id),
      const DeepCollectionEquality().hash(name),
      const DeepCollectionEquality().hash(description));

  @JsonKey(ignore: true)
  @override
  _$LoaderModelCopyWith<_LoaderModel> get copyWith =>
      __$LoaderModelCopyWithImpl<_LoaderModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_LoaderModelToJson(this);
  }
}

abstract class _LoaderModel implements LoaderModel {
  factory _LoaderModel(
      {@JsonKey(name: 'id') int? id,
      @JsonKey(name: 'name') String? name,
      @JsonKey(name: 'description') String? description}) = _$_LoaderModel;

  factory _LoaderModel.fromJson(Map<String, dynamic> json) =
      _$_LoaderModel.fromJson;

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
  @JsonKey(ignore: true)
  _$LoaderModelCopyWith<_LoaderModel> get copyWith =>
      throw _privateConstructorUsedError;
}
