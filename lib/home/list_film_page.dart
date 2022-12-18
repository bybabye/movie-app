import 'package:flutter/material.dart';
import 'package:movie_app/home/description_film.dart';
import 'package:movie_app/models/profile_film.dart';
import 'package:movie_app/provider/film_provider.dart';
import 'package:movie_app/theme/app_colors.dart';
import 'package:movie_app/theme/app_style.dart';
import 'package:provider/provider.dart';

class ListFilmPage extends StatefulWidget {
  const ListFilmPage({super.key});

  @override
  State<ListFilmPage> createState() => _ListFilmPageState();
}

class _ListFilmPageState extends State<ListFilmPage> {
  late double height;
  late double width;

  int limit = 24;
  int first = 1;
  int second = 2;
  int thirt = 3;
  bool isCheck = true;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      Provider.of<FilmProvider>(context, listen: false).getFilmToPage();
    });
  }

  @override
  Widget build(BuildContext context) {
    height = MediaQuery.of(context).size.height;
    width = MediaQuery.of(context).size.width;
    return SizedBox(
      height: height,
      width: width,
      child: Consumer<FilmProvider>(
        builder: (context, value, child) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                flex: 1,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    'Phim',
                    style: AppStyles.h1.copyWith(color: AppColors.mainColor),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
              Expanded(
                flex: 9,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: value.isLoading
                      ? const Center(
                          child: CircularProgressIndicator(),
                        )
                      : GridView.count(
                          primary: false,
                          crossAxisCount: 2,
                          crossAxisSpacing: 10,
                          mainAxisSpacing: 10,
                          childAspectRatio: 2 / 3,
                          children: value.films
                              .map(
                                (e) => ClipRRect(
                                  borderRadius: BorderRadius.circular(16),
                                  child: InkWell(
                                    onTap: () {
                                      // ignore: use_build_context_synchronously
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (_) =>
                                              DescriptionFilm(link: e.url),
                                        ),
                                      );
                                    },
                                    child: Image.network(
                                      e.image,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                              )
                              .toList(),
                        ),
                ),
              ),
              Expanded(
                flex: 1,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      _customButtonGruop(
                        const Icon(
                          Icons.arrow_back_ios,
                          color: Colors.white,
                        ),
                        true,
                        () {
                          if (first != 1) {
                            value.updateToPage(first--);
                          }
                        },
                      ),
                      _customButtonGruop(
                          Text(
                            '$first',
                            style: AppStyles.h2
                                .copyWith(color: Colors.white, fontSize: 18),
                            textAlign: TextAlign.center,
                          ),
                          isCheck, () {
                        setState(() {});
                      }),
                      _customButtonGruop(
                        const Icon(
                          Icons.arrow_forward_ios,
                          color: Colors.white,
                        ),
                        true,
                        () {
                          if (first != 10) {
                            value.updateToPage(++first);
                          }
                        },
                      ),
                    ],
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }

  Widget _customButtonGruop(Widget child, bool isSelect, Function() func) {
    return InkWell(
      onTap: func,
      child: Container(
        alignment: Alignment.center,
        height: 50,
        width: 50,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: isSelect ? AppColors.mainColor : Colors.grey,
        ),
        child: child,
      ),
    );
  }
}
