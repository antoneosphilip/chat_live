import 'package:flutter/material.dart';
import 'package:live_app/util/styles.dart';

class DropDownItem {
  final String value;
  final String text;
  DropDownItem({required this.value, required this.text});
}

class DropDownView extends StatelessWidget {
  final List<DropDownItem> items;
  final Function onSelected;
  final String? selectedValue;
  final String? text;
  const DropDownView({
    Key? key,
    this.items = const [],
    required this.onSelected,
    this.selectedValue,
    this.text = '',
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<PopupMenuItem> bItems = [];
    items.forEach((element) {
      PopupMenuItem item = PopupMenuItem(
        padding: EdgeInsets.all(2),
        height: 25,
        value: "${element.value}",
        textStyle: robotoMedium.copyWith(
          color: Colors.black,
        ),
        child: Container(
          width: double.infinity,
          color:
              selectedValue == element.value ? Colors.teal : Colors.transparent,
          child: Center(
            child: Text(
              "${element.text}",
            ),
          ),
        ),
      );
      bItems.add(item);
    });
    return PopupMenuButton(
      constraints: BoxConstraints(maxWidth: 100, maxHeight: 170),
      padding: EdgeInsets.all(0),
      itemBuilder: (context) {
        return bItems;
      },
      child: Container(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text(
              '${text} ${selectedValue}',
              style: TextStyle(color: Colors.white),
            ),
            Icon(
              Icons.keyboard_arrow_up,
              color: Colors.white,
            )
          ],
        ),
      ),
      onSelected: (dynamic value) {
        onSelected(value);
      },
    );
  }
}
