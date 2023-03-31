import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mathlab/models/games.dart';
import 'package:mathlab/utils/colors.dart';
import 'package:mathlab/utils/dimensions.dart';
import 'package:mathlab/widgets/big_text.dart';
import 'package:mathlab/widgets/expandable_text_widget.dart';
import 'package:mathlab/widgets/icon_and_text_widget.dart';
import 'package:mathlab/widgets/small_text.dart';

class GameTile extends StatelessWidget {
  final Game game;
  const GameTile({
    super.key,
    required this.game,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.primaryColor.withOpacity(0.1),
        borderRadius: BorderRadius.circular(getProportionateScreenWidth(10)),
      ),
      height: getProportionateScreenHeight(95),
      padding: EdgeInsets.symmetric(
          horizontal: getProportionateScreenWidth(10),
          vertical: getProportionateScreenHeight(10)),
      margin: EdgeInsets.symmetric(
          vertical: getProportionateScreenHeight(10),
          horizontal: getProportionateScreenWidth(15)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Stack(clipBehavior: Clip.none, children: [
            Container(
              width: getProportionateScreenWidth(60),
              height: getProportionateScreenHeight(60),
              decoration: BoxDecoration(
                color: AppColors.primaryColor.withOpacity(0.8),
                shape: BoxShape.circle,
              ),
            ),
          ]),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: Dimensions.screenWidth! * 0.7,
                padding: EdgeInsets.only(
                    left: getProportionateScreenWidth(10),
                    right: getProportionateScreenWidth(10)),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      BigText(text: game.name),
                      SizedBox(
                        height: getProportionateScreenHeight(3),
                      ),
                      SmallText(text: game.category),
                      SizedBox(
                        height: getProportionateScreenHeight(3),
                      ),
                      Row(
                        children: [
                          Wrap(
                            children: List.generate(
                                5,
                                (index) => const Icon(
                                      Icons.star,
                                      color: AppColors.primaryColor,
                                      size: 15,
                                    )),
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          const SmallText(text: "4.5"),
                          const SizedBox(
                            width: 10,
                          ),
                          const SmallText(text: "1287"),
                          const SizedBox(
                            width: 10,
                          ),
                          const SmallText(text: "comments"),
                        ],
                      ),
                    ]),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
