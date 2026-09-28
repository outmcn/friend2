import 'package:flutter_test/flutter_test.dart';
import 'package:friend2/main.dart';

void main() {
  testWidgets('official Flutter icon gallery renders', (tester) async {
    await tester.pumpWidget(const Friend2OfficialIconsApp());
    expect(find.text('Flutter 官方图标'), findsOneWidget);
    expect(find.text('搜索 Flutter 图标名称'), findsOneWidget);
  });
}
