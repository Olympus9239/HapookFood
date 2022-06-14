import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import 'package:hapook_food/controller/popular_product_controller.dart';
import 'package:hapook_food/controller/recommended_product_controller.dart';
import 'package:hapook_food/models/products_model.dart';
import 'package:hapook_food/utlis/app_constants.dart';
import 'package:hapook_food/utlis/colors.dart';
import 'package:hapook_food/utlis/dimensions.dart';
import 'package:hapook_food/widgets/app_column.dart';
import 'package:hapook_food/widgets/big_text.dart';
import 'package:hapook_food/widgets/icon_and_text_widget.dart';
import 'package:hapook_food/widgets/small_text.dart';

class FoodPageBody extends StatefulWidget {
   FoodPageBody({Key? key}) : super(key: key);

  @override
  _FoodPageBodyState createState() => _FoodPageBodyState();
}

class _FoodPageBodyState extends State<FoodPageBody> {
  PageController pageController = PageController();
  var _currPagValue = 0.0;
  double _scaleFactor = 0.8;
  double _height = Dimensions.pageViewContainer;
  @override
  void initState() {
    super.initState();
    pageController.addListener(() {
      setState(() {
        _currPagValue = pageController.page!;
        print("Current value is" + _currPagValue.toString());
      });
    });
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    pageController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
       GetBuilder<PopularProductController>(builder:(popularproducts){
         return  popularproducts.isLoaded?Container(
           // color: Colors.redAccent,
           height: Dimensions.pageView,
           child: PageView.builder(
               controller: pageController,
               itemCount: popularproducts.popularproductlist.length,
               itemBuilder: (context, position) {
                 return _buildPageItem(position,popularproducts.popularproductlist[position]);
               }),
         ):CircularProgressIndicator(color: AppColors.mainColor,);
       }),
        GetBuilder<PopularProductController>(builder: (popularproducts){
          return DotsIndicator(
            dotsCount: popularproducts.popularproductlist.isEmpty?1:popularproducts.popularproductlist.length,
            position: _currPagValue,
            decorator: DotsDecorator(
                color: Colors.black87, // Inactive color
                activeColor: AppColors.mainColor,
                size: Size.square(9),
                activeSize: Size(18.0, 9.0),
                activeShape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10))),
          );
        }),
        SizedBox(
          height: Dimensions.height30,
        ),
        Container(
          margin: EdgeInsets.only(left: Dimensions.width30),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              BigText(text: 'Recommended'),
              SizedBox(
                width: Dimensions.width10,
              ),
              Container(
                child: BigText(
                  text: '.',
                  color: Colors.black26,
                ),
              ),
              SizedBox(
                width: Dimensions.width10,
              ),
              SmallText(text: 'Food pairing')
            ],
          ),
        ),

        // list of food and images

         GetBuilder<RecommendedProductController>(builder: (recommendedProduct){
           return recommendedProduct.isLoaded?ListView.builder(
               physics: const NeverScrollableScrollPhysics(),
               shrinkWrap: true,
               itemCount: recommendedProduct.recommendedProductList.length,
               itemBuilder: (context, index) {
                 return Container(
                   margin: EdgeInsets.only(
                       left: Dimensions.width20, right: Dimensions.width20,bottom: Dimensions.width20 ),
                   child: Row(
                     children: [
                       // image section
                       Container(
                         width:Dimensions.listViewImgSize,
                         height: Dimensions.listViewImgSize,
                         decoration: BoxDecoration(
                           borderRadius: BorderRadius.circular(Dimensions.radius20),
                           color: Colors.white38,
                           image: DecorationImage(
                             fit: BoxFit.cover,
                             image: NetworkImage(AppConstants.BASE_URL+AppConstants.UPLOAD_URI+recommendedProduct.recommendedProductList[index].img),
                           ),
                         ),

                       ),
                       // text container
                       Expanded(
                         child: Container(
                           height: Dimensions.listViewImgSize,
                           decoration: BoxDecoration(
                             borderRadius: BorderRadius.only(
                               topRight: Radius.circular(Dimensions.radius20),
                               bottomRight: Radius.circular(Dimensions.radius20),
                             ),
                             color: Colors.white,
                           ),
                           child: Padding(
                             padding: EdgeInsets.only(left: Dimensions.width10,right: Dimensions.width10),
                             child: Column(
                               crossAxisAlignment: CrossAxisAlignment.start,
                               mainAxisAlignment: MainAxisAlignment.center,
                               children: [
                                 BigText(text: recommendedProduct.recommendedProductList[index].name),
                                 SizedBox(height: Dimensions.height10,),
                                 SmallText(text: "With Chinese Charecteristics"),
                                 SizedBox(height: Dimensions.height10,),

                                 Row(
                                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                   children: [
                                     IconAndTextWidget(
                                         icon: Icons.circle_sharp,
                                         text: "Normal ",
                                         iconColor: AppColors.iconColor1),
                                     IconAndTextWidget(
                                         icon: Icons.location_on,
                                         text: "1.7km ",
                                         iconColor: AppColors.mainColor),
                                     IconAndTextWidget(
                                         icon: Icons.access_time_rounded,
                                         text: "32 min",
                                         iconColor: AppColors.iconColor2)
                                   ],
                                 ),

                               ],
                             ),
                           ),
                         ),
                       ),

                     ],
                   ),
                 );
               }):CircularProgressIndicator(
             color: AppColors.mainColor,
           );
         })


      ],
    );
  }

  Widget _buildPageItem(int index, ProductModel popularproduct) {
    Matrix4 matrix = Matrix4.identity();
    if (index == _currPagValue.floor()) {
      // .floor focrefully tells the pg no of currpage value as a natural no
      var currScale = 1 - (_currPagValue - index) * (1 - _scaleFactor);
      var currTrans = _height * (1 - currScale) / 2;
      matrix = Matrix4.diagonal3Values(1, currScale, 1)
        ..setTranslationRaw(0, currTrans, 0);
    } else if (index == _currPagValue.floor() + 1) {
      var currScale =
          _scaleFactor + (_currPagValue - index + 1) * (1 - _scaleFactor);
      var currTrans = _height * (1 - currScale) / 2;
      matrix = Matrix4.diagonal3Values(1, currScale, 1);
      matrix = Matrix4.diagonal3Values(1, currScale, 1)
        ..setTranslationRaw(0, currTrans, 0);
    } else if (index == _currPagValue.floor() - 1) {
      var currScale = 1 - (_currPagValue - index) * (1 - _scaleFactor);
      matrix = Matrix4.diagonal3Values(1, currScale, 1);
    } else {
      var currScale = 0.8;
      matrix = Matrix4.diagonal3Values(1, currScale, 1)
        ..setTranslationRaw(0, _height * (1 - _scaleFactor), 1);
    }
    return Transform(
      transform: matrix,
      child: Stack(
        children: [
          Container(
            margin: EdgeInsets.only(
                left: Dimensions.width10, right: Dimensions.width10),
            height: Dimensions.pageViewContainer,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(Dimensions.radius30),
                color: index.isEven ? Color(0xFF69c5df) : Color(0xFF9294cc),
                image: DecorationImage(
                  image: NetworkImage(AppConstants.BASE_URL+AppConstants.UPLOAD_URI+popularproduct.img),
                  fit: BoxFit.cover,
                )),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              margin: EdgeInsets.only(
                  left: Dimensions.width30,
                  right: Dimensions.width30,
                  bottom: Dimensions.height30),
              height: Dimensions.pageViewTextContainer,
              decoration: BoxDecoration(
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      color: Color(0xFFe8e8e8),
                      blurRadius: 5.0,
                      offset: Offset(0, 5),
                    )
                  ],
                  borderRadius: BorderRadius.circular(Dimensions.radius20)),
              child: Container(
                padding: EdgeInsets.only(
                    top: Dimensions.height15,
                    left: Dimensions.width15,
                    right: Dimensions.width15),
                child: AppColumn(text: popularproduct.name,),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
