import 'package:flutter_test/flutter_test.dart';
import 'package:cf_fluttertest/main.dart';

void main() {
  testWidgets('opens the details screen', (tester) async {
    await tester.pumpWidget(const CodeForgeFlutterApp());
    expect(find.text('Built with CodeForge'), findsOneWidget);
    await tester.tap(find.text('Open details'));
    await tester.pumpAndSettle();
    expect(find.text('Flutter navigation works'), findsOneWidget);
  });
}
