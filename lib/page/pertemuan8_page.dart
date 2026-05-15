// ==========================
// FILE : pertemuan8_page.dart
// ==========================

import 'package:flutter/material.dart';

class AutocompletespinPage extends StatefulWidget {
  const AutocompletespinPage({super.key});

  @override
  State<AutocompletespinPage> createState() =>
      _AutocompletespinPageState();
}

class _AutocompletespinPageState
    extends State<AutocompletespinPage> {

  final _formKey = GlobalKey<FormState>();

  final TextEditingController _universityController =
      TextEditingController();

  final TextEditingController _majorController =
      TextEditingController();

  String? _selectedEducationLevel;
  String? _selectedYear;

  final List<String> _universities = [
    'Universitas Indonesia',
    'Institut Teknologi Bandung',
    'Universitas Gadjah Mada',
    'Universitas Padjadjaran',
    'Universitas Airlangga',
    'Institut Pertanian Bogor',
    'Universitas Brawijaya',
    'Universitas Diponegoro',
    'Universitas Sebelas Maret',
    'Universitas Negeri Jakarta',
    'Universitas Pamulang',
  ];

  final List<String> _majors = [
    'Teknik Informatika',
    'Sistem Informasi',
    'Teknik Elektro',
    'Manajemen',
    'Akuntansi',
    'Hukum',
    'Kedokteran',
    'Psikologi',
    'Desain Komunikasi Visual',
    'Hubungan Internasional',
  ];

  final List<String> _educationLevels = [
    'SMA/Sederajat',
    'D3',
    'S1',
    'S2',
    'S3',
  ];

  final List<String> _years = [
    '2020',
    '2021',
    '2022',
    '2023',
    '2024',
    '2025',
    '2026',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],

      appBar: AppBar(
        title: const Text(
          'Pertemuan 8',
        ),
        centerTitle: true,
        backgroundColor: Colors.deepPurple,
        foregroundColor: Colors.white,
      ),

      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),

        child: Card(
          elevation: 5,

          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),

          child: Padding(
            padding: const EdgeInsets.all(20),

            child: Form(
              key: _formKey,

              child: Column(
                crossAxisAlignment:
                    CrossAxisAlignment.start,

                children: [

                  const Text(
                    "Form AutoComplete & Spinner",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.deepPurple,
                    ),
                  ),

                  const SizedBox(height: 25),

                  // ======================
                  // AUTOCOMPLETE UNIVERSITAS
                  // ======================

                  const Text(
                    "Universitas",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  const SizedBox(height: 10),

                  Autocomplete<String>(
                    optionsBuilder: (textEditingValue) {

                      if (textEditingValue.text.isEmpty) {
                        return const Iterable<String>.empty();
                      }

                      return _universities.where(
                        (option) => option
                            .toLowerCase()
                            .contains(
                              textEditingValue.text
                                  .toLowerCase(),
                            ),
                      );
                    },

                    onSelected: (value) {
                      _universityController.text = value;
                    },

                    fieldViewBuilder:
                        (context,
                            controller,
                            focusNode,
                            onEditingComplete) {

                      return TextFormField(
                        controller: controller,
                        focusNode: focusNode,

                        decoration: InputDecoration(
                          hintText:
                              "Cari universitas...",

                          border: OutlineInputBorder(
                            borderRadius:
                                BorderRadius.circular(12),
                          ),
                        ),

                        validator: (value) {

                          if (value == null ||
                              value.isEmpty) {

                            return "Universitas wajib diisi";
                          }

                          return null;
                        },
                      );
                    },
                  ),

                  const SizedBox(height: 25),

                  // ======================
                  // AUTOCOMPLETE JURUSAN
                  // ======================

                  const Text(
                    "Jurusan",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  const SizedBox(height: 10),

                  Autocomplete<String>(
                    optionsBuilder: (textEditingValue) {

                      if (textEditingValue.text.isEmpty) {
                        return const Iterable<String>.empty();
                      }

                      return _majors.where(
                        (option) => option
                            .toLowerCase()
                            .contains(
                              textEditingValue.text
                                  .toLowerCase(),
                            ),
                      );
                    },

                    onSelected: (value) {
                      _majorController.text = value;
                    },

                    fieldViewBuilder:
                        (context,
                            controller,
                            focusNode,
                            onEditingComplete) {

                      return TextFormField(
                        controller: controller,
                        focusNode: focusNode,

                        decoration: InputDecoration(
                          hintText:
                              "Cari jurusan...",

                          border: OutlineInputBorder(
                            borderRadius:
                                BorderRadius.circular(12),
                          ),
                        ),

                        validator: (value) {

                          if (value == null ||
                              value.isEmpty) {

                            return "Jurusan wajib diisi";
                          }

                          return null;
                        },
                      );
                    },
                  ),

                  const SizedBox(height: 25),

                  // ======================
                  // DROPDOWN JENJANG
                  // ======================

                  DropdownButtonFormField<String>(
                    value: _selectedEducationLevel,

                    decoration: InputDecoration(
                      labelText:
                          "Jenjang Pendidikan",

                      border: OutlineInputBorder(
                        borderRadius:
                            BorderRadius.circular(12),
                      ),
                    ),

                    items: _educationLevels.map((item) {

                      return DropdownMenuItem(
                        value: item,
                        child: Text(item),
                      );

                    }).toList(),

                    onChanged: (value) {

                      setState(() {
                        _selectedEducationLevel =
                            value;
                      });
                    },

                    validator: (value) {

                      if (value == null) {
                        return "Pilih jenjang pendidikan";
                      }

                      return null;
                    },
                  ),

                  const SizedBox(height: 25),

                  // ======================
                  // DROPDOWN TAHUN
                  // ======================

                  DropdownButtonFormField<String>(
                    value: _selectedYear,

                    decoration: InputDecoration(
                      labelText: "Tahun Masuk",

                      border: OutlineInputBorder(
                        borderRadius:
                            BorderRadius.circular(12),
                      ),
                    ),

                    items: _years.map((item) {

                      return DropdownMenuItem(
                        value: item,
                        child: Text(item),
                      );

                    }).toList(),

                    onChanged: (value) {

                      setState(() {
                        _selectedYear = value;
                      });
                    },

                    validator: (value) {

                      if (value == null) {
                        return "Pilih tahun masuk";
                      }

                      return null;
                    },
                  ),

                  const SizedBox(height: 35),

                  SizedBox(
                    width: double.infinity,
                    height: 55,

                    child: ElevatedButton(

                      onPressed: _submitForm,

                      style: ElevatedButton.styleFrom(
                        backgroundColor:
                            Colors.deepPurple,

                        foregroundColor:
                            Colors.white,
                      ),

                      child: const Text(
                        "Simpan Data",
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight:
                              FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  // ==========================
  // SUBMIT
  // ==========================

  void _submitForm() {

    if (_formKey.currentState!.validate()) {

      showDialog(
        context: context,

        builder: (context) {

          return AlertDialog(

            title: const Text("Berhasil"),

            content: Text(
              "Universitas : ${_universityController.text}\n"
              "Jurusan : ${_majorController.text}\n"
              "Jenjang : $_selectedEducationLevel\n"
              "Tahun : $_selectedYear",
            ),

            actions: [

              TextButton(
                onPressed: () {

                  Navigator.pop(context);

                },

                child: const Text("OK"),
              ),
            ],
          );
        },
      );

    } else {

      ScaffoldMessenger.of(context).showSnackBar(

        const SnackBar(
          content: Text(
            "Harap lengkapi semua data",
          ),
        ),
      );
    }
  }

  @override
  void dispose() {
    _universityController.dispose();
    _majorController.dispose();
    super.dispose();
  }
}