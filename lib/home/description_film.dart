import 'package:flutter/material.dart';
import 'package:movie_app/models/profile_film.dart';
import 'package:movie_app/service/service.dart';
import 'package:movie_app/theme/app_assets.dart';
import 'package:movie_app/theme/app_colors.dart';
import 'package:movie_app/theme/app_style.dart';

class DescriptionFilm extends StatelessWidget {
  const DescriptionFilm({
    super.key,
    required this.link,
  });
  final String link;

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: FutureBuilder(
        future: profile(link),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return Stack(
              children: [
                Positioned(
                  width: width,
                  child: Image.network(
                    snapshot.data!.image,
                    fit: BoxFit.fitWidth,
                  ),
                ),
                Positioned(
                  top: 30,
                  left: 30,
                  height: 40,
                  width: 40,
                  child: IconButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: const Icon(
                      Icons.arrow_back,
                      color: Colors.white,
                      size: 30,
                    ),
                  ),
                ),
                Positioned(
                  bottom: -(height / 3.8),
                  width: width,
                  child: Image.asset(
                    AppAssets.bg,
                    fit: BoxFit.fitWidth,
                    color: Colors.yellow,
                  ),
                ),
                Positioned(
                  bottom: -(height / 3.5),
                  width: width,
                  child: Image.asset(
                    AppAssets.bg,
                    fit: BoxFit.fitWidth,
                  ),
                ),
                Positioned(
                  left: 50,
                  top: 230,
                  height: 250,
                  width: 180,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(16),
                    child: Image.network(
                      snapshot.data!.image,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Positioned(
                  bottom: -(height / 2.88),
                  width: width,
                  child: Image.asset(
                    AppAssets.bg,
                    fit: BoxFit.fitWidth,
                    color: Colors.yellow,
                  ),
                ),
                Positioned(
                  bottom: -(height / 2.8),
                  width: width,
                  child: Image.asset(
                    AppAssets.bg,
                    fit: BoxFit.fitWidth,
                    color: Colors.white,
                  ),
                ),
                Positioned(
                  bottom: 0,
                  height: 350,
                  width: width,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          snapshot.data!.name,
                          style: AppStyles.h2,
                        ),
                        Text(
                          snapshot.data!.description,
                          maxLines: 5,
                          style: const TextStyle(
                            color: Colors.black,
                            fontSize: 18,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                        Align(
                          alignment: Alignment.centerRight,
                          child: Container(
                            alignment: Alignment.center,
                            height: 60,
                            width: 120,
                            padding: const EdgeInsets.all(12),
                            decoration: BoxDecoration(
                              color: AppColors.mainColor,
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: Text(
                              'Xem Phim ->',
                              style: AppStyles.h4.copyWith(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ],
            );
          } else if (snapshot.hasError) {
            return const Center(
              child: Text('has Error'),
            );
          } else {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
    );
  }
}
