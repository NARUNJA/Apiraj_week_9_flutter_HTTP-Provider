class JsonMBinance {
  String symbol;
  String priceChangePercent;
  String lastPrice;

  JsonMBinance({
    this.symbol,
    this.priceChangePercent,
    this.lastPrice,
  });

  factory JsonMBinance.fromJson(Map<String, dynamic> json) {
    return JsonMBinance(
        symbol: json['symbol'],
        priceChangePercent: json['priceChangePercent'],
        lastPrice: json['lastPrice']);
  }
}
