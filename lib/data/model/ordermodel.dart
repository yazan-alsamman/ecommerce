class OrdersModel {
  int? orderId;
  int? orderUserid;
  int? orderAdress;
  int? orderType;
  int? orderPricedelivery;
  int? orderPrice;
  int? orderTotalprice;
  int? orderCoupon;
  int? orderRating;
  String? orderNoterating;
  int? orderPaymentmethod;
  int? orderStatus;
  String? orderDatetime;
  int? adressId;
  int? adressUserid;
  String? adressName;
  String? adressCity;
  String? adressStreet;
  double? adressLat;
  double? adressLong;

  OrdersModel(
      {this.orderId,
      this.orderUserid,
      this.orderAdress,
      this.orderType,
      this.orderPricedelivery,
      this.orderPrice,
      this.orderTotalprice,
      this.orderCoupon,
      this.orderRating,
      this.orderNoterating,
      this.orderPaymentmethod,
      this.orderStatus,
      this.orderDatetime,
      this.adressId,
      this.adressUserid,
      this.adressName,
      this.adressCity,
      this.adressStreet,
      this.adressLat,
      this.adressLong});

  OrdersModel.fromJson(Map<String, dynamic> json) {
    orderId = json['order_id'];
    orderUserid = json['order_userid'];
    orderAdress = json['order_adress'];
    orderType = json['order_type'];
    orderPricedelivery = json['order_pricedelivery'];
    orderPrice = json['order_price'];
    orderTotalprice = json['order_totalprice'];
    orderCoupon = json['order_coupon'];
    orderRating = json['order_rating'];
    orderNoterating = json['order_noterating'];
    orderPaymentmethod = json['order_paymentmethod'];
    orderStatus = json['order_status'];
    orderDatetime = json['order_datetime'];
    adressId = json['adress_id'];
    adressUserid = json['adress_userid'];
    adressName = json['adress_name'];
    adressCity = json['adress_city'];
    adressStreet = json['adress_street'];
    adressLat = json['adress_lat'];
    adressLong = json['adress_long'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['order_id'] = this.orderId;
    data['order_userid'] = this.orderUserid;
    data['order_adress'] = this.orderAdress;
    data['order_type'] = this.orderType;
    data['order_pricedelivery'] = this.orderPricedelivery;
    data['order_price'] = this.orderPrice;
    data['order_totalprice'] = this.orderTotalprice;
    data['order_coupon'] = this.orderCoupon;
    data['order_rating'] = this.orderRating;
    data['order_noterating'] = this.orderNoterating;
    data['order_paymentmethod'] = this.orderPaymentmethod;
    data['order_status'] = this.orderStatus;
    data['order_datetime'] = this.orderDatetime;
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
