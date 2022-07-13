import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:test_app/service/router/app_router.dart';

class ProfilePageMenu extends StatelessWidget{

  final _headers = const ['Dashboard', 'Настройки профиля', 'Мои документы', 'Рейтинги', 'Тестирование','Поиск вакансий', 'Мои отклики', 'Рекомендации', 'Тарифы', 'FAQ'];
  final List<AssetImage> _tabImages = const [AssetImage('assets/menu_icons/DashBoard.png'),
    AssetImage('assets/menu_icons/Settings.png'),
    AssetImage('assets/menu_icons/Documents.png'),
    AssetImage('assets/menu_icons/Rating.png'),
    AssetImage('assets/menu_icons/Tests.png'),
    AssetImage('assets/menu_icons/Vacancies.png'),
    AssetImage('assets/menu_icons/Replies.png'),
    AssetImage('assets/menu_icons/Recs.png'),
    AssetImage('assets/menu_icons/Fees.png'),
    AssetImage('assets/menu_icons/Faq.png'),
  ];

  const ProfilePageMenu({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: const EdgeInsets.symmetric(horizontal: 11.0),
        height: 45.0 * _headers.length,
        child: ListView.builder(
            physics: const NeverScrollableScrollPhysics(),
            itemCount: _headers.length,
            itemBuilder: (BuildContext context, int index){
              return SizedBox(
                  height: 45,
                  child: InkWell(
                    onTap: (){
                      if(_headers[index] == 'Настройки профиля'){
                        AutoRouter.of(context).navigate(ProfileUpdatePageRoute());
                      }
                    },
                    child: Column(
                      children: <Widget>[
                        const SizedBox(
                          height: 9.0,
                        ),
                        Row(children: <Widget>[
                          Container(
                            height: 22,
                            width: 22,
                            decoration: BoxDecoration(
                                image: DecorationImage(
                                    image: _tabImages[index],
                                    fit: BoxFit.fill
                                )
                            ),
                          ),
                          const SizedBox(
                            width: 23.0,
                          ),
                          Text(_headers[index],
                              style: const TextStyle(
                                color: Color(0xFF44444F),
                                fontWeight: FontWeight.w600,
                                fontSize: 15,
                              )
                          ),
                        ],
                        ),
                        const SizedBox(
                          height: 8.0,
                        )
                      ],
                    ),
                  )
              );
            }
        )
    );
  }

}