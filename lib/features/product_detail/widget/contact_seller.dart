import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:softbenz_task/core/services/notification_service.dart';
import 'package:softbenz_task/core/utils/size_utils.dart';
import 'package:softbenz_task/core/utils/text_utils.dart';
import 'package:softbenz_task/core/widgets/buttons/custom_filled_button.dart';
import 'package:softbenz_task/gen/colors.gen.dart';
import 'package:softbenz_task/gen/fonts.gen.dart';

class ContactSeller extends StatefulWidget {
  const ContactSeller({super.key});

  @override
  State<ContactSeller> createState() => _ContactSellerState();
}

class _ContactSellerState extends State<ContactSeller> {
  TextEditingController messageController = TextEditingController();
  bool isContactSeller = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          width: 30.w,
          child: CustomFilledButton(
            onPressed: () {
              isContactSeller = true;
              setState(() {});
            },
            title: "Contact Seller",
            fontColor: ColorName.colorWhite,
            fontFamily: FontFamily.barlowBold,
            containerPadding:
                EdgeInsets.symmetric(vertical: 12.hp, horizontal: 10.wp),
            fontSize: 14.hp,
            fontWeight: FontWeight.w600,
          ),
        ),
        SizedBox(
          height: 10.hp,
        ),
        Visibility(
            visible: isContactSeller,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                customTextField(messageController),
                SizedBox(
                  height: 10.hp,
                ),
                SizedBox(
                  width: 20.w,
                  child: CustomFilledButton(
                    onPressed: () async {
                      if (messageController.text.isNotEmpty) {
                        RemoteMessage message = RemoteMessage(
                          notification: RemoteNotification(
                            title: "Thank you for Contacting Us",
                          ),
                          data: {
                            'type': 'msg',
                            'id': '123',
                          },
                        );

                        await NotificationServices().showNotification(message);

                        messageController.clear();
                        FocusScope.of(context).unfocus();
                      }
                    },
                    title: "Submit",
                    fontColor: ColorName.colorWhite,
                    fontFamily: FontFamily.barlowBold,
                    containerPadding: EdgeInsets.symmetric(
                        vertical: 12.hp, horizontal: 10.wp),
                    fontSize: 14.hp,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            )),
      ],
    );
  }
}
