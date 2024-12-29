class CountryModel {
  int? id;
  String? name;
  String? code;
  String? timeZone;
  String? flag;

  CountryModel({this.id, this.name, this.code, this.timeZone, this.flag});

  CountryModel.fromJson(Map<String, dynamic>? json) {
    id = json?['id'];
    name = json?['name'];
    code = json?['code'];
    timeZone = json?['time_zone'];
    flag = json?['flag'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['code'] = this.code;
    data['time_zone'] = this.timeZone;
    data['flag'] = this.flag;
    return data;
  }
}
