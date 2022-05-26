// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'coal_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$CoalStateTearOff {
  const _$CoalStateTearOff();

  _Data data(List<CoalModel> coal) {
    return _Data(
      coal,
    );
  }

  _DataLoading dataLoading(List<CoalModel> coal) {
    return _DataLoading(
      coal,
    );
  }

  _Error error(String error) {
    return _Error(
      error,
    );
  }
}

/// @nodoc
const $CoalState = _$CoalStateTearOff();

/// @nodoc
mixin _$CoalState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(List<CoalModel> coal) data,
    required TResult Function(List<CoalModel> coal) dataLoading,
    required TResult Function(String error) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(List<CoalModel> coal)? data,
    TResult Function(List<CoalModel> coal)? dataLoading,
    TResult Function(String error)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(List<CoalModel> coal)? data,
    TResult Function(List<CoalModel> coal)? dataLoading,
    TResult Function(String error)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Data value) data,
    required TResult Function(_DataLoading value) dataLoading,
    required TResult Function(_Error value) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_Data value)? data,
    TResult Function(_DataLoading value)? dataLoading,
    TResult Function(_Error value)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Data value)? data,
    TResult Function(_DataLoading value)? dataLoading,
    TResult Function(_Error value)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CoalStateCopyWith<$Res> {
  factory $CoalStateCopyWith(CoalState value, $Res Function(CoalState) then) =
      _$CoalStateCopyWithImpl<$Res>;
}

/// @nodoc
class _$CoalStateCopyWithImpl<$Res> implements $CoalStateCopyWith<$Res> {
  _$CoalStateCopyWithImpl(this._value, this._then);

  final CoalState _value;
  // ignore: unused_field
  final $Res Function(CoalState) _then;
}

/// @nodoc
abstract class _$DataCopyWith<$Res> {
  factory _$DataCopyWith(_Data value, $Res Function(_Data) then) =
      __$DataCopyWithImpl<$Res>;
  $Res call({List<CoalModel> coal});
}

/// @nodoc
class __$DataCopyWithImpl<$Res> extends _$CoalStateCopyWithImpl<$Res>
    implements _$DataCopyWith<$Res> {
  __$DataCopyWithImpl(_Data _value, $Res Function(_Data) _then)
      : super(_value, (v) => _then(v as _Data));

  @override
  _Data get _value => super._value as _Data;

  @override
  $Res call({
    Object? coal = freezed,
  }) {
    return _then(_Data(
      coal == freezed
          ? _value.coal
          : coal // ignore: cast_nullable_to_non_nullable
              as List<CoalModel>,
    ));
  }
}

/// @nodoc

class _$_Data implements _Data {
  const _$_Data(this.coal);

  @override
  final List<CoalModel> coal;

  @override
  String toString() {
    return 'CoalState.data(coal: $coal)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _Data &&
            const DeepCollectionEquality().equals(other.coal, coal));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(coal));

  @JsonKey(ignore: true)
  @override
  _$DataCopyWith<_Data> get copyWith =>
      __$DataCopyWithImpl<_Data>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(List<CoalModel> coal) data,
    required TResult Function(List<CoalModel> coal) dataLoading,
    required TResult Function(String error) error,
  }) {
    return data(coal);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(List<CoalModel> coal)? data,
    TResult Function(List<CoalModel> coal)? dataLoading,
    TResult Function(String error)? error,
  }) {
    return data?.call(coal);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(List<CoalModel> coal)? data,
    TResult Function(List<CoalModel> coal)? dataLoading,
    TResult Function(String error)? error,
    required TResult orElse(),
  }) {
    if (data != null) {
      return data(coal);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Data value) data,
    required TResult Function(_DataLoading value) dataLoading,
    required TResult Function(_Error value) error,
  }) {
    return data(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_Data value)? data,
    TResult Function(_DataLoading value)? dataLoading,
    TResult Function(_Error value)? error,
  }) {
    return data?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Data value)? data,
    TResult Function(_DataLoading value)? dataLoading,
    TResult Function(_Error value)? error,
    required TResult orElse(),
  }) {
    if (data != null) {
      return data(this);
    }
    return orElse();
  }
}

abstract class _Data implements CoalState {
  const factory _Data(List<CoalModel> coal) = _$_Data;

  List<CoalModel> get coal;
  @JsonKey(ignore: true)
  _$DataCopyWith<_Data> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$DataLoadingCopyWith<$Res> {
  factory _$DataLoadingCopyWith(
          _DataLoading value, $Res Function(_DataLoading) then) =
      __$DataLoadingCopyWithImpl<$Res>;
  $Res call({List<CoalModel> coal});
}

/// @nodoc
class __$DataLoadingCopyWithImpl<$Res> extends _$CoalStateCopyWithImpl<$Res>
    implements _$DataLoadingCopyWith<$Res> {
  __$DataLoadingCopyWithImpl(
      _DataLoading _value, $Res Function(_DataLoading) _then)
      : super(_value, (v) => _then(v as _DataLoading));

  @override
  _DataLoading get _value => super._value as _DataLoading;

  @override
  $Res call({
    Object? coal = freezed,
  }) {
    return _then(_DataLoading(
      coal == freezed
          ? _value.coal
          : coal // ignore: cast_nullable_to_non_nullable
              as List<CoalModel>,
    ));
  }
}

/// @nodoc

class _$_DataLoading implements _DataLoading {
  const _$_DataLoading(this.coal);

  @override
  final List<CoalModel> coal;

  @override
  String toString() {
    return 'CoalState.dataLoading(coal: $coal)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _DataLoading &&
            const DeepCollectionEquality().equals(other.coal, coal));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(coal));

  @JsonKey(ignore: true)
  @override
  _$DataLoadingCopyWith<_DataLoading> get copyWith =>
      __$DataLoadingCopyWithImpl<_DataLoading>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(List<CoalModel> coal) data,
    required TResult Function(List<CoalModel> coal) dataLoading,
    required TResult Function(String error) error,
  }) {
    return dataLoading(coal);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(List<CoalModel> coal)? data,
    TResult Function(List<CoalModel> coal)? dataLoading,
    TResult Function(String error)? error,
  }) {
    return dataLoading?.call(coal);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(List<CoalModel> coal)? data,
    TResult Function(List<CoalModel> coal)? dataLoading,
    TResult Function(String error)? error,
    required TResult orElse(),
  }) {
    if (dataLoading != null) {
      return dataLoading(coal);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Data value) data,
    required TResult Function(_DataLoading value) dataLoading,
    required TResult Function(_Error value) error,
  }) {
    return dataLoading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_Data value)? data,
    TResult Function(_DataLoading value)? dataLoading,
    TResult Function(_Error value)? error,
  }) {
    return dataLoading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Data value)? data,
    TResult Function(_DataLoading value)? dataLoading,
    TResult Function(_Error value)? error,
    required TResult orElse(),
  }) {
    if (dataLoading != null) {
      return dataLoading(this);
    }
    return orElse();
  }
}

abstract class _DataLoading implements CoalState {
  const factory _DataLoading(List<CoalModel> coal) = _$_DataLoading;

  List<CoalModel> get coal;
  @JsonKey(ignore: true)
  _$DataLoadingCopyWith<_DataLoading> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$ErrorCopyWith<$Res> {
  factory _$ErrorCopyWith(_Error value, $Res Function(_Error) then) =
      __$ErrorCopyWithImpl<$Res>;
  $Res call({String error});
}

/// @nodoc
class __$ErrorCopyWithImpl<$Res> extends _$CoalStateCopyWithImpl<$Res>
    implements _$ErrorCopyWith<$Res> {
  __$ErrorCopyWithImpl(_Error _value, $Res Function(_Error) _then)
      : super(_value, (v) => _then(v as _Error));

  @override
  _Error get _value => super._value as _Error;

  @override
  $Res call({
    Object? error = freezed,
  }) {
    return _then(_Error(
      error == freezed
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_Error implements _Error {
  const _$_Error(this.error);

  @override
  final String error;

  @override
  String toString() {
    return 'CoalState.error(error: $error)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _Error &&
            const DeepCollectionEquality().equals(other.error, error));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(error));

  @JsonKey(ignore: true)
  @override
  _$ErrorCopyWith<_Error> get copyWith =>
      __$ErrorCopyWithImpl<_Error>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(List<CoalModel> coal) data,
    required TResult Function(List<CoalModel> coal) dataLoading,
    required TResult Function(String error) error,
  }) {
    return error(this.error);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(List<CoalModel> coal)? data,
    TResult Function(List<CoalModel> coal)? dataLoading,
    TResult Function(String error)? error,
  }) {
    return error?.call(this.error);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(List<CoalModel> coal)? data,
    TResult Function(List<CoalModel> coal)? dataLoading,
    TResult Function(String error)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this.error);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Data value) data,
    required TResult Function(_DataLoading value) dataLoading,
    required TResult Function(_Error value) error,
  }) {
    return error(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_Data value)? data,
    TResult Function(_DataLoading value)? dataLoading,
    TResult Function(_Error value)? error,
  }) {
    return error?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Data value)? data,
    TResult Function(_DataLoading value)? dataLoading,
    TResult Function(_Error value)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this);
    }
    return orElse();
  }
}

abstract class _Error implements CoalState {
  const factory _Error(String error) = _$_Error;

  String get error;
  @JsonKey(ignore: true)
  _$ErrorCopyWith<_Error> get copyWith => throw _privateConstructorUsedError;
}
