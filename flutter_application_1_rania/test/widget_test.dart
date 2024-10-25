// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

// Pastikan path berikut sesuai dengan lokasi file 'main.dart' pada proyek Anda
import 'package:flutter_application_1_rania/main.dart';

void main() {
  testWidgets('Counter increments smoke test', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(MyApp()); // Hapus 'const' jika MyApp tidak didefinisikan dengan const

    // Verify that our counter starts at 0.
    expect(find.text('0'), findsOneWidget); // Mengecek apakah ada teks '0'
    expect(find.text('1'), findsNothing);  // Mengecek apakah teks '1' tidak ditemukan

    // Tap the '+' icon and trigger a frame.
    await tester.tap(find.byIcon(Icons.add)); // Klik ikon '+'
    await tester.pump(); // Memicu satu frame lagi untuk mengupdate UI

    // Verify that our counter has incremented.
    expect(find.text('0'), findsNothing); // Memastikan '0' sudah tidak ada
    expect(find.text('1'), findsOneWidget); // Memastikan teks '1' muncul setelah ikon '+' ditekan
  });
}
