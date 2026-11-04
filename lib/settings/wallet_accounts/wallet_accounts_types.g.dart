// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'wallet_accounts_types.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$WalletAccountEntryImpl _$$WalletAccountEntryImplFromJson(Map json) =>
    _$WalletAccountEntryImpl(
      address: json['address'] as String,
      label: json['label'] as String,
      archived: json['archived'] as bool? ?? false,
    );

Map<String, dynamic> _$$WalletAccountEntryImplToJson(
        _$WalletAccountEntryImpl instance) =>
    <String, dynamic>{
      'address': instance.address,
      'label': instance.label,
      'archived': instance.archived,
    };

_$WalletAccountsImpl _$$WalletAccountsImplFromJson(Map json) =>
    _$WalletAccountsImpl(
      accounts: json['accounts'] == null
          ? const IListConst([])
          : IList<WalletAccountEntry>.fromJson(
              json['accounts'],
              (value) => WalletAccountEntry.fromJson(
                  Map<String, dynamic>.from(value as Map)),
            ),
    );

Map<String, dynamic> _$$WalletAccountsImplToJson(
        _$WalletAccountsImpl instance) =>
    <String, dynamic>{
      'accounts': instance.accounts.toJson(
        (value) => value.toJson(),
      ),
    };
