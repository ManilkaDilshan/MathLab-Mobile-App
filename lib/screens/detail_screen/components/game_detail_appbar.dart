import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mathlab/utils/colors.dart';
import 'package:mathlab/utils/dimensions.dart';
import 'package:mathlab/widgets/app_icon.dart';
import 'package:palette_generator/palette_generator.dart';

class DetailAppBar extends StatefulWidget {
  final String gameImage;
  const DetailAppBar({super.key, required this.gameImage});

  @override
  State<DetailAppBar> createState() => _DetailAppBarState();
}

class _DetailAppBarState extends State<DetailAppBar> {
  PaletteGenerator? _paletteGenerator;

  @override
  void initState() {
    super.initState();
    _generatePalette();
  }

  void _generatePalette() async {
    _paletteGenerator = await PaletteGenerator.fromImageProvider(
      AssetImage(widget.gameImage),
      size: const Size(110, 110),
    );
    setState(() {});
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      backgroundColor: _paletteGenerator != null
          ? _paletteGenerator!.dominantColor!.color
          : Colors.white,
      automaticallyImplyLeading: false,
      toolbarHeight: getProportionateScreenHeight(80),
      systemOverlayStyle:
          const SystemUiOverlayStyle(statusBarColor: Colors.transparent),
      expandedHeight: getProportionateScreenHeight(265),
      elevation: 0.0,
      pinned: true,
      stretch: true,
      flexibleSpace: FlexibleSpaceBar(
        background: Image.asset(
          widget.gameImage,
          fit: BoxFit.cover,
        ),
        stretchModes: const [
          StretchMode.blurBackground,
          StretchMode.zoomBackground,
        ],
        collapseMode: CollapseMode.parallax,
      ),
      bottom: PreferredSize(
        preferredSize: const Size.fromHeight(0.0),
        child: Container(
          height: getProportionateScreenHeight(32),
          alignment: Alignment.center,
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(getProportionateScreenWidth(32)),
                  topRight: Radius.circular(getProportionateScreenWidth(32)))),
          child: Container(
            width: 40.0,
            height: 5.0,
            decoration: BoxDecoration(
                color: AppColors.lightTextColor.withOpacity(0.6),
                borderRadius: const BorderRadius.all(Radius.circular(100.0))),
          ),
        ),
      ),
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          GestureDetector(
            child: const AppIcon(icon: Icons.clear),
            onTap: () {
              Navigator.pop(context);
            },
          ),
        ],
      ),
    );
  }
}
