import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pointer_interceptor/pointer_interceptor.dart';
import 'package:live_app/util/dimensions.dart';
import 'package:live_app/view/base/custom_button.dart';

class InputDialog extends StatelessWidget {
  final String icon;
  final String? title;
  final Widget? child;
  final Function onYesPressed;
  final bool isLogOut;
  final Function? onNoPressed;
  const InputDialog(
      {Key? key,
      required this.icon,
      this.title,
      this.child,
      required this.onYesPressed,
      this.isLogOut = false,
      this.onNoPressed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return PointerInterceptor(
      child: SizedBox(
          width: 300,
          child: Padding(
            padding: const EdgeInsets.all(Dimensions.paddingSizeLarge),
            child: Column(mainAxisSize: MainAxisSize.min, children: [
              Image.asset(
                icon,
                width: 50,
                height: 50,
                // color: Theme.of(context).primaryColor,
              ),
              Padding(
                  padding: const EdgeInsets.all(Dimensions.paddingSizeLarge),
                  child: child),
              const SizedBox(height: Dimensions.paddingSizeLarge),
              Row(children: [
                Expanded(
                    child: TextButton(
                  onPressed: () => Get.back(),
                  style: TextButton.styleFrom(
                    backgroundColor:
                        Theme.of(context).disabledColor.withOpacity(0.3),
                    minimumSize: const Size(Dimensions.webMaxWidth, 50),
                    padding: EdgeInsets.zero,
                    shape: RoundedRectangleBorder(
                        borderRadius:
                            BorderRadius.circular(Dimensions.radiusSmall)),
                  ),
                  child: Text(
                    'back'.tr,
                    textAlign: TextAlign.center,
                  ),
                )),
                const SizedBox(width: Dimensions.paddingSizeLarge),
                Expanded(
                    child: CustomButton(
                  buttonText: 'go'.tr,
                  onPressed: () => onYesPressed(),
                  radius: Dimensions.radiusSmall,
                  height: 50,
                )),
              ]),
            ]),
          )),
    );
  }
}
