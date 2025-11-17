import 'package:flutter/material.dart';
import 'package:news_app/l10n/app_localizations.dart';
import 'package:news_app/controller/locale_provider.dart';
import 'package:news_app/controller/theme_provider.dart';
import 'package:news_app/common_widgets/custom_drawer_header.dart';
import 'package:news_app/common_widgets/custom_drop_down_menu.dart';
import 'package:news_app/common_widgets/drawer_lsit_gap.dart';
import 'package:news_app/common_widgets/refactor_drawer_list_tile_item.dart';
import 'package:provider/provider.dart';

class CustomDrawer extends StatefulWidget {
  const CustomDrawer({super.key});

  @override
  State<CustomDrawer> createState() => _CustomDrawerState();
}

class _CustomDrawerState extends State<CustomDrawer> {
  String _selectedTheme = 'light';
  String _selectedLanguage = 'en';

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    final localeProvider = Provider.of<LocaleProvider>(context);
    var heightSize = MediaQuery.of(context).size;
    return Drawer(
      shape: const RoundedRectangleBorder(borderRadius: BorderRadius.zero),
      child: Column(
        children: [
          CustomDrawerHeader(heightSize: heightSize),
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
            selectedValue: _selectedTheme,
            value1: 'dark',
            value2: 'light',
            title1: AppLocalizations.of(context)!.dark,
            title2: AppLocalizations.of(context)!.light,
            onChanged: (value) {
              setState(() {
                _selectedTheme = value!;
                // value == 'dark' ? ThemeMode.dark : ThemeMode.light;
              });
               themeProvider.setTheme(
                  value == 'dark' ? ThemeMode.dark : ThemeMode.light,
                );
            },
          ),

          DrawerListGap(),

          RefactorDrawerListTileItem(
            imageName: 'icon_home.png',
            titleName: AppLocalizations.of(context)!.language,
          ),

          CustomDropDownMenu(
            selectedValue: _selectedLanguage,
            title1: AppLocalizations.of(context)!.english,
            title2: AppLocalizations.of(context)!.arabic,
            value1: 'en',
            value2: 'ar',
            onChanged: (value) {
              if (value != null) {
                setState(() {
                  _selectedLanguage = value;
               
                });
                localeProvider.setLocale(
                  value == 'en' ? const Locale('en') : const Locale('ar'),
                );
              }
            },
          ),
        ],
      ),
    );
  }
}
