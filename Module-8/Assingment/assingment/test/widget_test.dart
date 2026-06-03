// This is a basic Flutter widget test for the Contact List UI.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package.

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:assingment/main.dart';

void main() {
  testWidgets('Contact List UI rendering test', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(const MyApp());

    // Verify that the title is 'Contact List'.
    expect(find.text('Contact List'), findsOneWidget);

    // Verify that the TextFormFields exist.
    expect(find.byType(TextFormField), findsNWidgets(2));

    // Verify that the Add button exists.
    expect(find.widgetWithText(ElevatedButton, 'Add'), findsOneWidget);

    // Verify that the initial contact list is displayed.
    expect(find.text('Jawad'), findsOneWidget);
    expect(find.text('01877-777777'), findsOneWidget);
    expect(find.text('Ferdous'), findsOneWidget);
    expect(find.text('01673-777777'), findsOneWidget);

    // We have three Hasan contacts, so check that at least one is found.
    expect(find.text('Hasan'), findsAtLeastNWidgets(1));
    expect(find.text('01745-777777'), findsAtLeastNWidgets(1));
  });
}
