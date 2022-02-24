import 'package:flutter/material.dart';

import '../constants.dart';

class SocialButtonWidget extends StatelessWidget {
  const SocialButtonWidget({
    Key? key,
    required this.icon,
  }) : super(key: key);
  final String icon;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.center,
      child: DecoratedBox(
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(color: kThunderColor),
          borderRadius: const BorderRadius.all(Radius.circular(15),
          ),
        ),
        child: Stack(
          children: [
            Padding(
              padding: const EdgeInsets.only(
                left: 40,
                top: 18,
                right: 40,
                bottom: 18,
              ),
              child: Image.asset("assets/images/${icon}_icon.png",
                height: 27,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
