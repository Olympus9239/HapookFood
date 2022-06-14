import 'package:get/get.dart';

class Dimensions{
  static double screenHeight=Get.context!.height;
  static double screenWidth=Get.context!.width;
  static double pageView=screenHeight/2.6;
  static double pageViewContainer=screenHeight/3.84;      //home page pe advertisment banner ka size hai
  static double pageViewTextContainer=screenHeight/6.03;// ye value ration kaise liya jaane ke liye part 1 2:12:0 pe jao

// dynamic height padding and margin
  static double height10=screenHeight/84.4;
  static double height20=screenHeight/42.2;
  static double height15=screenHeight/56.27;
  static double height30=screenHeight/28.13;
  static double height45=screenHeight/18.76;


// dynamic width padding and margin
  static double width10=screenWidth/84.4;
  static double width20=screenWidth/42.2;
  static double width15=screenWidth/56.27;
  static double width30=screenWidth/28.13;

// font size
  static double font20=screenHeight/42.2;
  static double font15=screenHeight/56.27;
  static double font26=screenHeight/32.46;

  static double radius20=screenHeight/42.2;
  static double radius30=screenHeight/28.13;


// icon size
  static double iconSize24=screenHeight/25.17 ;
  static double iconSize16 = screenHeight/52.75;

  //list view size
static double listViewImgSize = screenWidth/3.25;
static double listViewTextContSize=screenWidth/3.9;

//popular food

static double popularFoodImageSize=screenHeight/2.41;

// bottom height

static double bottomHeightBar=screenHeight/7.03;



}
