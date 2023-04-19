import 'package:air_drop/services/firestore_services.dart';
import 'package:air_drop/widgets_common/loading_indicator.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import '../../consts/consts.dart';

class OrderScreen extends StatelessWidget {
  const OrderScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(      backgroundColor: whiteColor,

        appBar: AppBar(
          title:
              "My Orders".text.fontFamily(semibold).color(darkFontGrey).make(),
        ),
        body: StreamBuilder(
          stream:FireStoreServices.getAllOrders(),
          builder:
              (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
            if (!snapshot.hasData) {
              return Center(
                child: loadingIndicator(),
              );
            }
            else if (snapshot.data!.docs.isEmpty){
              return "No Orders Yet!".text.fontFamily(regular).color(darkFontGrey).makeCentered();
            }
            else {
              var data=snapshot.data!.docs;
              
              return ListView.builder(
                itemCount: data.length,
                  itemBuilder: (BuildContext context,int index){
                  return ListTile(
                    leading: "${index+1}".text.fontFamily(bold).color(darkFontGrey).xl.make(),
                    title: data[index]['order_code'].toString().text.color(redColor).fontFamily(semibold).make(),
                    subtitle:data[index]['total_amount'].toString().text.color(darkFontGrey).fontFamily(bold).make(),
                    trailing: IconButton(onPressed: (){}, icon: const Icon(Icons.arrow_forward_ios_rounded,color: darkFontGrey,),),

                  );
                  });
            }
          },
        ));
  }
}
