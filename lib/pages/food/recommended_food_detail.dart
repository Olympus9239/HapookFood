import 'package:flutter/material.dart';
import 'package:hapook_food/utlis/colors.dart';
import 'package:hapook_food/utlis/dimensions.dart';
import 'package:hapook_food/widgets/app_icon.dart';
import 'package:hapook_food/widgets/big_text.dart';
import 'package:hapook_food/widgets/expendable_text_widget.dart';

class RecommendedFoodDetail extends StatelessWidget {
  const RecommendedFoodDetail({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: CustomScrollView  (
        slivers: [
          SliverAppBar(
            toolbarHeight: 70,
            title: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                AppIcon(icon: Icons.clear),
                AppIcon(icon: Icons.shopping_cart_outlined),
              ],
            ),
            bottom: PreferredSize(
              preferredSize: Size.fromHeight(20),
              child: Container(
                //    margin: EdgeInsets.only(left: Dimensions.width20,right: Dimensions.width20),
                child: Center(
                    child: BigText(
                  size: Dimensions.font26,
                  text: "Chinese Side",
                )),
                width: double.maxFinite,
                padding: EdgeInsets.only(top: 5, bottom: 10),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topRight: Radius.circular(Dimensions.radius20),
                      topLeft: Radius.circular(Dimensions.radius20),
                    )),
              ),
            ),
            expandedHeight: 300,
            pinned: true,
            backgroundColor: AppColors.yellowColor,
            flexibleSpace: FlexibleSpaceBar(
              background: Image.asset(
                "assets/image/food0.png",
                width: double.maxFinite,
                fit: BoxFit.cover,
              ),
            ),
          ),
          const SliverToBoxAdapter(
            child: ExpandableTextWidget(
              text:
                  "Chicken chilly is tasty,Chicken chilly is tasty,Chicken chilly is tasty,Chicken chilly is tastyChicken chilly is tastyChicken chilly is tastyChicken chilly is tastyChicken chilly is tastyChicken chilly is tastyChicken chilly is tastyChicken chilly is tastyChicken chilly is tastyChicken chilly is tastyChicken chilly is tastyChicken chilly is tastyChicken chilly is tastyChicken chilly is tastyChicken chilly is tastyChicken chilly is tastyChicken chilly is tastyChicken chilly is tastyChicken chilly is tastyChicken chilly is tastyChicken chilly is tastyChicken chilly is tastyChicken chilly is tastyChicken chilly is tastyChicken chilly is tastyChicken chilly is tastyChicken chilly is tastyChicken chilly is tastyChicken chilly is tastyChicken chilly is tastyChicken chilly is tastyChicken chilly is tastyChicken chilly is tastyChicken chilly is tastyChicken chilly is tastyChicken chilly is tastyChicken chilly is tastyChicken chilly is tastyChicken chilly is tastyChicken chilly is tastyChicken chilly is tastyChicken chilly is tastyChicken chilly is tastyChicken chilly is tastyChicken chilly is tastyChicken chilly is tastyChicken chilly is tastyChicken chilly is tastyChicken chilly is tastyChicken chilly is tastyChicken chilly is tastyChicken chilly is tastyChicken chilly is tastyChicken chilly is tastyChicken chilly is tastyChicken chilly is tastyChicken chilly is tastyChicken chilly is tastyChicken chilly is tastyChicken chilly is tastyChicken chilly is tastyChicken chilly is tastyChicken chilly is tastyChicken chilly is tastyChicken chilly is tastyChicken chilly is tastyChicken chilly is tastyChicken chilly is tastyChicken chilly is tastyChicken chilly is tastyChicken chilly is tastyChicken chilly is tastyChicken chilly is tastyChicken chilly is tastyChicken chilly is tastyChicken chilly is tastyChicken chilly is tastyChicken chilly is tastyChicken chilly is tastyChicken chilly is tastyChicken chilly is tastyChicken chilly is tasty",
            ),
          )
        ],
      ),
      bottomNavigationBar: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            padding: EdgeInsets.only(
              top: Dimensions.height10,
              bottom: Dimensions.height10,
              left: Dimensions.width20*3.5,
              right: Dimensions.width20*3.5,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                AppIcon(
                  size: Dimensions.iconSize24,
                  icon: Icons.remove,
                  backgroundColor: AppColors.mainColor,
                  iconColor: Colors.white,

                ),
                BigText(text: "\$12.88"+"X"+"0",color: AppColors.mainBlackColor,),
                AppIcon(
                  size: Dimensions.iconSize24,
                  icon: Icons.add,
                  backgroundColor: AppColors.mainColor,
                  iconColor: Colors.white,

                )
              ],
            ),
          ),
          Container(
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
                  child: Icon(
                    Icons.favorite,
                    color: AppColors.mainColor,
                  )
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
        ],
      ),
    );
  }
}
