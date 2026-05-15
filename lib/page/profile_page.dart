import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          // ================= HEADER =================
          Stack(
            clipBehavior: Clip.none,
            children: [
              Container(
                height: 220,
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: NetworkImage(
                      'https://images.unsplash.com/photo-1501785888041-af3ef285b470',
                    ),
                    fit: BoxFit.cover,
                  ),
                ),
              ),

              // 🔥 PROFILE IMAGE (SUDAH FIX)
              Positioned(
                bottom: -50,
                left: 0,
                right: 0,
                child: Center(
                  child: Container(
                    width: 110,
                    height: 110,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(
                        color: Colors.white,
                        width: 4,
                      ),
                      boxShadow: const [
                        BoxShadow(
                          color: Colors.black26,
                          blurRadius: 10,
                          offset: Offset(0, 4),
                        ),
                      ],
                      image: const DecorationImage(
                        image: AssetImage('assets/images/profile.jpg'),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),

          const SizedBox(height: 60),

          // ================= NAME =================
          const Text(
            "Rayza Aditya Ilham",
            style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
          ),

          const SizedBox(height: 5),

          // NIM
          const Text(
            "NIM: 241011700882",
            style: TextStyle(color: Colors.grey),
          ),

          const SizedBox(height: 3),

          // KELAS
          const Text(
            "Kelas: 03SIFE009",
            style: TextStyle(color: Colors.grey),
          ),

          const SizedBox(height: 5),

          // LOCATION
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              Icon(Icons.location_on, size: 16, color: Colors.grey),
              Text(
                " Jakarta, Indonesia",
                style: TextStyle(color: Colors.grey),
              ),
            ],
          ),

          const SizedBox(height: 20),

          // ================= STATS =================
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: const [
              _StatItem("248", "Posts"),
              _StatItem("12.5K", "Followers"),
              _StatItem("894", "Following"),
            ],
          ),

          const SizedBox(height: 20),

          // ================= ABOUT ME =================
          const Padding(
            padding: EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "About Me",
                  style: TextStyle(
                      fontSize: 18, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 10),
                Text(
                  "Saya adalah mahasiswa Sistem Informasi yang memiliki minat dan passion dalam bidang teknologi, khususnya pengembangan aplikasi mobile menggunakan Flutter. Saya memiliki ketertarikan dalam mempelajari bagaimana sebuah aplikasi dibangun mulai dari perancangan tampilan (UI/UX), pengolahan data, hingga implementasi fitur yang interaktif. Saya juga terus berusaha meningkatkan kemampuan dalam bahasa pemrograman serta mengikuti perkembangan teknologi terbaru agar dapat menghasilkan aplikasi yang modern, efisien, dan user-friendly. Selain itu, saya memiliki semangat belajar yang tinggi, mampu bekerja secara mandiri maupun dalam tim, serta berkomitmen untuk terus berkembang dan memberikan kontribusi positif di dunia teknologi.",
                ),
              ],
            ),
          ),

          // ================= INFORMATION =================
          Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "Information",
                  style:
                      TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                _infoItem(Icons.email, "rayzailham06@gmail.com"),
                _infoItem(Icons.phone, "+62 85711514248"),
                _infoItem(Icons.cake, "March 14, 2006"),
                _infoItem(
                    Icons.work, "Mobile Programmer at Universitas Pamulang"),
              ],
            ),
          ),

          // ================= SKILLS =================
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "Skills & Interests",
                  style:
                      TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 10),
                Wrap(
                  spacing: 10,
                  children: const [
                    _ChipItem("Flutter"),
                    _ChipItem("UI/UX Design"),
                    _ChipItem("Laravel"),
                    _ChipItem("Figma"),
                    _ChipItem("SQL"),
                  ],
                ),
              ],
            ),
          ),

          const SizedBox(height: 20),

          // ================= BUTTON =================
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Row(
              children: [
                Expanded(
                  child: ElevatedButton(
                    onPressed: () {},
                    child: const Text("Edit Profile"),
                  ),
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: OutlinedButton(
                    onPressed: () {},
                    child: const Text("Share Profile"),
                  ),
                ),
              ],
            ),
          ),

          const SizedBox(height: 30),
        ],
      ),
    );
  }

  Widget _infoItem(IconData icon, String text) {
    return ListTile(
      leading: CircleAvatar(
        backgroundColor: Colors.blue.withOpacity(0.1),
        child: Icon(icon, color: Colors.blue),
      ),
      title: Text(text),
    );
  }
}

// ================= STAT =================
class _StatItem extends StatelessWidget {
  final String number;
  final String label;

  const _StatItem(this.number, this.label);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          number,
          style: const TextStyle(
              fontSize: 18, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 5),
        Text(label, style: const TextStyle(color: Colors.grey)),
      ],
    );
  }
}

// ================= CHIP =================
class _ChipItem extends StatelessWidget {
  final String text;

  const _ChipItem(this.text);

  @override
  Widget build(BuildContext context) {
    return Chip(
      label: Text(text),
      backgroundColor: Colors.blue.withOpacity(0.1),
    );
  }
}