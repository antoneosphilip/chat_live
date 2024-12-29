import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../data/model/response/user_model.dart';

class GameCoinsScreen extends StatefulWidget {
  final UserModel? user;
  const GameCoinsScreen({super.key, this.user});

  @override
  State<GameCoinsScreen> createState() => _GameCoinsScreenState();
}

class _GameCoinsScreenState extends State<GameCoinsScreen> {
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
                  image: AssetImage('assets/images/game_coins_balance_bg.webp'),
                  fit: BoxFit.fill,
                  matchTextDirection: true),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Game Coin'.tr,
                  style: TextStyle(color: Colors.white54),
                ),
                Text(
                  '${widget.user?.wallet?.gameCoins}',
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
