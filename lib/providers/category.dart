import 'package:flutter/material.dart';
import '../helpers/category.dart';
import '../models/category.dart';

class CategoryProvider with ChangeNotifier{
  CategoryServices _categoryServices = CategoryServices();
  List<CategoryModel> categories = [];
  List<String> catrgoriesNames = [];
  String selectedCategory;

  CategoryProvider.initialize(){
    loadCategories();
  }

  loadCategories()async{
    categories = await _categoryServices.getCategories();
    for(CategoryModel category in categories){
      catrgoriesNames.add(category.name);
    }
    selectedCategory = catrgoriesNames[0];
    notifyListeners();
  }

  changeSelectedCategory({String newCategory}){
    selectedCategory = newCategory;
    notifyListeners();
  }
}