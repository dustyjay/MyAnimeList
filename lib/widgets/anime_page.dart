import 'package:anime_list/widgets/custom_icon.dart';
import 'package:anime_list/widgets/custom_text.dart';
import 'package:anime_list/models/anime.model.dart';
import 'package:anime_list/utils/constants.dart';
import 'package:anime_list/utils/toast.dart';
import 'package:flutter/material.dart';

class AnimePage extends StatefulWidget {
  final Anime item;
  const AnimePage({Key? key, required this.item}) : super(key: key);

  @override
  State<AnimePage> createState() => _AnimePageState();
}

class _AnimePageState extends State<AnimePage> {
  @override
  Widget build(BuildContext context) {
    final Anime item = widget.item;
    final bool isLoved = (item.episodes ?? 0) > 20;

    return Scaffold(
      appBar: AppBar(title: Text(item.title ?? 'Anime')),
      floatingActionButton: FloatingActionButton(
          backgroundColor: Colors.white,
          onPressed: () => Utils.displayToast('Floater!'),
          child: Icon(
            isLoved ? Icons.favorite : Icons.favorite_border,
            color: Colors.red,
            size: 32.0,
          )),
      body: pageLayout(),
    );
  }

  Widget pageLayout() {
    final Anime item = widget.item;
    final int? members = item.members;
    final int episodes = item.episodes ?? 0;
    final num? score = item.score;
    final bool isLoved = episodes > 20;

    Color scoreColor = Colors.red;
    if (score! > 6) {
      scoreColor = Colors.green;
    } else if (score > 4) {
      scoreColor = Colors.amber;
    }
    return Column(children: [
      Container(
        height: 350,
        width: MediaQuery.of(context).size.width,
        alignment: Alignment.center,
        decoration: BoxDecoration(
            image: DecorationImage(
                image: NetworkImage(item.imageUrl ?? ''),
                fit: BoxFit.cover,
                alignment: Alignment.center)),
      ),
      Padding(
        padding: const EdgeInsets.all(16.0),
        child: Wrap(runSpacing: 10.0, children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Row(
                children: <Widget>[
                  Padding(
                      padding: const EdgeInsets.only(right: 4.0),
                      child: CustomIcon.favIcon(
                          context, isLoved, Constants.iconSizeSmall)),
                  Text('$members')
                ],
              ),
              Text(item.numberOfEpisodes()),
            ],
          ),
          const Divider(),
          Text(item.getSynopsis()),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text(item.airingStatus()),
              Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: <Widget>[
                  Text(
                    item.getScore(),
                    style: TextStyle(fontSize: 24.0, color: scoreColor),
                  ),
                  const Text('/10')
                ],
              ),
            ],
          ),
        ]),
      ),
    ]);
  }
}
