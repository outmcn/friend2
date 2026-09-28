import 'package:flutter_test/flutter_test.dart';
import 'package:friend2/main.dart';

void main() {
  testWidgets('Friend2 reference app renders buttons and icons', (
    tester,
  ) async {
    await tester.pumpWidget(const Friend2App());
    expect(find.text('TD 按钮参考'), findsOneWidget);
    expect(find.text('按钮变体'), findsOneWidget);
    expect(find.text('主要按钮'), findsOneWidget);
    await tester.tap(find.text('图标查看'));
    await tester.pumpAndSettle();
    expect(find.text('TD 图标'), findsOneWidget);
    expect(find.text('搜索图标名称'), findsOneWidget);
  });
}
