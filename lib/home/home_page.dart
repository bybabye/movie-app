import 'package:flutter/material.dart';
import 'package:movie_app/components/custom_circle_icon.dart';
import 'package:movie_app/components/item_drawer.dart';
import 'package:movie_app/components/stack_swiper_view.dart';
import 'package:movie_app/home/list_film_page.dart';
import 'package:movie_app/theme/app_colors.dart';
import 'package:movie_app/theme/app_style.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final GlobalKey<ScaffoldState> _key = GlobalKey();
  late double height;
  late double width;
  int selectIndex = 0;
  List<Widget> myBody = [
    const ListFilmPage(),
    const StackSwiperView(),
    Container(),
    Container(),
    Container(),
  ];
  List<Widget> itemsDrawer = const [
    ItemDrawer(text: 'Movie', icon: Icons.movie),
    ItemDrawer(text: 'Top Film', icon: Icons.thumb_up_outlined),
    ItemDrawer(text: 'My favourite', icon: Icons.favorite),
    ItemDrawer(text: 'settings', icon: Icons.settings),
    ItemDrawer(text: 'logout', icon: Icons.logout),
  ];

  @override
  Widget build(BuildContext context) {
    height = MediaQuery.of(context).size.height;
    width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(color: AppColors.mainColor, size: 30),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      key: _key,
      drawer: Drawer(
        backgroundColor: AppColors.kBGDrawer,
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: ListView(
            children: [
              SizedBox(
                height: 100,
                width: width,
              ),
              for (int i = 0; i < itemsDrawer.length; i++)
                InkWell(
                  onTap: () {
                    setState(() {
                      selectIndex = i;
                    });
                    _key.currentState!.closeDrawer();
                  },
                  child: itemsDrawer[i],
                )
            ],
          ),
        ),
      ),
      backgroundColor: Colors.grey[200],
      body: myBody[selectIndex],
    );
  }
}
