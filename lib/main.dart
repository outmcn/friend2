import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:tdesign_flutter/tdesign_flutter.dart';
import 'icon_catalog.dart';

void main() => runApp(const Friend2App());

class Friend2App extends StatelessWidget {
  const Friend2App({super.key});

  @override
  Widget build(BuildContext context) {
    final token = TThemeData.defaultData();
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Friend2 TD 参考',
      theme: TThemeBuilder.light(token),
      darkTheme: TThemeBuilder.dark(token),
      themeMode: ThemeMode.system,
      home: const _ReferenceHome(),
    );
  }
}

class Friend2ButtonApp extends Friend2App {
  const Friend2ButtonApp({super.key});
}

class _ReferenceHome extends StatefulWidget {
  const _ReferenceHome();

  @override
  State<_ReferenceHome> createState() => _ReferenceHomeState();
}

class _ReferenceHomeState extends State<_ReferenceHome> {
  int tab = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: tab,
        children: const [_ButtonGallery(), _IconGallery()],
      ),
      bottomNavigationBar: NavigationBar(
        selectedIndex: tab,
        onDestinationSelected: (value) => setState(() => tab = value),
        destinations: const [
          NavigationDestination(
            icon: Icon(TIcons.button),
            selectedIcon: Icon(TIcons.button_filled),
            label: '按钮参考',
          ),
          NavigationDestination(
            icon: Icon(TIcons.app),
            selectedIcon: Icon(TIcons.app_filled),
            label: '图标查看',
          ),
        ],
      ),
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
    return SafeArea(
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
                  title: '尺寸与配色',
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
                      label: '小',
                      child: TButton(
                        size: TButtonSize.small,
                        colorScheme: TButtonColorScheme.danger,
                        child: const Text('危险小按钮'),
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
                  title: '状态与布局',
                  children: [
                    _ButtonRow(
                      label: '禁用',
                      child: const TButton(child: Text('不可用'), onPressed: null),
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
    );
  }
}

class _IconGallery extends StatefulWidget {
  const _IconGallery();

  @override
  State<_IconGallery> createState() => _IconGalleryState();
}

class _IconGalleryState extends State<_IconGallery> {
  final search = TextEditingController();
  String query = '';

  @override
  void dispose() {
    search.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final entries = tdesignIconCatalog.entries
        .where((entry) => entry.key.contains(query.toLowerCase()))
        .toList(growable: false);
    return SafeArea(
      child: Column(
        children: [
          TNavBar(
            title: 'TD 图标',
            useDefaultBack: false,
            actions: [
              TNavBarItem(
                customWidget: TText(
                  '${entries.length}/${tdesignIconCatalog.length}',
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(16, 12, 16, 8),
            child: TInput(
              controller: search,
              hintText: '搜索图标名称',
              prefix: const Icon(TIcons.search),
              onChanged: (value) =>
                  setState(() => query = value.trim().toLowerCase()),
              suffix: query.isEmpty
                  ? null
                  : IconButton(
                      onPressed: () {
                        search.clear();
                        setState(() => query = '');
                      },
                      icon: const Icon(TIcons.close),
                    ),
            ),
          ),
          Expanded(
            child: GridView.builder(
              padding: const EdgeInsets.fromLTRB(12, 4, 12, 24),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 4,
                mainAxisSpacing: 8,
                crossAxisSpacing: 8,
                childAspectRatio: .78,
              ),
              itemCount: entries.length,
              itemBuilder: (_, index) => _IconCard(
                name: entries[index].key,
                icon: entries[index].value,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _IconCard extends StatelessWidget {
  const _IconCard({required this.name, required this.icon});

  final String name;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    return TCell(
      align: TCellAlign.center,
      image: Icon(icon, size: 30, color: colors.primary),
      title: GestureDetector(
        onTap: () async {
          await Clipboard.setData(ClipboardData(text: name));
          if (context.mounted) {
            ScaffoldMessenger.of(
              context,
            ).showSnackBar(SnackBar(content: Text('已复制：$name')));
          }
        },
        child: Text(
          name,
          maxLines: 2,
          textAlign: TextAlign.center,
          overflow: TextOverflow.ellipsis,
          style: const TextStyle(fontSize: 10),
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
