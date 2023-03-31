
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mathlab/utils/colors.dart';
import 'package:mathlab/utils/dimensions.dart';

class InstrumentBuilder extends StatelessWidget {
  final List instruments;
  const InstrumentBuilder({
    super.key, required this.instruments,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: SizedBox(
            child: ListView.builder(
              padding: const EdgeInsets.only(top: 0.0),
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              scrollDirection: Axis.vertical,
              itemCount: instruments.length,
              itemBuilder: (BuildContext context, int index) {
                return Padding(
                  padding: const EdgeInsets.only(bottom: 10),
                  child: Row(
                    children: [
                      Container(
                        height: getProportionateScreenHeight(24),
                        width: getProportionateScreenWidth(24),
                        alignment: Alignment.center,
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          color: AppColors.primaryLightColor,
                        ),
                        child: const Icon(
                          Icons.done,
                          color: AppColors.primaryColor,
                        ),
                      ),
                      const SizedBox(width: 10,),
                      Text(
                        instruments[index],
                        style: Theme.of(context).textTheme.bodyMedium,
                      )
                    ],
                  ),
                );
              },
            ),
          ),
        ),
      ],
    );
  }
}
