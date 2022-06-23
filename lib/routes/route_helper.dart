import 'package:get/get.dart';
import 'package:hapook_food/pages/food/popular_food_detail.dart';
import 'package:hapook_food/pages/food/recommended_food_detail.dart';
import 'package:hapook_food/pages/home/main_food_page.dart';

class RouteHelper{
  static const String initial="/";
  static const  String popularFood="/popular-food";
  static const  String recommendedFood="/recommended-food";



  static String getPopularFood()=> '$popularFood';
  static String getinitialRoute()=>'$initial';
  static String getrecommendedFood()=>'$recommendedFood';

  static List<GetPage> routes=[
    GetPage(name: initial, page: ()=>MainFoodPage()),
    GetPage(name: popularFood,page: ()=>PopularFoodDetail(),
    transition: Transition.fadeIn
    ),
    GetPage(name: recommendedFood,page: ()=>RecommendedFoodDetail( ),
        transition: Transition.fadeIn
    ),


  ];
}