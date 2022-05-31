class Contact {
  String? mobile;
  int? frequency;
  int? timestamp;
  String? id;
  String? jid;
  String? name;
  String? avatar;
  bool? status;
  double? totalExchanges;
  double? upcomingPaybacks;
  double? upcomingDues;

  Contact(
      {this.mobile,
      this.frequency,
      this.timestamp,
      this.id,
      this.jid,
      this.name,
      this.avatar,
      this.status,
      this.totalExchanges,
      this.upcomingPaybacks,
      this.upcomingDues});

  Contact.fromJson(Map<String, dynamic> json) {
    mobile = json['mobile'];
    frequency = json['frequency'];
    timestamp = json['timestamp'];
    id = json['id'];
    jid = json['jid'];
    name = json['name'];
    avatar = json['avatar'];
    status = json['status'];
    totalExchanges = json['totalExchanges'];
    upcomingPaybacks = json['upcomingPaybacks'];
    upcomingDues = json['upcomingDues'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['mobile'] = mobile;
    data['frequency'] = frequency;
    data['timestamp'] = timestamp;
    data['id'] = id;
    data['jid'] = jid;
    data['name'] = name;
    data['avatar'] = avatar;
    data['status'] = status;
    data['totalExchanges'] = totalExchanges;
    data['upcomingPaybacks'] = upcomingPaybacks;
    data['upcomingDues'] = upcomingDues;
    return data;
  }
}