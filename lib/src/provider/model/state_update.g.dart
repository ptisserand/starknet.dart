// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'state_update.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_StateUpdate _$$_StateUpdateFromJson(Map<String, dynamic> json) =>
    _$_StateUpdate(
      blockHash: Felt.fromJson(json['block_hash'] as String),
      newRoot: Felt.fromJson(json['new_root'] as String),
      oldRoot: Felt.fromJson(json['old_root'] as String),
      payload: (json['payload'] as List<dynamic>?)
          ?.map((e) => Felt.fromJson(e as String))
          .toList(),
    );

Map<String, dynamic> _$$_StateUpdateToJson(_$_StateUpdate instance) =>
    <String, dynamic>{
      'block_hash': instance.blockHash.toJson(),
      'new_root': instance.newRoot.toJson(),
      'old_root': instance.oldRoot.toJson(),
      'payload': instance.payload?.map((e) => e.toJson()).toList(),
    };

_$_StateDiff _$$_StateDiffFromJson(Map<String, dynamic> json) => _$_StateDiff(
      storageDiffs: (json['storage_diffs'] as List<dynamic>)
          .map((e) => StorageDiffItem.fromJson(e as Map<String, dynamic>))
          .toList(),
      declaredContracts: (json['declared_contracts'] as List<dynamic>)
          .map((e) => DeclaredContractItem.fromJson(e as Map<String, dynamic>))
          .toList(),
      deployedContracts: (json['deployed_contracts'] as List<dynamic>)
          .map((e) => DeployedContractItem.fromJson(e as Map<String, dynamic>))
          .toList(),
      nonces: (json['nonces'] as List<dynamic>)
          .map((e) =>
              NonceAndContractAddress.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$_StateDiffToJson(_$_StateDiff instance) =>
    <String, dynamic>{
      'storage_diffs': instance.storageDiffs.map((e) => e.toJson()).toList(),
      'declared_contracts':
          instance.declaredContracts.map((e) => e.toJson()).toList(),
      'deployed_contracts':
          instance.deployedContracts.map((e) => e.toJson()).toList(),
      'nonces': instance.nonces.map((e) => e.toJson()).toList(),
    };

_$_NonceAndContractAddress _$$_NonceAndContractAddressFromJson(
        Map<String, dynamic> json) =>
    _$_NonceAndContractAddress(
      nonce: Felt.fromJson(json['nonce'] as String),
      contractAddress: Felt.fromJson(json['contract_address'] as String),
    );

Map<String, dynamic> _$$_NonceAndContractAddressToJson(
        _$_NonceAndContractAddress instance) =>
    <String, dynamic>{
      'nonce': instance.nonce.toJson(),
      'contract_address': instance.contractAddress.toJson(),
    };