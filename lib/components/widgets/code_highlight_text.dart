// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_highlight/flutter_highlight.dart';
import 'package:flutter_highlight/themes/night-owl.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quanta/constants/theme.dart';

class CodeHighlighter extends StatelessWidget {
  final String input;

  const CodeHighlighter({super.key, required this.input});

  @override
  Widget build(BuildContext context) {
    final codeBlocks = _parseCodeBlocks(input);
    final screenSize = MediaQuery.sizeOf(context);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: codeBlocks.map((block) {
        if (block.isCode) {
          final langauage = _detectLanguage(block.content);
          return FittedBox(
            fit: BoxFit.fitHeight,
            child: Container(
              width: screenSize.width,
              decoration: BoxDecoration(
                color: qcode,
                borderRadius: BorderRadius.circular(10),
              ),
              alignment: Alignment.center,
              child: Padding(
                padding: const EdgeInsets.all(5),
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Column(
                    children: [
                      HighlightView(
                        block.content,
                        language: langauage,
                        theme: nightOwlTheme,
                        padding: const EdgeInsets.only(
                            top: 15, bottom: 15, left: 15, right: 15),
                        tabSize: 30,
                        textStyle: const TextStyle(
                          fontFamily: 'Monospace',
                          fontSize: 13,
                        ),
                      ),
                      ThemeClass.space1,
                      GestureDetector(
                        onTap: () {
                          Clipboard.setData(ClipboardData(text: block.content));
                        },
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            SvgPicture.network(
                              'https://www.svgrepo.com/show/474132/copy.svg',
                              height: 10,
                              width: 10,
                              color: qyellow,
                            ),
                            ThemeClass.space0,
                            Text(
                              'Copy',
                              style: GoogleFonts.poppins(
                                fontSize: 10,
                                color: qyellow,
                              ),
                            )
                          ],
                        ),
                      ),
                      ThemeClass.space0,
                    ],
                  ),
                ),
              ),
            ),
          );
        } else {
          return SelectableText(
            block.content,
            textAlign: TextAlign.justify,
            style: GoogleFonts.poppins(
              fontSize: 12,
              color: qblack,
            ),
          );
        }
      }).toList(),
    );
  }

  List<_Block> _parseCodeBlocks(String input) {
    final blocks = <_Block>[];
    final codeBlockRegex =
        RegExp(r'```(\w*)\n(.*?)\n```', multiLine: true, dotAll: true);
    var lastEnd = 0;

    for (final match in codeBlockRegex.allMatches(input)) {
      if (match.start > lastEnd) {
        blocks.add(_Block(false, input.substring(lastEnd, match.start)));
      }

      final language = match.group(1);
      final code = match.group(2);
      blocks.add(_Block(true, code!, language: language));

      lastEnd = match.end;
    }

    if (lastEnd < input.length) {
      blocks.add(_Block(false, input.substring(lastEnd)));
    }

    return blocks;
  }

  String _detectLanguage(String code) {
    if (RegExp(r'[^\s.]+\.dart').hasMatch(code) ||
        RegExp(r'class [A-Z][\w_]*').hasMatch(code) ||
        RegExp(r'void [A-Z][\w_]*\(').hasMatch(code)) {
      return 'dart';
    } else if (RegExp(r'def [A-Z][\w_]*\(').hasMatch(code) ||
        RegExp(r'import [A-Za-z0-9.]+').hasMatch(code)) {
      return 'python';
    } else if (RegExp(r'function [A-Za-z0-9_]*\(').hasMatch(code) ||
        RegExp(r'var [A-Za-z0-9_]+').hasMatch(code)) {
      return 'javascript';
    } else if (RegExp(r'public class [A-Z][\w_]*').hasMatch(code) ||
        RegExp(r'int [A-Za-z0-9_]+').hasMatch(code)) {
      return 'java';
    } else if (RegExp(r'#include <[A-Za-z0-9./]+>').hasMatch(code) ||
        RegExp(r'int main\(\)').hasMatch(code)) {
      return 'cpp';
    } else if (RegExp(r'%[^\n\r]*\n').hasMatch(code) || // Shell scripting
        RegExp(r'source [A-Za-z0-9_./]+').hasMatch(code)) {
      return 'shell';
    } else if (RegExp(r'function\s+\w+\(').hasMatch(code) || // C#
        RegExp(r'var\s+\w+\s*=\s*\w+').hasMatch(code)) {
      return 'csharp';
    } else if (RegExp(r'package [A-Za-z0-9.]+;').hasMatch(code) || // Kotlin
        RegExp(r'fun\s+\w+\(').hasMatch(code)) {
      return 'kotlin';
    } else if (RegExp(r'BEGIN TRANSACTION;').hasMatch(code) || // SQL
        RegExp(r'SELECT \* FROM').hasMatch(code)) {
      return 'sql';
    } else if (RegExp(r'\$ grep').hasMatch(code) || // Regular expressions
        RegExp(r'^\[').hasMatch(code)) {
      // Common regex delimiters (modify for your needs)
      return 'regex';
    } else if (RegExp(r'//.*\n').hasMatch(code) || // XML comments
        RegExp(r'<[A-Za-z]+').hasMatch(code)) {
      return 'xml';
    } else if (RegExp(r'module\s+[A-Za-z0-9_]+').hasMatch(code) || // Ruby
        RegExp(r'def\s+[A-Za-z0-9_]+').hasMatch(code)) {
      return 'ruby';
    } else {
      return 'Unknown';
    }
  }
}

class _Block {
  final bool isCode;
  final String content;
  final String? language;

  _Block(this.isCode, this.content, {this.language});
}
