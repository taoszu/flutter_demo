import 'package:flutter/material.dart';
import 'package:flutter_demo/widget/ripple_item.dart';

import '../common_widget.dart';

class DrawerRippleItem extends StatelessWidget {
  DrawerRippleItem({
    Key key,
    this.isSelect = false,
    this.iconPath,
    @required this.title,
    this.highlightColor,
    this.contentHighlightColor,
    this.tapCallback,
  }) : super(key: key);

  final String iconPath;
  final String title;
  final Color highlightColor;
  final Color contentHighlightColor;
  final bool isSelect;
  final GestureTapCallback tapCallback;

  final Color normalColor = Color(0xFF262d50);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(right: 4.0),
      child: RippleItem(
        isSelect: isSelect,
        tapCallback: tapCallback,
        highlightColor: highlightColor,
        borderRadius: BorderRadius.only(
          topRight: Radius.circular(24.0),
          bottomRight: Radius.circular(24.0),
        ),
        content: Container(
            padding: EdgeInsets.only(left: 24.0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Container(
                  child: Common.iconImage(path: iconPath,color: isSelect ? contentHighlightColor: normalColor),
                  margin: EdgeInsets.only(right: 24.0),
                ),
                Common.primarySmallTitle(content: title, color: isSelect ? contentHighlightColor: normalColor)
              ],
            )),
      ),
    );
  }
}
