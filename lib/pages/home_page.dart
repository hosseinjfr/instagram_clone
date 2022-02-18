import 'dart:math';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:instagram_clone/constant/post_json.dart';
import 'package:instagram_clone/constant/story_json.dart';
import 'package:instagram_clone/theme/colors.dart';
import 'package:line_icons/line_icons.dart';
import '../widgets/story_item.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return getBody();
  }

  Widget getBody() {
    return SingleChildScrollView(
      child: Column(
        children: [
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(right: 20, left: 15),
                  child: Column(
                    children: [
                      SizedBox(
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
                            Positioned(
                              bottom: 0,
                              right: 0,
                              child: Container(
                                width: 19,
                                height: 16,
                                decoration: const BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: white,
                                ),
                                child: const Icon(
                                  Icons.add_circle,
                                  color: buttonFollowColor,
                                  size: 19,
                                ),
                              ),
                            )
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
          Divider(
            color: white.withOpacity(0.3),
          ),
          const SizedBox(
            height: 15,
          ),
          Column(
            children: List.generate(posts.length, (index) {
              return PostItem(
                  profileImg: posts[index]['profileImg'],
                  name: posts[index]['name'],
                  postImg: posts[index]['postImg'],
                  caption: posts[index]['caption'],
                  isLoved: posts[index]['isLoved'],
                  likedBy: posts[index]['likedBy'],
                  viewCount: posts[index]['commentCount'],
                  dayAgo: posts[index]['timeAgo']);
            }),
          ),
        ],
      ),
    );
  }
}

class PostItem extends StatelessWidget {
  final String profileImg;
  final String name;
  final String postImg;
  final String caption;
  final isLoved;
  final String likedBy;
  final String viewCount;
  final String dayAgo;

  const PostItem({
    Key? key,
    required this.profileImg,
    required this.name,
    required this.postImg,
    required this.caption,
    required this.isLoved,
    required this.likedBy,
    required this.viewCount,
    required this.dayAgo,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 15),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Container(
                      width: 40,
                      height: 40,
                      decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          image: DecorationImage(
                              image: NetworkImage(profileImg),
                              fit: BoxFit.cover)),
                    ),
                    const SizedBox(
                      width: 15,
                    ),
                    Text(
                      name,
                      style: const TextStyle(
                        color: white,
                        fontSize: 15,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
                const Icon(
                  LineIcons.horizontalEllipsis,
                  color: white,
                )
              ],
            ),
          ),
          const SizedBox(
            height: 12,
          ),
          Container(
            height: 400,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: NetworkImage(
                  postImg,
                ),
                fit: BoxFit.cover,
              ),
            ),
          ),
          const SizedBox(
            height: 12,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 15, right: 15, top: 3),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    isLoved
                        ? SvgPicture.asset(
                            'assets/images/loved_icon.svg',
                            width: 27,
                          )
                        : Container(),
                    const SizedBox(
                      width: 20,
                    ),
                    SvgPicture.asset(
                      'assets/images/comment_icon.svg',
                      width: 27,
                    ),
                    const SizedBox(
                      width: 20,
                    ),
                    SvgPicture.asset(
                      'assets/images/message_icon.svg',
                      width: 27,
                    ),
                  ],
                ),
                SvgPicture.asset(
                  'assets/images/save_icon.svg',
                  width: 27,
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 15,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 15, right: 15),
            child: RichText(
                text: TextSpan(
              children: [
                TextSpan(
                  text: 'Liked by ',
                  style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                TextSpan(
                  text: '$likedBy ',
                  style: TextStyle(fontSize: 15, fontWeight: FontWeight.w700),
                ),
                TextSpan(
                  text: 'and ',
                  style: TextStyle(fontSize: 15, fontWeight: FontWeight.w500),
                ),
                TextSpan(
                  text: 'Other',
                  style: TextStyle(fontSize: 15, fontWeight: FontWeight.w700),
                ),
              ],
            )),
          ),
          const SizedBox(
            height: 12,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 15, right: 15),
            child: RichText(
              text: TextSpan(
                children: [
                  TextSpan(
                    text: '$name ',
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  TextSpan(
                    text: '$caption',
                    style: TextStyle(fontSize: 15, fontWeight: FontWeight.w700),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(
            height: 12,
          ),
          Padding(
            padding: EdgeInsets.only(
              left: 15,
              right: 15,
            ),
            child: Text(
              'view $viewCount comments',
              style: TextStyle(
                color: white.withOpacity(0.3),
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          const SizedBox(
            height: 12,
          ),
          Padding(
            padding: EdgeInsets.only(left: 15, right: 15),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Container(
                      width: 30,
                      height: 30,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        image: DecorationImage(
                          image: NetworkImage(posts[0]['profileImg']),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 15,
                    ),
                    Text(
                      'Add a comment...',
                      style: TextStyle(
                        color: white.withOpacity(0.3),
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    const Text(
                      '😂',
                      style: TextStyle(
                        fontSize: 22,
                      ),
                    ),
                    const SizedBox(
                      width: 15,
                    ),
                    const Text(
                      '😍',
                      style: TextStyle(
                        fontSize: 22,
                      ),
                    ),
                    const SizedBox(
                      width: 15,
                    ),
                    Icon(
                      Icons.add_circle,
                      color: white.withOpacity(0.5),
                      size: 18,
                    )
                  ],
                ),
              ],
            ),
          ),
          SizedBox(
            height: 12,
          ),
          Padding(
            padding: EdgeInsets.only(left: 15, right: 15),
            child: Text(
              '1 day ago',
              style: TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.w500,
                color: white.withOpacity(0.5),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
