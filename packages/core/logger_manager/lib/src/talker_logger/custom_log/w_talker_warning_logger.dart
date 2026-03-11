import 'dart:convert';

import 'package:talker_flutter/talker_flutter.dart';

/// Логгер для предупреждений с форматированием JSON.
class WTalkerWarningLogger extends TalkerLog {
  WTalkerWarningLogger(dynamic msg, Type runtimeType)
    : super(_createMessage(msg, runtimeType), logLevel: LogLevel.warning);

  @override
  AnsiPen get pen => AnsiPen()..yellow();

  @override
  String get key => 'warning';

  static const _encoder = JsonEncoder.withIndent('  ');

  static String _createMessage(dynamic msg, Type runtimeType) {
    final result = StringBuffer('[$runtimeType] ');

    if (msg is Map || msg is List) {
      result
        ..writeln()
        ..write(_encoder.convert(msg));
    } else {
      result.write(_formatMixedMessage(msg?.toString() ?? 'null'));
    }

    return result.toString();
  }

  static String _formatMixedMessage(String message) {
    final buffer = StringBuffer();
    final parts = _splitByJsonBlocks(message);

    for (final part in parts) {
      final trimmed = part.trim();

      if (_looksLikeJson(trimmed)) {
        try {
          final parsed = json.decode(trimmed);
          final pretty = _encoder.convert(parsed);
          buffer
            ..writeln()
            ..write(pretty);
        } on Object catch (_) {
          buffer.write(part);
        }
      } else {
        buffer.write(part);
      }
    }

    return buffer.toString();
  }

  static List<String> _splitByJsonBlocks(String input) {
    final result = <String>[];
    final buffer = StringBuffer();
    final stack = <String>[];

    for (var i = 0; i < input.length; i++) {
      final char = input[i];

      if (char == '{' || char == '[') {
        if (stack.isEmpty && buffer.isNotEmpty) {
          result.add(buffer.toString());
          buffer.clear();
        }
        stack.add(char);
      }

      buffer.write(char);

      if ((char == '}' && stack.isNotEmpty && stack.last == '{') ||
          (char == ']' && stack.isNotEmpty && stack.last == '[')) {
        stack.removeLast();
        if (stack.isEmpty) {
          result.add(buffer.toString());
          buffer.clear();
        }
      }
    }

    if (buffer.isNotEmpty) {
      result.add(buffer.toString());
    }

    return result;
  }

  static bool _looksLikeJson(String input) {
    final trimmed = input.trim();
    return (trimmed.startsWith('{') && trimmed.endsWith('}')) ||
        (trimmed.startsWith('[') && trimmed.endsWith(']'));
  }
}
