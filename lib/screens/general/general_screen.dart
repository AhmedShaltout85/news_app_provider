import 'package:flutter/material.dart';
import 'package:news_app/l10n/app_localizations.dart';
import 'package:news_app/screens/general/tabs/abc_news_tab.dart';
import 'package:news_app/utils/app_routes.dart';

import '../../common_widgets/custom_drawer.dart';

class GeneralScreen extends StatelessWidget {
  const GeneralScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final tabList = [
      Tab(text: AppLocalizations.of(context)!.abc_news),
      Tab(text: AppLocalizations.of(context)!.aftonposten),
      Tab(text: AppLocalizations.of(context)!.ansa_it),
      Tab(text: AppLocalizations.of(context)!.ary_news),
      Tab(text: AppLocalizations.of(context)!.axios),
    ];
    return DefaultTabController(
      length: tabList.length, // number of tabs
      child: Scaffold(
        appBar: AppBar(
          title: Text(AppLocalizations.of(context)!.general),
          actions: [
            IconButton(onPressed: () {
              Navigator.pushNamed(context, AppRoutes.searchRouteName);
            }, icon: const Icon(Icons.search)),
          ],
          bottom: TabBar(tabs: tabList),
        ),
        drawer: const CustomDrawer(),
        body: TabBarView(
          children: [
            AbcNewsTab(),
            Center(child: Text('News Screen')),
            Center(child: Text('Profile Screen')),
            Center(child: Text('Profile Screen')),
            Center(child: Text('Profile Screen')),
          ],
        ),
      ),
    );
  }
}
