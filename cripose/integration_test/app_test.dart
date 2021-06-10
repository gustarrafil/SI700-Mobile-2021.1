import 'package:cripose/main.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('My test', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(MyApp());
  });
}
