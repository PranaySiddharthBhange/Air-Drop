import 'package:air_drop/consts/consts.dart';
import 'package:air_drop/controller/home_controller.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

class CartController extends GetxController{

  //text controller for shipping details
  var addressController=TextEditingController();
  var cityController=TextEditingController();
  var stateController=TextEditingController();
  var postalcodeController=TextEditingController();
  var phoneController=TextEditingController();
  var placingOrder=false.obs;

  var paymentIndex=0.obs;

  late dynamic productSnapshot;

  var products =[];

  var totalP=0.obs;
  calculate(data){
    totalP.value=0;
    for(var i=0;i<data.length;i++){
      totalP.value=totalP.value+int.parse(data[i]['tprice'].toString());
    }
  }
   changePaymentIndex(index){
    paymentIndex.value=index;
   }

   //
  placeMyOrder({required orderPaymentMethod,required totalAmount})async{
    placingOrder(true);

    await getProductDetails();

    await fireStore.collection(ordersCollection).doc().set({

      'order_by':currentUser!.uid,
      'order_by_name':Get.find<HomeController>().username,
      'order_by_email':currentUser!.email,
      'order_by_address':addressController.text,
      'order_by_state':stateController.text,
      'order_by_city':cityController.text,
      'order_by_phone':phoneController.text,
      'order_by_postal':postalcodeController.text,
      'shipping_method':"Home Delivery",
      'payment_method':orderPaymentMethod,
      'order_placed':true,
      'order_code':"12754712",
      'order_confirmed':false,
      'order_delivered':false,
      'order_on_delivery':false,
      'total_amount':totalAmount,
      'orders':FieldValue.arrayUnion(products)
    });
    placingOrder(false);

  }

 getProductDetails(){
    products.clear();
    for(var i=0;i<productSnapshot.length;i++){
      products.add({
        'color':productSnapshot[i]['color'],
        'img':productSnapshot[i]['img'],
        'vendor_id':productSnapshot[i]['vendor_id'],
        'tprice':productSnapshot[i]['tprice'],
        'qty':productSnapshot[i]['qty'],
        'title':productSnapshot[i]['title'],
      });
    }
 }

 clearCart(){
    for(var i=0;i<productSnapshot.length;i++){
      fireStore.collection(cartCollection).doc(productSnapshot[i].id).delete();
    }
 }

}