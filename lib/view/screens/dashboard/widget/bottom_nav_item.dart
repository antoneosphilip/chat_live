import 'package:flutter/material.dart';
import 'package:live_app/util/styles.dart';

class BottomNavItem extends StatelessWidget {
  final String selectedIcon;
  final String unSelectedIcon;
  final String title;
  final Function? onTap;
  final bool isSelected;
  const BottomNavItem(
      {super.key,
      this.onTap,
      this.isSelected = false,
      required this.title,
      required this.selectedIcon,
      required this.unSelectedIcon});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: InkWell(
        onTap: onTap as void Function()?,
        child: Column(
            mainAxisAlignment:
                isSelected ? MainAxisAlignment.end : MainAxisAlignment.end,
            children: [
              Image.asset(
                isSelected ? selectedIcon : unSelectedIcon,
                height: isSelected ? 45 : 30,
                width: isSelected ? 45 : 30,
              ),
              isSelected == false
                  ? Text(
                      title,
                      style: robotoRegular.copyWith(
                          color: isSelected
                              ? Theme.of(context).primaryColor
                              : Theme.of(context).textTheme.bodyMedium!.color!,
                          fontSize: 9),
                    )
                  : const SizedBox(
                      height: 10,
                    ),
            ]),
      ),
    );
  }
}
