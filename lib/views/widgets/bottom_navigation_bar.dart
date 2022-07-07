import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

import '../../service/icons/icons.dart';

class CustomBottomNavigationBar extends StatefulWidget {
  const CustomBottomNavigationBar(
      {Key? key, required this.tabsRouter, required this.onTap})
      : super(key: key);

  final TabsRouter tabsRouter;
  final Function(int index) onTap;

  @override
  State<CustomBottomNavigationBar> createState() => _CustomBottomNavigationBarState();
}

class _CustomBottomNavigationBarState extends State<CustomBottomNavigationBar>{
  @override
  Widget build(BuildContext context) {
    return Container(
        width: MediaQuery.of(context).size.width,
        height: 86,
        decoration: const BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Color.fromRGBO(70, 96, 135, 0.1),
              offset: Offset(0, -8),
              blurRadius: 32,
              spreadRadius: 0,
            ),
          ],
        ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Expanded(
            child: InkResponse(
              onTap: () {
                widget.onTap(0);
              },
              child: _NavBarItem(
                label: 'Главная',
                paddingTop: 15,
                iconSize: const Size(21, 19),
                svgAssetPath: MyFlutterApp.home,
                isActive: widget.tabsRouter.activeIndex == 0,
              ),
            ),
          ),
          Expanded(
            child: InkResponse(
              onTap: () {
                widget.onTap(1);
              },
              child: _NavBarItem(
                label: 'Новости',
                paddingTop: 16,
                iconSize: const Size(21.33, 20),
                svgAssetPath: MyFlutterApp.news,
                isActive: widget.tabsRouter.activeIndex == 1,
              ),
            ),
          ),
          Expanded(
            child: InkResponse(
              onTap: () {
                widget.onTap(2);
              },
              child: _NavBarItem(
                label: 'Вакансии',
                paddingTop: 13,
                iconSize: const Size(24, 24),
                svgAssetPath: MyFlutterApp.vacancies,
                isActive: widget.tabsRouter.activeIndex == 2,
              ),
            ),
          ),
          Expanded(
            child: InkResponse(
              onTap: () {
                widget.onTap(3);
              },
              child: _NavBarItem(
                label: 'Тесты',
                paddingTop: 13,
                iconSize: const Size(24, 24),
                svgAssetPath: MyFlutterApp.tests,
                isActive: widget.tabsRouter.activeIndex == 3,
              ),
            ),
          ),
          Expanded(
            child: InkResponse(
              onTap: () {
                widget.onTap(4);
              },
              child: _NavBarItem(
                label: 'Профиль',
                paddingTop: 13,
                iconSize: const Size(24, 24),
                svgAssetPath: MyFlutterApp.profile,
                isActive: widget.tabsRouter.activeIndex == 4,
              ),
            ),
          ),
        ],
      ),
    );
  }

}

class _NavBarItem extends StatelessWidget {
  const _NavBarItem({
    Key? key,
    required this.label,
    required this.svgAssetPath,
    required this.iconSize,
    this.paddingTop = 0,
    this.isActive = false,
  }) : super(key: key);
  final String label;
  final double paddingTop;
  final Size iconSize;
  final IconData svgAssetPath;
  final bool isActive;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        SizedBox(height: paddingTop),
        SizedBox(
          height: iconSize.height,
          width: iconSize.width,
          child: Center(
            child: Icon(svgAssetPath,
              color: Colors.black54,
            ),
          ),
        ),
        const Spacer(),
        SizedBox(
          height: 24,
          child: Center(
            child: Text(
              label,
              textAlign: TextAlign.center,
              style: TextStyle(
                color: isActive ? Colors.blue :  Colors.grey,
                fontSize: 11,
              ),
            ),
          ),
        ),
        const SizedBox(height: 25),
      ],
    );
  }
}
