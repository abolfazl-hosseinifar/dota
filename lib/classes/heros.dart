class Heros {
  String? id;
  String? name;
  String? imgList;
  String? description;

  Heros({this.id, this.name, this.imgList, this.description});

  Heros.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    imgList = json['img_list'];
    description = json['description'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['img_list'] = this.imgList;
    data['description'] = this.description;
    return data;
  }
}
