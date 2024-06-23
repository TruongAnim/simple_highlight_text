# Simple Highlight Text Package

A Flutter package that provides a widget to highlight keywords in a given text with a different color and supports tapping on the highlighted keywords.

## Features

- Highlight specified keywords in a text with a custom background color.
- Handle tap events on the highlighted keywords.

## Getting Started

### Installation

Add the following to your `pubspec.yaml`:

```yaml
dependencies:
  simple_highlight_text: ^1.0.0
```

Run flutter pub get to install the package.

Usage
Import the package:

```dart
import 'package:simple_highlight_text/simple_highlight_text.dart';
```

Use the SimpleHighlightText widget in your application:

```dart
Padding(
    padding: const EdgeInsets.all(16.0),
    child: SimpleHighlightText(
        text: 'This is a sample text with keywords to highlight.',
        keywords: ['sample', 'keywords', 'highlight'],
        highlightColor: Colors.yellow,
        onTap: (keyword) {
        print('Tapped on: $keyword');
        },
    ),
)
```

## Parameters

- text: The text to display.
- keywords: A list of keywords to highlight.
- style: TextStyle for normal text
- highlightStyle: TextStyle for the highlight text
- caseSensitive: Should ony highlight the text that math the case.
- highlightColor: The color to use for highlighting the keywords.
- onTap: A callback function that gets called when a highlighted keyword is tapped.

# License

This project is licensed under the MIT License - see the LICENSE file for details.

***Feel free to contribute to this package by opening issues and submitting pull requests. Your contributions are greatly appreciated!***
