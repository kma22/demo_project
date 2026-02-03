import 'dart:convert';

import 'package:talker_flutter/talker_flutter.dart';

/// A custom logger that prettifies JSON or Map/List data in logs,
/// and enhances log readability by extracting and formatting embedded JSON blocks in strings.
class WTalkerWarningLogger extends TalkerLog {
  /// Creates a log message with [info] level that formats JSON-like structures.
  ///
  /// Accepts any [msg], detects whether it is a [Map], [List], or a [String]
  /// containing embedded JSON, and formats the content with indentation.
  WTalkerWarningLogger(dynamic msg, Type runtimeType)
    : super(_createMessage(msg, runtimeType), logLevel: LogLevel.warning);

  @override
  AnsiPen get pen => AnsiPen()..yellow();

  @override
  String get key => 'warning';

  static const _encoder = JsonEncoder.withIndent('  ');

  /// Creates a formatted message by checking the type of [msg] and formatting it.
  ///
  /// If the message is a [Map] or [List], it's encoded and formatted as pretty JSON.
  /// If it's a [String], the method detects and formats embedded JSON blocks.
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

  /// Processes a [message] that may contain embedded JSON blocks mixed with text.
  ///
  /// Extracts JSON blocks using [_splitByJsonBlocks], attempts to decode and pretty-print them.
  /// If decoding fails, the block is left as-is.
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

  /// Splits a string into separate segments of plain text and JSON blocks.
  ///
  /// Recognizes JSON-like structures delimited by `{}` or `[]`, supports nested structures.
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

  /// Checks if a given [input] string looks like a JSON object or array.
  ///
  /// Returns `true` if it starts and ends with `{}` or `[]`.
  static bool _looksLikeJson(String input) {
    final trimmed = input.trim();
    return (trimmed.startsWith('{') && trimmed.endsWith('}')) ||
        (trimmed.startsWith('[') && trimmed.endsWith(']'));
  }
}
