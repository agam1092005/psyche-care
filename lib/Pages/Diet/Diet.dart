// ignore_for_file: file_names, prefer_typing_uninitialized_variables

import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:psychecare/Pages/Diet/CategoryRecipes.dart';

class Diet extends StatefulWidget {
  const Diet({super.key});

  @override
  State<Diet> createState() => _DietState();
}

class _DietState extends State<Diet> {
  @override
  void initState() {
    super.initState();
    getCategories();
  }

  var categories = [];

  getCategories() async {
    await http
        .get(
      Uri.parse("https://www.themealdb.com/api/json/v1/1/categories.php"),
    )
        .then((value) {
      Map<String, dynamic> jsonData = jsonDecode(value.body);
      categories = jsonData["categories"];
    });

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      scrollDirection: Axis.vertical,
      padding: const EdgeInsets.all(16),
      children: [
        const SizedBox(
          height: 60,
          child: Image(
            alignment: Alignment.topLeft,
            image: AssetImage(
              "assets/leaf.png",
            ),
          ),
        ),
        const SizedBox(
          height: 20,
        ),
        Container(
          padding: const EdgeInsets.all(16),
          height: MediaQuery.sizeOf(context).width / 2 - 32,
          width: 200,
          decoration: const BoxDecoration(
            color: Colors.green,
            borderRadius: BorderRadius.all(
              Radius.circular(
                16,
              ),
            ),
          ),
          child: const Text(
            "You don't have to eat less, you just have to eat right.",
            style: TextStyle(
              fontWeight: FontWeight.w900,
              fontSize: 25,
              color: Colors.white,
            ),
          ),
        ),
        const SizedBox(
          height: 20,
        ),
        SizedBox(
          height: 250,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            physics: const BouncingScrollPhysics(),
            itemCount: categories.length,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 5),
                child: GestureDetector(
                  onTap: () {
                    Navigator.of(context, rootNavigator: true).push(
                      CupertinoPageRoute<bool>(
                        fullscreenDialog: false,
                        builder: (BuildContext context) => CategoryRecipes(
                            desc:
                                "${categories[index]["strCategoryDescription"]}",
                            category: "${categories[index]["strCategory"]}"),
                      ),
                    );
                  },
                  child: Container(
                    width: 250,
                    decoration: const BoxDecoration(
                      borderRadius: BorderRadius.all(
                        Radius.circular(
                          16,
                        ),
                      ),
                      color: Colors.black12,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          height: 125,
                          decoration: BoxDecoration(
                            image: DecorationImage(
                                fit: BoxFit.fitHeight,
                                image: NetworkImage(
                                    "${categories[index]["strCategoryThumb"]}")),
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Text(
                          "${categories[index]["strCategory"]}",
                          style: const TextStyle(
                            fontWeight: FontWeight.w900,
                            fontSize: 16,
                            color: Colors.black,
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
        const SizedBox(
          height: 20,
        ),
        const Text(
          '“Let Food Be Thy Medicine, Thy Medicine Shall Be Thy Food.”',
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w600,
            fontFamily: "DM_Serif_Display",
          ),
          textAlign: TextAlign.center,
        ),
        const SizedBox(
          height: 10,
        ),
        const SizedBox(
          height: 150,
          child: Image(
            image: AssetImage(
              "assets/noodle_soup.png",
            ),
          ),
        ),
      ],
    );
  }
}
