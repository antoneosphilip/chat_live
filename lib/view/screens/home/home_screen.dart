import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:live_app/controller/splash_controller.dart';
import 'package:live_app/view/screens/home/my_rooms_screen.dart';
import 'package:live_app/view/screens/home/rooms_screen.dart';
import 'package:live_app/view/screens/home/widget/home_appbar.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with TickerProviderStateMixin {
  TabController? _tabController;
  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, initialIndex: 0, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<SplashController>(builder: (splashController) {
      return Scaffold(
        extendBodyBehindAppBar: true,
        backgroundColor: Colors.white54,
        appBar: HomeAppbar(
          tabController: _tabController,
        ),
        body: TabBarView(
          controller: _tabController,
          children: const [
            RoomsScreen(),
            MyRoomsScreen(),
          ],
        ),
      );
    });
  }
}
