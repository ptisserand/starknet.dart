import 'package:starknet_flutter/src/stores/starknet_store.dart';

export 'src/crypto/crypto_helper.dart';
// TODO: split this file into multiple files
export 'src/exchange_rates/exchange_rates.dart';
export 'src/models/models.dart';
export 'src/stores/starknet_store.dart';
export 'src/views/passcode/fragments/password/password_config.dart';
export 'src/views/passcode/fragments/pin_code/pin_code_config.dart';
export 'src/views/views.dart';
export 'src/views/wallet/wallet_initialization.dart';
export 'src/views/wallet_list/wallet_list.dart';

export 'src/views/wallet_types.dart';

class StarknetFlutter {
  static Future<void> init() async {
    await StarknetStore.init();
  }
}
