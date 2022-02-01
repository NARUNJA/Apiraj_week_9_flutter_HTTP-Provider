import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class DrawerMenu {
  static Widget menu(context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          DrawerHeader(
            // ส่วนหัว
            decoration: const BoxDecoration(
              // สีพื้นหลัง
              gradient: LinearGradient(
                colors: [Colors.greenAccent, Colors.lightGreenAccent],
              ),
            ),
            child: Stack(
              // ใช้ใส่ข้อมูล รูปภาพและ อักษร
              children: [
                Center(
                  child: Column(
                    children: [
                      Expanded(
                        // รูป
                        child: Container(
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(100),
                            child: Image.network(
                              'https://scontent.fcnx2-1.fna.fbcdn.net/v/t1.6435-9/55478668_2084846624885280_4610380228110319616_n.jpg?_nc_cat=104&ccb=1-5&_nc_sid=8bfeb9&_nc_ohc=E8fV2VNHV1kAX8LuBFv&tn=EYe7Y4NqLZu3jNBR&_nc_ht=scontent.fcnx2-1.fna&oh=00_AT_mBt4auuudoQ2pan8vANsEMzLXQud_IziHX5sg3B6NEA&oe=621B4EFE',
                              height: 100,
                              width: 100,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      ),
                      Container(
                        // ชื่อ-สกุล
                        padding: const EdgeInsets.only(
                            right: 0, top: 10, left: 0, bottom: 0),
                        child: const Text(
                          'นาย อภิราช คงแหลม',
                          style: TextStyle(
                              fontSize: 18,
                              color: Colors.black, // สีน้ำเงิน
                              fontFamily: "Mali",
                              fontWeight: FontWeight.w500),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          ListTile(
            // Home
            leading: const Icon(FontAwesomeIcons.home),
            title: const Text('Home'),
            onTap: () {
              Navigator.pushNamed(context, '/'); // นำทางไปที่ Home
            },
          ),
          const Divider(
            // เส้นสีดำ คั้น
            height: 10,
            thickness: 2,
            indent: 0,
            endIndent: 0,
            color: Colors.black,
          ),
          ListTile(
            //Profile
            leading: const Icon(FontAwesomeIcons.user),
            title: const Text('Profile'),
            onTap: () {
              Navigator.pushNamed(context, '/profile',
                  arguments: PageArguments('Profile', 'Profile'));
              // มีการนำท่างและ  pass arguments to a named route
            },
          ),
          const Divider(
            height: 10,
            thickness: 2,
            indent: 0,
            endIndent: 0,
            color: Colors.black,
          ),
          ListTile(
            //Profile
            leading: const Icon(FontAwesomeIcons.bitcoin),
            title: const Text('Crypto'),
            onTap: () {
              Navigator.pushNamed(context, '/crypto',
                  arguments: PageArguments('Crypto', 'Cryptocurrency'));
              // มีการนำท่างและ  pass arguments to a named route
            },
          ),
          const Divider(
            height: 10,
            thickness: 2,
            indent: 0,
            endIndent: 0,
            color: Colors.black,
          ),
          ListTile(
            //Profile
            leading: const Icon(FontAwesomeIcons.baseballBall),
            title: const Text('Pokémon'),
            onTap: () {
              Navigator.pushNamed(context, '/pokemon',
                  arguments: PageArguments('Pokémon', 'Pokémon'));
              // มีการนำท่างและ  pass arguments to a named route
            },
          ),
          const Divider(
            height: 10,
            thickness: 2,
            indent: 0,
            endIndent: 0,
            color: Colors.black,
          ),
        ],
      ),
    );
  }
}

class PageArguments {
  // class PageArguments
  final String title;
  final String message;
  //constructor
  PageArguments(this.title, this.message);
}
