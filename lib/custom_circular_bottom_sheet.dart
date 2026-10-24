import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

///     NOTE
///     To use this bottom_sheets sheet and displayed as required set backgroundColor: Colors.transparent on showModalBottomSheet
class CustomCircularBottomSheet extends StatefulWidget {
  const CustomCircularBottomSheet({super.key, this.backgroundColor = Colors.white, required this.widget, this.padding});

  final EdgeInsetsGeometry? padding;
  final Color backgroundColor;
  final Widget widget;

  @override
  State<CustomCircularBottomSheet> createState() => _CustomCircularBottomSheetState();
}

class _CustomCircularBottomSheetState extends State<CustomCircularBottomSheet> with SingleTickerProviderStateMixin {
  late final AnimationController _shadowController;

  late final Animation<double> _firstShadowAnimation;
  late final Animation<double> _secondShadowAnimation;

  @override
  void initState() {
    super.initState();

    _shadowController = AnimationController(vsync: this, duration: const Duration(milliseconds: 1200));

    _firstShadowAnimation = CurvedAnimation(parent: _shadowController, curve: Curves.easeOut);

    _secondShadowAnimation = CurvedAnimation(parent: _shadowController, curve: Curves.easeOut);

    _shadowController.forward();
  }

  @override
  void dispose() {
    _shadowController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _shadowController,
      builder: (context, child) {
        return Container(
          constraints: BoxConstraints(maxHeight: MediaQuery.of(context).size.height * 0.85),
          padding: widget.padding ?? EdgeInsetsDirectional.only(top: 48.h, start: 24.w, end: 24.w, bottom: 24.h),
          width: double.infinity,
          decoration: BoxDecoration(
            color: widget.backgroundColor,
            borderRadius: BorderRadius.only(topLeft: Radius.circular(400.r), topRight: Radius.circular(400.r)),
            boxShadow: [
              BoxShadow(
                color: widget.backgroundColor.withValues(alpha: 0.2 * _secondShadowAnimation.value),
                spreadRadius: 30.r * _secondShadowAnimation.value,
              ),
              BoxShadow(
                color: widget.backgroundColor.withValues(alpha: 0.6 * _firstShadowAnimation.value),
                spreadRadius: 15.r * _firstShadowAnimation.value,
              ),
            ],
          ),
          child: SingleChildScrollView(
            child: Column(mainAxisSize: MainAxisSize.min, children: [widget.widget]),
          ),
        );
      },
    );
  }
}
