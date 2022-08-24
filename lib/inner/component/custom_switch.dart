import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tasker/app_utils/app_color.dart';
import 'package:tasker/app_utils/app_text_style.dart';

class CustomSwitch extends StatefulWidget {
  final bool value;
  final ValueChanged<bool> onChanged;
  final Color activeColor;
  final Color inactiveColor;
  final String activeText;
  final String inactiveText;
  final Color activeTextColor;
  final Color inactiveTextColor;

  const CustomSwitch({
    Key? key,
    required this.value,
    required this.onChanged,
    required this.activeColor,
    this.inactiveColor = AppColor.cE2F1FD,
    this.activeText = '',
    this.inactiveText = '',
    this.activeTextColor = Colors.white70,
    this.inactiveTextColor = Colors.white70,
  }) : super(key: key);

  @override
  _CustomSwitchState createState() => _CustomSwitchState();
}

class _CustomSwitchState extends State<CustomSwitch> with SingleTickerProviderStateMixin {
  late Animation _circleAnimation;
  late AnimationController _animationController;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(vsync: this, duration: Duration(milliseconds: 60));
    _circleAnimation = AlignmentTween(
            begin: widget.value ? Alignment.centerRight : Alignment.centerLeft,
            end: widget.value ? Alignment.centerLeft : Alignment.centerRight)
        .animate(CurvedAnimation(parent: _animationController, curve: Curves.linear));
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _animationController,
      builder: (context, child) {
        return GestureDetector(
          onTap: () {
            if (_animationController.isCompleted) {
              _animationController.reverse();
            } else {
              _animationController.forward();
            }
            widget.value == false ? widget.onChanged(true) : widget.onChanged(false);
          },
          child: Container(
            width: 48.w,
            height: 24.h,
            padding: EdgeInsets.zero,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20.r),
              color: _circleAnimation.value == Alignment.centerLeft ? widget.inactiveColor : widget.activeColor,
              gradient: _circleAnimation.value == Alignment.centerLeft ? null : AppColor.gradient_03,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                _circleAnimation.value == Alignment.centerRight
                    ? Padding(
                        padding: EdgeInsets.symmetric(horizontal: 4.w),
                        child: Text(
                          widget.activeText,
                          style: AppTextStyle.regularNormal.copyWith(
                            fontSize: 12.sp,
                            color: widget.activeTextColor,
                          ),
                        ),
                      )
                    : const SizedBox(),
                Align(
                  alignment: _circleAnimation.value,
                  child: Container(
                    width: 20.r,
                    height: 20.r,
                    decoration: BoxDecoration(shape: BoxShape.circle, color: Colors.white),
                  ),
                ),
                _circleAnimation.value == Alignment.centerLeft
                    ? Padding(
                        padding: EdgeInsets.symmetric(horizontal: 4.w),
                        child: Text(
                          widget.inactiveText,
                          style: AppTextStyle.regularNormal.copyWith(
                            fontSize: 12.sp,
                            color: widget.inactiveTextColor,
                          ),
                        ),
                      )
                    : const SizedBox()
              ],
            ),
          ),
        );
      },
    );
  }
}
