import 'dart:ffi';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/utils/Constants.dart';
import 'package:flutter_application_1/utils/MyRoutes.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:velocity_x/velocity_x.dart';

class MyDrawer extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _MyDrawer();
}

class _MyDrawer extends State<MyDrawer> {
  String imageUrl =
      "https://akm-img-a-in.tosshub.com/indiatoday/images/story/202211/untitled-1_0-one_one.jpg?VersionId=2UvgyBhEFLLMzztCbeFTTShGb9c33ddU";

  static String userName = "";
  @override
  void initState() {
    super.initState();
    getUserName();
  }

  Future<void> getUserName() async {
    final sharedPreferences = await SharedPreferences.getInstance();
    setState(() {
      userName = sharedPreferences.getString(Constants.userName)!;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Container(
        color: context.canvasColor,
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              padding: EdgeInsets.zero,
              child: UserAccountsDrawerHeader(
                accountName: Text(
                  (userName.length > 0) ? userName : "Anil Sahoo",
                  style: TextStyle(color: Colors.white),
                ),
                accountEmail: const Text(
                  "sahooanilkumar@gmail.com",
                  style: TextStyle(color: Colors.white),
                ),
                currentAccountPicture: CircleAvatar(
                  backgroundImage: NetworkImage(imageUrl),
                ),
              ),
            ),
            const ListTile(
              leading: Icon(
                CupertinoIcons.home,
                color: Colors.cyan,
              ),
              title: Text(
                "Home",
                textScaleFactor: 1.2,
                style:
                    TextStyle(color: Colors.cyan, fontWeight: FontWeight.bold),
              ),
            ),
            const ListTile(
              leading: Icon(
                CupertinoIcons.profile_circled,
                color: Colors.cyan,
              ),
              title: Text(
                "Profile",
                textScaleFactor: 1.2,
                style:
                    TextStyle(color: Colors.cyan, fontWeight: FontWeight.bold),
              ),
            ),
            const ListTile(
              leading: Icon(
                CupertinoIcons.mail,
                color: Colors.cyan,
              ),
              title: Text(
                "Email",
                textScaleFactor: 1.2,
                style:
                    TextStyle(color: Colors.cyan, fontWeight: FontWeight.bold),
              ),
            ),
            const ListTile(
              title: InkWell(
                child: Text(
                  "Logout",
                  textScaleFactor: 1.2,
                  style: TextStyle(
                      color: Colors.cyan, fontWeight: FontWeight.bold),
                ),
              ),
              leading: Icon(
                CupertinoIcons.arrow_uturn_right,
                color: Colors.cyan,
              ),
            )
          ],
        ),
      ),
    );
  }
}
