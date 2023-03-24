import 'package:flutter/material.dart';

class MZBottomNavigationBar extends StatefulWidget {
  final List<String> unselectedIconList;
  final List<String> selectedIconList;
  final List<String> titleList;
  final Color unselectedColor;
  final Color selectedColor;
  final List<Widget> pageList;
  final double iconSize;
  final double fontSize;
  final Color backgroundColor;

  const MZBottomNavigationBar(
      {Key key,
      @required this.unselectedIconList,
      this.selectedIconList,
      @required this.titleList,
      this.unselectedColor = Colors.black54,
      this.selectedColor = Colors.red,
      @required this.pageList,
      this.backgroundColor = Colors.white,
      this.iconSize = 24.0,
      this.fontSize = 16})
      : super(key: key);

  @override
  _MZBottomNavigationBarState createState() => _MZBottomNavigationBarState();
}

class _MZBottomNavigationBarState extends State<MZBottomNavigationBar> {
  int _currentIndex = 0;
  PageController _pageController = new PageController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        type: BottomNavigationBarType.fixed,
        unselectedItemColor: widget.unselectedColor,
        selectedItemColor: widget.selectedColor,
        unselectedFontSize: widget.fontSize,
        selectedFontSize: widget.fontSize,
        onTap: (index) {
          _pageController.jumpToPage(index);
          setState(() {
            _currentIndex = index;
          });
        },
        items: widget.titleList.asMap().keys.map((index) {
          return BottomNavigationBarItem(
              icon: Image.asset(
                widget.unselectedIconList[index],
                width: widget.iconSize,
                height: widget.iconSize,
                fit: BoxFit.contain,
              ),
              activeIcon: widget.selectedIconList == null
                  ? null
                  : Image.asset(
                      widget.selectedIconList[index],
                      width: widget.iconSize,
                      height: widget.iconSize,
                      fit: BoxFit.contain,
                    ),
              label: widget.titleList[index]);
        }).toList(),
      ),
      body: PageView.builder(
          onPageChanged: (index) {
            setState(() {
              _currentIndex = index;
            });
          },
          controller: _pageController,
          itemCount: widget.pageList.length,
          itemBuilder: (BuildContext context, int index) {
            return widget.pageList[index];
          }),
    );
  }
}
