import 'package:anime_list/widgets/anime_page.dart';
import 'package:anime_list/widgets/custom_icon.dart';
import 'package:anime_list/models/anime.model.dart';
import 'package:anime_list/utils/toast.dart';
import 'package:flutter/material.dart';

class AnimeListItem extends StatelessWidget {
  final Anime item;

  const AnimeListItem({Key? key, required this.item}) : super(key: key);

  @override
  ListTile build(BuildContext context) {
    final bool isLoved = (item.episodes ?? 0) > 20;

    return ListTile(
      title: Text(item.title ?? 'Anime'),
      trailing: CustomIcon.favIcon(context, isLoved),
      onTap: () {
        Utils.displayToast('Display me!');
        Navigator.of(context).push(MaterialPageRoute<void>(
            builder: (context) => AnimePage(
                  item: item,
                )));
      },
    );
  }
}
