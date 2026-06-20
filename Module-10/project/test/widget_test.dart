// This is a basic Flutter widget test for the Food Recipes app.

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:project/main.dart';

void main() {
  testWidgets('Recipes list display smoke test', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(const MyApp());

    // Verify that the AppBar title is displayed.
    expect(find.text('Food Recipes'), findsOneWidget);

    // Verify that some recipes from our JSON list are displayed.
    expect(find.text('Pasta Carbonara'), findsOneWidget);
    expect(find.text('Creamy pasta dish with bacon and cheese.'), findsOneWidget);
    
    expect(find.text('Caprese Salad'), findsOneWidget);
    expect(find.text('Simple and refreshing salad with tomatoes, mozzarella, and basil.'), findsOneWidget);

    // Verify that the fast food icon is rendered on the screen.
    expect(find.byIcon(Icons.fastfood), findsAtLeastNWidgets(1));
  });
}
