import 'package:starknet/starknet.dart';
import 'package:avnu_provider/avnu_provider.dart';
import 'package:test/test.dart';
import 'dart:convert';

import '../utils.dart';

void removeNullFields(Map<String, dynamic> json) {
  json.removeWhere((key, value) => value == null);
  json.forEach((key, value) {
    if (value is Map<String, dynamic>) {
      removeNullFields(value);
    } else if (value is List) {
      for (var item in value) {
        if (item is Map<String, dynamic>) {
          removeNullFields(item);
        }
      }
    }
  });
}

void main() {
  group('AvnuProvider', () {
    late AvnuProvider avnuProvider;

    final sepoliaAccount0Address = Felt.fromHexString(
      "0x00f1ac9E93A5da15FdeFD80F6224877Fb9977Fa09C5DFccb0024A6654C111224",
    );

    final sepoliaAccount0PrivateKey = Felt.fromHexString(
        "0x0468af3624b056706186434f56f3218c6363be6defd72338abd8a0989031cc32");

    final sepoliaAccount0 = getAccount(
      accountAddress: sepoliaAccount0Address,
      privateKey: sepoliaAccount0PrivateKey,
    );

    setUpAll(() {
      // executed once before all tests
      final apiKey = '3fe427af-1c19-4126-8570-4e3adba3a043';
      final publicKey = BigInt.parse(
          "0429c489be63b21c399353e03a9659cfc1650b24bae1e9ebdde0aef2b38deb44",
          radix: 16);
      avnuProvider = getAvnuProvider(publicKey: publicKey, apiKey: apiKey);
    });

    group('execute', () {
      test('send avnu build typed data and execute transaction', () async {
        final userAddress = sepoliaAccount0.accountAddress.toHexString();
        final calls = [
          {
            'contractAddress':
                '0x049d36570d4e46f48e99674bd3fcc84644ddd6b96f7c741b1562b82f9e004dc7',
            'entrypoint': 'approve',
            'calldata': [
              '0x498e484da80a8895c77dcad5362ae483758050f22a92af29a385459b0365bfe',
              '0xf',
              '0x0'
            ]
          }
        ];
        final gasTokenAddress =
            '0x4718f5a0fc34cc1af16a1cdee98ffb20c31f5cd61d6ab07201858f4287c938d';
        final maxGasTokenAmount = '0xFC3F02C221B000';
        //just for testing, we hardcode the account class hash to the ArgentX account class hash
        //in a real scenario, we would get the account class hash from the Starknetprovider
        final accountClassHash =
            '0x36078334509b514626504edc9fb252328d1a240e4e948bef8d0c08dff45927f';
        final avnuBuildTypedData = await avnuProvider.buildTypedData(
            userAddress,
            calls,
            gasTokenAddress,
            maxGasTokenAmount,
            accountClassHash);
        expect(avnuBuildTypedData, isA<AvnuBuildTypedData>());

        final String typedData = jsonEncode(avnuBuildTypedData.toJson());
        final typedDataObject = TypedData.fromJson(jsonDecode(typedData));

        // Remove null fields from typedData
        final Map<String, dynamic> typedDataMap = jsonDecode(typedData);
        removeNullFields(typedDataMap);
        final String cleanTypedData = jsonEncode(typedDataMap);

        final messageHash = getMessageHash(
            typedDataObject, sepoliaAccount0.accountAddress.toBigInt());
        final signature = starknetSign(
          privateKey: sepoliaAccount0.signer.privateKey.toBigInt(),
          messageHash: messageHash,
          seed: BigInt.from(32),
        );
        final signCount = "0x1";
        final starknetSignatureId = "0x0";
        final publicKey = sepoliaAccount0.signer.publicKey.toHexString();
        final signatureR = Felt(signature.r).toHexString();
        final signatureS = Felt(signature.s).toHexString();
        final signatureList = [
          signCount,
          starknetSignatureId,
          publicKey,
          signatureR,
          signatureS
        ];
        final deploymentData = null;
        final avnuExecute = await avnuProvider.execute(
            userAddress, cleanTypedData, signatureList, deploymentData);
        expect(avnuExecute, isA<AvnuExecute>());
      });

      test('execute sponsored transaction with sponsor api key', () async {
        final userAddress = sepoliaAccount0.accountAddress.toHexString();
        final calls = [
          {
            'contractAddress':
                '0x049d36570d4e46f48e99674bd3fcc84644ddd6b96f7c741b1562b82f9e004dc7',
            'entrypoint': 'approve',
            'calldata': [
              '0x498e484da80a8895c77dcad5362ae483758050f22a92af29a385459b0365bfe',
              '0xf',
              '0x0'
            ]
          }
        ];
        // If we want that our transaction be sponsored, don't have to set the gasTokenAddress and maxGasTokenAmount fields
        // as mentioned in https://doc.avnu.fi/avnu-paymaster/cover-your-users-gas-fees
        final gasTokenAddress = '';
        final maxGasTokenAmount = '';

        //just for testing, we hardcode the account class hash to the ArgentX account class hash
        //in a real scenario, we would get the account class hash from the Starknet provider
        final accountClassHash =
            '0x36078334509b514626504edc9fb252328d1a240e4e948bef8d0c08dff45927f';
        final avnuBuildTypedData = await avnuProvider.buildTypedData(
            userAddress,
            calls,
            gasTokenAddress,
            maxGasTokenAmount,
            accountClassHash);
        expect(avnuBuildTypedData, isA<AvnuBuildTypedData>());

        final String typedData = jsonEncode(avnuBuildTypedData.toJson());
        final typedDataObject = TypedData.fromJson(jsonDecode(typedData));

        // Remove null fields from typedData
        final Map<String, dynamic> typedDataMap = jsonDecode(typedData);
        removeNullFields(typedDataMap);
        final String cleanTypedData = jsonEncode(typedDataMap);

        final messageHash = getMessageHash(
            typedDataObject, sepoliaAccount0.accountAddress.toBigInt());
        final signature = starknetSign(
          privateKey: sepoliaAccount0.signer.privateKey.toBigInt(),
          messageHash: messageHash,
          seed: BigInt.from(32),
        );
        final signCount = "0x1";
        final starknetSignatureId = "0x0";
        final publicKey = sepoliaAccount0.signer.publicKey.toHexString();
        final signatureR = Felt(signature.r).toHexString();
        final signatureS = Felt(signature.s).toHexString();
        final signatureList = [
          signCount,
          starknetSignatureId,
          publicKey,
          signatureR,
          signatureS
        ];
        final deploymentData = null;

        final avnuExecute = await avnuProvider.execute(
            userAddress, cleanTypedData, signatureList, deploymentData);
        expect(avnuExecute, isA<AvnuExecute>());
      });

      test('execute rewards sponsored transaction without sponsor api key',
          () async {
        // Set the transaction that we want to be sponsored
        final userAddress = sepoliaAccount0.accountAddress.toHexString();
        final calls = [
          {
            'contractAddress':
                '0x049d36570d4e46f48e99674bd3fcc84644ddd6b96f7c741b1562b82f9e004dc7',
            'entrypoint': 'approve',
            'calldata': [
              '0x498e484da80a8895c77dcad5362ae483758050f22a92af29a385459b0365bfe',
              '0xf',
              '0x0'
            ]
          }
        ];

        // As a apikey manager, allocate rewards to users, enabling them to execute gasless transactions
        // ensure we have at least one gasless transaction available for the user
        final address = sepoliaAccount0.accountAddress.toHexString();
        final campaign = 'Onboarding';
        final protocol = 'AVNU';
        final freeTx = 1;
        // set expiration date as utc + one hour in the future
        final expirationDate =
            DateTime.now().add(Duration(hours: 1)).toUtc().toIso8601String();
        final whitelistedCalls = [
          {'contractAddress': '*', 'entrypoint': '*'}
        ];
        final avnuSetAccountRewards = await avnuProvider.setAccountRewards(
            address,
            campaign,
            protocol,
            freeTx,
            expirationDate,
            whitelistedCalls);
        expect(avnuSetAccountRewards, isA<AvnuAccountRewards>());
        // set null apikey to ensure we won't be using sponsored apikey transaction
        avnuProvider.setApiKey('');

        // If we want that our transaction be sponsored, don't have to set the gasTokenAddress and maxGasTokenAmount fields
        // as mentioned in https://doc.avnu.fi/avnu-paymaster/cover-your-users-gas-fees
        final gasTokenAddress = '';
        final maxGasTokenAmount = '';

        //just for testing, we hardcode the account class hash to the ArgentX account class hash
        //in a real scenario, we would get the account class hash from the Starknet provider
        final accountClassHash =
            '0x36078334509b514626504edc9fb252328d1a240e4e948bef8d0c08dff45927f';

        // Build the typed data
        final avnuBuildTypedData = await avnuProvider.buildTypedData(
            userAddress,
            calls,
            gasTokenAddress,
            maxGasTokenAmount,
            accountClassHash);
        expect(avnuBuildTypedData, isA<AvnuBuildTypedData>());

        final String typedData = jsonEncode(avnuBuildTypedData.toJson());
        final typedDataObject = TypedData.fromJson(jsonDecode(typedData));

        // Remove null fields from typedData
        final Map<String, dynamic> typedDataMap = jsonDecode(typedData);
        removeNullFields(typedDataMap);
        final String cleanTypedData = jsonEncode(typedDataMap);

        // Generate signature for the typed data
        final messageHash = getMessageHash(
            typedDataObject, sepoliaAccount0.accountAddress.toBigInt());
        final signature = starknetSign(
          privateKey: sepoliaAccount0.signer.privateKey.toBigInt(),
          messageHash: messageHash,
          seed: BigInt.from(32),
        );
        final signCount = "0x1";
        final starknetSignatureId = "0x0";
        final publicKey = sepoliaAccount0.signer.publicKey.toHexString();
        final signatureR = Felt(signature.r).toHexString();
        final signatureS = Felt(signature.s).toHexString();
        final signatureList = [
          signCount,
          starknetSignatureId,
          publicKey,
          signatureR,
          signatureS
        ];
        final deploymentData = null;

        // Execute the transaction
        final avnuExecute = await avnuProvider.execute(
            userAddress, cleanTypedData, signatureList, deploymentData);
        expect(avnuExecute, isA<AvnuExecute>());
      });
    });

    group('setAccountRewards', () {
      test('set rewards for a user account', () async {
        final address = sepoliaAccount0.accountAddress.toHexString();
        final campaign = 'Onboarding';
        final protocol = 'AVNU';
        // set 2 gasless transactions for the user
        final freeTx = 2;
        // set expiration dat with current utc data in gmt TZ plus 1 hour
        final expirationDate =
            DateTime.now().add(Duration(hours: 1)).toUtc().toIso8601String();
        final whitelistedCalls = [
          {'contractAddress': '*', 'entrypoint': '*'}
        ];
        final avnuSetAccountRewards = await avnuProvider.setAccountRewards(
            address,
            campaign,
            protocol,
            freeTx,
            expirationDate,
            whitelistedCalls);
        expect(avnuSetAccountRewards, isA<AvnuAccountRewards>());
      });
    });
  }, tags: ['integration'], timeout: Timeout(Duration(minutes: 1)));
}
