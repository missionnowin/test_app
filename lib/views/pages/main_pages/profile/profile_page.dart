import 'package:flutter/material.dart';
import 'package:test_app/views/widgets/profile_page_widgets/profile_page_footer.dart';
import 'package:test_app/views/widgets/profile_page_widgets/profile_page_header.dart';
import '../../../widgets/profile_page_widgets/profile_menu.dart';


class ProfilePage extends StatelessWidget{
  const ProfilePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        top: true,
        bottom: true,
        child: Scaffold(
            backgroundColor: const Color(0xFFFAFAFB),
            body: ListView(
                children: const <Widget>[
                  ProfilePageHeader(),
                  SizedBox(
                    height: 21,
                  ),
                  ProfilePageMenu(),
                  SizedBox(
                    height: 50.0,
                  ),
                  ProfilePageFooter(),
                  SizedBox(
                    height: 20,
                  )
                ],
            ),
        ),
    );
  }
}

