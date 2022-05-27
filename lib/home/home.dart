import 'package:flutter/material.dart';
import 'package:fug/feeds/feeds.dart';
import 'package:fug/messanges/messages.dart';
import 'package:fug/personal_page/personal_page.dart';

class HomePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _HomePageState();

  const HomePage({Key? key}) : super(key: key);
}

class _HomePageState extends State<HomePage> {
  int _selectedId = 0;
  static final List<Widget> _list = [
    const Feeds(),
    const Messages(),
    const PersonalPage()
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedId = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: _list[_selectedId],
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(
              icon: Icon(Icons.feed_outlined), label: "Лента"),
          BottomNavigationBarItem(
              icon: Icon(Icons.message_outlined), label: "Сообщения"),
          BottomNavigationBarItem(
              icon: Icon(Icons.person_outlined), label: "Профиль")
        ],
        onTap: _onItemTapped,
        currentIndex: _selectedId,
      ),
    );
  }
}
