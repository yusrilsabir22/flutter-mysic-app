// To parse this JSON data, do
//
//     final welcome = welcomeFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

class FetchedSong {
  final List<Data> data;
  final String continuation;

  FetchedSong({
    required this.data,
    required this.continuation,
  });

  factory FetchedSong.fromRawJson(String str) => FetchedSong.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory FetchedSong.fromJson(Map<String, dynamic> json) => FetchedSong(
    data: List<Data>.from(json["data"].map((x) => Data.fromJson(x))),
    continuation: json["continuation"],
  );

  Map<String, dynamic> toJson() => {
    "data": List<dynamic>.from(data.map((x) => x.toJson())),
    "continuation": continuation,
  };
}

class Data {
  final String text;
  final List<Content> contents;

  Data({
    required this.text,
    required this.contents,
  });

  factory Data.fromRawJson(String str) => Data.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    text: json["text"],
    contents: List<Content>.from(json["contents"].map((x) => Content.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "text": text,
    "contents": List<dynamic>.from(contents.map((x) => x.toJson())),
  };
}

class Content {
  final Type type;
  final String title;
  final String? artist;
  final String? videoId;
  final List<Thumbnail> thumbnails;
  final String? subtitle;
  final BrowseEndpoint? browseEndpoint;

  Content({
    required this.type,
    required this.title,
    required this.artist,
    required this.videoId,
    required this.thumbnails,
    required this.subtitle,
    required this.browseEndpoint,
  });

  factory Content.fromRawJson(String str) => Content.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Content.fromJson(Map<String, dynamic> json) => Content(
    type: typeValues.map[json["type"]]!,
    title: json["title"],
    artist: json["artist"],
    videoId: json["videoId"],
    thumbnails: List<Thumbnail>.from(json["thumbnails"].map((x) => Thumbnail.fromJson(x))),
    subtitle: json["subtitle"],
    browseEndpoint: json["browseEndpoint"] == null ? null : BrowseEndpoint.fromJson(json["browseEndpoint"]),
  );

  Map<String, dynamic> toJson() => {
    "type": typeValues.reverse[type],
    "title": title,
    "artist": artist,
    "videoId": videoId,
    "thumbnails": List<dynamic>.from(thumbnails.map((x) => x.toJson())),
    "subtitle": subtitle,
    "browseEndpoint": browseEndpoint!.toJson(),
  };
}

class BrowseEndpoint {
  final String browseId;
  final String params;

  BrowseEndpoint({
    required this.browseId,
    required this.params,
  });

  factory BrowseEndpoint.fromRawJson(String str) => BrowseEndpoint.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory BrowseEndpoint.fromJson(Map<String, dynamic> json) => BrowseEndpoint(
    browseId: json["browseId"],
    params: json["params"],
  );

  Map<String, dynamic> toJson() => {
    "browseId": browseId,
    "params": params,
  };
}

class Thumbnail {
  final String url;
  final int width;
  final int height;

  Thumbnail({
    required this.url,
    required this.width,
    required this.height,
  });

  factory Thumbnail.fromRawJson(String str) => Thumbnail.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Thumbnail.fromJson(Map<String, dynamic> json) => Thumbnail(
    url: json["url"],
    width: json["width"],
    height: json["height"],
  );

  Map<String, dynamic> toJson() => {
    "url": url,
    "width": width,
    "height": height,
  };
}

enum Type { SONG, BROWSE }

final typeValues = EnumValues({
  "browse": Type.BROWSE,
  "song": Type.SONG
});

class EnumValues<T> {
  Map<String, T> map;
  late Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    reverseMap = map.map((k, v) => MapEntry(v, k));
    return reverseMap;
  }
}
