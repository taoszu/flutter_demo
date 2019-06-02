import 'package:flutter/material.dart';

class Common {
  static appBar({title: String}) {
    return AppBar(
      title: Text(
        title,
        style: TextStyle(color: Color(0xFF262d50)),
      ),
      iconTheme: IconThemeData(color: Color(0xFF262d50)),
      backgroundColor: Colors.white,
      elevation: 0,
    );
  }

  static iconImage({path: String, color = const Color(0xFF262d50)}) {
    return Image.asset(
      "images/$path",
      width: 24,
      height: 24,
      color: color,
    );
  }

  static circleAvatar({size = 64.0, path: String}) {
    return CircleAvatar(
      radius: size / 2,
      backgroundImage: Image.asset(
        "images/$path",
        width: size,
        height: size,
      ).image,
    );
  }

  static primaryContent({content: String, color = const Color(0xFF6b7399)}) {
    return Text(
      content,
      style: TextStyle(color: color, fontSize: 16),
    );
  }

  static primarySmallTitle({content: String, color = const Color(0xFF262d50)}) {
    return Text(
      content,
      style: TextStyle(color: color, fontSize: 14),
    );
  }

  static primaryTitle({content: String, color = const Color(0xFF262d50)}) {
    return Text(
      content,
      style: TextStyle(color: color, fontSize: 16),
    );
  }

  static primaryBigTitle({content: String, color = const Color(0xFF262d50)}) {
    return Text(
      content,
      style: TextStyle(color: color, fontSize: 18),
    );
  }

  static primarySubTitle({content: String, color = const Color(0xFF8F95B3)}) {
    return Text(
      content,
      style: TextStyle(color: color, fontSize: 14),
    );
  }
}
