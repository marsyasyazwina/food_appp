import 'package:flutter/material.dart';
import 'package:food_appp/screen/categories_meals_screen.dart';

class CategoryItem extends StatelessWidget {
 final String id;
 final String tittle;
 final Color color;

 const CategoryItem(this.id, this.tittle, this.color);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
     onTap: () {
       Navigator.pushNamed(context, CategoriesMealsScreen.routeName,arguments: {
         'id' : id,
         'tittle' : tittle
       });
     },
     child: Container(
      padding: EdgeInsets.all(10),
      child: Text(
       tittle,
       style: Theme.of(context).textTheme.headline6,
      ),
      decoration: BoxDecoration(
       gradient: LinearGradient(
           colors: [
            color.withOpacity(0.7),
            color
           ],
        begin: Alignment.topLeft,
        end: Alignment.bottomRight
       ),
       borderRadius: BorderRadius.circular(15)
      ),
     ),
    );
  }
}
