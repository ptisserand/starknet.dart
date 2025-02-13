// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'avnu_execute.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

AvnuExecute _$AvnuExecuteFromJson(Map<String, dynamic> json) {
  return _AvnuExecute.fromJson(json);
}

/// @nodoc
mixin _$AvnuExecute {
  String get transactionHash => throw _privateConstructorUsedError;

  /// Serializes this AvnuExecute to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of AvnuExecute
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $AvnuExecuteCopyWith<AvnuExecute> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AvnuExecuteCopyWith<$Res> {
  factory $AvnuExecuteCopyWith(
          AvnuExecute value, $Res Function(AvnuExecute) then) =
      _$AvnuExecuteCopyWithImpl<$Res, AvnuExecute>;
  @useResult
  $Res call({String transactionHash});
}

/// @nodoc
class _$AvnuExecuteCopyWithImpl<$Res, $Val extends AvnuExecute>
    implements $AvnuExecuteCopyWith<$Res> {
  _$AvnuExecuteCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of AvnuExecute
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? transactionHash = null,
  }) {
    return _then(_value.copyWith(
      transactionHash: null == transactionHash
          ? _value.transactionHash
          : transactionHash // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$AvnuExecuteImplCopyWith<$Res>
    implements $AvnuExecuteCopyWith<$Res> {
  factory _$$AvnuExecuteImplCopyWith(
          _$AvnuExecuteImpl value, $Res Function(_$AvnuExecuteImpl) then) =
      __$$AvnuExecuteImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String transactionHash});
}

/// @nodoc
class __$$AvnuExecuteImplCopyWithImpl<$Res>
    extends _$AvnuExecuteCopyWithImpl<$Res, _$AvnuExecuteImpl>
    implements _$$AvnuExecuteImplCopyWith<$Res> {
  __$$AvnuExecuteImplCopyWithImpl(
      _$AvnuExecuteImpl _value, $Res Function(_$AvnuExecuteImpl) _then)
      : super(_value, _then);

  /// Create a copy of AvnuExecute
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? transactionHash = null,
  }) {
    return _then(_$AvnuExecuteImpl(
      transactionHash: null == transactionHash
          ? _value.transactionHash
          : transactionHash // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$AvnuExecuteImpl implements _AvnuExecute {
  const _$AvnuExecuteImpl({required this.transactionHash});

  factory _$AvnuExecuteImpl.fromJson(Map<String, dynamic> json) =>
      _$$AvnuExecuteImplFromJson(json);

  @override
  final String transactionHash;

  @override
  String toString() {
    return 'AvnuExecute(transactionHash: $transactionHash)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AvnuExecuteImpl &&
            (identical(other.transactionHash, transactionHash) ||
                other.transactionHash == transactionHash));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, transactionHash);

  /// Create a copy of AvnuExecute
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$AvnuExecuteImplCopyWith<_$AvnuExecuteImpl> get copyWith =>
      __$$AvnuExecuteImplCopyWithImpl<_$AvnuExecuteImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$AvnuExecuteImplToJson(
      this,
    );
  }
}

abstract class _AvnuExecute implements AvnuExecute {
  const factory _AvnuExecute({required final String transactionHash}) =
      _$AvnuExecuteImpl;

  factory _AvnuExecute.fromJson(Map<String, dynamic> json) =
      _$AvnuExecuteImpl.fromJson;

  @override
  String get transactionHash;

  /// Create a copy of AvnuExecute
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$AvnuExecuteImplCopyWith<_$AvnuExecuteImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
