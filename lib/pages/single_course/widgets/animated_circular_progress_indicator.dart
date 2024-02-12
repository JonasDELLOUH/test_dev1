
import 'package:flutter/material.dart';
import 'package:test_dev_flutter1/core/constants/colors.dart';

import '../../../global_widgets/custom_text.dart';

class AnimatedCircularProgressIndicator extends StatefulWidget {
  final double targetPercentage;
  final int animationDuration;

  const AnimatedCircularProgressIndicator({
    Key? key,
    this.animationDuration = 2000, required this.targetPercentage,
  }) : super(key: key);

  @override
  _AnimatedCircularProgressIndicatorState createState() =>
      _AnimatedCircularProgressIndicatorState();
}

class _AnimatedCircularProgressIndicatorState
    extends State<AnimatedCircularProgressIndicator>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
        duration: Duration(milliseconds: widget.animationDuration),
        vsync: this);
    _animation =
        Tween<double>(begin: 0, end: widget.targetPercentage.toDouble())
            .animate(_controller)
          ..addListener(() {
            setState(() {});
          });

    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Stack(
        alignment: Alignment.center,
        children: [
          SizedBox(
            width: 32,
            height: 32,
            child: CircularProgressIndicator(
              value: _animation.value / 100,
              strokeWidth: 4,
              color: AppColors.skyBlue,
                backgroundColor: Colors.grey
            ),
          ),
          CustomText(text:
            '${_animation.value.toInt()}%',
            fontSize: 12, fontWeight: FontWeight.bold, color: AppColors.skyBlue,
          ),
        ],
      ),
    );
  }
}
