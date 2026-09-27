import 'package:flutter_test/flutter_test.dart';
import 'package:friend2/main.dart';

void main() {
  testWidgets('Friend2 renders TDesign UI shell', (tester) async {
    await tester.pumpWidget(const Friend2App());
    expect(find.text('Friend2'), findsOneWidget);
    expect(find.text('主页'), findsOneWidget);
    expect(find.text('发现'), findsOneWidget);
    expect(find.text('消息'), findsOneWidget);
    expect(find.text('我的'), findsOneWidget);
  });
}
