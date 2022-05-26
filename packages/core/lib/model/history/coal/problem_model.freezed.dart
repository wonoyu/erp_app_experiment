// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'problem_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

ProblemResponse _$ProblemResponseFromJson(Map<String, dynamic> json) {
  return _ProblemResponse.fromJson(json);
}

/// @nodoc
class _$ProblemResponseTearOff {
  const _$ProblemResponseTearOff();

  _ProblemResponse call(
      {@JsonKey(name: 'status') int? status,
      @JsonKey(name: 'data') List<ProblemModel>? data,
      @JsonKey(name: 'message') String? message}) {
    return _ProblemResponse(
      status: status,
      data: data,
      message: message,
    );
  }

  ProblemResponse fromJson(Map<String, Object?> json) {
    return ProblemResponse.fromJson(json);
  }
}

/// @nodoc
const $ProblemResponse = _$ProblemResponseTearOff();

/// @nodoc
mixin _$ProblemResponse {
  @JsonKey(name: 'status')
  int? get status => throw _privateConstructorUsedError;
  @JsonKey(name: 'data')
  List<ProblemModel>? get data => throw _privateConstructorUsedError;
  @JsonKey(name: 'message')
  String? get message => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ProblemResponseCopyWith<ProblemResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ProblemResponseCopyWith<$Res> {
  factory $ProblemResponseCopyWith(
          ProblemResponse value, $Res Function(ProblemResponse) then) =
      _$ProblemResponseCopyWithImpl<$Res>;
  $Res call(
      {@JsonKey(name: 'status') int? status,
      @JsonKey(name: 'data') List<ProblemModel>? data,
      @JsonKey(name: 'message') String? message});
}

/// @nodoc
class _$ProblemResponseCopyWithImpl<$Res>
    implements $ProblemResponseCopyWith<$Res> {
  _$ProblemResponseCopyWithImpl(this._value, this._then);

  final ProblemResponse _value;
  // ignore: unused_field
  final $Res Function(ProblemResponse) _then;

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
              as List<ProblemModel>?,
      message: message == freezed
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
abstract class _$ProblemResponseCopyWith<$Res>
    implements $ProblemResponseCopyWith<$Res> {
  factory _$ProblemResponseCopyWith(
          _ProblemResponse value, $Res Function(_ProblemResponse) then) =
      __$ProblemResponseCopyWithImpl<$Res>;
  @override
  $Res call(
      {@JsonKey(name: 'status') int? status,
      @JsonKey(name: 'data') List<ProblemModel>? data,
      @JsonKey(name: 'message') String? message});
}

/// @nodoc
class __$ProblemResponseCopyWithImpl<$Res>
    extends _$ProblemResponseCopyWithImpl<$Res>
    implements _$ProblemResponseCopyWith<$Res> {
  __$ProblemResponseCopyWithImpl(
      _ProblemResponse _value, $Res Function(_ProblemResponse) _then)
      : super(_value, (v) => _then(v as _ProblemResponse));

  @override
  _ProblemResponse get _value => super._value as _ProblemResponse;

  @override
  $Res call({
    Object? status = freezed,
    Object? data = freezed,
    Object? message = freezed,
  }) {
    return _then(_ProblemResponse(
      status: status == freezed
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as int?,
      data: data == freezed
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as List<ProblemModel>?,
      message: message == freezed
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_ProblemResponse implements _ProblemResponse {
  _$_ProblemResponse(
      {@JsonKey(name: 'status') this.status,
      @JsonKey(name: 'data') this.data,
      @JsonKey(name: 'message') this.message});

  factory _$_ProblemResponse.fromJson(Map<String, dynamic> json) =>
      _$$_ProblemResponseFromJson(json);

  @override
  @JsonKey(name: 'status')
  final int? status;
  @override
  @JsonKey(name: 'data')
  final List<ProblemModel>? data;
  @override
  @JsonKey(name: 'message')
  final String? message;

  @override
  String toString() {
    return 'ProblemResponse(status: $status, data: $data, message: $message)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _ProblemResponse &&
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
  _$ProblemResponseCopyWith<_ProblemResponse> get copyWith =>
      __$ProblemResponseCopyWithImpl<_ProblemResponse>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_ProblemResponseToJson(this);
  }
}

abstract class _ProblemResponse implements ProblemResponse {
  factory _ProblemResponse(
      {@JsonKey(name: 'status') int? status,
      @JsonKey(name: 'data') List<ProblemModel>? data,
      @JsonKey(name: 'message') String? message}) = _$_ProblemResponse;

  factory _ProblemResponse.fromJson(Map<String, dynamic> json) =
      _$_ProblemResponse.fromJson;

  @override
  @JsonKey(name: 'status')
  int? get status;
  @override
  @JsonKey(name: 'data')
  List<ProblemModel>? get data;
  @override
  @JsonKey(name: 'message')
  String? get message;
  @override
  @JsonKey(ignore: true)
  _$ProblemResponseCopyWith<_ProblemResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

ProblemModel _$ProblemModelFromJson(Map<String, dynamic> json) {
  return _ProblemModel.fromJson(json);
}

/// @nodoc
class _$ProblemModelTearOff {
  const _$ProblemModelTearOff();

  _ProblemModel call(
      {@JsonKey(name: 'id') int? id, @JsonKey(name: 'name') String? name}) {
    return _ProblemModel(
      id: id,
      name: name,
    );
  }

  ProblemModel fromJson(Map<String, Object?> json) {
    return ProblemModel.fromJson(json);
  }
}

/// @nodoc
const $ProblemModel = _$ProblemModelTearOff();

/// @nodoc
mixin _$ProblemModel {
  @JsonKey(name: 'id')
  int? get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'name')
  String? get name => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ProblemModelCopyWith<ProblemModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ProblemModelCopyWith<$Res> {
  factory $ProblemModelCopyWith(
          ProblemModel value, $Res Function(ProblemModel) then) =
      _$ProblemModelCopyWithImpl<$Res>;
  $Res call(
      {@JsonKey(name: 'id') int? id, @JsonKey(name: 'name') String? name});
}

/// @nodoc
class _$ProblemModelCopyWithImpl<$Res> implements $ProblemModelCopyWith<$Res> {
  _$ProblemModelCopyWithImpl(this._value, this._then);

  final ProblemModel _value;
  // ignore: unused_field
  final $Res Function(ProblemModel) _then;

  @override
  $Res call({
    Object? id = freezed,
    Object? name = freezed,
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
    ));
  }
}

/// @nodoc
abstract class _$ProblemModelCopyWith<$Res>
    implements $ProblemModelCopyWith<$Res> {
  factory _$ProblemModelCopyWith(
          _ProblemModel value, $Res Function(_ProblemModel) then) =
      __$ProblemModelCopyWithImpl<$Res>;
  @override
  $Res call(
      {@JsonKey(name: 'id') int? id, @JsonKey(name: 'name') String? name});
}

/// @nodoc
class __$ProblemModelCopyWithImpl<$Res> extends _$ProblemModelCopyWithImpl<$Res>
    implements _$ProblemModelCopyWith<$Res> {
  __$ProblemModelCopyWithImpl(
      _ProblemModel _value, $Res Function(_ProblemModel) _then)
      : super(_value, (v) => _then(v as _ProblemModel));

  @override
  _ProblemModel get _value => super._value as _ProblemModel;

  @override
  $Res call({
    Object? id = freezed,
    Object? name = freezed,
  }) {
    return _then(_ProblemModel(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_ProblemModel implements _ProblemModel {
  _$_ProblemModel(
      {@JsonKey(name: 'id') this.id, @JsonKey(name: 'name') this.name});

  factory _$_ProblemModel.fromJson(Map<String, dynamic> json) =>
      _$$_ProblemModelFromJson(json);

  @override
  @JsonKey(name: 'id')
  final int? id;
  @override
  @JsonKey(name: 'name')
  final String? name;

  @override
  String toString() {
    return 'ProblemModel(id: $id, name: $name)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _ProblemModel &&
            const DeepCollectionEquality().equals(other.id, id) &&
            const DeepCollectionEquality().equals(other.name, name));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(id),
      const DeepCollectionEquality().hash(name));

  @JsonKey(ignore: true)
  @override
  _$ProblemModelCopyWith<_ProblemModel> get copyWith =>
      __$ProblemModelCopyWithImpl<_ProblemModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_ProblemModelToJson(this);
  }
}

abstract class _ProblemModel implements ProblemModel {
  factory _ProblemModel(
      {@JsonKey(name: 'id') int? id,
      @JsonKey(name: 'name') String? name}) = _$_ProblemModel;

  factory _ProblemModel.fromJson(Map<String, dynamic> json) =
      _$_ProblemModel.fromJson;

  @override
  @JsonKey(name: 'id')
  int? get id;
  @override
  @JsonKey(name: 'name')
  String? get name;
  @override
  @JsonKey(ignore: true)
  _$ProblemModelCopyWith<_ProblemModel> get copyWith =>
      throw _privateConstructorUsedError;
}
