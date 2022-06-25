import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hapook_food/controller/recommended_product_controller.dart';
import 'package:hapook_food/routes/route_helper.dart';
import 'package:hapook_food/utlis/app_constants.dart';
import 'package:hapook_food/utlis/colors.dart';
import 'package:hapook_food/utlis/dimensions.dart';
import 'package:hapook_food/widgets/app_icon.dart';
import 'package:hapook_food/widgets/big_text.dart';
import 'package:hapook_food/widgets/expendable_text_widget.dart';

class RecommendedFoodDetail extends StatelessWidget {
 final int pageId;
  const RecommendedFoodDetail({Key? key,required this.pageId}) : super(key: key);
  @override
  Widget build(BuildContext context) {
      var product=Get.find<RecommendedProductController>().recommendedProductList[pageId];
    return Scaffold(
      backgroundColor: Colors.white,
      body: CustomScrollView  (
        slivers: [
          SliverAppBar(
            automaticallyImplyLeading: false,
            toolbarHeight: 70,
            title: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GestureDetector(
                    onTap: ()=>Get.toNamed(RouteHelper.initial),
                    child: AppIcon(icon: Icons.clear )),
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
                  text: product.name,
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
              background: Image.network(
                AppConstants.BASE_URL+AppConstants.UPLOAD_URI+product.img,
                width: double.maxFinite,
                fit: BoxFit.cover,
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: ExpandableTextWidget(
              text: product.description,
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
                BigText(text: "\$"+product.price.toString()+  "X"+  "0",color: AppColors.mainBlackColor,),
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
                  child: BigText(text: "\$${product.price} Add to Cart ",color: Colors.white,),
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
