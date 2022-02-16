import 'package:flutter/material.dart';
import 'package:instagram_clone/constant/story_json.dart';
import 'package:instagram_clone/theme/colors.dart';

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
        Container(
          width: 68,
          height: 68,
          decoration: const BoxDecoration(
              shape: BoxShape.circle,
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: storyBorderColor,
              )),
          child: Padding(
            padding: const EdgeInsets.all(3.0),
            child: Container(
              width: 65,
              height: 65,
              decoration: BoxDecoration(
                  border: Border.all(
                    color: black,
                    width: 2,
                  ),
                  shape: BoxShape.circle,
                  image: DecorationImage(
                      image: NetworkImage(stories[0]['img']),
                      fit: BoxFit.cover)),
            ),
          ),
        ),
        SizedBox(
          height: 8.0,
        ),
        SizedBox(
          width: 70,
          child: Text(
            stories[0]['name'],
            overflow: TextOverflow.ellipsis,
            style: TextStyle(
              color: white,
            ),
          ),
        )
      ],
    );
  }
}
