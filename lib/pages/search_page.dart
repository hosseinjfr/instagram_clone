import 'package:flutter/material.dart';
import 'package:instagram_clone/constant/search_json.dart';
import 'package:instagram_clone/theme/colors.dart';

import '../widgets/search_category_item.dart';

class SearchPage extends StatefulWidget {
  SearchPage({Key? key}) : super(key: key);

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  @override
  Widget build(BuildContext context) {
    return getBody();
  }

  Widget getBody() {
    var size = MediaQuery.of(context).size;
    return SingleChildScrollView(
      child: Column(
        children: [
          SafeArea(
            child: Row(
              children: [
                const SizedBox(width: 15),
                Container(
                  width: size.width - 30,
                  height: 45,
                  decoration: BoxDecoration(
                    color: textFieldBackground,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: TextField(
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      prefixIcon: Icon(
                        Icons.search,
                        color: white.withOpacity(0.5),
                      ),
                    ),
                    style: TextStyle(color: white.withOpacity(0.3)),
                    cursorColor: white.withOpacity(0.5),
                  ),
                ),
                const SizedBox(width: 15),
              ],
            ),
          ),
          SizedBox(
            height: 15,
          ),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Padding(
              padding: const EdgeInsets.only(left: 20, right: 20),
              child: Row(
                children: List.generate(searchCategories.length, (index) {
                  return CategoryStory(
                    name: searchCategories[index],
                  );
                }),
              ),
            ),
          ),
          SizedBox(
            height: 15,
          ),
          Wrap(
            spacing: 1,
            runSpacing: 1,
            children: List.generate(searchImages.length, (index) {
              return Container(
                width: (size.width - 3) / 3,
                height: (size.width - 3) / 3,
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: NetworkImage(searchImages[index]),
                        fit: BoxFit.cover)),
              );
            }),
          ),
        ],
      ),
    );
  }
}
