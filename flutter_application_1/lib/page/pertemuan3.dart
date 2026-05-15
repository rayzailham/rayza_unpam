import 'package:flutter/material.dart';

class Pertemuan3Page extends StatefulWidget {
  const Pertemuan3Page({super.key});

  @override
  State<Pertemuan3Page> createState() => _Pertemuan3PageState();
}

class _Pertemuan3PageState extends State<Pertemuan3Page> {
  final TextEditingController kodeController = TextEditingController();
  final TextEditingController namaController = TextEditingController();
  final TextEditingController hargaController = TextEditingController();

  // LIST UNTUK MENYIMPAN DATA
  List<Map<String, String>> dataProduk = [];

  void simpanData() {
    if (kodeController.text.isEmpty ||
        namaController.text.isEmpty ||
        hargaController.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Semua data harus diisi!")),
      );
      return;
    }

    setState(() {
      dataProduk.add({
        "kode": kodeController.text,
        "nama": namaController.text,
        "harga": hargaController.text,
      });
    });

    // reset form
    kodeController.clear();
    namaController.clear();
    hargaController.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Form Produk"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            // ================= FORM =================
            TextField(
              controller: kodeController,
              decoration: const InputDecoration(labelText: "Kode Produk"),
            ),
            TextField(
              controller: namaController,
              decoration: const InputDecoration(labelText: "Nama Produk"),
            ),
            TextField(
              controller: hargaController,
              decoration: const InputDecoration(labelText: "Harga Produk"),
            ),

            const SizedBox(height: 20),

            ElevatedButton(
              onPressed: simpanData,
              child: const Text("Simpan"),
            ),

            const SizedBox(height: 20),

            // ================= HASIL DATA =================
            Expanded(
              child: dataProduk.isEmpty
                  ? const Center(child: Text("Belum ada data"))
                  : ListView.builder(
                      itemCount: dataProduk.length,
                      itemBuilder: (context, index) {
                        final item = dataProduk[index];

                        return Card(
                          child: ListTile(
                            title: Text(item["nama"]!),
                            subtitle: Text(
                                "Kode: ${item["kode"]} | Harga: ${item["harga"]}"),
                          ),
                        );
                      },
                    ),
            )
          ],
        ),
      ),
    );
  }
}