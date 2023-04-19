import 'package:air_drop/services/firestore_services.dart';
import 'package:air_drop/widgets_common/loading_indicator.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import '../../consts/consts.dart';

class MessagesScreen extends StatelessWidget {
  const MessagesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: whiteColor,
        appBar: AppBar(
          title:
          "My Messages".text.fontFamily(semibold).color(darkFontGrey).make(),
        ),
        body: StreamBuilder(
          stream:FireStoreServices.getAllMessages(),
          builder:
              (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
            if (!snapshot.hasData) {
              return Center(
                child: loadingIndicator(),
              );
            }
            else if (snapshot.data!.docs.isEmpty){
              return "No Messages Yet!".text.fontFamily(regular).color(darkFontGrey).makeCentered();
            }
            else {
              return Container();
            }
          },
        ));
  }
}
