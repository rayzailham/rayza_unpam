import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_application_1/page/beranda_page.dart';

void main() {
  testWidgets('Test BerandaPage tampil', (WidgetTester tester) async {
    await tester.pumpWidget(
      MaterialApp(
        home: BerandaPage(),
      ),
    );

    expect(find.text('Dashboard'), findsOneWidget);
  });
}