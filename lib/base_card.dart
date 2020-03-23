import 'package:flutter/material.dart';

class BaseCart extends StatefulWidget {
  @override
  BaseCartState createState() => BaseCartState();
}

class BaseCartState extends State<BaseCart> {
  Color subTitleColor = Colors.grey;

  @override
  Widget build(BuildContext context) {
    return PhysicalModel(
      color: Colors.transparent,
      borderRadius: BorderRadius.circular(6),
      clipBehavior: Clip.antiAlias,
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white
        ),
        child: Column(
          children: <Widget>[
            topContent(),
            bottomContent()
          ],
        )
      )
    );
  }

  topContent() {
    return Padding(
      padding: EdgeInsets.only(left: 20, top: 26, bottom: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Row(
            children: <Widget>[
              topTitle('')
            ],
          ),
          subTitle('')
        ],
      ),
    );
  }

  bottomContent() {
    return Container();
  }

  Widget subTitle(String title) {
    return Padding(
      padding: EdgeInsets.only(top: 5),
      child: Text(
        title,
        style: TextStyle(
          fontSize: 11,
          color: subTitleColor
        )
      ),
    );
  }

  Widget topTitle(String title) {
    return Text(
      title,
      style: TextStyle(
        fontSize: 22
      )
    );
  }
}
