class CallsModel {
  String? image;
  late String name;
  CallInfo? callInfo;
  late String time;
  late String callType;

  CallsModel(
      {this.image,
      required this.name,
      this.callInfo,
      required this.time,
      required this.callType});

  CallsModel.fromJson(Map<String, dynamic> json) {
    image = json['image'];
    name = json['name'];
    callInfo = json['callInfo'] != null
        ? new CallInfo.fromJson(json['callInfo'])
        : null;
    time = json['time'];
    callType = json['callType'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['image'] = this.image;
    data['name'] = this.name;
    if (this.callInfo != null) {
      data['callInfo'] = this.callInfo!.toJson();
    }
    data['time'] = this.time;
    data['callType'] = this.callType;
    return data;
  }
}

class CallInfo {
  late bool incoming;

  CallInfo({required this.incoming});

  CallInfo.fromJson(Map<String, dynamic> json) {
    incoming = json['incoming'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['incoming'] = incoming;
    return data;
  }
}
