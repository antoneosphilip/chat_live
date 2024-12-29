import 'package:flutter/cupertino.dart';

class UserDetailsContainer extends StatelessWidget {
  const UserDetailsContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return  Container(
      height:
      MediaQuery.of(context).size.height *
          0.2,
      decoration: const BoxDecoration(
        image: DecorationImage(
            matchTextDirection: true,
            image: AssetImage(
                'assets/images/detail_bg.png'),
            fit: BoxFit.fill),
        borderRadius: BorderRadius.only(
          topRight: Radius.circular(15),
          topLeft: Radius.circular(15),
        ),
      ),
    );
  }
}
