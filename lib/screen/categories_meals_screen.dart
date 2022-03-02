import 'package:flutter/material.dart';
import 'package:food_appp/model/meal.dart';
import 'package:food_appp/widget/meal_item.dart';

class CategoriesMealsScreen extends StatelessWidget {
  // membuat var untuk nama routes nya
  static const routeName = '/categories-meals';

  @override
  Widget build(BuildContext context) {
    //menyambungkan argumen yang dikirim
    final routeArgs = ModalRoute.of(context)!.settings.arguments as Map<String?, String?>;
    final categoryId = routeArgs["id"];
    final categoryTittle = routeArgs ["tittle"];
    //membuat variable untuk memfilter datanya sesuai dengan apa yang kita klik dan menampilkannya dengan bentuk list
    final categoryMeal = meals.where((mealItem) => mealItem.categories.contains(categoryId) ).toList();
    return Scaffold(
      appBar: AppBar(
        title: Text(categoryTittle!),
      ),
      body: ListView.builder(
          itemBuilder: (context, index){
            return MealItem(
                id: categoryMeal[index].id,
                tittle: categoryMeal[index].title,
                imgUrl: categoryMeal[index].imgurl,
                duration: categoryMeal[index].duration,
                complexity: categoryMeal[index].complexity,
                afforfability: categoryMeal[index].afforfability
            );
          },
        itemCount: categoryMeal.length,
          ),
    );
  }
}
