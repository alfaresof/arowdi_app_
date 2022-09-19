import 'package:arowdi_app/screen/details/details.dart';
import 'package:arowdi_app/screen/saved_poet/saved.dart';
import 'package:arowdi_app/screen/wazn_page/wazn_page.dart';
import 'package:flutter/material.dart';

import '../comp/color.dart';

class home extends StatefulWidget {
  final int selected;
  const home({Key? key, required this.selected}) : super(key: key);

  @override
  State<home> createState() => _homeState();
}

class _homeState extends State<home> {
  late int _selectedindex = widget.selected;
  final tabs = [
    saved_poet(),
    wazn_page(),
    details(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: tabs[_selectedindex],
      bottomNavigationBar: BottomNavigationBar(
        onTap: (index) {
          setState(() {
            _selectedindex = index;
            tabs[_selectedindex];
          });
        },
        currentIndex: _selectedindex,
        backgroundColor: black_color,
        items: [
          BottomNavigationBarItem(
            icon: Icon(
              Icons.list_alt,
              color: orange_color,
            ),
            label: 'ابيات سابقة',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.play_arrow_outlined,
              color: orange_color,
            ),
            label: 'اوزن',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.not_listed_location_outlined,
              color: orange_color,
            ),
            label: 'عن التطبيق',
          ),
        ],
        selectedItemColor: orange_color,
        unselectedItemColor: orange_color,
      ),
    );
  }
}
