import 'package:flutter/material.dart';
import 'package:flutter_mochammadagatha/controller/contact.dart';
import 'package:flutter_mochammadagatha/view/create_new_contacts.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:provider/provider.dart';

void main() {
  testWidgets('Test Create New Contacts Provider', (WidgetTester tester) async {

    final contactProvider = ContactProvider();

    // Build widget
    await tester.pumpWidget(
      MaterialApp(
        home: ChangeNotifierProvider(
          create: (context) => contactProvider,
          child: const CreateNewContacts(),
        ),
      ),
    );
    expect(find.text('Create New Contacts'), findsOneWidget);
    expect(find.text('Name'), findsOneWidget);
    expect(find.text('Nomor'), findsOneWidget);
    expect(find.text('Date'), findsOneWidget);
    expect(find.text('Pick Color'), findsOneWidget);
    expect(find.text('Pick File'), findsOneWidget);
    expect(find.text('Submit'), findsOneWidget);

    final nameTextField = find.ancestor(
      of: find.text('Name'),
      matching: find.byType(TextFormField),
    );

    final numberTextField = find.ancestor(
      of: find.text('Nomor'),
      matching: find.byType(TextFormField),
    );

    expect(find.text("Name"), findsOneWidget);
    await tester.enterText(nameTextField, 'Moch Agatha');
    expect(numberTextField, findsOneWidget);
    await tester.enterText(numberTextField, '0895397133255');

    expect(
        find.ancestor(
          of: find.text('Moch Agatha'),
          matching: find.byType(TextFormField),
        ),
        findsOneWidget);

    expect(
        find.ancestor(
          of: find.text('0895397133255'),
          matching: find.byType(TextFormField),
        ),
        findsOneWidget);

    final pickFileButton = find.text('Pick File');
    expect(pickFileButton, findsOneWidget);

    final pickColorButton = find.widgetWithText(ElevatedButton, "Pick Color");
    await tester.pump();
    expect(pickColorButton, findsOneWidget);
    await tester.tap(pickColorButton, warnIfMissed: false);
    await tester.pump();

    final selectDateButton = find.widgetWithText(TextButton, "Select");
    await tester.pump();
    expect(selectDateButton, findsOneWidget);
    await tester.tap(selectDateButton);
    await tester.pump();
    final datePickerDialog = find.byType(CalendarDatePicker);
    expect(datePickerDialog, findsOneWidget);

    final submitButton = find.text("Submit");
    await tester.tap(submitButton, warnIfMissed: false);
    await tester.pumpAndSettle();

    expect(find.text("List Contacts"), findsOneWidget);
    expect(find.text("M"), findsOneWidget);
    expect(find.text("Moch Agatha"), findsOneWidget);
    expect(find.text("0895397133255"), findsOneWidget);

    final editButton = find.byIcon(Icons.edit);
    expect(editButton, findsOneWidget);
    await tester.tap(editButton);
    await tester.pump();
  });
}
