import 'package:flutter/material.dart';
import 'package:test_app/views/widgets/home_page_widgets/article_widget.dart';
import 'package:test_app/views/widgets/home_page_widgets/content.dart';
import 'package:test_app/views/widgets/home_page_widgets/home_page_header.dart';
import 'package:test_app/views/widgets/home_page_widgets/profile_rating_widget.dart';
import '../../../widgets/home_page_widgets/chart/chart.dart';


class HomePage extends StatelessWidget {

  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: Container(
            width: MediaQuery.of(context).size.width,
            margin: const EdgeInsets.all(12.0),
            padding: const EdgeInsets.all(12.0),
            child: ListView(
                children: <Widget>[
                  const HomePageHeader(),
                  const SizedBox(
                    height: 30,
                  ),
                  const ProfileRatingWidget(),
                  const SizedBox(
                    height: 20,
                  ),
                  const Chart(),
                  const SizedBox(
                    height: 10,
                  ),
                  const ArticleWidget(),
                  const SizedBox(
                    height: 10,
                  ),
                  Container(
                    alignment: Alignment.center,
                    child: const ContentWidget(),
                  ),
                ]
            )
        )
    );
  }
}