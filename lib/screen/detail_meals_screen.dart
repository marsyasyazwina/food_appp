import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:food_appp/model/meal.dart';

class DetailMealsScreen extends StatelessWidget {
  // buat var untuk inisialisasi routes nya
  static const routesName = '/meal-detail';

  // membuat function untuk menambahkan ke favorite nya. yang fungsi dari function nya ini sama dengan function togglefav dan isFav di main.dart

  final Function toggleFavorite ;
  final Function isFavorite;

  DetailMealsScreen(this.toggleFavorite, this.isFavorite);

  @override
  Widget build(BuildContext context) {
    //buat var untuk menampung argument
    final mealId = ModalRoute.of(context)!.settings.arguments as String;
    //buat var untuk menentukan id yang di pilih
    final selectedMeal = meals.firstWhere((meals) => meals.id == mealId);
    return Scaffold(
      appBar: AppBar(
        title: Text('${selectedMeal.title}'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: 300,
              width: double.infinity,
              child: Image.asset(selectedMeal.imgurl, fit: BoxFit.cover,),
            ),
            buildSectionTittle(context, "Ingredients"),
            buildContainer(context,
            ListView.builder(
                itemBuilder: (context, index){
                  return Card(
                    color: Theme.of(context).accentColor,
                    child: Padding(padding: EdgeInsets.symmetric(
                      vertical: 5, horizontal: 10
                    ),
                      child: Text(selectedMeal.ingredients[index]),
                    ),
                  );
                },
              itemCount: selectedMeal.ingredients.length,
            )
            ),
            buildSectionTittle(context, "Steps"),
            buildContainer(context,
            ListView.builder(
                itemBuilder: (context, index){
                  return Column(
                    children: [
                      ListTile(
                        leading: CircleAvatar(
                          child: Text('${(index + 1)}'),
                        ),
                        title: Text(selectedMeal.steps[index]),
                      )

                    ],
                  );
                },
              itemCount: selectedMeal.steps.length,
                )
            )

          ]
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () =>toggleFavorite(mealId),
        child: Icon(
          isFavorite(mealId)? Icons.favorite : Icons.favorite_border , color: Colors.pinkAccent,
        ),
      ),
    );
  }

  Widget buildSectionTittle(BuildContext context, String text){
    return Container(
          margin: EdgeInsets.all(10),
      child: Text(text , style: Theme.of(context).textTheme.headline6,),

    );

  }

  Widget buildContainer(BuildContext context, Widget child){
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: Colors.grey)
      ),
      margin: EdgeInsets.all(10),
      padding: EdgeInsets.all(10),
      height: 200,
      width: MediaQuery.of(context).size.width,
      child: child,
    );
  }
}
