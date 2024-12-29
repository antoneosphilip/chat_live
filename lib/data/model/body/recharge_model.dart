class RechargeModel {
  int? id;
  String? diamond;
  String? usd;

  RechargeModel({this.id, this.diamond, this.usd});

  RechargeModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    diamond = double.parse(json['diamond']).toInt().toString();
    usd = json['usd'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['diamond'] = this.diamond;
    data['usd'] = this.usd;
    return data;
  }
}
