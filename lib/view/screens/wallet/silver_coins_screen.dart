import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../data/model/response/user_model.dart';

class SilverCoinsScreen extends StatefulWidget {
  final UserModel? user;
  const SilverCoinsScreen({super.key, this.user});

  @override
  State<SilverCoinsScreen> createState() => _SilverCoinsScreenState();
}

class _SilverCoinsScreenState extends State<SilverCoinsScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Container(
            padding: EdgeInsets.all(10),
            height: MediaQuery.of(context).size.height * 0.2,
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
              image: const DecorationImage(
                  image: AssetImage('assets/images/my_silver_bg.webp'),
                  fit: BoxFit.fill,
                  matchTextDirection: true),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Balance'.tr,
                  style: TextStyle(color: Colors.white54),
                ),
                Text(
                  '${widget.user?.wallet?.silver}',
                  style: TextStyle(fontSize: 30, color: Colors.white),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
