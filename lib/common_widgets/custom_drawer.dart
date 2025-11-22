
import 'package:flutter/material.dart';
import 'package:news_app/l10n/app_localizations.dart';
import 'package:news_app/controller/locale_provider.dart';
import 'package:news_app/controller/theme_provider.dart';
import 'package:news_app/common_widgets/custom_drawer_header.dart';
import 'package:news_app/common_widgets/custom_drop_down_menu.dart';
import 'package:news_app/common_widgets/drawer_list_gap.dart';
import 'package:news_app/common_widgets/refactor_drawer_list_tile_item.dart';
import 'package:provider/provider.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    final localeProvider = Provider.of<LocaleProvider>(context);

    // Compute current values from providers instead of local state
    final currentTheme =
        themeProvider.themeMode == ThemeMode.dark ? 'dark' : 'light';
    final currentLanguage = localeProvider.locale.languageCode;

    return Drawer(
      shape: const RoundedRectangleBorder(borderRadius: BorderRadius.zero),
      child: Column(
        children: [
          CustomDrawerHeader(heightSize: MediaQuery.of(context).size),
          RefactorDrawerListTileItem(
            imageName: 'icon_home.png',
            titleName: AppLocalizations.of(context)!.go_to_home,
          ),
          DrawerListGap(),
          RefactorDrawerListTileItem(
            imageName: 'icon_theme.png',
            titleName: AppLocalizations.of(context)!.theme,
          ),
          CustomDropDownMenu(
            selectedValue: currentTheme, // Use provider value directly
            value1: 'dark',
            value2: 'light',
            title1: AppLocalizations.of(context)!.dark,
            title2: AppLocalizations.of(context)!.light,
            onChanged: (value) {
              if (value != null) {
                themeProvider.setTheme(
                  value == 'dark' ? ThemeMode.dark : ThemeMode.light,
                );
              }
            },
          ),
          DrawerListGap(),
          RefactorDrawerListTileItem(
            imageName: 'icon_language.png', // Changed from icon_home.png
            titleName: AppLocalizations.of(context)!.language,
          ),
          CustomDropDownMenu(
            selectedValue: currentLanguage, // Use provider value directly
            title1: AppLocalizations.of(context)!.english,
            title2: AppLocalizations.of(context)!.arabic,
            value1: 'en',
            value2: 'ar',
            onChanged: (value) {
              if (value != null) {
                localeProvider.setLocale(
                  Locale(value), // Simplified locale creation
                );
              }
            },
          ),
        ],
      ),
    );
  }
}
