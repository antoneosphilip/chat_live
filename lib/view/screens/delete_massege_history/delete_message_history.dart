import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:live_app/view/screens/delete_massege_history/widget/clear_message.dart';

import '../../widgets/app_bar.dart';

class DeleteMessageHistory extends StatelessWidget {
  const DeleteMessageHistory({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      appBar: const AppBarCustom(
        name: 'Delete message history',
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,

          children: [
            SizedBox(
              height: 10.h,
            ),
            const ClearMessage(text: 'Clear message list',),
            SizedBox(
              height: 10.h,
            ),
            Padding(
              padding:  EdgeInsets.only(left: 16.w),
              child: const Text(
                "After clearing the message list,the chat history remains",
                style: TextStyle(color: Colors.black38),
              ),
            ),
            SizedBox(
              height: 10.h,
            ),
            const ClearMessage(text: 'Clear all chat history',),
            SizedBox(
              height: 10.h,
            ),
            Padding(
              padding:  EdgeInsets.only(left: 16.w),
              child: const Text(
                "Clear all chat records",
                style: TextStyle(color: Colors.black38),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
