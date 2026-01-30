import 'dart:math';
import 'package:flutter/material.dart';
import 'package:fortune_alarm/l10n/app_localizations.dart';

class PositiveMessages {
  static String getMessage(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    final List<String> messages = [
      l10n.cheeringMessage1, l10n.cheeringMessage2, l10n.cheeringMessage3, l10n.cheeringMessage4,
      l10n.cheeringMessage5, l10n.cheeringMessage6, l10n.cheeringMessage7, l10n.cheeringMessage8,
      l10n.cheeringMessage9, l10n.cheeringMessage10, l10n.cheeringMessage11, l10n.cheeringMessage12,
      l10n.cheeringMessage13, l10n.cheeringMessage14, l10n.cheeringMessage15, l10n.cheeringMessage16,
      l10n.cheeringMessage17, l10n.cheeringMessage18, l10n.cheeringMessage19, l10n.cheeringMessage20,
      l10n.cheeringMessage21, l10n.cheeringMessage22, l10n.cheeringMessage23, l10n.cheeringMessage24,
      l10n.cheeringMessage25, l10n.cheeringMessage26, l10n.cheeringMessage27, l10n.cheeringMessage28,
      l10n.cheeringMessage29, l10n.cheeringMessage30, l10n.cheeringMessage31, l10n.cheeringMessage32,
      l10n.cheeringMessage33, l10n.cheeringMessage34, l10n.cheeringMessage35, l10n.cheeringMessage36,
      l10n.cheeringMessage37, l10n.cheeringMessage38, l10n.cheeringMessage39, l10n.cheeringMessage40,
      l10n.cheeringMessage41, l10n.cheeringMessage42, l10n.cheeringMessage43, l10n.cheeringMessage44,
      l10n.cheeringMessage45, l10n.cheeringMessage46, l10n.cheeringMessage47, l10n.cheeringMessage48,
      l10n.cheeringMessage49, l10n.cheeringMessage50,
    ];
    return messages[Random().nextInt(messages.length)];
  }

  static List<String> getFallbackMessages(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    return [
      l10n.cheeringMessage1,
      l10n.cheeringMessage2,
      l10n.cheeringMessage3,
    ];
  }
}
