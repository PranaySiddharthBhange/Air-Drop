import 'package:air_drop/consts/lists.dart';
import 'package:air_drop/views/auth_screen/signup_screen.dart';
import 'package:air_drop/widgets_common/applogo_widget.dart';
import 'package:air_drop/widgets_common/bg_widget.dart';
import 'package:air_drop/widgets_common/custom_textfield.dart';
import 'package:air_drop/widgets_common/our_button.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../consts/consts.dart';
import '../home_screen/home.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return bgWidget(

        child: Scaffold(
          resizeToAvoidBottomInset: false,
      body: Center(

        child: Column(

          children: [
            (context.screenHeight * 0.1).heightBox,
            applogoWidget(),
            10.heightBox,
            "Log in to $appname".text.fontFamily(bold).white.size(18).make(),
            15.heightBox,


            Column(
              children: [
                customTextField(hint: emailHint, title: email),
                customTextField(hint: passwordHint, title: password),
                Align(
                    alignment: Alignment.centerRight,
                    child: TextButton(
                        onPressed: () {}, child: forgetPass.text.make())),
                5.heightBox,
                // ourButton().box.width(context.screenWidth-50).make(),
                ourButton(
                        color: redColor,
                        title: login,
                        textColor: whiteColor,
                        onPress: () {
                          Get.to(()=>Home());
                        })
                    .box
                    .width(context.screenWidth - 50)
                    .make()
              ],
            ).box.white.rounded.padding(EdgeInsets.all(16)).width(context.screenWidth).white.make(),
            5.heightBox,
            createNewAccount.text.color(fontGrey).make(),
            5.heightBox,
            ourButton(
                color: lightGolden,
                title: signUp,
                textColor: redColor,
                onPress: () {
                  Get.to(()=> signupScreen());
                })
                .box
                .width(context.screenWidth - 130)
                .make(),
            10.heightBox,
            loginWith.text.color(fontGrey).make(),
            5.heightBox,
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children:
                List.generate(3, (index) => Padding(
                  padding: EdgeInsets.all(8),
                  child: CircleAvatar(
                    backgroundColor: lightGrey,
                    radius: 25,
                    child: Image.asset(socialIconList[index],width: 30,),
                  ),
                ))
            )
          ],

        ).box.white.rounded.padding(const EdgeInsets.fromLTRB(16,16, 16,16)).width(context.screenWidth-70).shadow.make()
      )

    )
    );
  }
}
// 32:27