import 'package:flutter/material.dart';
import 'package:simple_animations/simple_animations.dart';
import 'package:supercharged/supercharged.dart';

enum _BgProps { color1, color2 }

class AnimatedGradientBackground extends StatelessWidget {
  final Color color1Begin;
  final Color color1End;
  final Color color2Begin;
  final Color color2End;

  const AnimatedGradientBackground({
    Key key,
    this.color1Begin,
    this.color1End,
    this.color2Begin,
    this.color2End,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final tween = MultiTween<_BgProps>()
      ..add(
        _BgProps.color1,
        color1Begin
            // Color(0xFFF2B807)
            .tweenTo(color1End
                // Color(0xFF5F49F2)
                ),
      ) //Colors.lightBlue.shade900))
      ..add(
        _BgProps.color2,
        color2Begin
            // Color(0xFFFF199F)
            .tweenTo(color2End
                // Color(0xFF35F29A)
                ),
      ); //Colors.blue.shade600));

    return MirrorAnimation<MultiTweenValues<_BgProps>>(
      tween: tween,
      duration: 3.seconds,
      builder: (context, child, value) {
        return Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.center,
              end: Alignment.bottomCenter,
              colors: [value.get(_BgProps.color1), value.get(_BgProps.color2)],
            ),
          ),
        );
      },
    );
  }
}
