import 'package:flutter/material.dart';
import 'package:svgaplayer_flutter/parser.dart';
import 'package:svgaplayer_flutter/player.dart';

class SvgWithPngAndText extends StatefulWidget {
  final String svgPath;
  final String? txt;
  final String? txtPlaceName;
  final String? imageOneUrl;
  final String? imagetwoUrl;
  final String? imageOnePlaceName;
  final String? imagetwoPlaceName;
  final double? width;
  final double? height;
  const SvgWithPngAndText({
    super.key,
    this.txt,
    this.txtPlaceName,
    this.imageOneUrl,
    required this.svgPath,
    this.imageOnePlaceName,
    this.imagetwoUrl,
    this.imagetwoPlaceName,
    this.width,
    this.height,
  });

  @override
  State<SvgWithPngAndText> createState() => _SvgWithPngAndTextState();
}

class _SvgWithPngAndTextState extends State<SvgWithPngAndText>
    with SingleTickerProviderStateMixin {
  late SVGAAnimationController animationController;

  @override
  void initState() {
    this.animationController = SVGAAnimationController(vsync: this);
    this.loadAnimation();
    super.initState();
  }

  @override
  void dispose() {
    this.animationController.dispose();
    super.dispose();
  }

  void loadAnimation() async {
    final videoItem;
    if (widget.svgPath.startsWith('http')) {
      videoItem = await SVGAParser.shared.decodeFromURL(widget.svgPath);
    } else {
      videoItem = await SVGAParser.shared.decodeFromAssets(widget.svgPath);
    }
    animationController.videoItem = videoItem;
    if (widget.imageOneUrl != null) {
      animationController.videoItem?.dynamicItem.setImageWithUrl(
          "${widget.imageOneUrl}", "${widget.imageOnePlaceName}");
    }
    if (widget.imagetwoUrl != null) {
      animationController.videoItem?.dynamicItem.setImageWithUrl(
          "${widget.imagetwoUrl}", "${widget.imagetwoPlaceName}");
    }

    if (widget.txt != null) {
      animationController.videoItem?.dynamicItem.setText(
          TextPainter(
              text: TextSpan(
                  text: "${widget.txt}",
                  style: const TextStyle(
                    fontSize: 28,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ))),
          "${widget.txtPlaceName}");
    }
    animationController
        .repeat(period: const Duration(seconds: 2))
        .asStream()
        .first;
  }

  @override
  Widget build(BuildContext context) {
    return SVGAImage(
      animationController,
      preferredSize: widget.width != null && widget.height != null
          ? Size(widget.width!, widget.height!)
          : null,
    );
  }
}
