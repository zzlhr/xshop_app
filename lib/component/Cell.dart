import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Cell extends StatelessWidget {
  final title;

  final content;

  final isJump;

  final jumpPageName;

  final type;

  const Cell(
    this.title, {
    Key key,
    this.content,
    this.isJump,
    this.jumpPageName,
    this.type,
  })  : assert(title != null),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Container(
          color: Colors.white,
          padding: EdgeInsets.fromLTRB(8, 12, 8, 12),
          child: Row(
            children: <Widget>[
              Expanded(
                flex: 5,
                child: Text(
                  this.title,
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                ),
              ),
              Expanded(
                flex: 20,
                child: _getContent(),
              ),
              _jump()
            ],
          ),
        ),
        Divider(
          height: 1,
        )
      ],
    );
  }

  _getContent() {
    var _type = type ?? "text";
    if (_type == "text") {
      var _content = content ?? "";
      return Text(_content, textDirection: TextDirection.rtl);
    }
    if (type == "AssetImage") {
      return Container(
        alignment: Alignment.centerRight,
        child: SizedBox(
          height: 40,
          width: 40,
          child: CircleAvatar(radius: 20, backgroundImage: content),
        ),
      );
    }
    return Container(width: 0, height: 0);
  }

  _jump() {
    if (this.isJump) {
      return Expanded(
        flex: 1,
        child: Icon(
          Icons.chevron_left,
          textDirection: TextDirection.rtl,
        ),
      );
    }
    return Container(width: 0, height: 0);
  }
}
