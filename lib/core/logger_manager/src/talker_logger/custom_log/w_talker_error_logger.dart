import 'dart:convert';

import 'package:talker_flutter/talker_flutter.dart';

/// Логгер для ошибок с форматированием JSON.
class WTalkerErrorLogger extends TalkerLog {
  WTalkerErrorLogger(dynamic msg, Type runtimeType, String operation, Object? exc, StackTrace? st)
    : super(
        _createMessage(msg, runtimeType, operation),
        stackTrace: st,
        exception: exc,
        logLevel: LogLevel.error,
      );

  @override
  AnsiPen get pen => AnsiPen()..red();

  @override
  String get key => 'error';

  static const _encoder = JsonEncoder.withIndent('  ');

  static String _createMessage(dynamic msg, Type runtimeType, String operation) {
    final result = StringBuffer('[$runtimeType] Failed to $operation.');

    if (msg is Map || msg is List) {
      result
        ..writeln()
        ..write(_encoder.convert(msg));
    } else if (msg != null) {
      result.write(_formatMixedMessage(msg.toString()));
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
