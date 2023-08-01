import 'package:flutter/material.dart';
import 'package:points_rewards/extensions/system.dart';

class TextureBackground extends StatelessWidget {
  const TextureBackground({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: context.height,
      // width: context.width,
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage('assets/bg_texture.png'),
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
