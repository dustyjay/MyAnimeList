import 'dart:convert';

Anime animeFromJson(String str) {
  final jsonData = json.decode(str);
  return Anime.fromJson(jsonData);
}

List<Anime> topAnimeFromJson(String str, {String key = 'top'}) {
  final fromJson = json.decode(str);
  final mainArray = fromJson[key];
  final List<Anime> returnValue =
      List<Anime>.from(mainArray.map((e) => Anime.fromJson(e)).toList());
  return returnValue;
}

String allAnimeToJson(List<Anime> data) {
  final toJson = data.map((e) => e.toJson());
  return json.encode(toJson);
}

class Anime {
  int malId;
  String? url;
  String? imageUrl;
  String? title;
  bool? airing;
  String? synopsis;
  String? type;
  int? episodes;
  num? score;
  String? startDate;
  String? endDate;
  int? members;
  String? rated;

  Anime(
      this.malId,
      this.url,
      this.imageUrl,
      this.title,
      this.airing,
      this.synopsis,
      this.type,
      this.episodes,
      this.score,
      this.startDate,
      this.endDate,
      this.members,
      this.rated);
  // Write computed properties here
  // @override
  String airingStatus() {
    if (airing != null) {
      return airing ?? false ? 'Airing' : 'Completed';
    }
    return 'Airing: N/A';
  }

  String numberOfEpisodes() {
    if (episodes != null) {
      return episodes == 1 ? '$episodes Episode' : '$episodes Episodes';
    }
    return 'Episodes: N/A';
  }

  String getScore() {
    if (score != null) {
      return '$score';
    }
    return '-';
  }

  String getSynopsis() {
    return synopsis ?? 'No description available';
  }

  factory Anime.fromJson(Map<String, dynamic> json) => Anime(
      json['mal_id'],
      json['url'],
      json['image_url'],
      json['title'],
      json['airing'],
      json['synopsis'],
      json['type'],
      json['episodes'],
      json['score'],
      json['startDate'],
      json['endDate'],
      json['members'],
      json['rated']);

  Map<String, dynamic> toJson() => {
        "mal_id": malId,
        "url": url,
        "imageUrl": imageUrl,
        "title": title,
        "airing": airing,
        "synopsis": synopsis,
        "type": type,
        "episodes": episodes,
        "score": score,
        "startDate": startDate,
        "endDate": endDate,
        "members": members,
        "rated": rated
      };
}
