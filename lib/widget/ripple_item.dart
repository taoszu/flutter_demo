import 'package:flutter/material.dart';

class RippleItem extends StatelessWidget {

  RippleItem({Key key,
    this.isSelect = false,
    this.itemHeight = 48.0,
    this.highlightColor = const Color(0xFFE1F5FE),
    this.normalColor = Colors.white,
    this.rippleColor,
    this.tapCallback,
    this.borderRadius = const BorderRadius.all(Radius.zero),
    this.content,
  }) : super(key: key);

  final bool isSelect;
  final double itemHeight;
  final Color normalColor;
  final Color highlightColor;
  final Color rippleColor;
  final GestureTapCallback tapCallback;
  final BorderRadius borderRadius;
  final Widget content;

  @override
  Widget build(BuildContext context) {
    return Material(
        color: normalColor,
        child: Ink(
            decoration: BoxDecoration(
                color: isSelect ? highlightColor : normalColor,
                borderRadius: borderRadius
            ),
            child: InkWell(
                splashColor: rippleColor != null ? rippleColor : Theme.of(context).splashColor,
                borderRadius: borderRadius,
                onTap: tapCallback,
                child: Container(
                  height: itemHeight,
                  child: content,
                ))));
  }

}