import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mantact/app/utils/constants/app_strings.dart';

class CustomAppBar extends StatefulWidget implements PreferredSizeWidget {
  const CustomAppBar({super.key});

  @override
  State<CustomAppBar> createState() => _CustomAppBarState();

  @override
  Size get preferredSize => AppBar().preferredSize;
}

class _CustomAppBarState extends State<CustomAppBar> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 0),
      child: Row(
        children: [
          const Spacer(),
          Expanded(child: SvgPicture.asset(AppStrings.svgIconPath)),
          Expanded(
              child: GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(context, '/settings');
                  },
                  child: Icon(
                    Icons.menu,
                    color: Theme.of(context).textTheme.bodyLarge!.color,
                  )))
        ],
      ),
    );
  }
}
