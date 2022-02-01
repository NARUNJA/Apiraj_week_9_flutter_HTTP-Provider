import 'package:flutter/material.dart';
import 'package:test112/jsonapiCrypto/service/json_service.dart';
import 'package:test112/jsonapiCrypto/view/json_view.dart';
import 'package:provider/provider.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:test112/drawer_menu.dart';

class Crypto extends StatefulWidget {
  const Crypto({Key key}) : super(key: key);
  @override
  State<StatefulWidget> createState() {
    return _CryptoState();
  }
}

class _CryptoState extends State<Crypto> {
  @override
  Widget build(BuildContext context) {
    final data = Provider.of<JsonDataBinance>(context);
    final args = ModalRoute.of(context).settings.arguments as PageArguments;
    return Scaffold(
      appBar: AppBar(
        title: Text(args.message),
        actions: <Widget>[
          IconButton(
            padding: const EdgeInsetsDirectional.fromSTEB(0, 0, 50, 0),
            icon: const Icon(
              FontAwesomeIcons.bitcoin,
              color: Colors.black,
              size: 35,
            ),
            onPressed: () {},
          ),
        ],
        flexibleSpace: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [Colors.cyan, Colors.yellow],
            ),
          ),
        ),
      ),
      drawer: DrawerMenu.menu(context),
      body: jsonViewBinance(context),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            data.fetchJSONBinance();
          });
        },
        tooltip: 'Refresh',
        child: const Icon(
          Icons.refresh,
          size: 35,
        ),
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(16.0)),
            side: BorderSide(color: Colors.blueAccent, width: 4.0)),
        backgroundColor: Colors.cyanAccent,
        foregroundColor: Colors.black,
      ),
    );
  }
}
