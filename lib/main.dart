import 'package:flutter/material.dart';
import 'package:tdesign_flutter/tdesign_flutter.dart';

void main() => runApp(const Friend2ButtonApp());

class Friend2ButtonApp extends StatelessWidget {
  const Friend2ButtonApp({super.key});

  @override
  Widget build(BuildContext context) {
    final token = TThemeData.defaultData();
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Friend2 TD 按钮参考',
      theme: TThemeBuilder.light(token),
      darkTheme: TThemeBuilder.dark(token),
      themeMode: ThemeMode.system,
      home: const _ButtonGallery(),
    );
  }
}

class _ButtonGallery extends StatefulWidget {
  const _ButtonGallery();

  @override
  State<_ButtonGallery> createState() => _ButtonGalleryState();
}

class _ButtonGalleryState extends State<_ButtonGallery> {
  String? lastAction;

  void showAction(String text) {
    setState(() => lastAction = text);
    ScaffoldMessenger.of(context)
      ..hideCurrentSnackBar()
      ..showSnackBar(SnackBar(content: Text(text)));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            const TNavBar(title: 'TD 按钮参考', useDefaultBack: false),
            Expanded(
              child: ListView(
                padding: const EdgeInsets.fromLTRB(16, 12, 16, 32),
                children: [
                  _Section(
                    title: '按钮变体',
                    children: [
                      _ButtonRow(
                        label: '填充',
                        child: TButton(
                          variant: TButtonVariant.fill,
                          colorScheme: TButtonColorScheme.primary,
                          child: const Text('主要按钮'),
                          onPressed: () => showAction('点击了主要按钮'),
                        ),
                      ),
                      _ButtonRow(
                        label: '描边',
                        child: TButton(
                          variant: TButtonVariant.outline,
                          colorScheme: TButtonColorScheme.primary,
                          child: const Text('描边按钮'),
                          onPressed: () => showAction('点击了描边按钮'),
                        ),
                      ),
                      _ButtonRow(
                        label: '文字',
                        child: TButton(
                          variant: TButtonVariant.text,
                          colorScheme: TButtonColorScheme.primary,
                          child: const Text('文字按钮'),
                          onPressed: () => showAction('点击了文字按钮'),
                        ),
                      ),
                      _ButtonRow(
                        label: '幽灵',
                        child: TButton(
                          variant: TButtonVariant.ghost,
                          colorScheme: TButtonColorScheme.primary,
                          child: const Text('幽灵按钮'),
                          onPressed: () => showAction('点击了幽灵按钮'),
                        ),
                      ),
                    ],
                  ),
                  _Section(
                    title: '尺寸',
                    children: [
                      _ButtonRow(
                        label: '大',
                        child: TButton(
                          size: TButtonSize.large,
                          child: const Text('大按钮'),
                          onPressed: () => showAction('点击了大按钮'),
                        ),
                      ),
                      _ButtonRow(
                        label: '中',
                        child: TButton(
                          size: TButtonSize.medium,
                          child: const Text('中按钮'),
                          onPressed: () => showAction('点击了中按钮'),
                        ),
                      ),
                      _ButtonRow(
                        label: '小',
                        child: TButton(
                          size: TButtonSize.small,
                          child: const Text('小按钮'),
                          onPressed: () => showAction('点击了小按钮'),
                        ),
                      ),
                      _ButtonRow(
                        label: '超小',
                        child: TButton(
                          size: TButtonSize.extraSmall,
                          child: const Text('超小按钮'),
                          onPressed: () => showAction('点击了超小按钮'),
                        ),
                      ),
                    ],
                  ),
                  _Section(
                    title: '配色',
                    children: [
                      _ButtonRow(
                        label: '默认',
                        child: TButton(
                          colorScheme: TButtonColorScheme.defaultTheme,
                          child: const Text('默认'),
                          onPressed: () => showAction('点击了默认按钮'),
                        ),
                      ),
                      _ButtonRow(
                        label: '危险',
                        child: TButton(
                          colorScheme: TButtonColorScheme.danger,
                          child: const Text('危险操作'),
                          onPressed: () => showAction('点击了危险按钮'),
                        ),
                      ),
                      _ButtonRow(
                        label: '浅色',
                        child: TButton(
                          colorScheme: TButtonColorScheme.light,
                          child: const Text('浅色按钮'),
                          onPressed: () => showAction('点击了浅色按钮'),
                        ),
                      ),
                    ],
                  ),
                  _Section(
                    title: '图标按钮',
                    children: [
                      _ButtonRow(
                        label: '左图标',
                        child: TButton(
                          icon: const Icon(TIcons.add_circle),
                          child: const Text('新增'),
                          onPressed: () => showAction('点击了新增'),
                        ),
                      ),
                      _ButtonRow(
                        label: '右图标',
                        child: TButton(
                          icon: const Icon(TIcons.arrow_right),
                          iconPosition: TButtonIconPosition.right,
                          child: const Text('下一步'),
                          onPressed: () => showAction('点击了下一步'),
                        ),
                      ),
                      _ButtonRow(
                        label: '纯图标',
                        child: TButton(
                          icon: const Icon(TIcons.add_circle),
                          child: const SizedBox.shrink(),
                          onPressed: () => showAction('点击了纯图标按钮'),
                        ),
                      ),
                    ],
                  ),
                  _Section(
                    title: '禁用和通栏',
                    children: [
                      _ButtonRow(
                        label: '禁用',
                        child: const TButton(
                          child: Text('不可用'),
                          onPressed: null,
                        ),
                      ),
                      SizedBox(
                        width: double.infinity,
                        child: TButton(
                          child: const Text('通栏按钮'),
                          onPressed: () => showAction('点击了通栏按钮'),
                        ),
                      ),
                    ],
                  ),
                  if (lastAction != null)
                    Padding(
                      padding: const EdgeInsets.only(top: 12),
                      child: Text('最近操作：$lastAction'),
                    ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _Section extends StatelessWidget {
  const _Section({required this.title, required this.children});

  final String title;
  final List<Widget> children;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 22),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(bottom: 10),
            child: Text(
              title,
              style: Theme.of(
                context,
              ).textTheme.titleMedium?.copyWith(fontWeight: FontWeight.w700),
            ),
          ),
          ...children,
        ],
      ),
    );
  }
}

class _ButtonRow extends StatelessWidget {
  const _ButtonRow({required this.label, required this.child});

  final String label;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: Row(
        children: [
          SizedBox(width: 56, child: Text(label)),
          Expanded(child: child),
        ],
      ),
    );
  }
}
