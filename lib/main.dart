import 'package:flutter/material.dart';
import 'jsonapi_pokemon/pokemon_screen.dart';
import 'profile.dart';
import 'home.dart';
import 'package:test112/jsonapiCrypto/service/json_service.dart';
import 'package:test112/jsonapiCrypto/crypto.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (_) => JsonDataBinance()),
    ],
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({Key key}) : super(key: key);
  // วิดเจ็ตนี้เป็นรูทของแอปพลิเคชัน

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // ธีมสี
        primarySwatch: Colors.cyan,
      ),
      initialRoute: '/', // หน้าจอเริ่มต้น
      routes: {
        //หน้าจอที่ เขื่อมต่อ named route
        '/': (context) => const HomeScreen(),
        '/profile': (context) => const Proflie(),
        '/crypto': (context) => const Crypto(),
        '/pokemon': (context) => PokeScreen(),
      },
      debugShowCheckedModeBanner: false,
    );
  }
}
