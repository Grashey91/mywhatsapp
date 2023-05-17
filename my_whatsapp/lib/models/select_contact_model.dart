class SelectContactModel {
  String? name;
  String? image;
  bool? hasAbout;
  String? about;

  SelectContactModel({this.name, this.image, this.hasAbout, this.about});

  SelectContactModel.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    image = json['image'];
    hasAbout = json['hasAbout'];
    about = json['about'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['image'] = this.image;
    data['hasAbout'] = this.hasAbout;
    data['about'] = this.about;
    return data;
  }
}
