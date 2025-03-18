import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:widgets_app/presentation/providers/theme_provider.dart';

class ThemeChangerScreen extends ConsumerWidget {

  static const name = "theme_changer";

  const ThemeChangerScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {

    final isDarkMode = ref.watch(themeNotifierProvider).isDarkMode;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Theme Changer'),
        actions: [
          IconButton(
            icon: isDarkMode 
              ? const Icon(Icons.dark_mode_outlined) 
              : const Icon(Icons.light_mode_outlined),
            onPressed: () {
              // ref
              //   .read(isDarkModeProvider.notifier)
              //   .update((isDarkMode) => !isDarkMode);
              ref
                .read(themeNotifierProvider.notifier)
                .toggleDarkmode();
            }, 
          )
        ],
      ),
      body: const _ThemeChangerView(),
    );
  }
}

class _ThemeChangerView extends ConsumerWidget {
  const _ThemeChangerView();

  @override
  Widget build(BuildContext context, WidgetRef ref) {

    final colors = ref.watch(colorListProvider);
    final appTheme = ref.watch(themeNotifierProvider);

    return ListView.builder(
      itemCount: colors.length,
      itemBuilder: (context, index) {
        final color = colors[index];
        return RadioListTile(
          title: Text('Este color', style: TextStyle(color: color),),
          subtitle: Text('${color.value}'),
          activeColor: color,
          value: index, 
          groupValue: appTheme.selectedColor, 
          onChanged: (value) {
            ref
              .watch(themeNotifierProvider.notifier)
              .changeColorIndex(index);
            // ref
            //   .read(selectedColorProvider.notifier)
            //   .update((selectedColor) => selectedColor = index);
          },
        );
      },
    );
  }
}