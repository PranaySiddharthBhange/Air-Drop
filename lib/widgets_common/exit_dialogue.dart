
import 'package:air_drop/widgets_common/our_button.dart';
import 'package:flutter/services.dart';

import '../consts/consts.dart';

Widget exitDialogue( context) {
  return Dialog(
    child: Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        "Conform".text.fontFamily(bold).color(darkFontGrey).size(18).make(),
        Divider(),
        10.heightBox,
        "Are you sure you want to exit ?"
            .text
            .color(darkFontGrey)
            .size(16)
            .make(),
        10.heightBox,
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            ourButton(color: redColor, textColor: whiteColor, title: "Yes",onPress: (){
              SystemNavigator.pop();
            }),
            ourButton(color: redColor, textColor: whiteColor, title: "No",onPress: (){
              Navigator.pop(context);
            }),
          ],
        )
      ],
    ).box.color(lightGrey).roundedSM.padding(EdgeInsets.all(16)).make(),
  );
}
