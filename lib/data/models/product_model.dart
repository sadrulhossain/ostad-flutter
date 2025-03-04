class ProductModel {
  String? status;
  List<Data>? data;

  ProductModel({this.status, this.data});

  factory ProductModel.fromInput({
    required String name,
    required int code,
    required String img,
    required int qty,
    required int unitPrice,
    required int totalPrice,
  }) {
    return ProductModel(
      status: "new",
      data: [
        Data(
          name: name,
          code: code,
          img: img,
          qty: qty,
          unitPrice: unitPrice,
          totalPrice: totalPrice,
        )
      ],
    );
  }

  ProductModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(Data.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['status'] = status;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Data {
  String? id;
  String? name;
  int? code;
  String? img;
  int? qty;
  int? unitPrice;
  int? totalPrice;

  Data({
    this.id,
    this.name,
    this.code,
    this.img,
    this.qty,
    this.unitPrice,
    this.totalPrice
  });

  Data.fromJson(Map<String, dynamic> json) {
    id = json['_id'];
    name = json['ProductName'];
    code = json['ProductCode'];
    img = json['Img'];
    qty = json['Qty'];
    unitPrice = json['UnitPrice'];
    totalPrice = json['TotalPrice'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['ProductName'] = name;
    data['ProductCode'] = code;
    data['Img'] = img;
    data['Qty'] = qty;
    data['UnitPrice'] = unitPrice;
    data['TotalPrice'] = totalPrice;
    return data;
  }
}
