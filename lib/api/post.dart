import 'package:anime_list/models/anime.model.dart';
import 'package:anime_list/utils/constants.dart';
import 'package:http/http.dart' as http;

String url = 'https://jikan1.p.rapidapi.com/top/anime/1/upcoming';

Map<String, String> getHeader() {
  return {
    'X-RapidApi-Host': Constants.HOST_KEY,
    'X-RapidApi-Key': Constants.API_KEY
  };
}

Future<List<Anime>> getAnimeList() async {
  try {
    final response = await http.get(Uri.parse(url), headers: getHeader());
    final List<Anime> list = topAnimeFromJson(response.body, key: 'top');
    return list;
  } catch (err) {
    rethrow;
  }
}
