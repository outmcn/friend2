import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:tdesign_flutter/tdesign_flutter.dart';
import 'icon_catalog.dart';

void main() => runApp(const Friend2IconApp());

class Friend2IconApp extends StatelessWidget {
  const Friend2IconApp({super.key});

  @override
  Widget build(BuildContext context) {
    final token = TThemeData.defaultData();
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Friend2 TD 图标',
      theme: TThemeBuilder.light(token),
      darkTheme: TThemeBuilder.dark(token),
      themeMode: ThemeMode.system,
      home: const _IconGallery(),
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
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            TNavBar(
              title: 'TD 图标',
              useDefaultBack: false,
              actions: [
                TNavBarItem(customWidget: TText('${entries.length}/${tdesignIconCatalog.length}')),
              ],
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(16, 12, 16, 8),
              child: TInput(
                controller: search,
                hintText: '搜索图标名称',
                prefix: const Icon(TIcons.search),
                onChanged: (value) => setState(() => query = value.trim().toLowerCase()),
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
                itemBuilder: (_, index) => _IconCard(name: entries[index].key, icon: entries[index].value),
              ),
            ),
          ],
        ),
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
            ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('已复制：$name')));
          }
        },
        child: Text(name, maxLines: 2, textAlign: TextAlign.center, overflow: TextOverflow.ellipsis, style: const TextStyle(fontSize: 10)),
      ),
    );
  }
}
