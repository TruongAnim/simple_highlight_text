library simple_highlight_text;

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class SimpleHighlightText extends StatelessWidget {
  final String text;
  final List<String> keywords;
  final TextStyle? style;
  final TextStyle? highlightStyle;
  final bool caseSensitive;
  final Color? highlightColor;
  final void Function(String)? onTap;

// RichText
  final TextAlign textAlign;
  final TextDirection? textDirection;
  final bool softWrap;
  final TextOverflow overflow;
  final TextScaler textScaler;
  final int? maxLines;
  final Locale? locale;
  final StrutStyle? strutStyle;
  final TextWidthBasis textWidthBasis;
  final TextHeightBehavior? textHeightBehavior;
  final Color? selectionColor;

  const SimpleHighlightText({
    super.key,
    required this.text,
    required this.keywords,
    this.style,
    this.highlightStyle,
    this.highlightColor,
    this.caseSensitive = false,
    this.onTap,
    this.textAlign = TextAlign.start,
    this.textDirection,
    this.softWrap = true,
    this.overflow = TextOverflow.clip,
    this.textScaler = TextScaler.noScaling,
    this.maxLines,
    this.locale,
    this.strutStyle,
    this.textWidthBasis = TextWidthBasis.parent,
    this.textHeightBehavior,
    this.selectionColor,
  });

  @override
  Widget build(BuildContext context) {
    List<TextSpan> spans = [];
    int start = 0;

    RegExp regExp = RegExp(keywords.map((keyword) => RegExp.escape(keyword)).join('|'), caseSensitive: caseSensitive);
    Iterable<RegExpMatch> matches = regExp.allMatches(text);
    TextStyle? highlight = highlightStyle?.copyWith(backgroundColor: highlightColor);
    highlight ??= const TextStyle().copyWith(backgroundColor: highlightColor);

    final DefaultTextStyle defaultTextStyle = DefaultTextStyle.of(context);
    TextStyle? effectiveTextStyle = style;
    if (style == null || style!.inherit) {
      effectiveTextStyle = defaultTextStyle.style.merge(style);
    }
    if (MediaQuery.boldTextOf(context)) {
      effectiveTextStyle = effectiveTextStyle!.merge(const TextStyle(fontWeight: FontWeight.bold));
    }

    for (RegExpMatch match in matches) {
      if (match.start > start) {
        spans.add(TextSpan(text: text.substring(start, match.start)));
      }
      spans.add(TextSpan(
        text: match.group(0),
        style: highlight,
        recognizer: TapGestureRecognizer()
          ..onTap = () {
            onTap?.call(match.group(0)!);
          },
      ));
      start = match.end;
    }
    if (start < text.length) {
      spans.add(TextSpan(text: text.substring(start)));
    }

    return RichText(
      text: TextSpan(
        style: effectiveTextStyle,
        children: spans,
      ),
      textAlign: textAlign,
      textDirection: textDirection,
      softWrap: softWrap,
      overflow: overflow,
      maxLines: maxLines,
      textScaler: textScaler,
      locale: locale,
      strutStyle: strutStyle,
      textWidthBasis: textWidthBasis,
      textHeightBehavior: textHeightBehavior,
      selectionColor: selectionColor,
    );
  }
}
