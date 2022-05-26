// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'plan_prod_activity_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

PlanProdResponse _$PlanProdResponseFromJson(Map<String, dynamic> json) {
  return _PlanProdResponse.fromJson(json);
}

/// @nodoc
class _$PlanProdResponseTearOff {
  const _$PlanProdResponseTearOff();

  _PlanProdResponse call(
      {@JsonKey(name: 'status') int? status,
      @JsonKey(name: 'data') List<PlanProdModel>? data,
      @JsonKey(name: 'message') String? message}) {
    return _PlanProdResponse(
      status: status,
      data: data,
      message: message,
    );
  }

  PlanProdResponse fromJson(Map<String, Object?> json) {
    return PlanProdResponse.fromJson(json);
  }
}

/// @nodoc
const $PlanProdResponse = _$PlanProdResponseTearOff();

/// @nodoc
mixin _$PlanProdResponse {
  @JsonKey(name: 'status')
  int? get status => throw _privateConstructorUsedError;
  @JsonKey(name: 'data')
  List<PlanProdModel>? get data => throw _privateConstructorUsedError;
  @JsonKey(name: 'message')
  String? get message => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $PlanProdResponseCopyWith<PlanProdResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PlanProdResponseCopyWith<$Res> {
  factory $PlanProdResponseCopyWith(
          PlanProdResponse value, $Res Function(PlanProdResponse) then) =
      _$PlanProdResponseCopyWithImpl<$Res>;
  $Res call(
      {@JsonKey(name: 'status') int? status,
      @JsonKey(name: 'data') List<PlanProdModel>? data,
      @JsonKey(name: 'message') String? message});
}

/// @nodoc
class _$PlanProdResponseCopyWithImpl<$Res>
    implements $PlanProdResponseCopyWith<$Res> {
  _$PlanProdResponseCopyWithImpl(this._value, this._then);

  final PlanProdResponse _value;
  // ignore: unused_field
  final $Res Function(PlanProdResponse) _then;

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
              as List<PlanProdModel>?,
      message: message == freezed
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
abstract class _$PlanProdResponseCopyWith<$Res>
    implements $PlanProdResponseCopyWith<$Res> {
  factory _$PlanProdResponseCopyWith(
          _PlanProdResponse value, $Res Function(_PlanProdResponse) then) =
      __$PlanProdResponseCopyWithImpl<$Res>;
  @override
  $Res call(
      {@JsonKey(name: 'status') int? status,
      @JsonKey(name: 'data') List<PlanProdModel>? data,
      @JsonKey(name: 'message') String? message});
}

/// @nodoc
class __$PlanProdResponseCopyWithImpl<$Res>
    extends _$PlanProdResponseCopyWithImpl<$Res>
    implements _$PlanProdResponseCopyWith<$Res> {
  __$PlanProdResponseCopyWithImpl(
      _PlanProdResponse _value, $Res Function(_PlanProdResponse) _then)
      : super(_value, (v) => _then(v as _PlanProdResponse));

  @override
  _PlanProdResponse get _value => super._value as _PlanProdResponse;

  @override
  $Res call({
    Object? status = freezed,
    Object? data = freezed,
    Object? message = freezed,
  }) {
    return _then(_PlanProdResponse(
      status: status == freezed
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as int?,
      data: data == freezed
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as List<PlanProdModel>?,
      message: message == freezed
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_PlanProdResponse implements _PlanProdResponse {
  _$_PlanProdResponse(
      {@JsonKey(name: 'status') this.status,
      @JsonKey(name: 'data') this.data,
      @JsonKey(name: 'message') this.message});

  factory _$_PlanProdResponse.fromJson(Map<String, dynamic> json) =>
      _$$_PlanProdResponseFromJson(json);

  @override
  @JsonKey(name: 'status')
  final int? status;
  @override
  @JsonKey(name: 'data')
  final List<PlanProdModel>? data;
  @override
  @JsonKey(name: 'message')
  final String? message;

  @override
  String toString() {
    return 'PlanProdResponse(status: $status, data: $data, message: $message)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _PlanProdResponse &&
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
  _$PlanProdResponseCopyWith<_PlanProdResponse> get copyWith =>
      __$PlanProdResponseCopyWithImpl<_PlanProdResponse>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_PlanProdResponseToJson(this);
  }
}

abstract class _PlanProdResponse implements PlanProdResponse {
  factory _PlanProdResponse(
      {@JsonKey(name: 'status') int? status,
      @JsonKey(name: 'data') List<PlanProdModel>? data,
      @JsonKey(name: 'message') String? message}) = _$_PlanProdResponse;

  factory _PlanProdResponse.fromJson(Map<String, dynamic> json) =
      _$_PlanProdResponse.fromJson;

  @override
  @JsonKey(name: 'status')
  int? get status;
  @override
  @JsonKey(name: 'data')
  List<PlanProdModel>? get data;
  @override
  @JsonKey(name: 'message')
  String? get message;
  @override
  @JsonKey(ignore: true)
  _$PlanProdResponseCopyWith<_PlanProdResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

PlanProdModel _$PlanProdModelFromJson(Map<String, dynamic> json) {
  return _PlanProdModel.fromJson(json);
}

/// @nodoc
class _$PlanProdModelTearOff {
  const _$PlanProdModelTearOff();

  _PlanProdModel call(
      {@JsonKey(name: 'id')
          int? id,
      @JsonKey(name: 'name')
          String? name,
      @JsonKey(name: 'created_at')
          String? createdAt,
      @JsonKey(name: 'plan_prod_activity_group_id')
          int? planProdActivityGroupId,
      @JsonKey(name: 'code')
          String? code}) {
    return _PlanProdModel(
      id: id,
      name: name,
      createdAt: createdAt,
      planProdActivityGroupId: planProdActivityGroupId,
      code: code,
    );
  }

  PlanProdModel fromJson(Map<String, Object?> json) {
    return PlanProdModel.fromJson(json);
  }
}

/// @nodoc
const $PlanProdModel = _$PlanProdModelTearOff();

/// @nodoc
mixin _$PlanProdModel {
  @JsonKey(name: 'id')
  int? get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'name')
  String? get name => throw _privateConstructorUsedError;
  @JsonKey(name: 'created_at')
  String? get createdAt => throw _privateConstructorUsedError;
  @JsonKey(name: 'plan_prod_activity_group_id')
  int? get planProdActivityGroupId => throw _privateConstructorUsedError;
  @JsonKey(name: 'code')
  String? get code => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $PlanProdModelCopyWith<PlanProdModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PlanProdModelCopyWith<$Res> {
  factory $PlanProdModelCopyWith(
          PlanProdModel value, $Res Function(PlanProdModel) then) =
      _$PlanProdModelCopyWithImpl<$Res>;
  $Res call(
      {@JsonKey(name: 'id')
          int? id,
      @JsonKey(name: 'name')
          String? name,
      @JsonKey(name: 'created_at')
          String? createdAt,
      @JsonKey(name: 'plan_prod_activity_group_id')
          int? planProdActivityGroupId,
      @JsonKey(name: 'code')
          String? code});
}

/// @nodoc
class _$PlanProdModelCopyWithImpl<$Res>
    implements $PlanProdModelCopyWith<$Res> {
  _$PlanProdModelCopyWithImpl(this._value, this._then);

  final PlanProdModel _value;
  // ignore: unused_field
  final $Res Function(PlanProdModel) _then;

  @override
  $Res call({
    Object? id = freezed,
    Object? name = freezed,
    Object? createdAt = freezed,
    Object? planProdActivityGroupId = freezed,
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
      createdAt: createdAt == freezed
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as String?,
      planProdActivityGroupId: planProdActivityGroupId == freezed
          ? _value.planProdActivityGroupId
          : planProdActivityGroupId // ignore: cast_nullable_to_non_nullable
              as int?,
      code: code == freezed
          ? _value.code
          : code // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
abstract class _$PlanProdModelCopyWith<$Res>
    implements $PlanProdModelCopyWith<$Res> {
  factory _$PlanProdModelCopyWith(
          _PlanProdModel value, $Res Function(_PlanProdModel) then) =
      __$PlanProdModelCopyWithImpl<$Res>;
  @override
  $Res call(
      {@JsonKey(name: 'id')
          int? id,
      @JsonKey(name: 'name')
          String? name,
      @JsonKey(name: 'created_at')
          String? createdAt,
      @JsonKey(name: 'plan_prod_activity_group_id')
          int? planProdActivityGroupId,
      @JsonKey(name: 'code')
          String? code});
}

/// @nodoc
class __$PlanProdModelCopyWithImpl<$Res>
    extends _$PlanProdModelCopyWithImpl<$Res>
    implements _$PlanProdModelCopyWith<$Res> {
  __$PlanProdModelCopyWithImpl(
      _PlanProdModel _value, $Res Function(_PlanProdModel) _then)
      : super(_value, (v) => _then(v as _PlanProdModel));

  @override
  _PlanProdModel get _value => super._value as _PlanProdModel;

  @override
  $Res call({
    Object? id = freezed,
    Object? name = freezed,
    Object? createdAt = freezed,
    Object? planProdActivityGroupId = freezed,
    Object? code = freezed,
  }) {
    return _then(_PlanProdModel(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      createdAt: createdAt == freezed
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as String?,
      planProdActivityGroupId: planProdActivityGroupId == freezed
          ? _value.planProdActivityGroupId
          : planProdActivityGroupId // ignore: cast_nullable_to_non_nullable
              as int?,
      code: code == freezed
          ? _value.code
          : code // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_PlanProdModel implements _PlanProdModel {
  _$_PlanProdModel(
      {@JsonKey(name: 'id')
          this.id,
      @JsonKey(name: 'name')
          this.name,
      @JsonKey(name: 'created_at')
          this.createdAt,
      @JsonKey(name: 'plan_prod_activity_group_id')
          this.planProdActivityGroupId,
      @JsonKey(name: 'code')
          this.code});

  factory _$_PlanProdModel.fromJson(Map<String, dynamic> json) =>
      _$$_PlanProdModelFromJson(json);

  @override
  @JsonKey(name: 'id')
  final int? id;
  @override
  @JsonKey(name: 'name')
  final String? name;
  @override
  @JsonKey(name: 'created_at')
  final String? createdAt;
  @override
  @JsonKey(name: 'plan_prod_activity_group_id')
  final int? planProdActivityGroupId;
  @override
  @JsonKey(name: 'code')
  final String? code;

  @override
  String toString() {
    return 'PlanProdModel(id: $id, name: $name, createdAt: $createdAt, planProdActivityGroupId: $planProdActivityGroupId, code: $code)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _PlanProdModel &&
            const DeepCollectionEquality().equals(other.id, id) &&
            const DeepCollectionEquality().equals(other.name, name) &&
            const DeepCollectionEquality().equals(other.createdAt, createdAt) &&
            const DeepCollectionEquality().equals(
                other.planProdActivityGroupId, planProdActivityGroupId) &&
            const DeepCollectionEquality().equals(other.code, code));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(id),
      const DeepCollectionEquality().hash(name),
      const DeepCollectionEquality().hash(createdAt),
      const DeepCollectionEquality().hash(planProdActivityGroupId),
      const DeepCollectionEquality().hash(code));

  @JsonKey(ignore: true)
  @override
  _$PlanProdModelCopyWith<_PlanProdModel> get copyWith =>
      __$PlanProdModelCopyWithImpl<_PlanProdModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_PlanProdModelToJson(this);
  }
}

abstract class _PlanProdModel implements PlanProdModel {
  factory _PlanProdModel(
      {@JsonKey(name: 'id')
          int? id,
      @JsonKey(name: 'name')
          String? name,
      @JsonKey(name: 'created_at')
          String? createdAt,
      @JsonKey(name: 'plan_prod_activity_group_id')
          int? planProdActivityGroupId,
      @JsonKey(name: 'code')
          String? code}) = _$_PlanProdModel;

  factory _PlanProdModel.fromJson(Map<String, dynamic> json) =
      _$_PlanProdModel.fromJson;

  @override
  @JsonKey(name: 'id')
  int? get id;
  @override
  @JsonKey(name: 'name')
  String? get name;
  @override
  @JsonKey(name: 'created_at')
  String? get createdAt;
  @override
  @JsonKey(name: 'plan_prod_activity_group_id')
  int? get planProdActivityGroupId;
  @override
  @JsonKey(name: 'code')
  String? get code;
  @override
  @JsonKey(ignore: true)
  _$PlanProdModelCopyWith<_PlanProdModel> get copyWith =>
      throw _privateConstructorUsedError;
}
