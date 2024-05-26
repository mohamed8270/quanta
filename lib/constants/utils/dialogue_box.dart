import 'package:flutter/material.dart';
import 'package:quanta/constants/theme.dart';
import 'package:quanta/constants/utils/snack_bar.dart';
import 'package:quanta/interface/reusable/user_input_box.dart';
import 'package:quanta/service/database/mongo_db.dart';
import 'package:get/get.dart';
import 'package:flutter_svg/svg.dart';

class DialogueBoxClass {
  Future<void> mailDialogueBox(BuildContext context, String id) {
    final screenSize = MediaQuery.sizeOf(context);
    var trackController = TextEditingController();
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
                Text(
                  'Stay updated with product pricing alerts right in your inbox',
                  style: ThemeClass.heading3,
                ),
                ThemeClass.space0,
                Text(
                  'Never miss a bargain with our timely alerts!',
                  style: ThemeClass.heading6,
                ),
                ThemeClass.space3,
                Text('Email Address', style: ThemeClass.heading5),
                ThemeClass.space0,
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
                child: Text('Track', style: ThemeClass.detailDiscountTxt),
              ),
            ),
          ],
        );
      },
    );
  }
}
