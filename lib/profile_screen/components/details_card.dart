import '../../consts/consts.dart';

Widget detailsCard({width,String? count,String? title}){
  return Column(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      count!.text.fontFamily(bold).color(darkFontGrey).size(16).make(),
      5.heightBox,
      title!.text.fontFamily(semibold).color(darkFontGrey).size(16).make()

    ],
  ).box.white.width(width).height(80).rounded.padding(const EdgeInsets.all(4)).make();

}