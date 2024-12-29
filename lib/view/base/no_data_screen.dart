import 'package:flutter/material.dart';

class NoDataScreen extends StatelessWidget {
  final bool isCart;
  final bool showFooter;
  final String? text;
  final bool fromAddress;
  const NoDataScreen(
      {Key? key,
      required this.text,
      this.isCart = false,
      this.showFooter = false,
      this.fromAddress = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView();
  }
}
