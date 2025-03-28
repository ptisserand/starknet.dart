import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../wallet_state/index.dart';
import '../widgets/icon.dart';

class WalletTypeSelector extends HookConsumerWidget {
  final WalletType? initialValue;
  final void Function(WalletType)? onChanged;
  final bool showLabel;
  final List<WalletType> availableTypes;
  final bool showTooltips;

  WalletTypeSelector({
    super.key,
    this.initialValue,
    this.onChanged,
    this.showLabel = true,
    this.showTooltips = true,
    // Default to all wallet types if not specified
    this.availableTypes = WalletType.values,
  }) : assert(availableTypes.isNotEmpty,
            'At least one wallet type must be provided');

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // If initial value not provided, use first available type
    final walletType = useState(initialValue ??
        (availableTypes.isNotEmpty ? availableTypes.first : null));

    // Filter segments based on available types
    final filteredSegments = availableTypes
        .map((type) => ButtonSegment<WalletType>(
              value: type,
              icon: Tooltip(
                message: showTooltips ? type.description : null,
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8),
                  child: WalletTypeIcon(type: type),
                ),
              ),
              label: showTooltips ? Text(type.label) : null,
            ))
        .toList();

    return SizedBox(
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          if (showLabel)
            const Text(
              'Select your wallet type:',
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w600,
              ),
            ),
          if (showLabel) const SizedBox(height: 16),
          SegmentedButton<WalletType>(
            showSelectedIcon: false,
            segments: filteredSegments,
            selected: walletType.value != null ? {walletType.value!} : {},
            onSelectionChanged: filteredSegments.length > 1
                ? (value) {
                    walletType.value = value.first;
                    onChanged?.call(value.first);
                  }
                : null,
          ),
        ],
      ),
    );
  }
}
