import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:mathlab/models/games.dart';
import 'package:mathlab/screens/detail_screen/components/game_detail_appbar.dart';
import 'package:mathlab/screens/detail_screen/components/instrument_builder.dart';
import 'package:mathlab/screens/detail_screen/components/step_builder.dart';
import 'package:mathlab/utils/colors.dart';
import 'package:mathlab/utils/dimensions.dart';
import 'package:mathlab/widgets/small_text.dart';

class GameDetail extends StatelessWidget {
  final int gameId;
  static String routeName = '/game_details/:gameId';
  const GameDetail({super.key, required this.gameId});

  @override
  Widget build(BuildContext context) {
    List<Game> gameList = Game.gameList;
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          DetailAppBar(gameImage: gameList[gameId].image),
          SliverToBoxAdapter(
            child: Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: getProportionateScreenWidth(24)),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    gameList[gameId].name,
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                  SizedBox(
                    height: getProportionateScreenHeight(8),
                  ),
                  DefaultTextStyle(
                      style: Theme.of(context)
                          .textTheme
                          .bodyMedium!
                          .copyWith(color: AppColors.lightTextColor),
                      child: Row(
                        children: [
                          const SmallText(
                            text: 'Game Type',
                          ),
                          const SizedBox(
                            width: 8.0,
                          ),
                          Container(
                            height: 5.0,
                            width: 5.0,
                            decoration: const BoxDecoration(
                                color: Colors.black26, shape: BoxShape.circle),
                          ),
                          const SizedBox(
                            width: 8.0,
                          ),
                          SmallText(text: gameList[gameId].category),
                        ],
                      )),
                  SizedBox(
                    height: getProportionateScreenHeight(16),
                  ),
                  Divider(
                    color: AppColors.lightTextColor.withOpacity(0.5),
                    height: 1.0,
                  ),
                  SizedBox(
                    height: getProportionateScreenHeight(16),
                  ),
                  Text(
                    'Description',
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                  SizedBox(
                    height: getProportionateScreenHeight(8),
                  ),
                  Text(
                    gameList[gameId].description,
                    style: Theme.of(context)
                        .textTheme
                        .bodyMedium!
                        .copyWith(color: AppColors.lightTextColor),
                  ),
                  SizedBox(
                    height: getProportionateScreenHeight(16),
                  ),
                  Divider(
                    color: AppColors.lightTextColor.withOpacity(0.5),
                    height: 1.0,
                  ),
                  SizedBox(
                    height: getProportionateScreenHeight(16),
                  ),
                  Text(
                    'Instruments',
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                  SizedBox(
                    height: getProportionateScreenHeight(16),
                  ),
                  InstrumentBuilder(
                    instruments: gameList[gameId].instruments,
                  ),
                  SizedBox(
                    height: getProportionateScreenHeight(16),
                  ),
                  Divider(
                    color: AppColors.lightTextColor.withOpacity(0.5),
                    height: 1.0,
                  ),
                  SizedBox(
                    height: getProportionateScreenHeight(16),
                  ),
                  Text(
                    'Instructions',
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                  SizedBox(
                    height: getProportionateScreenHeight(16),
                  ),
                  StepBuilder(instructions: gameList[gameId].steps)
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
