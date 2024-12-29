import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:live_app/controller/events_controller.dart';
import 'package:live_app/util/app_constants.dart';
import 'package:live_app/view/widgets/svg/svg_with_png_and_texy.dart';
import 'package:svgaplayer_flutter/player.dart';

class BigHornLayer extends StatelessWidget {
  const BigHornLayer({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<EventsController>(
      builder: (controller) => Visibility(
        visible: controller.bigHorn,
        child: controller.bigHorn
            ? GestureDetector(
                onTap: () {},
                child: SvgWithPngAndText(
                  width: MediaQuery.of(context).size.width * 0.95,
                  height: MediaQuery.of(context).size.height * 0.2,
                  svgPath: 'assets/svg/big_horn.svga',
                  imageOneUrl:
                      'https://github.com/PonyCui/resources/blob/master/svga_replace_avatar.png?raw=true',
                  imageOnePlaceName: 'kuang1',
                ))
            : const SizedBox(),
      ),
    );
  }
}

class AllRoomLayer extends StatelessWidget {
  const AllRoomLayer({super.key});
  @override
  Widget build(BuildContext context) {
    return GetBuilder<EventsController>(
      builder: (controller) => Visibility(
        visible: controller.allRoom,
        child: controller.allRoom
            ? GestureDetector(
                onTap: () {},
                child: SvgWithPngAndText(
                  width: MediaQuery.of(context).size.width * 0.95,
                  height: MediaQuery.of(context).size.height * 0.2,
                  svgPath: 'assets/svg/all_room.svga',
                  imageOneUrl:
                      'https://github.com/PonyCui/resources/blob/master/svga_replace_avatar.png?raw=true',
                  imageOnePlaceName: 'baimiaobian',
                ))
            : const SizedBox(),
      ),
    );
  }
}

class AllSeatsLayer extends StatelessWidget {
  const AllSeatsLayer({super.key});
  @override
  Widget build(BuildContext context) {
    return GetBuilder<EventsController>(
      builder: (controller) => Visibility(
        visible: controller.allSeats,
        child: controller.allSeats
            ? GestureDetector(
                onTap: () {},
                child: SvgWithPngAndText(
                  width: MediaQuery.of(context).size.width * 0.95,
                  height: MediaQuery.of(context).size.height * 0.2,
                  svgPath: 'assets/svg/all_seats.svga',
                  imageOneUrl:
                      'https://github.com/PonyCui/resources/blob/master/svga_replace_avatar.png?raw=true',
                  imageOnePlaceName: 'baimiaobian',
                ))
            : const SizedBox(),
      ),
    );
  }
}

class InRoomGiftShowLayer extends StatelessWidget {
  const InRoomGiftShowLayer({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<EventsController>(
      builder: (controller) => Visibility(
        visible: controller.inRoom,
        child: controller.inRoom
            ? GestureDetector(
                onTap: () {
                  controller.hideInRoomSentGift();
                },
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  height: 500,
                  child: SVGASimpleImage(
                    resUrl:
                        "${AppConstants.mediaUrl}/gift/${controller.inRoomGiftSent?.image}",
                  ),
                ))
            : SizedBox(),
      ),
    );
  }
}
