import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../ui/index.dart';
import '../wallet_state/index.dart';
import '../widgets/wallet_type_selector.dart';

import 'protect_wallet_screen.dart';

class RecoverWalletScreen extends HookConsumerWidget {
  const RecoverWalletScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final seedPhrase = useState('');
    final wordsCount =
        seedPhrase.value == '' ? 0 : seedPhrase.value.trim().split(' ').length;
    final isButtonEnabled = wordsCount == 12;
    final walletType = useState(WalletType.openZeppelin);

    return Layout2(
      children: [
        const SimpleHeader(
          title: 'Recover your wallet',
        ),
        WalletTypeSelector(
          initialValue: walletType.value,
          onChanged: (value) => walletType.value = value,
        ),
        TextInput(
          hintText: 'Enter your seed phrase',
          onChanged: (value) => seedPhrase.value = value,
        ),
        const Spacer(),
        PrimaryButton(
            onPressed: isButtonEnabled
                ? () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => ProtectWalletScreen(
                          seedPhrase: seedPhrase.value,
                          walletType: walletType.value,
                        ),
                      ),
                    );
                  }
                : null,
            label: 'Continue'),
      ],
    );
  }
}
