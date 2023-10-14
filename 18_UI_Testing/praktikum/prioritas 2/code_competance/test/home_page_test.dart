import 'package:code_competance/home_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('UI Testing for HomePage', (WidgetTester tester) async {
    await tester.pumpWidget(const MaterialApp(home: HomePage()));

    expect(find.byType(AppBar), findsOneWidget);

    await tester.tap(find.byIcon(Icons.menu));

    expect(
        find.text(
            "Coding Bootcamp Penghasil\nProgrammer Dengan Kualitas\nTinggi di Indonesia"),
        findsOneWidget);
    expect(
        find.text(
            "Alterra Academy adalah coding bootcamp\nindonesia untuk semua orang baik dengan\nbackground IT & non-IT untuk menjadi\nProgrammer dengan kualitas terbaik di\nindustri saat ini."),
        findsOneWidget);

    await tester.tap(find.text("Pelajari Lebih Lanjut"));
    await tester.pumpAndSettle();

    expect(find.text("Contact Us"), findsOneWidget);
    expect(find.byType(TextFormField), findsWidgets);

    final textFields = find.byType(TextField);

    expect(textFields, findsWidgets);

    for (final textField in textFields.evaluate()) {
      expect(textField.widget, isA<TextField>());
    }

    await tester.enterText(
        find.widgetWithText(TextFormField, "First name"), "Moch");
    await tester.enterText(
        find.widgetWithText(TextFormField, "Last name"), "Agatha");
    await tester.enterText(
        find.widgetWithText(TextFormField, "Email"), "agatha01@gmail.com");
    await tester.enterText(
        find.widgetWithText(TextField, "Masukkan komentar di sini..."),
        "Wah bagus banget!!!!");

    await tester.tap(find.text("Submit"), warnIfMissed: false);
    await tester.pumpAndSettle();

    expect(find.text("Feedback"), findsOneWidget);
    expect(find.text("Moch"), findsOneWidget);
    expect(find.text("Agatha"), findsOneWidget);
    expect(find.text("Wah bagus banget!!!!"), findsOneWidget);
  });
}
