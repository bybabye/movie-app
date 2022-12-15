import 'package:flutter/material.dart';
import 'package:card_swiper/card_swiper.dart';
import 'package:movie_app/provider/film_provider.dart';
import 'package:provider/provider.dart';

// ignore: must_be_immutable
class SwiperView extends StatelessWidget {
  SwiperView({
    super.key,
  });

  late FilmProvider _filmProvider;

  @override
  Widget build(BuildContext context) {
    _filmProvider = Provider.of(context);
    return FutureBuilder(
      future: _filmProvider.getFilm(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return Swiper(
            itemBuilder: (BuildContext context, int index) {
              return ClipRRect(
                borderRadius: BorderRadius.circular(16),
                child: Image.network(
                  snapshot.data![index].image,
                  fit: BoxFit.cover,
                ),
              );
            },
            axisDirection: AxisDirection.right,
            itemCount: snapshot.data!.length,
            itemHeight: 380.0,
            itemWidth: 230.0,
            layout: SwiperLayout.STACK,
          );
        } else if (snapshot.hasError) {
          return const Center(
            child: Text('Error'),
          );
        } else {
          return const Center(child: CircularProgressIndicator());
        }
      },
    );
  }
}
