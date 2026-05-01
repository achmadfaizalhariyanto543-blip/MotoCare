import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:motocare/main.dart';

void main() {

  testWidgets('Menampilkan MotoCare', (WidgetTester tester) async {
    await tester.pumpWidget(const MyApp());

    expect(find.text('MotoCare'), findsOneWidget);
  });

  testWidgets('Tombol Servis Motor ada', (WidgetTester tester) async {
    await tester.pumpWidget(const MyApp());

    expect(find.text('Servis Motor'), findsOneWidget);
  });

  testWidgets('Navigasi ke halaman Servis', (WidgetTester tester) async {
    await tester.pumpWidget(const MyApp());

    await tester.tap(find.text('Servis Motor'));
    await tester.pumpAndSettle();

    expect(find.text('Halaman Servis'), findsOneWidget);
  });

  testWidgets('Input nama pelanggan', (WidgetTester tester) async {
    await tester.pumpWidget(const MyApp());

    await tester.enterText(find.byType(TextField), 'Faizal');
    await tester.pump();

    expect(find.text('Faizal'), findsOneWidget);
  });

  testWidgets('Menampilkan daftar sparepart', (WidgetTester tester) async {
    await tester.pumpWidget(const MyApp());

    expect(find.text('Oli'), findsOneWidget);
    expect(find.text('Ban'), findsOneWidget);
  });

}