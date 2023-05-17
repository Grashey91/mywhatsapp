class ChatModel {
  String? image;
  late String name;
  late String message;
  late String time;
  String? about;

  ChatModel(
      {this.image,
      required this.name,
      required this.message,
      required this.time,
      this.about});

  ChatModel.fromJson(Map<String, dynamic> json) {
    image = json['image'];
    name = json['name'];
    message = json['message'];
    time = json['time'];
    about = json['about'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['image'] = image;
    data['name'] = name;
    data['message'] = message;
    data['time'] = time;
    data['about'] = about;
    return data;
  }
}
