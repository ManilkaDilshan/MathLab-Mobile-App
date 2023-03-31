import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter/widgets.dart';
import 'package:mathlab/utils/dimensions.dart';

class StepBuilder extends StatelessWidget {
  final List instructions;
  const StepBuilder({super.key, required this.instructions});

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
              itemCount: instructions.length,
              itemBuilder: (BuildContext context, int index) {
                int stepNo = index + 1;
                return Padding(
                    padding: const EdgeInsets.only(bottom: 10),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          height: 24.0,
                          width: 24.0,
                          alignment: Alignment.center,
                          margin: const EdgeInsets.only(right: 16.0),
                          decoration: const BoxDecoration(
                            shape: BoxShape.circle,
                            color: Colors.black54,
                          ),
                          child: Text(
                            stepNo.toString(),
                            style: Theme.of(context)
                                .textTheme
                                .bodySmall!
                                .copyWith(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w700),
                          ),
                        ),
                        Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              instructions[index],
                              style: Theme.of(context).textTheme.bodyMedium,
                            ),
                            SizedBox(
                              height: getProportionateScreenHeight(10),
                            ),
                            ClipRRect(
                              borderRadius: BorderRadius.circular(12),
                              child: Image.network(
                                  'https://picsum.photos/300/200'),
                            )
                          ],
                        ))
                      ],
                    ));
              },
            ),
          ),
        ),
      ],
    );
  }
}
