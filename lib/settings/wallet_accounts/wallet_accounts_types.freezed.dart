// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'wallet_accounts_types.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

WalletAccountEntry _$WalletAccountEntryFromJson(Map<String, dynamic> json) {
  return _WalletAccountEntry.fromJson(json);
}

/// @nodoc
mixin _$WalletAccountEntry {
  String get address => throw _privateConstructorUsedError;
  String get label => throw _privateConstructorUsedError;
  bool get archived => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $WalletAccountEntryCopyWith<WalletAccountEntry> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $WalletAccountEntryCopyWith<$Res> {
  factory $WalletAccountEntryCopyWith(
          WalletAccountEntry value, $Res Function(WalletAccountEntry) then) =
      _$WalletAccountEntryCopyWithImpl<$Res, WalletAccountEntry>;
  @useResult
  $Res call({String address, String label, bool archived});
}

/// @nodoc
class _$WalletAccountEntryCopyWithImpl<$Res, $Val extends WalletAccountEntry>
    implements $WalletAccountEntryCopyWith<$Res> {
  _$WalletAccountEntryCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? address = null,
    Object? label = null,
    Object? archived = null,
  }) {
    return _then(_value.copyWith(
      address: null == address
          ? _value.address
          : address // ignore: cast_nullable_to_non_nullable
              as String,
      label: null == label
          ? _value.label
          : label // ignore: cast_nullable_to_non_nullable
              as String,
      archived: null == archived
          ? _value.archived
          : archived // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$WalletAccountEntryImplCopyWith<$Res>
    implements $WalletAccountEntryCopyWith<$Res> {
  factory _$$WalletAccountEntryImplCopyWith(_$WalletAccountEntryImpl value,
          $Res Function(_$WalletAccountEntryImpl) then) =
      __$$WalletAccountEntryImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String address, String label, bool archived});
}

/// @nodoc
class __$$WalletAccountEntryImplCopyWithImpl<$Res>
    extends _$WalletAccountEntryCopyWithImpl<$Res, _$WalletAccountEntryImpl>
    implements _$$WalletAccountEntryImplCopyWith<$Res> {
  __$$WalletAccountEntryImplCopyWithImpl(_$WalletAccountEntryImpl _value,
      $Res Function(_$WalletAccountEntryImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? address = null,
    Object? label = null,
    Object? archived = null,
  }) {
    return _then(_$WalletAccountEntryImpl(
      address: null == address
          ? _value.address
          : address // ignore: cast_nullable_to_non_nullable
              as String,
      label: null == label
          ? _value.label
          : label // ignore: cast_nullable_to_non_nullable
              as String,
      archived: null == archived
          ? _value.archived
          : archived // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$WalletAccountEntryImpl implements _WalletAccountEntry {
  const _$WalletAccountEntryImpl(
      {required this.address, required this.label, this.archived = false});

  factory _$WalletAccountEntryImpl.fromJson(Map<String, dynamic> json) =>
      _$$WalletAccountEntryImplFromJson(json);

  @override
  final String address;
  @override
  final String label;
  @override
  @JsonKey()
  final bool archived;

  @override
  String toString() {
    return 'WalletAccountEntry(address: $address, label: $label, archived: $archived)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$WalletAccountEntryImpl &&
            (identical(other.address, address) ||
                other.address == address) &&
            (identical(other.label, label) || other.label == label) &&
            (identical(other.archived, archived) ||
                other.archived == archived));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, address, label, archived);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$WalletAccountEntryImplCopyWith<_$WalletAccountEntryImpl> get copyWith =>
      __$$WalletAccountEntryImplCopyWithImpl<_$WalletAccountEntryImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$WalletAccountEntryImplToJson(
      this,
    );
  }
}

abstract class _WalletAccountEntry implements WalletAccountEntry {
  const factory _WalletAccountEntry(
      {required final String address,
      required final String label,
      final bool archived}) = _$WalletAccountEntryImpl;

  factory _WalletAccountEntry.fromJson(Map<String, dynamic> json) =
      _$WalletAccountEntryImpl.fromJson;

  @override
  String get address;
  @override
  String get label;
  @override
  bool get archived;
  @override
  @JsonKey(ignore: true)
  _$$WalletAccountEntryImplCopyWith<_$WalletAccountEntryImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

WalletAccounts _$WalletAccountsFromJson(Map<String, dynamic> json) {
  return _WalletAccounts.fromJson(json);
}

/// @nodoc
mixin _$WalletAccounts {
  IList<WalletAccountEntry> get accounts =>
      throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $WalletAccountsCopyWith<WalletAccounts> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $WalletAccountsCopyWith<$Res> {
  factory $WalletAccountsCopyWith(
          WalletAccounts value, $Res Function(WalletAccounts) then) =
      _$WalletAccountsCopyWithImpl<$Res, WalletAccounts>;
  @useResult
  $Res call({IList<WalletAccountEntry> accounts});
}

/// @nodoc
class _$WalletAccountsCopyWithImpl<$Res, $Val extends WalletAccounts>
    implements $WalletAccountsCopyWith<$Res> {
  _$WalletAccountsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? accounts = null,
  }) {
    return _then(_value.copyWith(
      accounts: null == accounts
          ? _value.accounts
          : accounts // ignore: cast_nullable_to_non_nullable
              as IList<WalletAccountEntry>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$WalletAccountsImplCopyWith<$Res>
    implements $WalletAccountsCopyWith<$Res> {
  factory _$$WalletAccountsImplCopyWith(_$WalletAccountsImpl value,
          $Res Function(_$WalletAccountsImpl) then) =
      __$$WalletAccountsImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({IList<WalletAccountEntry> accounts});
}

/// @nodoc
class __$$WalletAccountsImplCopyWithImpl<$Res>
    extends _$WalletAccountsCopyWithImpl<$Res, _$WalletAccountsImpl>
    implements _$$WalletAccountsImplCopyWith<$Res> {
  __$$WalletAccountsImplCopyWithImpl(
      _$WalletAccountsImpl _value, $Res Function(_$WalletAccountsImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? accounts = null,
  }) {
    return _then(_$WalletAccountsImpl(
      accounts: null == accounts
          ? _value.accounts
          : accounts // ignore: cast_nullable_to_non_nullable
              as IList<WalletAccountEntry>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$WalletAccountsImpl implements _WalletAccounts {
  const _$WalletAccountsImpl({this.accounts = const IListConst([])});

  factory _$WalletAccountsImpl.fromJson(Map<String, dynamic> json) =>
      _$$WalletAccountsImplFromJson(json);

  @override
  @JsonKey()
  final IList<WalletAccountEntry> accounts;

  @override
  String toString() {
    return 'WalletAccounts(accounts: $accounts)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$WalletAccountsImpl &&
            const DeepCollectionEquality().equals(other.accounts, accounts));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(accounts));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$WalletAccountsImplCopyWith<_$WalletAccountsImpl> get copyWith =>
      __$$WalletAccountsImplCopyWithImpl<_$WalletAccountsImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$WalletAccountsImplToJson(
      this,
    );
  }
}

abstract class _WalletAccounts implements WalletAccounts {
  const factory _WalletAccounts(
      {final IList<WalletAccountEntry> accounts}) = _$WalletAccountsImpl;

  factory _WalletAccounts.fromJson(Map<String, dynamic> json) =
      _$WalletAccountsImpl.fromJson;

  @override
  IList<WalletAccountEntry> get accounts;
  @override
  @JsonKey(ignore: true)
  _$$WalletAccountsImplCopyWith<_$WalletAccountsImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
