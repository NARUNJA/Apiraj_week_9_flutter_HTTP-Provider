import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:test112/jsonapiCrypto/model/json_model.dart';
import 'package:test112/jsonapiCrypto/service/json_service.dart';
import 'package:provider/provider.dart';

Widget jsonViewBinance(BuildContext context) {
  final data = Provider.of<JsonDataBinance>(context);
  String pict = 'assets/green.gif';
  return FutureBuilder<List<JsonMBinance>>(
      future: data.fetchJSONBinance(),
      builder: (context, data) {
        if (data.hasError) {
          return Center(
            child: Text("${data.error}"),
          );
        } else if (data.hasData) {
          var items = data.data as List<JsonMBinance>;

          return Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Color.fromRGBO(4, 90, 35, 1),
                  Color.fromRGBO(39, 105, 171, 0.75),
                ],
                begin: FractionalOffset.bottomCenter,
                end: FractionalOffset.topCenter,
              ),
            ),
            child: ListView.builder(
                itemCount: items == null ? 0 : items.length,
                itemBuilder: (BuildContext context, int index) {
                  return Card(
                    child: ListTile(
                      leading: Stack(
                        children: <Widget>[
                          Container(
                            width: 43,
                            height: 43,
                            padding: const EdgeInsetsDirectional.fromSTEB(
                                7, 7, 0, 0),
                            child: CircleAvatar(
                              child: Text(
                                items[index].symbol.toString()[0],
                                style: const TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black),
                              ),
                            ),
                          ),
                          Container(
                            padding: const EdgeInsetsDirectional.fromSTEB(
                                0, 0, 0, 0),
                            child: ClipRRect(
                              child: Image.asset(
                                picture(items[index]
                                    .priceChangePercent
                                    .toString()[0]),
                                height: 50,
                                width: 50,
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                        ],
                      ),
                      title: Text(items[index].symbol.toString()),
                      subtitle: Text(
                        "Last price: " + items[index].lastPrice.toString(),
                      ),
                      trailing: Text(
                        items[index].priceChangePercent.toString() + "%",
                        style: TextStyle(
                          color: isthanless(
                                  items[index].priceChangePercent.toString()[0])
                              ? Colors.red
                              : Colors.green,
                        ),
                      ),
                    ),
                  );
                }),
          );
        } else {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
      });
}

bool isthanless(String o) {
  if (o == '-') {
    return true;
  }
  return false;
}

String picture(String o) {
  if (o == '-') {
    return 'assets/red.gif';
  }
  return 'assets/green.gif';
}
