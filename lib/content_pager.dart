import 'package:beautyflutter/card_free.dart';
import 'package:beautyflutter/card_recommend.dart';
import 'package:beautyflutter/card_share.dart';
import 'package:beautyflutter/custom_appbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

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
    _statusBar();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        CustomAppBar(),
        Expanded(
          child: PageView(
            children: <Widget>[
              _wrapItem(CardRecommend()),
              _wrapItem(CardShare()),
              _wrapItem(CardFree()),
              _wrapItem(CardRecommend()),
            ],
            controller: _pageController,
            onPageChanged: widget.onPageChanged
          ),
        )
      ],
    );
  }

  Widget _wrapItem(Widget widget) {
    return Padding(
      padding: EdgeInsets.all(10),
      child: widget
    );
  }

  _statusBar() {
    SystemUiOverlayStyle uiOverlayStyle = SystemUiOverlayStyle(
      systemNavigationBarColor: Color(0xFF000000),
      systemNavigationBarDividerColor: null,
      statusBarColor: Colors.transparent,
      systemNavigationBarIconBrightness: Brightness.light,
      statusBarIconBrightness: Brightness.dark,
      statusBarBrightness: Brightness.light,
    );

    SystemChrome.setSystemUIOverlayStyle(uiOverlayStyle);
  }
}

class ContentPagerController {
  PageController _pageController;

  void jumpToPage(int page) {
    _pageController?.jumpToPage(page);
  }
}

