import 'package:flutter/material.dart';
import 'package:news_app/domain/provider/news_provider.dart';
import 'package:news_app/generated/l10n.dart';
import 'package:news_app/ui/components/home_page_content/home_page_content.dart';
import 'package:news_app/ui/components/loadings_widgets/loadings_widgets.dart';
import 'package:provider/provider.dart';
import '../../components/home_page_drawer/home_page_drawer.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final model = Provider.of<NewsProvider>(context);
    return Scaffold(
      drawer: const HomePageDrawer(),
      appBar: AppBar(
        backgroundColor: const Color(0xff003366),
        toolbarHeight: 64,
        surfaceTintColor: const Color(0xff003366),
        title: model.data?.title == null
            ? LoadingsWidgets.appBarTitleLoad
            : Text(
                model.data?.title ?? S.of(context).title,
                style: const TextStyle(fontSize: 24, color: Colors.white),
              ),
        leading: FutureBuilder(
          builder: (context, snapshot) => IconButton(
            onPressed: () {
              Scaffold.of(context).openDrawer();
            },
            color: Colors.white,
            icon: const Icon(Icons.menu),
          ),
        ),
        centerTitle: true,
      ),
      body: const HomePageContent(),
    );
  }
}
