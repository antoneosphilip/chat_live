import 'package:flutter/material.dart';
import 'package:live_app/view/widgets/arrow_btn.dart';

class SectionContainer extends StatelessWidget {
  final Widget? body;
  final Function()? onTab;
  final String? icon;
  final String? title;
  final Widget? centerTitle;
  final Color? color;
  final Color? containerColor;
  final EdgeInsetsGeometry? padding;
  final bool enableBtn;
  const SectionContainer({
    super.key,
    this.body,
    this.onTab,
    this.icon,
    this.title,
    this.color,
    this.padding,
    this.containerColor,
    this.centerTitle,
    this.enableBtn = true,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
          color: containerColor ?? Colors.transparent,
          borderRadius: BorderRadius.circular(10)),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    icon != null
                        ? Image.asset(
                            "${icon}",
                            width: 30,
                          )
                        : SizedBox(),
                    SizedBox(
                      width: 10,
                    ),
                    title != null
                        ? Text(
                            "${title}",
                            style: const TextStyle(
                              color: Colors.black54,
                              fontWeight: FontWeight.bold,
                              fontSize: 15,
                            ),
                          )
                        : SizedBox(),
                    SizedBox(
                      width: 10,
                    ),
                    centerTitle != null ? centerTitle! : SizedBox(),
                  ],
                ),
                enableBtn
                    ? ArrowBtn(
                        onTap: onTab,
                      )
                    : SizedBox(),
              ],
            ),
          ),
          Container(
            padding: padding,
            constraints: BoxConstraints(minHeight: body == null ? 100 : 50),
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: color != null
                    ? color
                    : Colors.orangeAccent.withOpacity(0.1)),
            child: body,
          ),
        ],
      ),
    );
  }
}
