import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hapook_food/controller/popular_product_controller.dart';
import 'package:hapook_food/controller/recommended_product_controller.dart';
import 'package:hapook_food/pages/food/popular_food_detail.dart';
import 'package:hapook_food/pages/food/recommended_food_detail.dart';
import 'package:hapook_food/pages/home/food_page_body.dart';
import 'package:hapook_food/pages/home/main_food_page.dart';
import 'package:hapook_food/routes/route_helper.dart';
import 'helper/dependencies.dart' as dep;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await  dep.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    Get.find<PopularProductController>().getPopularProduct();
    Get.find<RecommendedProductController>().getRecommendedProduct();

    return GetMaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,

      home: MainFoodPage(),
      initialRoute: RouteHelper.initial,
      getPages: RouteHelper.routes,
    );
  }
}
