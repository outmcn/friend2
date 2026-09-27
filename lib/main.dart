import 'package:flutter/material.dart';
import 'package:tdesign_flutter/tdesign_flutter.dart';

void main() => runApp(const Friend2App());

class Friend2App extends StatelessWidget {
  const Friend2App({super.key});
  @override
  Widget build(BuildContext context) {
    final token = TThemeData.defaultData();
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Friend2',
      theme: TThemeBuilder.light(token),
      darkTheme: TThemeBuilder.dark(token),
      themeMode: ThemeMode.system,
      home: const Friend2Shell(),
    );
  }
}

class Friend2Shell extends StatefulWidget {
  const Friend2Shell({super.key});
  @override
  State<Friend2Shell> createState() => _Friend2ShellState();
}

class _Friend2ShellState extends State<Friend2Shell> {
  int tab = 0;
  @override
  Widget build(BuildContext context) {
    final pages = [const _HomeScreen(), const _DiscoveryScreen(), const _MessageScreen(), const _ProfileScreen()];
    return Scaffold(
      body: IndexedStack(index: tab, children: pages),
      bottomNavigationBar: TTabBar(
        variant: TTabBarVariant.iconText,
        value: tab,
        onChanged: (value) => setState(() => tab = value),
        navigationTabs: [
          TTabBarItemConfig(tabText: '主页', selectedIcon: const Icon(TIcons.home_filled), unselectedIcon: const Icon(TIcons.home), onTap: () => setState(() => tab = 0)),
          TTabBarItemConfig(tabText: '发现', selectedIcon: const Icon(TIcons.explore_filled), unselectedIcon: const Icon(TIcons.explore), onTap: () => setState(() => tab = 1)),
          TTabBarItemConfig(tabText: '消息', selectedIcon: const Icon(TIcons.chat_bubble_filled), unselectedIcon: const Icon(TIcons.chat_bubble), onTap: () => setState(() => tab = 2)),
          TTabBarItemConfig(tabText: '我的', selectedIcon: const Icon(TIcons.personal_information_filled), unselectedIcon: const Icon(TIcons.personal_information), onTap: () => setState(() => tab = 3)),
        ],
      ),
    );
  }
}

class _HomeScreen extends StatelessWidget {
  const _HomeScreen();
  @override
  Widget build(BuildContext context) => _PageFrame(
    title: 'Friend2', subtitle: '认识新朋友，分享每一天',
    child: Column(children: [
      const _HeroPanel(icon: TIcons.star_filled, title: '今天也要发光', subtitle: '记录你的生活，发现有趣的人'),
      const SizedBox(height: 16),
      TCellGroup(title: const Text('快捷入口'), cells: [
        TCell(image: const Icon(TIcons.edit_1), title: const Text('发布动态'), arrow: true),
        TCell(image: const Icon(TIcons.search), title: const Text('探索内容'), arrow: true),
        TCell(image: const Icon(TIcons.usergroup), title: const Text('认识朋友'), arrow: true),
      ]),
    ]),
  );
}

class _DiscoveryScreen extends StatelessWidget {
  const _DiscoveryScreen();
  @override
  Widget build(BuildContext context) => _PageFrame(
    title: '发现',
    action: TButton(size: TButtonSize.small, icon: const Icon(TIcons.add), onPressed: () {}, child: const Text('发布')),
    child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      DefaultTabController(length: 3, child: TTabsBar(tabs: const [TTab(text: '推荐'), TTab(text: '附近'), TTab(text: '关注')], onTap: (_) {})),
      const SizedBox(height: 16),
      const _PostPreview(icon: TIcons.image, title: '把日子过成喜欢的样子', subtitle: '今天的风很温柔，适合记录一点小确幸'),
      const SizedBox(height: 12),
      const _PostPreview(icon: TIcons.sunny, title: '周末城市漫步', subtitle: '沿着江边走走，发现新的风景'),
    ]),
  );
}

class _MessageScreen extends StatelessWidget {
  const _MessageScreen();
  @override
  Widget build(BuildContext context) => _PageFrame(
    title: '消息',
    action: TButton(variant: TButtonVariant.text, icon: const Icon(TIcons.search), onPressed: () {}, child: const Text('搜索')),
    child: TCellGroup(cells: [
      TCell(image: TAvatar(child: const Text('思')), title: const Text('思思'), subtitle: const Text('最近有新的动态'), arrow: true),
      TCell(image: TAvatar(child: const Text('测')), title: const Text('测试2号'), subtitle: const Text('分享了一条内容'), arrow: true),
      TCell(image: TAvatar(child: const Text('友')), title: const Text('新的朋友'), subtitle: const Text('看看谁关注了你'), arrow: true),
    ]),
  );
}

class _ProfileScreen extends StatelessWidget {
  const _ProfileScreen();
  @override
  Widget build(BuildContext context) => _PageFrame(
    title: '我的',
    action: TButton(variant: TButtonVariant.text, icon: const Icon(TIcons.setting), onPressed: () {}, child: const Text('设置')),
    child: Column(children: [
      TCell(image: TAvatar(size: TAvatarSize.large, child: const Icon(TIcons.user)), title: const Text('Friend 用户'), subtitle: const Text('分享生活，遇见同频的人'), arrow: true),
      const SizedBox(height: 16),
      TCellGroup(title: const Text('我的内容'), cells: [
        TCell(image: const Icon(TIcons.edit_1), title: const Text('动态'), note: const Text('12'), arrow: true),
        TCell(image: const Icon(TIcons.star), title: const Text('收藏'), note: const Text('8'), arrow: true),
        TCell(image: const Icon(TIcons.thumb_up), title: const Text('点赞'), note: const Text('24'), arrow: true),
      ]),
    ]),
  );
}

class _PageFrame extends StatelessWidget {
  const _PageFrame({required this.title, required this.child, this.subtitle, this.action});
  final String title; final String? subtitle; final Widget? action; final Widget child;
  @override
  Widget build(BuildContext context) => SafeArea(
        child: Column(
          children: [
            TNavBar(
              title: title,
              useDefaultBack: false,
              actions: action == null
                  ? null
                  : [
                      TNavBarItem(customWidget: action!),
                    ],
            ),
            Expanded(
              child: ListView(
                padding: const EdgeInsets.fromLTRB(16, 20, 16, 28),
                children: [child],
              ),
            ),
          ],
        ),
      );
}

class _HeroPanel extends StatelessWidget {
  const _HeroPanel({required this.icon, required this.title, required this.subtitle});
  final IconData icon; final String title; final String subtitle;
  @override
  Widget build(BuildContext context) => TCell(image: TAvatar(child: Icon(icon)), title: Text(title), subtitle: Text(subtitle), arrow: true);
}

class _PostPreview extends StatelessWidget {
  const _PostPreview({required this.icon, required this.title, required this.subtitle});
  final IconData icon; final String title; final String subtitle;
  @override
  Widget build(BuildContext context) => TCell(image: TAvatar(child: Icon(icon)), title: Text(title), subtitle: Text(subtitle), arrow: true);
}
