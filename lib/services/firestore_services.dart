
import 'package:air_drop/consts/consts.dart';

class FireStoreServices {
  //get user data
  static getUser(uid) {
    return fireStore
        .collection(usersCollection)
        .where('id', isEqualTo: uid)
        .snapshots();
  }

  //get products according to category
  static getProducts(category) {
    return fireStore
        .collection(productsCollection)
        .where('p_category', isEqualTo: category)
        .snapshots();
  }

  //get cart

  static getCart(uid) {
    return fireStore
        .collection(cartCollection)
        .where('added_by', isEqualTo: uid)
        .snapshots();
  }

  //delete document
  static deleteDocument(docId) {
    return fireStore.collection(cartCollection).doc(docId).delete();
  }

  //get all MESSAGES

  static getChatMessages(docId) {
    return fireStore
        .collection(chatCollection)
        .doc(docId)
        .collection(messagesCollection)
        .orderBy(
          'created_on',
          descending: false,
        )
        .snapshots();
  }

  static getAllOrders(){
    return fireStore.collection(ordersCollection).where('order_by',isEqualTo: currentUser!.uid).snapshots();
  }

  static getWishlists(){
    return fireStore.collection(productsCollection).where('p_wishlist',arrayContains: currentUser!.uid).snapshots();
  }

  static getAllMessages(){
    return fireStore.collection(chatCollection).where('fromId',isEqualTo:currentUser!.uid ).snapshots();
  }
}
