import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SwitchWidget extends StatefulWidget {
   SwitchWidget({super.key, required this.isSwitched});
     bool? isSwitched ;

  @override
  State<SwitchWidget> createState() => _SwitchWidgetState();
}

class _SwitchWidgetState extends State<SwitchWidget> {

  @override
  Widget build(BuildContext context) {

    return Switch(
      value: widget.isSwitched!,
      onChanged: (bool value) {
        setState(() {
          widget.isSwitched = value;
        });
      },
      activeColor: Colors.blue,
      inactiveThumbColor: Colors.grey,
      inactiveTrackColor: Colors.grey[300],
    );
  }
}
