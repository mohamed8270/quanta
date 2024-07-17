// ignore_for_file: library_private_types_in_public_api, unused_field

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quanta/common/styles/animations/animated_text_container.dart';
import 'package:quanta/common/styles/static.dart';
import 'package:quanta/common/styles/theme.dart';

class ExpandableText extends StatefulWidget {
  final String text;
  final int maxLines;
  final int minLines;

  const ExpandableText(
      {Key? key,
      required this.maxLines,
      required this.minLines,
      required this.text})
      : super(key: key);

  @override
  _ExpandableTextState createState() => _ExpandableTextState();
}

class _ExpandableTextState extends State<ExpandableText> {
  bool _isExpanded = false;
  int? _linesLength;

  Widget expandableText(bool isExpanded) {
    return Text(
      widget.text,
      textAlign: TextAlign.justify,
      overflow: TextOverflow.ellipsis,
      style: GoogleFonts.poppins(
        fontSize: 11.0,
        fontWeight: FontWeight.w500,
        color: qblack,
      ),
      maxLines: isExpanded ? widget.maxLines : widget.minLines,
    );
  }

  @override
  Widget build(BuildContext context) {
    final screeSize = MediaQuery.sizeOf(context);
    var text = TextClass();
    return Column(
      children: [
        AnimatedExpandingContainer(
          isExpanded: _isExpanded,
          expandedWidget: expandableText(true),
          unexpandedWidget: expandableText(false),
        ),
        GestureDetector(
          onTap: () {
            setState(() {
              _isExpanded = !_isExpanded;
            });
          },
          child: SizedBox(
            height: screeSize.height * 0.05,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                text.textWidget(
                  !_isExpanded ? "See More" : "See Less",
                  10.0,
                  TextClass.w6,
                  qblack,
                ),
                StaticClass.gap0,
                Icon(
                  !_isExpanded ? Icons.arrow_downward : Icons.arrow_upward,
                  size: 12,
                  color: qyellow,
                )
              ],
            ),
          ),
        )
      ],
    );
  }
}
