import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:mathlab/models/games.dart';
import 'package:mathlab/screens/detail_screen/game_detail.dart';
import 'package:mathlab/utils/colors.dart';
import 'package:mathlab/utils/dimensions.dart';
import 'package:page_transition/page_transition.dart';
import 'package:sliver_tools/sliver_tools.dart';

import 'components/game_tile.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    int selectedIndex = 0;

    List<String> gameTypes = [
      'All',
      'Category 1',
      'Category 2',
      'Category 3',
      'Category 4',
      'Category 5'
    ];

    List<Game> gamesList = Game.gameList;
    return Scaffold(
        body: CustomScrollView(
      slivers: [
        MultiSliver(
          pushPinnedChildren: true,
          children: [
            gameSearchBar(),
            categoryList(gameTypes, selectedIndex),
            SliverPinnedHeader(
              child: Container(
                decoration: const BoxDecoration(color: Colors.white),
                padding: EdgeInsets.only(
                    left: getProportionateScreenWidth(16),
                    bottom: getProportionateScreenHeight(15),
                    top: getProportionateScreenHeight(15)),
                child: Text('Game List',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: getProportionateScreenWidth(18),
                    )),
              ),
            ),
            SliverList(
              delegate: SliverChildListDelegate(gameList(gamesList)),
            ),
          ],
        ),
      ],
    ));
  }

  List<Container> gameList(List<Game> gamesList) {
    List<Container> containers = gamesList.map((game) {
      // ignore: avoid_unnecessary_containers
      return Container(
        child: GestureDetector(
            onTap: () {
              Navigator.push(context, PageTransition(child: GameDetail(gameId: game.gameId,), type: PageTransitionType.bottomToTop));
            },
            child: GameTile(
              game: game,
            )),
      );
    }).toList();

    containers.add(
      Container(
        height: getProportionateScreenHeight(35),
      ),
    );

    return containers;
  }

  Container categoryList(List<String> gameType, int selectedIndex) {
    return Container(
      padding:
          EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(12)),
      height: getProportionateScreenHeight(40),
      width: Dimensions.screenWidth,
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: gameType.length,
          itemBuilder: (BuildContext context, int index) {
            return Padding(
              padding: EdgeInsets.all(getProportionateScreenWidth(8)),
              child: GestureDetector(
                onTap: () {
                  setState(() {
                    selectedIndex = index;
                  });
                },
                child: Text(
                  gameType[index],
                  style: TextStyle(
                      fontSize: getProportionateScreenWidth(14),
                      fontWeight: selectedIndex == index
                          ? FontWeight.bold
                          : FontWeight.w300,
                      color: selectedIndex == index
                          ? AppColors.primaryColor
                          : Colors.black),
                ),
              ),
            );
          }),
    );
  }

  Container gameSearchBar() {
    return Container(
      padding: EdgeInsets.only(top: getProportionateScreenHeight(15)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Container(
            padding: EdgeInsets.symmetric(
                horizontal: getProportionateScreenWidth(16)),
            width: Dimensions.screenWidth! * 0.9,
            decoration: BoxDecoration(
                color: AppColors.primaryLightColor,
                borderRadius:
                    BorderRadius.circular(getProportionateScreenWidth(20))),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.search,
                  color: Colors.black54.withOpacity(0.6),
                ),
                const Expanded(
                    child: TextField(
                  showCursor: false,
                  decoration: InputDecoration(
                    hintText: 'Search Games',
                    border: InputBorder.none,
                    focusedBorder: InputBorder.none,
                  ),
                ))
              ],
            ),
          ),
        ],
      ),
    );
  }
}
