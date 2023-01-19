// To parse this JSON data, do
//
//     final DetailGames = DetailGamesFromJson(jsonString);

import 'dart:convert';

DetailGames? DetailGamesFromJson(String str) =>
    DetailGames.fromJson(json.decode(str));

String DetailGamesToJson(DetailGames? data) => json.encode(data!.toJson());

class DetailGames {
  static var obs;

  DetailGames({
    this.id,
    this.title,
    this.thumbnail,
    this.status,
    this.shortDescription,
    this.description,
    this.gameUrl,
    this.genre,
    this.platform,
    this.publisher,
    this.developer,
    this.releaseDate,
    this.freetogameProfileUrl,
    this.minimumSystemRequirements,
    this.screenshots,
  });

  int? id;
  String? title;
  String? thumbnail;
  String? status;
  String? shortDescription;
  String? description;
  String? gameUrl;
  String? genre;
  String? platform;
  String? publisher;
  String? developer;
  DateTime? releaseDate;
  String? freetogameProfileUrl;
  MinimumSystemRequirements? minimumSystemRequirements;
  List<Screenshot?>? screenshots;

  factory DetailGames.fromJson(Map<String, dynamic> json) => DetailGames(
        id: json["id"],
        title: json["title"],
        thumbnail: json["thumbnail"],
        status: json["status"],
        shortDescription: json["short_description"],
        description: json["description"],
        gameUrl: json["game_url"],
        genre: json["genre"],
        platform: json["platform"],
        publisher: json["publisher"],
        developer: json["developer"],
        releaseDate: DateTime.parse(json["release_date"]),
        freetogameProfileUrl: json["freetogame_profile_url"],
        minimumSystemRequirements: MinimumSystemRequirements.fromJson(
            json["minimum_system_requirements"]),
        screenshots: json["screenshots"] == null
            ? []
            : List<Screenshot?>.from(
                json["screenshots"]!.map((x) => Screenshot.fromJson(x))),
      );

  get entries => null;

  Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "thumbnail": thumbnail,
        "status": status,
        "short_description": shortDescription,
        "description": description,
        "game_url": gameUrl,
        "genre": genre,
        "platform": platform,
        "publisher": publisher,
        "developer": developer,
        "release_date":
            "${releaseDate!.year.toString().padLeft(4, '0')}-${releaseDate!.month.toString().padLeft(2, '0')}-${releaseDate!.day.toString().padLeft(2, '0')}",
        "freetogame_profile_url": freetogameProfileUrl,
        "minimum_system_requirements": minimumSystemRequirements!.toJson(),
        "screenshots": screenshots == null
            ? []
            : List<dynamic>.from(screenshots!.map((x) => x!.toJson())),
      };
}

class MinimumSystemRequirements {
  MinimumSystemRequirements({
    this.os,
    this.processor,
    this.memory,
    this.graphics,
    this.storage,
  });

  String? os;
  String? processor;
  String? memory;
  String? graphics;
  String? storage;

  factory MinimumSystemRequirements.fromJson(Map<String, dynamic> json) =>
      MinimumSystemRequirements(
        os: json["os"],
        processor: json["processor"],
        memory: json["memory"],
        graphics: json["graphics"],
        storage: json["storage"],
      );

  Map<String, dynamic> toJson() => {
        "os": os,
        "processor": processor,
        "memory": memory,
        "graphics": graphics,
        "storage": storage,
      };
}

class Screenshot {
  Screenshot({
    this.id,
    this.image,
  });

  int? id;
  String? image;

  factory Screenshot.fromJson(Map<String, dynamic> json) => Screenshot(
        id: json["id"],
        image: json["image"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "image": image,
      };
}
