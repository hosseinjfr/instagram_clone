import 'package:flutter/material.dart';
import 'package:instagram_clone/theme/colors.dart';

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
                SizedBox(width: 15),
                Container(
                  width: size.width - 30,
                  height: 60,
                  decoration: BoxDecoration(
                    color: textFieldBackground,
                  ),
                ),
                SizedBox(width: 15),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
