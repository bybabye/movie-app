import 'package:flutter/material.dart';
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
  late FilmProvider _filmProvider;
  int limit = 24;
  int first = 1;
  int second = 2;
  int thirt = 3;
  bool isCheck = true;

  @override
  Widget build(BuildContext context) {
    _filmProvider = Provider.of(context);
    height = MediaQuery.of(context).size.height;
    width = MediaQuery.of(context).size.width;
    return SizedBox(
      height: height,
      width: width,
      child: Column(
        children: [
          const Expanded(
            flex: 1,
            child: Text(
              'Phim',
              style: AppStyles.h1,
              textAlign: TextAlign.center,
            ),
          ),
          Expanded(
              flex: 9,
              child: FutureBuilder(
                future: _filmProvider.getFilmToPage(first * limit),
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: GridView.count(
                        primary: false,
                        crossAxisCount: 2,
                        crossAxisSpacing: 10,
                        mainAxisSpacing: 10,
                        childAspectRatio: 2 / 3,
                        children: snapshot.data!
                            .map(
                              (e) => ClipRRect(
                                borderRadius: BorderRadius.circular(16),
                                child: Image.network(
                                  e.image,
                                  fit: BoxFit.cover,
                                ),
                              ),
                            )
                            .toList(),
                      ),
                    );
                  } else if (snapshot.hasError) {
                    return const Center(
                      child: Text('Error'),
                    );
                  } else {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                },
              )),
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
                        setState(() {
                          thirt--;
                          second--;
                          first--;
                        });
                      }
                    },
                  ),
                  _customButtonGruop(Text('$first'), isCheck, () {
                    setState(() {});
                  }),
                  _customButtonGruop(Text('$second'), isCheck, () {
                    setState(() {});
                  }),
                  _customButtonGruop(Text('$thirt'), isCheck, () {
                    setState(() {});
                  }),
                  _customButtonGruop(
                    const Icon(
                      Icons.arrow_forward_ios,
                      color: Colors.white,
                    ),
                    true,
                    () {
                      if (thirt != 10) {
                        setState(() {
                          first++;
                          second++;
                          thirt++;
                        });
                      }
                    },
                  ),
                ],
              ),
            ),
          ),
        ],
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
