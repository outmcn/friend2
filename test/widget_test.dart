import 'package:flutter_test/flutter_test.dart';
import 'package:friend2/main.dart';

void main() {
  testWidgets('Friend2 contains Flutter and TD icon pages', (tester) async {
    await tester.pumpWidget(const Friend2IconApp());
    expect(find.text('Flutter 官方图标'), findsOneWidget);
    await tester.tap(find.text('TD 图标'));
    await tester.pump(const Duration(milliseconds: 300));
    expect(find.text('TD 图标'), findsAtLeastNWidgets(1));
    expect(find.text('搜索 TD 图标名称'), findsOneWidget);
  });
}
