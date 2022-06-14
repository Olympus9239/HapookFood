import 'package:flutter/material.dart';
import 'package:hapook_food/utlis/colors.dart';
import 'package:hapook_food/widgets/big_text.dart';
import 'package:hapook_food/widgets/small_text.dart';

import 'food_page_body.dart';

class MainFoodPage extends StatefulWidget {
  const MainFoodPage({Key? key}) : super(key: key);

  @override
  _MainFoodPageState createState() => _MainFoodPageState();
}

class _MainFoodPageState extends State<MainFoodPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          // Showing the header
          Center(
            child: Container(
              margin: EdgeInsets.only(top: 45,bottom: 15),
              padding: EdgeInsets.only(right: 20,left: 20),
              child: Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      children: [
                        BigText(text: "India",color: AppColors.mainColor,),
                        Row(
                          children: [
                            SmallText(text: "Bihar ",color: AppColors.mainBlackColor,),
                            Icon(Icons.arrow_drop_down_rounded),
                          ],
                        )
                      ],
                    ),
                    Container(
                      child: Icon(Icons.search,color: Colors.white,),
                      width: 45,
                      height: 45,
                      decoration: BoxDecoration(
                          color: AppColors.mainColor,

                          borderRadius: BorderRadius.circular(15)
                      ),
                    ),
                  ],
                ),
              ),
            ),

          ),
          // Showing the body
          Expanded(child: SingleChildScrollView(child: FoodPageBody())),
        ],
      ),
    );
  }
}
