import 'package:flutter/material.dart';
import 'package:instagram_clone/constant/story_json.dart';
import '../widgets/story_item.dart';

class HomePage extends StatefulWidget {
  HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return getBody();
  }

  Widget getBody() {
    return Column(
      children: [
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: [
              Padding(
                padding: const EdgeInsets.only(right: 20, left: 15),
                child: Column(
                  children: [
                    Container(
                      width: 65,
                      height: 65,
                      child: Stack(
                        children: [
                          Container(
                            width: 65,
                            height: 65,
                            decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                image: DecorationImage(
                                    image: NetworkImage(profile),
                                    fit: BoxFit.cover)),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
              Row(
                children: List.generate(stories.length, (index) {
                  return StoryItem(
                    img: stories[index]["img"],
                    name: stories[index]["name"],
                  );
                }),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
