import 'package:air_drop/cart_screen/cart_screen.dart';
import 'package:air_drop/category_screen/category_screen.dart';
import 'package:air_drop/controller/home_controller.dart';
import 'package:air_drop/profile_screen/profile_screen.dart';
import 'package:air_drop/views/home_screen/home_screen.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../consts/consts.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    //init home controller
    var controller=Get.put(HomeController());
    var navbarItem =[
      BottomNavigationBarItem(icon: Image.asset(icHome,width: 26,),label: home),
      BottomNavigationBarItem(icon: Image.asset(icCategories,width: 26,),label: categories),
      BottomNavigationBarItem(icon: Image.asset(icCart,width: 26,),label: cart),
      BottomNavigationBarItem(icon: Image.asset(icProfile,width: 26,),label: account)

    ];
    var navBody=[
      HomeScreen(),
      CategoryScreen(),
      CartScreen(),
      ProfileScreen()

    ];
    return Scaffold(
      body: Column(
        children: [
          Obx(
          ()=>Expanded(
              child: navBody.elementAt(controller.currentNavIndex.value) ,
            ),
          ),
        ],
      ),
      bottomNavigationBar:Obx(
            ()=> BottomNavigationBar(
              onTap: (value){
                controller.currentNavIndex.value=value;
              },
              currentIndex: controller.currentNavIndex.value,
          type: BottomNavigationBarType.fixed,
          selectedItemColor: redColor,
          selectedLabelStyle: const TextStyle(fontFamily: semibold),
          backgroundColor: whiteColor,
          items:navbarItem,),
      ) ,
    );
  }
}
