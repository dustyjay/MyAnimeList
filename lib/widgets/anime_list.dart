import 'package:anime_list/api/post.dart';
import 'package:anime_list/models/anime.model.dart';
import 'package:anime_list/widgets/anime_list_item.dart';
import 'package:anime_list/widgets/page_layout.dart';
import 'package:flutter/material.dart';

class AnimeList extends StatefulWidget {
  const AnimeList({Key? key}) : super(key: key);

  @override
  State<AnimeList> createState() => _AnimeListState();
}

class _AnimeListState extends State<AnimeList> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Anime>>(
        future: getAnimeList(),
        builder: ((context, snapshot) {
          final data = snapshot.data;
          return PageLayout(
              loading: snapshot.connectionState != ConnectionState.done,
              hasError: snapshot.hasError,
              mainWidget: ListView.separated(
                itemCount: data != null ? data.length : 0,
                padding: const EdgeInsets.all(10.0),
                separatorBuilder: (context, index) => const Divider(),
                itemBuilder: ((context, index) {
                  final item = data![index];

                  return AnimeListItem(
                    item: item,
                  );
                }),
              ));
        }

            // if (snapshot.connectionState == ConnectionState.done) {
            //   return Container(
            //       color: Colors.grey[300],
            //       width: 70.0,
            //       height: 70.0,
            //       child: const Align(
            //         child: Padding(
            //             padding: EdgeInsets.all(5.0),
            //             child: Center(child: CircularProgressIndicator())),
            //         alignment: FractionalOffset.center,
            //       ));
            // return ListView.separated(
            //   itemCount: data!.length,
            //   padding: const EdgeInsets.all(10.0),
            //   separatorBuilder: (context, index) => const Divider(),
            //   itemBuilder: ((context, index) {
            //     final item = data[index];

            //     return AnimeListItem(
            //       item: item,
            //     );
            //   }),
            // );
            // } else {
            //   return const Text('Loading');
            // }
            ));
  }
}
