import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:roumo_flutter/gen/assets.gen.dart';
import 'package:roumo_flutter/ui/text_style.dart';

class RecommendScreen extends StatelessWidget {
  const RecommendScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Center(child: Assets.images.readyImage.image()),
        13.verticalSpace,
        Text(Intl.message('plan_to_update'), style: style20Normal.copyWith(height: 24/20)),
        5.verticalSpace,
        Text(
          Intl.message('plan_to_update_detail'),
          style: style14NormalGrey.copyWith(height: 17/14),
        ),
      ],
    );
  }
}
