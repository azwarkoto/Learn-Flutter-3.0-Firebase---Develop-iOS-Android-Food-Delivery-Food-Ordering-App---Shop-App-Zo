import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:foodpanda_admin_web_portal/authentication/login_screen.dart';
import 'package:foodpanda_admin_web_portal/riders/all_blocked_riders_screen.dart';
import 'package:foodpanda_admin_web_portal/riders/all_verified_riders_screen.dart';
import 'package:foodpanda_admin_web_portal/sellers/all_blocked_sellers_screen.dart';
import 'package:foodpanda_admin_web_portal/sellers/all_verified_sellers_screen.dart';
import 'package:foodpanda_admin_web_portal/users/all_blocked_users_screen.dart';
import 'package:foodpanda_admin_web_portal/users/all_verified_users_screen.dart';
import 'package:intl/intl.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
{
  String timeText= "";
  String dateText= "";

  String formatCurrentLiveTime(DateTime time)
  {
    return DateFormat("hh:mm:ss a").format(time);
  }
  String formatCurrentDate(DateTime date)
  {
    return DateFormat("dd MMMM, yyyy").format(date);
  }

  getCurrentLiveTime()
  {
    final DateTime timeNow = DateTime.now();
    final String liveTime = formatCurrentLiveTime(timeNow);
    final String liveDate = formatCurrentDate(timeNow);

    if(this.mounted)
      {
        setState(() {
          timeText = liveTime;
          dateText = liveDate;

        });
      }
  }

  @override
  void initState()
  {
    super.initState();

    //time
    timeText = formatCurrentLiveTime(DateTime.now());

    //date
    dateText = formatCurrentDate(DateTime.now());

    Timer.periodic(const Duration(seconds: 1), (timer)
    {
      getCurrentLiveTime();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        flexibleSpace: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors:
                [
                  Colors.amber,
                  Colors.cyan,
                ],
              begin: FractionalOffset(0, 0),
              end: FractionalOffset(1, 0),
              stops: [0, 1],
              tileMode: TileMode.clamp,
            ),
          ),
        ),
        title: const Text(
         " ADMIN WEB PORTAL",
             style: TextStyle(
               fontSize: 20,
               letterSpacing: 3,
               color: Colors.white,
             ),
        ),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: Text(
                timeText + "\n" + dateText,
                style: const TextStyle(
                  fontSize: 20,
                  color: Colors.white,
                  letterSpacing: 3,
                  fontWeight: FontWeight.bold
                ),
              ),
            ),

            // users aktif dan blokir akun button ui
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                //active
                ElevatedButton.icon(
                  icon: Icon(Icons.person_add, color: Colors.white,),
                  label: Text(
                    "ALL VERIFIKASI USER ".toUpperCase() + "\n" + "Accounts".toUpperCase(),
                    style: const TextStyle(
                      fontSize: 16,
                      color: Colors.white,
                      letterSpacing: 3,
                    ),
                  ),
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.all(40),
                    primary: Colors.amber,
                  ),
                  onPressed: ()
                  {
                    Navigator.push(context, MaterialPageRoute(builder: (c)=> const AllVerifiedUsersScreen()));
                  },
                ),

                const SizedBox(width: 20,),

                //block
                ElevatedButton.icon(
                  icon: Icon(Icons.block_flipped, color: Colors.white,),
                  label: Text(
                    "ALL BLOCKED USER ".toUpperCase() + "\n" + "Accounts".toUpperCase(),
                    style: const TextStyle(
                      fontSize: 16,
                      color: Colors.white,
                      letterSpacing: 3,
                    ),
                  ),
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.all(40),
                    primary: Colors.cyan,
                  ),
                  onPressed: ()
                  {
                    Navigator.push(context, MaterialPageRoute(builder: (c)=> const AllBlockedUsersScreen()));
                  },
                ),
              ],
            ),

            // sellers aktif dan blokir akun button ui
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                //active
                ElevatedButton.icon(
                  icon: Icon(Icons.person_add, color: Colors.white,),
                  label: Text(
                    " ALL VERIFIKASI Sellers ".toUpperCase() + "\n" + "Accounts".toUpperCase(),
                    style: const TextStyle(
                      fontSize: 16,
                      color: Colors.white,
                      letterSpacing: 3,
                    ),
                  ),
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.all(40),
                    primary: Colors.cyan,
                  ),
                  onPressed: ()
                  {
                    Navigator.push(context, MaterialPageRoute(builder: (c)=> const AllVerifiedSellersScreen()));
                  },
                ),

                const SizedBox(width: 20,),

                //block
                ElevatedButton.icon(
                  icon: Icon(Icons.block_flipped, color: Colors.white,),
                  label: Text(
                    "ALL BLOCKED Sellers ".toUpperCase() + "\n" + "Accounts".toUpperCase(),
                    style: const TextStyle(
                      fontSize: 16,
                      color: Colors.white,
                      letterSpacing: 3,
                    ),
                  ),
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.all(40),
                    primary: Colors.amber,
                  ),
                  onPressed: ()
                  {
                    Navigator.push(context, MaterialPageRoute(builder: (c)=> const AllBlockedSellersScreen()));
                  },
                ),
              ],
            ),

            // Riders aktif dan blokir akun button ui
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                //active
                ElevatedButton.icon(
                  icon: Icon(Icons.person_add, color: Colors.white,),
                  label: Text(
                    " ALL VERIFIKASI Riders ".toUpperCase() + "\n" + "Accounts".toUpperCase(),
                    style: const TextStyle(
                      fontSize: 16,
                      color: Colors.white,
                      letterSpacing: 3,
                    ),
                  ),
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.all(40),
                    primary: Colors.amber,
                  ),
                  onPressed: ()
                  {
                    Navigator.push(context, MaterialPageRoute(builder: (c)=> const AllVerifiedRidersScreen()));
                  },
                ),

                const SizedBox(width: 20,),

                //block
                ElevatedButton.icon(
                  icon: Icon(Icons.block_flipped, color: Colors.white,),
                  label: Text(
                    "ALL BLOCKED Riders ".toUpperCase() + "\n" + "Accounts".toUpperCase(),
                    style: const TextStyle(
                      fontSize: 16,
                      color: Colors.white,
                      letterSpacing: 3,
                    ),
                  ),
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.all(40),
                    primary: Colors.cyan,
                  ),
                  onPressed: ()
                  {
                    Navigator.push(context, MaterialPageRoute(builder: (c)=> const AllBlockedRidersScreen()));
                  },
                ),
              ],
            ),

            // Logout Button
            ElevatedButton.icon(
              icon: Icon(Icons.logout, color: Colors.white,),
              label: Text(
                "Keluar".toUpperCase(),
                style: const TextStyle(
                  fontSize: 16,
                  color: Colors.white,
                  letterSpacing: 3,
                ),
              ),
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.all(40),
                primary: Colors.amber,
              ),
              onPressed: ()
              {
                  FirebaseAuth.instance.signOut();
                  Navigator.push(context, MaterialPageRoute(builder: (c)=> const LoginScreen()));
              },
            ),
          ],
        ),
      ),
    );
  }
}
