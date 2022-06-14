import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hapook_food/data/repository/popular_product_repo.dart';
import 'package:hapook_food/models/products_model.dart';

class PopularProductController extends GetxController{
  final PopularProductRepo popularProductRepo;

  PopularProductController({required this.popularProductRepo});
   List<ProductModel>  _popularProductList=[];
   List<ProductModel>  get popularproductlist => _popularProductList;

   bool _isLoaded=false;
   bool get isLoaded=>_isLoaded;


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
 }