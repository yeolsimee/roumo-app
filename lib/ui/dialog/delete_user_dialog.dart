import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:roumo_flutter/ui/text_style.dart';

void showMemberLeaveDialog(BuildContext parentContext, void Function() callback) {
  showDialog<dynamic>(
    context: parentContext,
    builder: (context) {
      return Dialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4.r)),
        backgroundColor: Colors.white,
        insetPadding: EdgeInsets.zero,
        elevation: 0,
        child: Wrap(
          children: [
            SizedBox(
              width: 311.w,
              child: Padding(
                padding: EdgeInsets.all(20.w),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(Intl.message('memberLeave'), style: style16Normal),
                    24.verticalSpace,
                    Text(
                      Intl.message('memberLeaveDetail'),
                      style: style14Normal,
                      textAlign: TextAlign.start,
                    ),
                    16.verticalSpace,
                    Align(
                      alignment: Alignment.centerRight,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          GestureDetector(
                            onTap: callback,
                            child: Text(
                              Intl.message('memberLeave'),
                              style: style14NormalGrey.copyWith(height: 2),
                            ),
                          ),
                          16.horizontalSpace,
                          GestureDetector(
                              onTap: () => Navigator.pop(context),
                              child: Text(
                                Intl.message('giveUp'),
                                style: style14Normal.copyWith(height: 2),
                              )
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      );
    },
  );
}