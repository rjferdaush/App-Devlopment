/// status : "success"
/// data : [{"_id":"001","ProductName":"Moto G96","ProductCode":754,"Img":"https://example.com/images/moto-g96.png","Qty":10,"UnitPrice":27000,"TotalPrice":270000},{"_id":"002","ProductName":"Zarin","ProductCode":1035,"Img":"https://example.com/images/zarin.png","Qty":1,"UnitPrice":1,"TotalPrice":1}]

class Productmodel {
  Productmodel({
      String status, 
      List<Data> data,}){
    _status = status;
    _data = data;
}

  Productmodel.fromJson(dynamic json) {
    _status = json['status'];
    if (json['data'] != null) {
      _data = [];
      json['data'].forEach((v) {
        _data.add(Data.fromJson(v));
      });
    }
  }
  String _status;
  List<Data> _data;
Productmodel copyWith({  String status,
  List<Data> data,
}) => Productmodel(  status: status ?? _status,
  data: data ?? _data,
);
  String get status => _status;
  List<Data> get data => _data;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['status'] = _status;
    if (_data != null) {
      map['data'] = _data.map((v) => v.toJson()).toList();
    }
    return map;
  }

}

/// _id : "001"
/// ProductName : "Moto G96"
/// ProductCode : 754
/// Img : "https://example.com/images/moto-g96.png"
/// Qty : 10
/// UnitPrice : 27000
/// TotalPrice : 270000

class Data {
  Data({
      String id, 
      String productName, 
      num productCode, 
      String img, 
      num qty, 
      num unitPrice, 
      num totalPrice,}){
    _id = id;
    _productName = productName;
    _productCode = productCode;
    _img = img;
    _qty = qty;
    _unitPrice = unitPrice;
    _totalPrice = totalPrice;
}

  Data.fromJson(dynamic json) {
    _id = json['_id'];
    _productName = json['ProductName'];
    _productCode = json['ProductCode'];
    _img = json['Img'];
    _qty = json['Qty'];
    _unitPrice = json['UnitPrice'];
    _totalPrice = json['TotalPrice'];
  }
  String _id;
  String _productName;
  num _productCode;
  String _img;
  num _qty;
  num _unitPrice;
  num _totalPrice;
Data copyWith({  String id,
  String productName,
  num productCode,
  String img,
  num qty,
  num unitPrice,
  num totalPrice,
}) => Data(  id: id ?? _id,
  productName: productName ?? _productName,
  productCode: productCode ?? _productCode,
  img: img ?? _img,
  qty: qty ?? _qty,
  unitPrice: unitPrice ?? _unitPrice,
  totalPrice: totalPrice ?? _totalPrice,
);
  String get id => _id;
  String get productName => _productName;
  num get productCode => _productCode;
  String get img => _img;
  num get qty => _qty;
  num get unitPrice => _unitPrice;
  num get totalPrice => _totalPrice;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['_id'] = _id;
    map['ProductName'] = _productName;
    map['ProductCode'] = _productCode;
    map['Img'] = _img;
    map['Qty'] = _qty;
    map['UnitPrice'] = _unitPrice;
    map['TotalPrice'] = _totalPrice;
    return map;
  }

}