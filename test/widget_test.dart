import 'package:flutter_test/flutter_test.dart';
import 'package:friend2/main.dart';

void main() {
  testWidgets('Friend2 reference app renders button and component pages', (
    tester,
  ) async {
    await tester.pumpWidget(const Friend2App());
    expect(find.text('TD 按钮参考'), findsOneWidget);
    expect(find.text('按钮变体'), findsOneWidget);

    await tester.tap(find.text('Flutter 图标'));
    await tester.pump(const Duration(milliseconds: 300));
    expect(find.text('Flutter 官方图标'), findsOneWidget);
    expect(find.text('搜索 Flutter 图标名称'), findsOneWidget);

    await tester.tap(find.text('组件参考'));
    await tester.pump(const Duration(milliseconds: 300));
    expect(find.text('TD 组件参考'), findsOneWidget);
    expect(find.text('输入与选择'), findsOneWidget);
  });
}
