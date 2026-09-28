import 'package:flutter_test/flutter_test.dart';
import 'package:friend2/main.dart';

void main() {
  testWidgets('Friend2 button gallery renders', (tester) async {
    await tester.pumpWidget(const Friend2ButtonApp());
    expect(find.text('TD 按钮参考'), findsOneWidget);
    expect(find.text('按钮变体'), findsOneWidget);
    expect(find.text('主要按钮'), findsOneWidget);
    expect(find.text('按钮变体'), findsOneWidget);
  });
}
