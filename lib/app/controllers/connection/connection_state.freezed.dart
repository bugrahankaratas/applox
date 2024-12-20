// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'connection_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$ConnectionState {
  CountryModel? get selectedCountry => throw _privateConstructorUsedError;
  DateTime? get connectionTime => throw _privateConstructorUsedError;
  double get downloadSize => throw _privateConstructorUsedError;
  double get uploadSize => throw _privateConstructorUsedError;
  List<CountryModel?>? get filteredList => throw _privateConstructorUsedError;

  /// Create a copy of ConnectionState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ConnectionStateCopyWith<ConnectionState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ConnectionStateCopyWith<$Res> {
  factory $ConnectionStateCopyWith(
          ConnectionState value, $Res Function(ConnectionState) then) =
      _$ConnectionStateCopyWithImpl<$Res, ConnectionState>;
  @useResult
  $Res call(
      {CountryModel? selectedCountry,
      DateTime? connectionTime,
      double downloadSize,
      double uploadSize,
      List<CountryModel?>? filteredList});

  $CountryModelCopyWith<$Res>? get selectedCountry;
}

/// @nodoc
class _$ConnectionStateCopyWithImpl<$Res, $Val extends ConnectionState>
    implements $ConnectionStateCopyWith<$Res> {
  _$ConnectionStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ConnectionState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? selectedCountry = freezed,
    Object? connectionTime = freezed,
    Object? downloadSize = null,
    Object? uploadSize = null,
    Object? filteredList = freezed,
  }) {
    return _then(_value.copyWith(
      selectedCountry: freezed == selectedCountry
          ? _value.selectedCountry
          : selectedCountry // ignore: cast_nullable_to_non_nullable
              as CountryModel?,
      connectionTime: freezed == connectionTime
          ? _value.connectionTime
          : connectionTime // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      downloadSize: null == downloadSize
          ? _value.downloadSize
          : downloadSize // ignore: cast_nullable_to_non_nullable
              as double,
      uploadSize: null == uploadSize
          ? _value.uploadSize
          : uploadSize // ignore: cast_nullable_to_non_nullable
              as double,
      filteredList: freezed == filteredList
          ? _value.filteredList
          : filteredList // ignore: cast_nullable_to_non_nullable
              as List<CountryModel?>?,
    ) as $Val);
  }

  /// Create a copy of ConnectionState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $CountryModelCopyWith<$Res>? get selectedCountry {
    if (_value.selectedCountry == null) {
      return null;
    }

    return $CountryModelCopyWith<$Res>(_value.selectedCountry!, (value) {
      return _then(_value.copyWith(selectedCountry: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$ConnectionStateImplCopyWith<$Res>
    implements $ConnectionStateCopyWith<$Res> {
  factory _$$ConnectionStateImplCopyWith(_$ConnectionStateImpl value,
          $Res Function(_$ConnectionStateImpl) then) =
      __$$ConnectionStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {CountryModel? selectedCountry,
      DateTime? connectionTime,
      double downloadSize,
      double uploadSize,
      List<CountryModel?>? filteredList});

  @override
  $CountryModelCopyWith<$Res>? get selectedCountry;
}

/// @nodoc
class __$$ConnectionStateImplCopyWithImpl<$Res>
    extends _$ConnectionStateCopyWithImpl<$Res, _$ConnectionStateImpl>
    implements _$$ConnectionStateImplCopyWith<$Res> {
  __$$ConnectionStateImplCopyWithImpl(
      _$ConnectionStateImpl _value, $Res Function(_$ConnectionStateImpl) _then)
      : super(_value, _then);

  /// Create a copy of ConnectionState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? selectedCountry = freezed,
    Object? connectionTime = freezed,
    Object? downloadSize = null,
    Object? uploadSize = null,
    Object? filteredList = freezed,
  }) {
    return _then(_$ConnectionStateImpl(
      selectedCountry: freezed == selectedCountry
          ? _value.selectedCountry
          : selectedCountry // ignore: cast_nullable_to_non_nullable
              as CountryModel?,
      connectionTime: freezed == connectionTime
          ? _value.connectionTime
          : connectionTime // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      downloadSize: null == downloadSize
          ? _value.downloadSize
          : downloadSize // ignore: cast_nullable_to_non_nullable
              as double,
      uploadSize: null == uploadSize
          ? _value.uploadSize
          : uploadSize // ignore: cast_nullable_to_non_nullable
              as double,
      filteredList: freezed == filteredList
          ? _value._filteredList
          : filteredList // ignore: cast_nullable_to_non_nullable
              as List<CountryModel?>?,
    ));
  }
}

/// @nodoc

class _$ConnectionStateImpl implements _ConnectionState {
  const _$ConnectionStateImpl(
      {this.selectedCountry = null,
      this.connectionTime = null,
      this.downloadSize = 0,
      this.uploadSize = 0,
      final List<CountryModel?>? filteredList})
      : _filteredList = filteredList;

  @override
  @JsonKey()
  final CountryModel? selectedCountry;
  @override
  @JsonKey()
  final DateTime? connectionTime;
  @override
  @JsonKey()
  final double downloadSize;
  @override
  @JsonKey()
  final double uploadSize;
  final List<CountryModel?>? _filteredList;
  @override
  List<CountryModel?>? get filteredList {
    final value = _filteredList;
    if (value == null) return null;
    if (_filteredList is EqualUnmodifiableListView) return _filteredList;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'ConnectionState(selectedCountry: $selectedCountry, connectionTime: $connectionTime, downloadSize: $downloadSize, uploadSize: $uploadSize, filteredList: $filteredList)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ConnectionStateImpl &&
            (identical(other.selectedCountry, selectedCountry) ||
                other.selectedCountry == selectedCountry) &&
            (identical(other.connectionTime, connectionTime) ||
                other.connectionTime == connectionTime) &&
            (identical(other.downloadSize, downloadSize) ||
                other.downloadSize == downloadSize) &&
            (identical(other.uploadSize, uploadSize) ||
                other.uploadSize == uploadSize) &&
            const DeepCollectionEquality()
                .equals(other._filteredList, _filteredList));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      selectedCountry,
      connectionTime,
      downloadSize,
      uploadSize,
      const DeepCollectionEquality().hash(_filteredList));

  /// Create a copy of ConnectionState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ConnectionStateImplCopyWith<_$ConnectionStateImpl> get copyWith =>
      __$$ConnectionStateImplCopyWithImpl<_$ConnectionStateImpl>(
          this, _$identity);
}

abstract class _ConnectionState implements ConnectionState {
  const factory _ConnectionState(
      {final CountryModel? selectedCountry,
      final DateTime? connectionTime,
      final double downloadSize,
      final double uploadSize,
      final List<CountryModel?>? filteredList}) = _$ConnectionStateImpl;

  @override
  CountryModel? get selectedCountry;
  @override
  DateTime? get connectionTime;
  @override
  double get downloadSize;
  @override
  double get uploadSize;
  @override
  List<CountryModel?>? get filteredList;

  /// Create a copy of ConnectionState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ConnectionStateImplCopyWith<_$ConnectionStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
