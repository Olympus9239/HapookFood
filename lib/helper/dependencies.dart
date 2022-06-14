import 'package:get/get.dart';
import 'package:hapook_food/controller/popular_product_controller.dart';
import 'package:hapook_food/controller/recommended_product_controller.dart';
import 'package:hapook_food/data/api/api_client.dart';
import 'package:hapook_food/data/repository/popular_product_repo.dart';
import 'package:hapook_food/data/repository/recommended_product_repo.dart';
import 'package:hapook_food/utlis/app_constants.dart';

Future<void>  init()async{
// apiClient
  Get.lazyPut(() => ApiClient(appBaseUrl: AppConstants.BASE_URL));
  // repos
  Get.lazyPut(() => PopularProductRepo(apiClient: Get.find()));
  Get.lazyPut(() => RecommendedProductRepo(apiClient: Get.find()));


  //controllers 
  Get.lazyPut(() => PopularProductController(popularProductRepo: Get.find()));
  Get.lazyPut(() => RecommendedProductController(recommendedProductRepo: Get.find()));



}