// ==========================
// FILE : beranda_page.dart
// ==========================

import 'package:flutter/material.dart';
import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';

import 'profile_page.dart';
import 'pertemuan3.dart';
import 'pertemuan4_page.dart';
import 'pertemuan5_page.dart';
import 'pertemuan6_page.dart';
import 'pertemuan7_page.dart';
import 'pertemuan8_page.dart';

class BerandaPage extends StatefulWidget {
  const BerandaPage({super.key});

  @override
  State<BerandaPage> createState() =>
      _BerandaPageState();
}

class _BerandaPageState
    extends State<BerandaPage> {

  int _currentIndex = 0;

  final List<Map<String, dynamic>> items = [
    {"title": "Pertemuan 1", "color": Colors.red},
    {"title": "Pertemuan 2", "color": Colors.orange},
    {"title": "Pertemuan 3", "color": Colors.yellow},
    {"title": "Pertemuan 4", "color": Colors.teal},
    {"title": "Pertemuan 5", "color": Colors.blue},
    {"title": "Pertemuan 6", "color": Colors.green},
    {"title": "Pertemuan 7", "color": Colors.purple},
    {"title": "Pertemuan 8", "color": Colors.deepPurple},
  ];

  @override
  Widget build(BuildContext context) {

    return Scaffold(

      appBar: AppBar(
        title: Text(
          _currentIndex == 0
              ? "Dashboard"
              : "Profile",
        ),

        centerTitle: true,
        backgroundColor: Colors.blue,
      ),

      body: _currentIndex == 0
          ? _buildList()
          : const ProfilePage(),

      bottomNavigationBar: SalomonBottomBar(

        currentIndex: _currentIndex,

        onTap: (i) {
          setState(() {
            _currentIndex = i;
          });
        },

        items: [

          SalomonBottomBarItem(
            icon: const Icon(Icons.home),
            title: const Text("Beranda"),
            selectedColor: Colors.blue,
          ),

          SalomonBottomBarItem(
            icon: const Icon(Icons.person),
            title: const Text("Profile"),
            selectedColor: Colors.blue,
          ),
        ],
      ),
    );
  }

  // ==========================
  // LIST MENU
  // ==========================

  Widget _buildList() {

    return ListView.builder(

      padding: const EdgeInsets.all(16),

      itemCount: items.length,

      itemBuilder: (context, index) {

        final item = items[index];

        return InkWell(

          onTap: () {

            switch (item["title"]) {

              case "Pertemuan 3":

                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) =>
                        const Pertemuan3Page(),
                  ),
                );

                break;

              case "Pertemuan 4":

                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) =>
                        const Pertemuan4Page(),
                  ),
                );

                break;

              case "Pertemuan 5":

                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) =>
                        const Pertemuan5Page(),
                  ),
                );

                break;

              case "Pertemuan 6":

                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) =>
                        const Pertemuan6Page(),
                  ),
                );

                break;

              case "Pertemuan 7":

                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) =>
                        const Pertemuan7Page(),
                  ),
                );

                break;

              case "Pertemuan 8":

                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) =>
                        const AutocompletespinPage(),
                  ),
                );

                break;

              default:

                ScaffoldMessenger.of(context)
                    .showSnackBar(

                  SnackBar(
                    content: Text(
                      "${item["title"]} belum tersedia",
                    ),
                  ),
                );
            }
          },

          child: Container(

            margin:
                const EdgeInsets.only(bottom: 15),

            padding: const EdgeInsets.all(16),

            decoration: BoxDecoration(
              color: Colors.white,

              borderRadius:
                  BorderRadius.circular(15),

              boxShadow: const [
                BoxShadow(
                  color: Colors.black12,
                  blurRadius: 5,
                ),
              ],
            ),

            child: Row(

              children: [

                CircleAvatar(
                  backgroundColor:
                      item["color"]
                          .withOpacity(0.2),

                  child: Icon(
                    Icons.menu_book,
                    color: item["color"],
                  ),
                ),

                const SizedBox(width: 15),

                Text(
                  item["title"],

                  style: const TextStyle(
                    fontSize: 16,
                  ),
                ),

                const Spacer(),

                const Icon(
                  Icons.arrow_forward_ios,
                  size: 16,
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}