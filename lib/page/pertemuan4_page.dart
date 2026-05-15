import 'package:flutter/material.dart';

class Pertemuan4Page extends StatefulWidget {
  const Pertemuan4Page({super.key});

  @override
  State<Pertemuan4Page> createState() => _Pertemuan4PageState();
}

class _Pertemuan4PageState extends State<Pertemuan4Page> {

  // ================= TOAST ANIMASI =================
  void showAnimatedMessage(String text, Color color) {
    final overlay = Overlay.of(context);

    late OverlayEntry overlayEntry;

    overlayEntry = OverlayEntry(
      builder: (context) {
        return _AnimatedToast(
          text: text,
          color: color,
          onFinish: () {
            overlayEntry.remove();
          },
        );
      },
    );

    overlay.insert(overlayEntry);
  }

  // ================= DIALOG SUBMIT =================
  void showSubmitDialog() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: const [
            Icon(Icons.check_circle, color: Colors.green, size: 60),
            SizedBox(height: 10),
            Text(
              "Apakah kamu yakin?",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 5),
            Text("Apakah kamu ingin menambahkan data"),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text("NO"),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.pop(context);
              showAnimatedMessage(
                "Berhasil menambahkan data!",
                Colors.green,
              );
            },
            child: const Text("YES"),
          ),
        ],
      ),
    );
  }

  // ================= DIALOG DELETE =================
  void showDeleteDialog() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: const [
            Icon(Icons.warning, color: Colors.orange, size: 60),
            SizedBox(height: 10),
            Text(
              "Apakah kamu yakin?",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 5),
            Text("Apakah kamu ingin menghapus data"),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text("NO"),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.pop(context);
              showAnimatedMessage(
                "Berhasil menghapus data!",
                Colors.red,
              );
            },
            child: const Text("YES"),
          ),
        ],
      ),
    );
  }

  // ================= SHOW DIALOG =================
  void showInfoDialog() {
    showDialog(
      context: context,
      builder: (context) => const AlertDialog(
        content: Text("Ini contoh dialog biasa"),
      ),
    );
  }

  // ================= UI =================
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Pertemuan 4"),
        backgroundColor: Colors.blue,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: showSubmitDialog,
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.green,
              ),
              child: const Text("Submit"),
            ),
            const SizedBox(height: 10),
            ElevatedButton(
              onPressed: showDeleteDialog,
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.red,
              ),
              child: const Text("Delete"),
            ),
            const SizedBox(height: 10),
            ElevatedButton(
              onPressed: showInfoDialog,
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.grey,
              ),
              child: const Text("Show Dialog"),
            ),
          ],
        ),
      ),
    );
  }
}

// ================= WIDGET TOAST =================
class _AnimatedToast extends StatefulWidget {
  final String text;
  final Color color;
  final VoidCallback onFinish;

  const _AnimatedToast({
    required this.text,
    required this.color,
    required this.onFinish,
  });

  @override
  State<_AnimatedToast> createState() => _AnimatedToastState();
}

class _AnimatedToastState extends State<_AnimatedToast>
    with SingleTickerProviderStateMixin {

  late AnimationController controller;
  late Animation<Offset> animation;

  @override
  void initState() {
    super.initState();

    controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 400),
    );

    animation = Tween<Offset>(
      begin: const Offset(-1, 0),
      end: const Offset(0, 0),
    ).animate(CurvedAnimation(
      parent: controller,
      curve: Curves.easeOut,
    ));

    controller.forward();

    Future.delayed(const Duration(seconds: 2), () {
      controller.reverse().then((_) {
        widget.onFinish();
      });
    });
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: 60,
      left: 20,
      right: 20,
      child: SlideTransition(
        position: animation,
        child: Material(
          color: Colors.transparent,
          child: Center(
            child: ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 280), // ✅ biar tidak kepanjangan
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: const [
                    BoxShadow(color: Colors.black26, blurRadius: 5),
                  ],
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min, // ✅ penting
                  children: [
                    Icon(Icons.check_circle, color: widget.color),
                    const SizedBox(width: 10),
                    Flexible(
                      child: Text(widget.text),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}