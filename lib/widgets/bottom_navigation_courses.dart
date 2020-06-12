import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class BottomNavigationBelajarkuy extends StatefulWidget {
  @override
  _BottomNavigationBelajarkuyState createState() => _BottomNavigationBelajarkuyState();
}

class _BottomNavigationBelajarkuyState extends State<BottomNavigationBelajarkuy> {
  int _selectedIndex = 0;
  var bottomTextStyle = TextStyle(
    fontSize: 12,
    fontWeight: FontWeight.w500,
  );

  void _onItemTapped(int index){
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 64,
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow:[
          BoxShadow(
            color: Colors.grey.withOpacity(0.3),
            spreadRadius: 2,
            blurRadius: 15,
            offset: Offset(0, 5),
          )
        ],
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(24),
          topRight: Radius.circular(24),
        )
      ),
      child: BottomNavigationBar(items: <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon: _selectedIndex == 0
            ? new SvgPicture.asset('assets/icons/home_colored.svg')
            : new SvgPicture.asset('assets/icons/home.svg'),
          title: Text('Home', style: bottomTextStyle,) 
        ),
        BottomNavigationBarItem(
          icon: _selectedIndex == 1
            ? new SvgPicture.asset('assets/icons/watch_colored.svg')
            : new SvgPicture.asset('assets/icons/watch.svg'),
          title: Text('My Course', style: bottomTextStyle,) 
        ),
      ],
      currentIndex: _selectedIndex,
      selectedItemColor: Color(0xFFF8AA70),
      unselectedItemColor: Color(0xFF8E8E8E),
      onTap: _onItemTapped,
      backgroundColor: Colors.transparent,
      type: BottomNavigationBarType.fixed,
      selectedFontSize: 12,
      showUnselectedLabels: true,
      elevation: 0,
      ),
    );
  }
}