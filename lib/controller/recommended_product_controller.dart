import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hapook_food/data/repository/popular_product_repo.dart';
import 'package:hapook_food/data/repository/recommended_product_repo.dart';
import 'package:hapook_food/models/products_model.dart';

class RecommendedProductController extends GetxController{
  final RecommendedProductRepo recommendedProductRepo;

  RecommendedProductController({required this.recommendedProductRepo});
  List<ProductModel>  _recommendedProductList=[];
  List<ProductModel>  get recommendedProductList => _recommendedProductList;

  bool _isLoaded=false;
  bool get isLoaded=>_isLoaded;


  Future<void>  getRecommendedProduct()async{
    Response response= await recommendedProductRepo.getRecommendedProductList();
    if(response.statusCode==200){
      print("got products");
      _recommendedProductList=[];
      _recommendedProductList.addAll(Product.fromJson(response.body).products);
      //    print(_popularProductList);
      _isLoaded=true;
      update();

    }else{

    }
  }
}