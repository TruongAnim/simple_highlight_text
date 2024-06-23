import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:simple_highlight_text/simple_highlight_text.dart';

void main() {
  testWidgets('HighlightedText shows highlighted keywords',
      (WidgetTester tester) async {
    const text = 'This is a sample text with keywords to highlight.';
    const keywords = ['sample', 'keywords', 'highlight'];
    const highlightColor = Colors.yellow;

    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: SimpleHighlightText(
            text: text,
            keywords: keywords,
            highlightColor: highlightColor,
            onTap: (keyword) {
              print('Tapped on: $keyword');
            },
          ),
        ),
      ),
    );
    // Verify the background color of the highlighted keywords
    final richTextFinder = find.byType(RichText);
    expect(richTextFinder, findsOneWidget);
    final RichText richText = tester.firstWidget(richTextFinder);
    final TextSpan span = richText.text as TextSpan;

    span.children!.forEach((childSpan) {
      if (keywords.contains(childSpan.toPlainText())) {
        expect(childSpan.style!.backgroundColor, highlightColor);
      }
    });
  });
}
