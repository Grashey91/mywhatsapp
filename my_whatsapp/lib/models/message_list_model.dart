class MessageListModel {
  String? message;
  String? time;

  MessageListModel({this.message, this.time});

  MessageListModel.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    time = json['time'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['message'] = message;
    data['time'] = time;
    return data;
  }
}
