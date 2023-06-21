import 'package:flutter/material.dart';
import 'package:news_app/generated/l10n.dart';
import 'package:news_app/ui/components/home_page_all_news/home_page_all_news.dart';
import 'package:news_app/ui/components/home_page_footer/home_page_footer.dart';
import 'package:news_app/ui/components/home_page_slider/home_page_slider.dart';

class HomePageContent extends StatelessWidget {
  const HomePageContent({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.only(top: 24),
      children: <Widget>[
        const HomePageSlider(),
        const SizedBox(
          height: 24,
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Text(
                S.current.bodyTitle,
                style: const TextStyle(
                  fontSize: 18,
                  color: Color(0xff323232),
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const HomePageAllNews(),
            const HomePageFooter()
          ],
        )
      ],
    );
  }
}