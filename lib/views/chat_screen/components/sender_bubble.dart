


import 'package:cloud_firestore/cloud_firestore.dart';
import '../../../consts/consts.dart';
import 'package:intl/intl.dart'as intl;
Widget senderBubble(DocumentSnapshot data) {

  var t=data['created_on']==null?DateTime.now():data['created_on'].toDate();
  var time=intl.DateFormat("h:mma").format(t);
  return Directionality(
    textDirection: data['uid']==currentUser!.uid?TextDirection.rtl:TextDirection.ltr,
    child: Container(

      margin: const EdgeInsets.all(15),
      padding: const EdgeInsets.all(20),
      decoration:  BoxDecoration(
          color: data['uid']==currentUser!.uid ? redColor : darkFontGrey,
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(20),
            topRight: Radius.circular(20),
            bottomLeft: Radius.circular(20),
          )),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          "${data['msg']}".text.white.size(16).make(),
          10.heightBox,
          time.text.color(whiteColor.withOpacity(0.5)).make()
        ],
      ),
    ),
  );
}
