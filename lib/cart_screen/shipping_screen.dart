import 'package:air_drop/cart_screen/payment_method.dart';
import 'package:air_drop/controller/cart_controller.dart';
import 'package:air_drop/widgets_common/custom_textfield.dart';
import 'package:air_drop/widgets_common/our_button.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../consts/consts.dart';

class ShippingDetails extends StatelessWidget {
  const ShippingDetails({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var controller = Get.find<CartController>();
    return Scaffold(
      backgroundColor: whiteColor,
      bottomNavigationBar: SizedBox(
          height: 60,
          child: ourButton(
              onPress: () {
                if(controller.addressController.text.length>10){
                  Get.to(()=>PaymentMethods());
                }
                else{
                  VxToast.show(context, msg:"Please Fill the form");

                }

              },
              color: redColor,
              textColor: whiteColor,
              title: "Continue")),
      appBar: AppBar(
        title: "Shipping Info"
            .text
            .fontFamily(semibold)
            .color(darkFontGrey)
            .make(),
      ),
      body: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          children: [
            customTextField(
                title: "Address",
                isPass: false,
                hint: "Enter Delivery Address",
                controller: controller.addressController),
            customTextField(
                title: "City",
                isPass: false,
                hint: "City",
                controller: controller.cityController),
            customTextField(
                title: "State",
                isPass: false,
                hint: "State",
                controller: controller.stateController),
            customTextField(
                title: "Postal Code",
                isPass: false,
                hint: "Postal Code",
                controller: controller.postalcodeController),
            customTextField(
                title: "Phone ",
                isPass: false,
                hint: "Phone",
                controller: controller.phoneController),
          ],
        ),
      ),
    );
  }
}
