import 'package:air_drop/consts/lists.dart';
import 'package:air_drop/profile_screen/components/details_card.dart';
import 'package:air_drop/widgets_common/bg_widget.dart';

import '../../consts/consts.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return bgWidget(
      child: Scaffold(
        body: SafeArea(
          child: Column(
            children: [
              //edit profile button
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Align(
                  alignment: Alignment.topRight,
                    child: Icon(Icons.edit,color: Colors.white,)).onTap(() { }),
              ),
              //users details section
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8),
                child: Row(
                  children: [
                    Image.asset(imgProfile2,width: 100,fit: BoxFit.cover,).box.roundedFull.clip(Clip.antiAlias).make(),
                    10.widthBox,
                    Expanded(child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        "Dummy User".text.white.fontFamily(semibold).make(),
                        5.heightBox,
                        "Cutomer@gmail.com".text.white.make(),

                      ],
                    )),
                    OutlinedButton(onPressed: () {},
                        style: OutlinedButton.styleFrom(
                          side: BorderSide(
                            color: whiteColor
                          )
                        ),
                        child:logout.text.fontFamily(semibold).white.make()
                    )
                  ],
                ),
              ),
              20.heightBox,
              Row(
    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  detailsCard(count: "00",title: "Cart",width: context.screenWidth/3.4),
                  detailsCard(count: "32",title: "Wishlist",width: context.screenWidth/3.4),
                  detailsCard(count: "647",title: "Orders",width: context.screenWidth/3.4)


                ],
              ),

              //buttons section
              ListView.separated(
                shrinkWrap: true,
                  separatorBuilder: (context,index){
                  return const Divider(color: lightGrey,);
                  }, itemCount: profileButtonsList.length, itemBuilder: (BuildContext context, int index) {
                  return ListTile(
                    leading:Image.asset(profileButtonIcons[index],width: 22,) ,
                    title: profileButtonsList[index].text.fontFamily(semibold).color(darkFontGrey).make()
                  );

              },).box.white.rounded.margin(EdgeInsets.all(12)).padding(EdgeInsets.symmetric(horizontal: 16)).shadowSm.make().box.color(redColor).make()
            ],
          ),
        ),
      )
    );
  }
}
