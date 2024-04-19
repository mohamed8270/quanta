// ignore_for_file: library_private_types_in_public_api, unused_field

import 'package:flutter/material.dart';
import 'package:quanta/constants/theme.dart';
import 'package:quanta/interface/views/animations/animated_text_container.dart';

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
      style: ThemeClass.detailDescriptionTxt,
      maxLines: isExpanded ? widget.maxLines : widget.minLines,
    );
  }

  @override
  Widget build(BuildContext context) {
    final screeSize = MediaQuery.sizeOf(context);
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
                Text(
                  !_isExpanded ? "See More" : "See Less",
                  style: ThemeClass.heading5,
                ),
                ThemeClass.space0,
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
