import 'package:flutter/material.dart';
import 'package:flutter_mochammadagatha/view/gridview_screen.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('Test GridviewScreen UI', (WidgetTester tester) async {
    final Map<String, WidgetBuilder> routes = {
      '/showImage': (BuildContext context) => const Placeholder(),
    };
    await tester.pumpWidget(MaterialApp(
      home: const GridviewScreen(),
      routes: routes,
    ));

    await tester.pumpAndSettle();

    expect(find.text('Galeri'), findsOneWidget);

    expect(find.byType(GridView), findsOneWidget);

    await tester.tap(find.byType(GestureDetector).first);
    await tester.pumpAndSettle();

    expect(find.byType(BottomSheet), findsOneWidget);

    expect(find.byType(CircleAvatar), findsOneWidget);
    expect(find.text('Zee'), findsOneWidget);

    await tester.tap(find.byType(CircleAvatar));
    await tester.pumpAndSettle();

    expect(find.byType(AlertDialog), findsOneWidget);

    expect(find.text('Lihat Foto'), findsOneWidget);
    expect(find.text('Apakah anda ingin membuka foto ini?'), findsOneWidget);

    await tester.tap(find.text('Ya'));
    await tester.pumpAndSettle();
  });
}
