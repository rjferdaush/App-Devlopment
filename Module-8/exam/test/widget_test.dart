import 'package:flutter_test/flutter_test.dart';
import 'package:exam/main.dart';

void main() {
  testWidgets('Blood Requests UI smoke test', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(const MyApp());

    // Verify that the title "Blood Requests" is displayed.
    expect(find.text('Blood Requests'), findsOneWidget);

    // Verify that the blood request types are displayed.
    expect(find.text('O- Blood Needed'), findsOneWidget);
    expect(find.text('O+ Blood Needed'), findsOneWidget);

    // Verify that the location detail is displayed on the screen.
    expect(find.textContaining('Khulna City Medical College Hospital'), findsAtLeastNWidgets(1));

    // Verify that the urgent badge and the View Details buttons exist.
    expect(find.text('URGENT'), findsNWidgets(2));
    expect(find.text('View Details'), findsNWidgets(2));
  });
}
