class TransactionData {
  String name;
  String date;
  String type;
  String value;

  TransactionData({
    this.name, this.date, this.type, this.value
  });

  TransactionData.fromJson(Map<String, dynamic> json) {
    name = json['name']?.toString();
    date = json['date']?.toString();
    type = json['type']?.toString();
    value = json['value']?.toString();
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['name'] = name;
    data['date'] = date;
    data['type'] = type;
    data['value'] = value;
    return data;
  }
}

class TransactionList {
  List<TransactionData> transactionList;

  TransactionList({
    this.transactionList
  });

  List<TransactionData> get(){
    return transactionList;
  }

  void add(TransactionData transaction){
    transactionList.add(transaction);
  }

  void fromJson(Map<String, dynamic> json) {
    if (json['transactions'] != null) {
      var transactionListInJsonFormat = json['transactions'];
      transactionList = <TransactionData>[];
      transactionListInJsonFormat.forEach((transactionInJsonFormat) {
        transactionList.add(TransactionData.fromJson(transactionInJsonFormat));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    if (transactionList != null) {
      var transactionListInJsonFormat = [];
            transactionList.forEach((transaction) {
        transactionListInJsonFormat.add(transaction.toJson());
      });
      data['transactions'] = transactionListInJsonFormat;
    }
    return data;
  }
}