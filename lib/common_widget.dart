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

  static iconImage({path: String}) {
    return Image.asset(
      "images/$path",
      width: 24,
      height: 24,
      color: Colors.blue,
    );
  }

  static circleAvatar({size = 64.0,  path: String}) {
    return CircleAvatar(
      radius: size / 2,
      backgroundImage: Image.asset(
        "images/$path",
        width: size,
        height: size,
      ).image,
    );
  }

  static primaryContent({content: String}) {
    return Text(
      content,
      style: TextStyle(color: Color(0xFF6b7399), fontSize: 16),
    );
  }

  static primaryTitle({content: String}) {
    return Text(
      content,
      style: TextStyle(color: Color(0xFF262d50), fontSize: 16),
    );
  }

  static primaryBigTitle({content: String}) {
    return Text(
      content,
      style: TextStyle(color: Color(0xFF262d50), fontSize: 18),
    );
  }

  static primarySubTitle({content: String}) {
    return Text(
      content,
      style: TextStyle(color: Color(0xFF8F95B3), fontSize: 14),
    );
  }

}
