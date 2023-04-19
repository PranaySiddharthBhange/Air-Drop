import 'package:air_drop/consts/lists.dart';
import 'package:air_drop/controller/cart_controller.dart';
import 'package:air_drop/views/home_screen/home_screen.dart';
import 'package:air_drop/widgets_common/loading_indicator.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../consts/consts.dart';
import '../widgets_common/our_button.dart';

class PaymentMethods extends StatelessWidget {
  const PaymentMethods({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    var controller=Get.find<CartController>();

    return Obx(()=>
      Scaffold(
        bottomNavigationBar: SizedBox(
            height: 60,
            child: controller.placingOrder.value?Center(child: loadingIndicator(),):ourButton(
                onPress: () async{
                  await controller.placeMyOrder(orderPaymentMethod: paymentMethod[controller.paymentIndex.value],totalAmount: controller.totalP.value);

                  await controller.clearCart();
                  VxToast.show(context, msg: "Order Placed");
                  Navigator.push(context, MaterialPageRoute(builder: (context) => HomeScreen(),));
                  // Get.to(()=>HomeScreen());
                },
                color: redColor,
                textColor: whiteColor,
                title: "Place My Order")),
        backgroundColor: whiteColor,
        appBar: AppBar(
          title: "Choose Payment Method"
              .text
              .fontFamily(semibold)
              .color(darkFontGrey)
              .make(),
        ),
        body: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Obx(()=>
            Column(
              children: List.generate(paymentMethodImg.length, (index) {
                return GestureDetector(
                  onTap: (){
                    controller.changePaymentIndex(index);
                  },
                  child: Container(
                    clipBehavior: Clip.antiAlias,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        border: Border.all(
                            color: controller.paymentIndex.value==index?redColor:Colors.transparent, width: 4, style: BorderStyle.solid)),
                    margin: const EdgeInsets.only(bottom: 8),
                    child: Stack(children: [
                      Image.asset(
                        paymentMethodImg[index],
                        width: double.infinity,
                        height: 120,
                        fit: BoxFit.cover,
                        colorBlendMode: controller.paymentIndex.value==index?BlendMode.darken:BlendMode.color,
                        color: controller.paymentIndex.value==index?Colors.black.withOpacity(0.4):Colors.transparent,
                      ),
                      controller.paymentIndex.value==index?Transform.scale(
                        alignment: Alignment.topRight,
                        scale: 1.3,
                        child: Checkbox(
                            activeColor: Colors.green,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(50)),
                            value: true,
                            onChanged: (value) {}),
                      ):Container(),
                      Positioned(
                        bottom: 0,
                          right: 10,
                          child: paymentMethod[index].text.white.fontFamily(semibold).size(20).make())
                    ]),
                  ),
                );
              }),
            ),
          ),
        ),
      ),
    );
  }
}
