import 'package:flutter/material.dart';

class ContentPager extends StatefulWidget {
  final ValueChanged<int> onPageChanged;
  final ContentPagerController contentPagerController;

  const ContentPager({Key key, this.onPageChanged, this.contentPagerController}) : super(key: key);

  @override
  _ContentPagerState createState() => _ContentPagerState();
}

class _ContentPagerState extends State<ContentPager> {
  PageController _pageController = PageController(
      viewportFraction: 0.8
  );

  static List<Color> _colors = [
    Colors.blue,
    Colors.red,
    Colors.orange,
    Colors.teal
  ];

  @override
  void initState() {
    if(widget.contentPagerController != null) {
      widget.contentPagerController._pageController = _pageController;
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        // appBar
        Expanded(
          child: PageView(
            children: <Widget>[
              _wrapItem(0),
              _wrapItem(1),
              _wrapItem(2),
              _wrapItem(3),
            ],
            controller: _pageController,
            onPageChanged: widget.onPageChanged
          ),
        )
      ],
    );
  }

  Widget _wrapItem(index) {
    return Padding(
      padding: EdgeInsets.all(10),
      child: Container(
        decoration: BoxDecoration(
          color: _colors[index]
        ),
      ),
    );
  }
}

class ContentPagerController {
  PageController _pageController;

  void jumpToPage(int page) {
    _pageController?.jumpToPage(page);
  }
}
