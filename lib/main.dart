import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:tdesign_flutter_icons/tdesign_flutter_icons.dart';
import 'flutter_icon_catalog.dart';
import 'td_icon_catalog.dart';

void main() => runApp(const Friend2IconApp());

class Friend2IconApp extends StatelessWidget {
  const Friend2IconApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Friend2 图标参考',
      theme: ThemeData(useMaterial3: true, brightness: Brightness.light),
      darkTheme: ThemeData(useMaterial3: true, brightness: Brightness.dark),
      themeMode: ThemeMode.system,
      home: const _IconReferenceHome(),
    );
  }
}

class _IconReferenceHome extends StatefulWidget {
  const _IconReferenceHome();

  @override
  State<_IconReferenceHome> createState() => _IconReferenceHomeState();
}

class _IconReferenceHomeState extends State<_IconReferenceHome> {
  int tab = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: tab,
        children: const [_FlutterIconsPage(), _TdIconsPage()],
      ),
      bottomNavigationBar: NavigationBar(
        selectedIndex: tab,
        onDestinationSelected: (value) => setState(() => tab = value),
        destinations: const [
          NavigationDestination(
            icon: Icon(Icons.apps_outlined),
            selectedIcon: Icon(Icons.apps),
            label: 'Flutter 官方',
          ),
          NavigationDestination(
            icon: const Icon(TIcons.application),
            selectedIcon: const Icon(TIcons.application_filled),
            label: 'TD 图标',
          ),
        ],
      ),
    );
  }
}

class _FlutterIconsPage extends StatefulWidget {
  const _FlutterIconsPage();

  @override
  State<_FlutterIconsPage> createState() => _FlutterIconsPageState();
}

class _FlutterIconsPageState extends State<_FlutterIconsPage> {
  final search = TextEditingController();
  String query = '';

  @override
  void dispose() {
    search.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final entries = flutterIconCatalog.entries
        .where((entry) => entry.key.contains(query.toLowerCase()))
        .toList(growable: false);
    return _IconGalleryScaffold(
      title: 'Flutter 官方图标',
      hint: '搜索 Flutter 图标名称',
      count: '${entries.length}/${flutterIconCatalog.length}',
      controller: search,
      query: query,
      entries: entries,
      onChanged: (value) => setState(() => query = value.trim().toLowerCase()),
      onClear: () {
        search.clear();
        setState(() => query = '');
      },
    );
  }
}

class _TdIconsPage extends StatefulWidget {
  const _TdIconsPage();

  @override
  State<_TdIconsPage> createState() => _TdIconsPageState();
}

class _TdIconsPageState extends State<_TdIconsPage> {
  final search = TextEditingController();
  String query = '';

  @override
  void dispose() {
    search.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final entries = tdIconCatalog.entries
        .where((entry) => entry.key.contains(query.toLowerCase()))
        .toList(growable: false);
    return _IconGalleryScaffold(
      title: 'TD 图标',
      hint: '搜索 TD 图标名称',
      count: '${entries.length}/${tdIconCatalog.length}',
      controller: search,
      query: query,
      entries: entries,
      onChanged: (value) => setState(() => query = value.trim().toLowerCase()),
      onClear: () {
        search.clear();
        setState(() => query = '');
      },
    );
  }
}

class _IconGalleryScaffold extends StatelessWidget {
  const _IconGalleryScaffold({
    required this.title,
    required this.hint,
    required this.count,
    required this.controller,
    required this.query,
    required this.entries,
    required this.onChanged,
    required this.onClear,
  });

  final String title;
  final String hint;
  final String count;
  final TextEditingController controller;
  final String query;
  final List<MapEntry<String, IconData>> entries;
  final ValueChanged<String> onChanged;
  final VoidCallback onClear;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 16),
            child: Center(child: Text(count)),
          ),
        ],
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(16, 12, 16, 8),
            child: TextField(
              controller: controller,
              decoration: InputDecoration(
                hintText: hint,
                prefixIcon: const Icon(Icons.search),
                suffixIcon: query.isEmpty
                    ? null
                    : IconButton(
                        onPressed: onClear,
                        icon: const Icon(Icons.close),
                      ),
                border: const OutlineInputBorder(),
              ),
              onChanged: onChanged,
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
    return Card(
      child: InkWell(
        onTap: () async {
          await Clipboard.setData(ClipboardData(text: name));
          if (context.mounted) {
            ScaffoldMessenger.of(
              context,
            ).showSnackBar(SnackBar(content: Text('已复制：$name')));
          }
        },
        child: Padding(
          padding: const EdgeInsets.all(6),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(icon, size: 30),
              const SizedBox(height: 8),
              Text(
                name,
                maxLines: 2,
                textAlign: TextAlign.center,
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(fontSize: 10),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
