// ignore_for_file: file_names, prefer_typing_uninitialized_variables

import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:psychecare/Pages/Diet/DetailedRecipe.dart';

class CategoryRecipes extends StatefulWidget {
  final category;
  final desc;
  const CategoryRecipes(
      {super.key, required this.category, required this.desc});

  @override
  State<CategoryRecipes> createState() => _CategoryRecipesState();
}

class _CategoryRecipesState extends State<CategoryRecipes> {
  @override
  void initState() {
    super.initState();
    getCategoryRecipe();
  }

  var categoryRecipe = [];

  getCategoryRecipe() async {
    await http
        .get(
      Uri.parse(
          "https://www.themealdb.com/api/json/v1/1/filter.php?c=${widget.category}"),
    )
        .then((value) {
      Map<String, dynamic> jsonData = jsonDecode(value.body);
      categoryRecipe = jsonData["meals"];
    });

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "${widget.category} Recipes",
                style: const TextStyle(
                  fontWeight: FontWeight.w900,
                  fontSize: 20,
                  color: Colors.black,
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Container(
                decoration: BoxDecoration(
                  color: Colors.grey.withOpacity(0.25),
                  borderRadius: const BorderRadius.all(
                    Radius.circular(
                      12,
                    ),
                  ),
                ),
                child: ExpansionTile(
                  title: const Text(
                    'Description',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: Colors.black,
                    ),
                  ),
                  trailing: const Icon(
                    Icons.arrow_drop_down,
                    size: 30,
                    color: Colors.black,
                  ),
                  childrenPadding: const EdgeInsets.symmetric(horizontal: 16),
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(bottom: 16),
                      child: Text(
                        "${widget.desc}",
                        style: TextStyle(
                          color: Colors.black.withOpacity(0.5),
                          fontSize: 16,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Expanded(
                child: ListView.builder(
                  scrollDirection: Axis.vertical,
                  physics: const BouncingScrollPhysics(),
                  itemCount: categoryRecipe.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(vertical: 5),
                      child: GestureDetector(
                        onTap: () {
                          Navigator.of(context, rootNavigator: true).push(
                            CupertinoPageRoute<bool>(
                              fullscreenDialog: false,
                              builder: (BuildContext context) => DetailedRecipe(
                                mealID: "${categoryRecipe[index]["idMeal"]}",
                              ),
                            ),
                          );
                        },
                        child: Container(
                          height: 250,
                          decoration: const BoxDecoration(
                            borderRadius: BorderRadius.all(
                              Radius.circular(
                                16,
                              ),
                            ),
                            color: Colors.black12,
                          ),
                          child: Stack(
                            children: [
                              Container(
                                decoration: BoxDecoration(
                                  borderRadius: const BorderRadius.all(
                                    Radius.circular(
                                      16,
                                    ),
                                  ),
                                  image: DecorationImage(
                                    colorFilter: ColorFilter.mode(
                                      Colors.black.withOpacity(0.4),
                                      BlendMode.multiply,
                                    ),
                                    fit: BoxFit.cover,
                                    image: NetworkImage(
                                      "${categoryRecipe[index]["strMealThumb"]}",
                                    ),
                                  ),
                                ),
                              ),
                              Center(
                                child: Text(
                                  "${categoryRecipe[index]["strMeal"]}",
                                  style: const TextStyle(
                                    fontWeight: FontWeight.w900,
                                    fontSize: 16,
                                    color: Colors.white,
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
