// ignore_for_file: deprecated_member_use

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:quanta/components/greeting_sectiomn.dart';
import 'package:quanta/components/chat_page_appbar.dart';
import 'package:quanta/components/widgets/code_highlight_text.dart';
import 'package:quanta/interface/views/animations/shimmer_loading.dart';
import 'package:quanta/interface/reusable/submit_button.dart';
import 'package:quanta/interface/reusable/user_input_box.dart';
import 'package:quanta/constants/theme.dart';
import 'package:http/http.dart' as http;

class ChatPage extends StatefulWidget {
  const ChatPage({super.key});

  @override
  State<ChatPage> createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  String prompt = '';
  String response = '';
  bool isLoading = false;
  final String serverUrl = 'https://server-b848.onrender.com/generate';

  void handlerPromptChange(String newPrompt) {
    setState(() {
      prompt = newPrompt;
    });
  }

  Future<void> handleQueryButtonPress() async {
    try {
      setState(() {
        isLoading = true;
      });
      final response = await http.post(
        Uri.parse(serverUrl),
        body: jsonEncode({'prompt': prompt}),
        headers: {'Content-Type': 'application/json'},
      );

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        setState(() {
          this.response = data['text'];
          isLoading = false;
        });
      } else {
        setState(() {
          this.response = 'Error: ${response.statusCode}';
          isLoading = false;
        });
      }
    } catch (error) {
      setState(() {
        response = 'Error: $error';
        isLoading = false;
      });
    }
  }

  double getBottomInsets() {
    if (MediaQuery.of(context).viewInsets.bottom >
        MediaQuery.of(context).viewPadding.bottom) {
      return MediaQuery.of(context).viewInsets.bottom -
          MediaQuery.of(context).viewPadding.bottom;
    }
    return 0;
  }

  String responseBoldCheck(String boldtxt) {
    return boldtxt.replaceAll('*', '');
  }

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.sizeOf(context);
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: const PreferredSize(
        preferredSize: Size.fromHeight(50),
        child: ChatPageAppBar(),
      ),
      backgroundColor: qwhite,
      floatingActionButtonAnimator: FloatingActionButtonAnimator.scaling,
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: Padding(
        padding: EdgeInsets.only(bottom: getBottomInsets()),
        child: Container(
          height: screenSize.height * 0.1,
          decoration: const BoxDecoration(
            color: qwhite,
            border: Border(
              top: BorderSide(width: 0.7, color: qgrey),
            ),
          ),
          alignment: Alignment.center,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    decoration: const BoxDecoration(
                      color: qwhite,
                    ),
                    width: screenSize.width * 0.87,
                    child: FloatingActionButton(
                      backgroundColor: qwhite,
                      clipBehavior: Clip.antiAliasWithSaveLayer,
                      focusElevation: 0,
                      hoverElevation: 0,
                      elevation: 0,
                      highlightElevation: 0,
                      disabledElevation: 0,
                      isExtended: true,
                      tooltip: 'Chat Now',
                      onPressed: () {},
                      child: UserInputBox(
                        onChanged: handlerPromptChange,
                      ),
                    ),
                  ),
                  SubmitButton(
                    click: handleQueryButtonPress,
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(left: 10),
                child: Text(
                  'Quanta uses GenAI, Check for mistakes',
                  style: ThemeClass.heading6,
                ),
              )
            ],
          ),
        ),
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Padding(
          padding: ThemeClass.padding0,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const GreetingSection(),
              ThemeClass.space1,
              AnimatedContainer(
                duration: const Duration(milliseconds: 500),
                height: isLoading ? screenSize.height * 0.15 : null,
                child: isLoading
                    ? const ShimmerLoadingAnimation()
                    : CodeHighlighter(input: responseBoldCheck(response)),
                // : Text(
                //     responseBoldCheck(response),
                //     textAlign: TextAlign.justify,
                //     style: ThemeClass.heading4,
                //   ),
              ),
              const Gap(150),
            ],
          ),
        ),
      ),
    );
  }
}
