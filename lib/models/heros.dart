// To parse this JSON data, do
//
//     final heros = herosFromJson(jsonString);

import 'dart:convert';

Heros herosFromJson(String str) => Heros.fromJson(json.decode(str));

String herosToJson(Heros data) => json.encode(data.toJson());

class Heros {
  List<Hero>? heros;

  Heros({
    this.heros,
  });

  factory Heros.fromJson(Map<String, dynamic> json) => Heros(
        heros: json["heros"] == null
            ? []
            : List<Hero>.from(json["heros"]!.map((x) => Hero.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "heros": heros == null
            ? []
            : List<dynamic>.from(heros!.map((x) => x.toJson())),
      };
}

class Hero {
  String? id;
  String? name;
  String? imgList;
  String? description;

  Hero({
    this.id,
    this.name,
    this.imgList,
    this.description,
  });

  factory Hero.fromJson(Map<String, dynamic> json) => Hero(
        id: json["id"],
        name: json["name"],
        imgList: json["img_list"],
        description: json["description"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "img_list": imgList,
        "description": description,
      };
}
