import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hapook_food/data/repository/popular_product_repo.dart';
import 'package:hapook_food/models/products_model.dart';
import 'package:hapook_food/utlis/colors.dart';

class PopularProductController extends GetxController{
  final PopularProductRepo popularProductRepo;

  PopularProductController({required this.popularProductRepo});
   List<ProductModel>  _popularProductList=[];
   List<ProductModel>  get popularproductlist => _popularProductList;

   bool _isLoaded=false;
   bool get isLoaded=>_isLoaded;// we are using get function to get the private isloaded

  int _quantity=0;
  int get quantity=>_quantity;// public quantity using get to get private quantity

  int _intCartItems=0;
  int get intCartItems=>_intCartItems+_quantity;


   Future<void>  getPopularProduct()async{
     Response response=await popularProductRepo.getPopularProductList();
     if(response.statusCode==200){
       print("got products");
       _popularProductList=[];
       _popularProductList.addAll(Product.fromJson(response.body).products);
   //    print(_popularProductList);
       _isLoaded=true;
       update();

     }else{

     }
   }
   // cart controller
void setQuantity(bool isIncrement){
     if(isIncrement){
       print("increament");
       print(quantity.toString());

       _quantity=checkQuantity(_quantity+1);
     }else{
       print("decreament");
       print(quantity.toString());
           _quantity=checkQuantity(_quantity-1);
     }
     update();
}
    int checkQuantity(int quantity){
      if(quantity<0){
        Get.snackbar("Item Count", "You can't reduce more",
        backgroundColor: AppColors.mainColor,
          colorText: Colors.white,
        );

        return 0;

      }else if(quantity>20){
        Get.snackbar("Item Count", "You can't add more",
          backgroundColor: AppColors.mainColor,
          colorText: Colors.white,
        );
        return 20;
      }else{
        return quantity;
      }
    }
    void initProduct(){
     _quantity=0;
    }


 }