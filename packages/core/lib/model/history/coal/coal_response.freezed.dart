// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'coal_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

CoalResponse _$CoalResponseFromJson(Map<String, dynamic> json) {
  return _CoalResponse.fromJson(json);
}

/// @nodoc
class _$CoalResponseTearOff {
  const _$CoalResponseTearOff();

  _CoalResponse call(
      {@JsonKey(name: 'status') int? status,
      @JsonKey(name: 'data') List<CoalModel>? data,
      @JsonKey(name: 'message') String? message}) {
    return _CoalResponse(
      status: status,
      data: data,
      message: message,
    );
  }

  CoalResponse fromJson(Map<String, Object?> json) {
    return CoalResponse.fromJson(json);
  }
}

/// @nodoc
const $CoalResponse = _$CoalResponseTearOff();

/// @nodoc
mixin _$CoalResponse {
  @JsonKey(name: 'status')
  int? get status => throw _privateConstructorUsedError;
  @JsonKey(name: 'data')
  List<CoalModel>? get data => throw _privateConstructorUsedError;
  @JsonKey(name: 'message')
  String? get message => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $CoalResponseCopyWith<CoalResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CoalResponseCopyWith<$Res> {
  factory $CoalResponseCopyWith(
          CoalResponse value, $Res Function(CoalResponse) then) =
      _$CoalResponseCopyWithImpl<$Res>;
  $Res call(
      {@JsonKey(name: 'status') int? status,
      @JsonKey(name: 'data') List<CoalModel>? data,
      @JsonKey(name: 'message') String? message});
}

/// @nodoc
class _$CoalResponseCopyWithImpl<$Res> implements $CoalResponseCopyWith<$Res> {
  _$CoalResponseCopyWithImpl(this._value, this._then);

  final CoalResponse _value;
  // ignore: unused_field
  final $Res Function(CoalResponse) _then;

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
              as List<CoalModel>?,
      message: message == freezed
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
abstract class _$CoalResponseCopyWith<$Res>
    implements $CoalResponseCopyWith<$Res> {
  factory _$CoalResponseCopyWith(
          _CoalResponse value, $Res Function(_CoalResponse) then) =
      __$CoalResponseCopyWithImpl<$Res>;
  @override
  $Res call(
      {@JsonKey(name: 'status') int? status,
      @JsonKey(name: 'data') List<CoalModel>? data,
      @JsonKey(name: 'message') String? message});
}

/// @nodoc
class __$CoalResponseCopyWithImpl<$Res> extends _$CoalResponseCopyWithImpl<$Res>
    implements _$CoalResponseCopyWith<$Res> {
  __$CoalResponseCopyWithImpl(
      _CoalResponse _value, $Res Function(_CoalResponse) _then)
      : super(_value, (v) => _then(v as _CoalResponse));

  @override
  _CoalResponse get _value => super._value as _CoalResponse;

  @override
  $Res call({
    Object? status = freezed,
    Object? data = freezed,
    Object? message = freezed,
  }) {
    return _then(_CoalResponse(
      status: status == freezed
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as int?,
      data: data == freezed
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as List<CoalModel>?,
      message: message == freezed
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_CoalResponse implements _CoalResponse {
  _$_CoalResponse(
      {@JsonKey(name: 'status') this.status,
      @JsonKey(name: 'data') this.data,
      @JsonKey(name: 'message') this.message});

  factory _$_CoalResponse.fromJson(Map<String, dynamic> json) =>
      _$$_CoalResponseFromJson(json);

  @override
  @JsonKey(name: 'status')
  final int? status;
  @override
  @JsonKey(name: 'data')
  final List<CoalModel>? data;
  @override
  @JsonKey(name: 'message')
  final String? message;

  @override
  String toString() {
    return 'CoalResponse(status: $status, data: $data, message: $message)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _CoalResponse &&
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
  _$CoalResponseCopyWith<_CoalResponse> get copyWith =>
      __$CoalResponseCopyWithImpl<_CoalResponse>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_CoalResponseToJson(this);
  }
}

abstract class _CoalResponse implements CoalResponse {
  factory _CoalResponse(
      {@JsonKey(name: 'status') int? status,
      @JsonKey(name: 'data') List<CoalModel>? data,
      @JsonKey(name: 'message') String? message}) = _$_CoalResponse;

  factory _CoalResponse.fromJson(Map<String, dynamic> json) =
      _$_CoalResponse.fromJson;

  @override
  @JsonKey(name: 'status')
  int? get status;
  @override
  @JsonKey(name: 'data')
  List<CoalModel>? get data;
  @override
  @JsonKey(name: 'message')
  String? get message;
  @override
  @JsonKey(ignore: true)
  _$CoalResponseCopyWith<_CoalResponse> get copyWith =>
      throw _privateConstructorUsedError;
}
