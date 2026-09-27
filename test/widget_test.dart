import 'package:flutter_test/flutter_test.dart';
import 'package:friend2/main.dart';

void main() {
  testWidgets('Friend2 icon viewer renders', (tester) async {
    await tester.pumpWidget(const Friend2IconApp());
    expect(find.text('TD 图标'), findsOneWidget);
    expect(find.text('搜索图标名称'), findsOneWidget);
  });
}
