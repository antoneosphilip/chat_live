import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../../../util/styles.dart';

class TabBarChatScreen extends StatelessWidget {
  const TabBarChatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: Container(
        margin: const EdgeInsets.only(top: 10),
        decoration: BoxDecoration(
          gradient: const LinearGradient(
            colors: [
              Colors.pinkAccent,
              Colors.purple,
            ],
          ),
          borderRadius: BorderRadius.circular(30),
        ),
        child: Padding(
          padding: const EdgeInsets.all(3.0),
          child: TabBar(
            indicator: BoxDecoration(
              borderRadius: BorderRadius.circular(30),
              color: Colors.white,
            ),
            labelColor: Colors.pinkAccent,
            unselectedLabelColor: Colors.white,
            tabs: [
              Tab(
                child: Text('Message', style: robotoBlack2),
              ),
              Tab(
                child: Text('Group chat', style: robotoBlack2),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
