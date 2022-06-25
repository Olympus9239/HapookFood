import 'package:get/get.dart';
import 'package:hapook_food/pages/food/popular_food_detail.dart';
import 'package:hapook_food/pages/food/recommended_food_detail.dart';
import 'package:hapook_food/pages/home/main_food_page.dart';

class RouteHelper{
  static const String initial="/";
  static const  String popularFood="/popular-food";
  static const  String recommendedFood="/recommended-food";



  static String getPopularFood(int pageId)=> '$popularFood?pageId=$pageId';
  static String getinitialRoute()=>'$initial';
  static String getrecommendedFood(int pageId)=>'$recommendedFood?pageId=$pageId';//variable inside a string we use dollar sign

  static List<GetPage> routes=[
    GetPage(name: initial, page: ()=>MainFoodPage()),
    GetPage(name: popularFood,page:(){
      var pageId=Get.parameters['pageId'];
     return   PopularFoodDetail(pageId: int.parse(pageId!),);
    },
      transition: Transition.fadeIn,



    ),
    GetPage(name: recommendedFood,page: (){
      var pageId=Get.parameters['pageId'];
      return  RecommendedFoodDetail(pageId:int.parse(pageId!));
},
        transition: Transition.fadeIn
    ),


  ];
}