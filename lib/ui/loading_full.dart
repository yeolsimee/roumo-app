import 'package:flutter/material.dart';
import 'package:roumo_flutter/gen/assets.gen.dart';

class LoadingFullScreen extends StatelessWidget {
  const LoadingFullScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Assets.images.loadingImage.image(),
      ),
    );
  }
}
