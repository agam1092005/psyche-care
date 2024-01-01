// ignore_for_file: prefer_typing_uninitialized_variables, non_constant_identifier_names, file_names

import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';

class DetailedRecipe extends StatefulWidget {
  final mealID;
  const DetailedRecipe({super.key, this.mealID});

  @override
  State<DetailedRecipe> createState() => _DetailedRecipeState();
}

class _DetailedRecipeState extends State<DetailedRecipe> {
  @override
  void initState() {
    super.initState();
    getRecipe();
  }

  late var Recipe;

  getRecipe() async {
    await http
        .get(
      Uri.parse(
          "https://www.themealdb.com/api/json/v1/1/lookup.php?i=${widget.mealID}"),
    )
        .then((value) {
      Map<String, dynamic> jsonData = jsonDecode(value.body);
      Recipe = jsonData["meals"][0];
    });

    setState(() {});
  }



  @override
  Widget build(BuildContext context) {
    //
    // var IngrCount = 0;
    // while (Recipe["strIngredient$IngrCount"] != null ||
    //     Recipe["strIngredient$IngrCount"] != "") {
    //   IngrCount += 1;
    // }
    return SafeArea(
      child: Scaffold(
        body: ListView(
          padding: const EdgeInsets.all(16),
          scrollDirection: Axis.vertical,
          children: [
            Container(
              height: MediaQuery.of(context).size.width * 0.8,
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.all(
                  Radius.circular(16),
                ),
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: NetworkImage(
                    "${Recipe["strMealThumb"]}",
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  "${Recipe["strMeal"]}",
                  style: const TextStyle(
                    fontWeight: FontWeight.w900,
                    fontSize: 20,
                    color: Colors.black,
                  ),
                ),
                Text(
                  "Cuisine: ${Recipe["strArea"]}",
                  style: const TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 16,
                    color: Colors.black45,
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            const Text(
              "Ingredients:-",
              style: TextStyle(
                fontWeight: FontWeight.w900,
                fontSize: 16,
                color: Colors.black,
              ),
            ),
            SizedBox(
              height: 100,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                physics: const BouncingScrollPhysics(),
                itemCount: 5,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          height: 50,
                          width: 50,
                          decoration: BoxDecoration(
                            image: DecorationImage(
                                fit: BoxFit.fitHeight,
                                image: NetworkImage(
                                    "https://www.themealdb.com/images/ingredients/${Recipe["strIngredient${index + 1}"]}.png")),
                          ),
                        ),
                        Text(
                          "${Recipe["strIngredient${index + 1}"]}",
                          style: const TextStyle(
                            fontWeight: FontWeight.w900,
                            fontSize: 16,
                            color: Colors.black,
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
            const Text(
              "Instructions:-",
              style: TextStyle(
                fontWeight: FontWeight.w900,
                fontSize: 16,
                color: Colors.black,
              ),
            ),
            Text(
              "${Recipe["strInstructions"]}",
              style: const TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: 12,
                color: Colors.black45,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
