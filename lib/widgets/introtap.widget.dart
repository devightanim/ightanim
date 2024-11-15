import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:ightanim/core/controllers/intro_tap.controller.dart';
class IntroTab extends StatefulWidget {
  final String text;
  final String svg;
  const IntroTab({
    required this.text,
    required this.svg,
    Key? key,
  }) : super(key: key);

  @override
  State<IntroTab> createState() => _IntroTabState();
}

class _IntroTabState extends State<IntroTab> {

  final IntroTabController _controller = Get.put(IntroTabController());

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Obx(
            () => Column(
          children: [
            Text(widget.text,style: TextStyle(),),
            Image.asset(widget.svg),

          ],
        ),
      ),
    );
  }

}
