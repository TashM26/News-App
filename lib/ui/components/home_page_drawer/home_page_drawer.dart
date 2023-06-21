import 'package:flutter/material.dart';
import 'package:news_app/domain/provider/local_provider/local_provider.dart';
import 'package:news_app/ui/components/home_page_drawer/home_page_drawer_btn.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../domain/provider/news_provider.dart';
import '../../pages/home_page/home_page.dart';

class HomePageDrawer extends StatelessWidget {
  const HomePageDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    final model = Provider.of<NewsProvider>(context);
    final localModel = Provider.of<LocalProvider>(context);
    return Drawer(
      backgroundColor: const Color(0xff003366),
      width: 80,
      child: SafeArea(
        child: Column(
          children: [
            HomePageDrawerBtn(
              btnAction: () async {
                final pref = await SharedPreferences.getInstance();
                await pref.setString('lang', 'ru');
                model.setUp();
                localModel.setLocale().then(
                      (value) => Navigator.of(context).pop(),
                    );
              },
            ),
            const SizedBox(
              height: 12,
            ),
            HomePageDrawerBtn(
              btnAction: () async {
                final pref = await SharedPreferences.getInstance();
                await pref.setString('lang', 'en');

                model.setUp();
                localModel.setLocale().then(
                      (value) => Navigator.of(context).pop(),
                    );
              },
              btnLangCode: 'en',
            ),
            const SizedBox(
              height: 12,
            ),
            HomePageDrawerBtn(
              btnAction: () async {
                final pref = await SharedPreferences.getInstance();
                await pref.setString('lang', 'uz');
                model.setUp();
                localModel
                    .setLocale()
                    .then((value) => Navigator.of(context).pop());
              },
              btnLangCode: 'uz',
            ),
            const Spacer(),
            FloatingActionButton(
              elevation: 0,
              backgroundColor: Colors.white,
              onPressed: () {},
              child: const Icon(
                Icons.exit_to_app,
                color: Color(0xff003366),
              ),
            ),
            const SizedBox(
              height: 12,
            )
          ],
        ),
      ),
    );
  }
}
