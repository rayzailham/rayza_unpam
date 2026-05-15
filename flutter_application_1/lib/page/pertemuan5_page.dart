import 'package:flutter/material.dart';

class Pertemuan5Page extends StatelessWidget {
  const Pertemuan5Page({super.key});

  @override
  Widget build(BuildContext context) {
    final List<String> data = [
      "Item 1",
      "Item 2",
      "Item 3",
      "Item 4",
      "Item 5",
      "Item 6",
      "Item 7",
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text("Pertemuan 5 - ListView"),
      ),
      body: ListView.builder(
        itemCount: data.length,
        itemBuilder: (context, index) {
          return Card(
            margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: ListTile(
              leading: CircleAvatar(
                child: Text("${index + 1}"),
              ),
              title: Text(data[index]),
              subtitle: const Text("Ini adalah contoh ListView"),
              
              onTap: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text("Kamu klik ${data[index]}"),
                  ),
                );
              },
            ),
          );
        },
      ),
    );
  }
}