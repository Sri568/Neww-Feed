// To parse this JSON data, do
//
//     final newsParse = newsParseFromJson(jsonString);

import 'dart:convert';

NewsParse newsParseFromJson(String str) => NewsParse.fromJson(json.decode(str));

String newsParseToJson(NewsParse data) => json.encode(data.toJson());

class NewsParse {
  NewsParse({
    required this.status,
    required this.statusCode,
    required this.version,
    required this.lastModified,
    required this.access,
    required this.total,
    required this.limit,
    required this.offset,
    required this.data,
  });

  String status;
  int statusCode;
  String version;
  String lastModified;
  String access;
  int total;
  int limit;
  int offset;
  List<Datum> data;

  factory NewsParse.fromJson(Map<String, dynamic> json) => NewsParse(
    status: json["status"],
    statusCode: json["status-code"],
    version: json["version"],
    lastModified: json["last-modified"],
    access: json["access"],
    total: json["total"],
    limit: json["limit"],
    offset: json["offset"],
    data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "status-code": statusCode,
    "version": version,
    "last-modified": lastModified,
    "access": access,
    "total": total,
    "limit": limit,
    "offset": offset,
    "data": List<dynamic>.from(data.map((x) => x.toJson())),
  };
}

class Datum {
  Datum({
    required this.id,
    required this.title,
    //required this.summary,
    required this.link,
    required this.published,
    //required this.image,
  });

  int id;
  String title;
 // String summary;
  String link;
  String published;
  //String image;

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
    id: json["id"],
    title: json["title"],
   // summary: json["summary"] == null ? null : json["summary"],
    link: json["link"],
    published: json["published"],
   // image: json["image"] == null ? null : json["image"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "title": title,
    //"summary": summary == null ? null : summary,
    "link": link,
    "published": published,
   // "image": image == null ? null : image,
  };
}

