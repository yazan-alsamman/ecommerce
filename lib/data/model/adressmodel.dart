class AddressModel {
  int? adressId;
  int? adressUserid;
  String? adressName;
  String? adressCity;
  String? adressStreet;
  double? adressLat;
  double? adressLong;

  AddressModel(
      {this.adressId,
      this.adressUserid,
      this.adressName,
      this.adressCity,
      this.adressStreet,
      this.adressLat,
      this.adressLong});

  AddressModel.fromJson(Map<String, dynamic> json) {
    adressId = json['adress_id'];
    adressUserid = json['adress_userid'];
    adressName = json['adress_name'];
    adressCity = json['adress_city'];
    adressStreet = json['adress_street'];
    adressLat = double.parse(json['adress_lat'].toString());
    adressLong = double.parse(json['adress_long'].toString());
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['adress_id'] = this.adressId;
    data['adress_userid'] = this.adressUserid;
    data['adress_name'] = this.adressName;
    data['adress_city'] = this.adressCity;
    data['adress_street'] = this.adressStreet;
    data['adress_lat'] = this.adressLat;
    data['adress_long'] = this.adressLong;
    return data;
  }
}
