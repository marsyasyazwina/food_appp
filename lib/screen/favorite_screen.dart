import 'package:flutter/material.dart';
import 'package:food_appp/model/meal.dart';
import 'package:food_appp/widget/meal_item.dart';

class FavoriteScreen extends StatelessWidget {

  final List<Meal> favoriteMeals;
  FavoriteScreen(this.favoriteMeals);

  @override
  Widget build(BuildContext context) {
    if(favoriteMeals.isEmpty){
      return Center(
        child: Text("Anda tidak memiliki data favorite"),
      );
    } else {
      return ListView.builder(
        itemBuilder: (context, index){
          return MealItem(
              id: favoriteMeals[index].id,
              tittle: favoriteMeals[index].title,
              imgUrl: favoriteMeals[index].imgurl,
              duration: favoriteMeals[index].duration,
              complexity: favoriteMeals[index].complexity,
              afforfability: favoriteMeals[index].afforfability);
        },
        itemCount: favoriteMeals.length,
      );
    }
  }
}
