class DataUserModel {
  final String user;
  final String cc;
  final String totalValue;

  DataUserModel({this.user, this.cc, this.totalValue});
  factory DataUserModel.fromJson(Map<String, dynamic> json) {
    return DataUserModel(
      user: json['nmbres'],
      cc: json['cdla'],
      totalValue: json['sldo'],
    );
  }
}
