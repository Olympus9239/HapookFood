import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:hapook_food/pages/home/main_food_page.dart';
import 'package:hapook_food/utlis/dimensions.dart';
import 'package:hapook_food/widgets/app_column.dart';
import 'package:hapook_food/widgets/app_icon.dart';
import 'package:hapook_food/widgets/expendable_text_widget.dart';
import 'package:hapook_food/widgets/small_text.dart';

import '../../utlis/colors.dart';
import '../../widgets/big_text.dart';
import '../../widgets/icon_and_text_widget.dart';
class PopularFoodDetail extends StatelessWidget {
  const PopularFoodDetail({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          // background image
          Positioned(
            left: 0,
            right: 0,
              child: Container(
             width: double.maxFinite,
              height: Dimensions.popularFoodImageSize,
              decoration: BoxDecoration(
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: AssetImage("assets/image/food0.png"),
                ),
              ),
          )),
          // icon widget
          Positioned(
            top: Dimensions.height45,
              left: Dimensions.width20,
              right: Dimensions.width20,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                      child: AppIcon(icon: Icons.arrow_back_ios, ),
                    onTap:()=> Get.to(()=>MainFoodPage()),


                  ),
                  AppIcon(icon: Icons.shopping_cart_outlined, )

                ],

              )),
          // introduction of food
          Positioned(
             left: 0,
              bottom: 0,
              right: 0,
              top: Dimensions.popularFoodImageSize -20 ,
              child: Container(
               padding: EdgeInsets.only(left: Dimensions.width20,right: Dimensions.width20,top: Dimensions.height20,),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius:BorderRadius.only(
                    topRight: Radius.circular(Dimensions.radius20),
                    topLeft: Radius.circular(Dimensions.radius20),
                  ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    AppColumn(text: 'Chinese Side',),
                    SizedBox(height: Dimensions.height20,),
                    BigText(text: "Introduce"),
                    SizedBox(height: Dimensions.height15,),
                    Expanded(child: SingleChildScrollView(child: ExpandableTextWidget(text: "Bhindi Masala is a well known and often made popular Indian dish and combining it with chicken takes the flavour to a whole new level.  Bhindi Masala is a well known and often made popular Indian dish and combining it with chicken takes the flavour to a whole new level. Bhindi Masala is a well known and often made popular Indian dish and combining it with chicken takes the flavour to a whole new level. Bhindi Masala is a well known and often made popular Indian dish and combining it with chicken takes the flavour to a whole new level.  ")))
                  ],   
                )
          )), 
          // expendable text widget

        ],
      ),
      bottomNavigationBar: Container(
        height: Dimensions.bottomHeightBar ,
        padding: EdgeInsets.only(top: Dimensions.height30,bottom: Dimensions.height30,right: Dimensions.width20,left: Dimensions.width20),
        decoration: BoxDecoration(
          color: AppColors.buttonBackgroundColor,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(Dimensions.radius20*2),
            topRight: Radius.circular(Dimensions.radius20*2),
          )
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
           Container(
             padding: EdgeInsets.only(top: Dimensions.height20,bottom: Dimensions.height20,right: Dimensions.width30,left: Dimensions.width30),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(Dimensions.radius20),
              color: Colors.white
            ),
             child: Row(
               children: [
                 Icon(Icons.remove,color: AppColors.signColor,),
                 SizedBox(width: Dimensions.width10/2,),
                 BigText(text: '0'),
                 SizedBox(width: Dimensions.width10/2,),
                 Icon(Icons.add,color: AppColors.signColor,)
               ],
             ),
           ),
            Container(
              padding: EdgeInsets.only(top: Dimensions.height20,bottom: Dimensions.height20,right: Dimensions.width30,left: Dimensions.width30),
              child: BigText(text: "\$10 | Add to Cart ",color: Colors.white,),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(Dimensions.radius20),
                color: AppColors.mainColor,
              ),
            )
          ],
        ),
      ),
    );
  }
}
