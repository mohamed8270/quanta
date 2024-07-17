import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_svg/svg.dart';
import 'package:quanta/common/styles/static.dart';
import 'package:quanta/common/styles/theme.dart';
import 'package:quanta/common/widgets/interface/snack_bar.dart';
import 'package:quanta/common/widgets/reusable/user_input_box.dart';
import 'package:quanta/data/service/http_client.dart';

class DialogueBoxClass {
  Future<void> mailDialogueBox(BuildContext context, String id) {
    final screenSize = MediaQuery.sizeOf(context);
    var trackController = TextEditingController();
    var text = TextClass();
    MongoDBclass mongoDBclass = Get.put(MongoDBclass());
    return showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          backgroundColor: qwhite,
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SvgPicture.network(
                'https://www.svgrepo.com/show/303264/amazon-2-logo.svg',
                height: 38,
                width: 38,
              ),
              GestureDetector(
                onTap: () => Get.back(),
                child: SvgPicture.network(
                  'https://www.svgrepo.com/show/444605/cross.svg',
                  height: 18,
                  width: 18,
                ),
              ),
            ],
          ),
          content: SizedBox(
            height: screenSize.height * 0.21,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                text.textWidget(
                  'Stay updated with product pricing alerts right in your inbox',
                  14.0,
                  TextClass.w6,
                  qblack,
                ),
                StaticClass.gap0,
                text.textWidget('Never miss a bargain with our timely alerts!',
                    8.0, TextClass.w5, qblack.withOpacity(0.5)),
                StaticClass.gap3,
                text.textWidget('Email Address', 10.0, TextClass.w6, qblack),
                StaticClass.gap0,
                UserTrackInputBox(txt: 'Email', controller: trackController),
              ],
            ),
          ),
          actions: [
            GestureDetector(
              onTap: () async {
                if (trackController.text.isEmpty) {
                  SnackBarClass().errorSnack('Please enter email');
                } else if (trackController.text.isNotEmpty) {
                  mongoDBclass.insertEmail(id, trackController.text);
                  Get.back();
                }
              },
              child: Container(
                height: screenSize.height * 0.055,
                width: screenSize.width,
                decoration: BoxDecoration(
                  color: qblack,
                  borderRadius: BorderRadius.circular(10),
                ),
                alignment: Alignment.center,
                child: text.textWidget('Track', 12.0, TextClass.w6, qwhite),
              ),
            ),
          ],
        );
      },
    );
  }
}
