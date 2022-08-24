import 'package:flutter/material.dart';

class EmojiText extends StatelessWidget {
  const EmojiText({
    Key? key,
    required this.text,
    required this.size,
  }) : super(key: key);

  final String text;
  final double size;
  @override
  Widget build(BuildContext context) {
    return RichText(
      text: _buildText(text, size),
    );
  }

  TextSpan _buildText(String text, double size) {
    final children = <TextSpan>[];
    final runes = text.runes;

    for (int i = 0; i < runes.length; /* empty */) {
      int current = runes.elementAt(i);

      // we assume that everything that is not
      // in Extended-ASCII set is an emoji...
      final isEmoji = current > 255;
      final shouldBreak = isEmoji ? (x) => x <= 255 : (x) => x > 255;

      final chunk = <int>[];
      while (!shouldBreak(current)) {
        chunk.add(current);
        if (++i >= runes.length) break;
        current = runes.elementAt(i);
      }

      children.add(
        TextSpan(
            text: String.fromCharCodes(chunk),
            style: TextStyle(fontSize: size)),
      );
    }

    return TextSpan(children: children);
  }
}



// This is emoji file it has can make rich text:  text + emoji , it reads all kinds of emojissssssssssssssssssssssssssssssssssssss


