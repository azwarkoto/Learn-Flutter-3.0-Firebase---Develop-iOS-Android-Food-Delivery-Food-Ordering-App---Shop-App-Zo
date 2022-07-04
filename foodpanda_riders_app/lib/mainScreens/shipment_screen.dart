import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:foodpanda_riders_app/global/global.dart';
import 'package:foodpanda_riders_app/maps/map_utils.dart';
import 'package:foodpanda_riders_app/splashScreen/splash_screen.dart';

class ShipmentScreen extends StatefulWidget
{
  String? purchaserId;
  String? sellerId;
  String? getOrderID;
  String? purchaserAddress;
  double? purchaserLat;
  double? purchaserLng;

  ShipmentScreen({
    this.purchaserId,
    this.sellerId,
    this.getOrderID,
    this.purchaserAddress,
    this.purchaserLat,
    this.purchaserLng,
  });

  @override
  _ShipmentScreenState createState() => _ShipmentScreenState();
}



class _ShipmentScreenState extends State<ShipmentScreen>
{
  double? sellerLat, sellerLng;

  getSellerData() async
  {
    FirebaseFirestore.instance
        .collection("sellers")
        .doc(widget.sellerId)
        .get()
        .then((DocumentSnapshot)
    {
      sellerLat = DocumentSnapshot.data()!["lat"];
      sellerLng = DocumentSnapshot.data()!["lng"];
    });
  }

  @override
  void initState() {
    super.initState();

    getSellerData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
     body: Column(
       crossAxisAlignment: CrossAxisAlignment.center,
       mainAxisAlignment: MainAxisAlignment.center,
       children: [
       Image.asset(
         "images/confirm1.png",
         width: 350,
       ),

         const SizedBox(height: 5,),

         GestureDetector(
           onTap: ()
           {
             MapUtils.lauchMapFromSourceToDestination(position!.latitude, position!.longitude, sellerLat, sellerLng);
           },
           child: Row(
             mainAxisAlignment: MainAxisAlignment.center,
             children: [

               Image.asset(
                 "images/restaurant.png",
                 width: 50,
               ),

               const SizedBox(width: 7,),

               Column(
                 children: const [
                    SizedBox(height: 12,),

                    Text(
                     "Lokasi Anda",
                     style: TextStyle(
                       fontFamily: "Signatra",
                       fontSize: 18,
                       letterSpacing: 2,
                     ),
                   ),
                 ],
               ),
             ],
           ),
         ),

         const SizedBox(height: 40,),

         Padding(
           padding: const EdgeInsets.all(10.0),
           child: Center(
             child: InkWell(
               onTap: ()
               {
                 Navigator.push(context, MaterialPageRoute(builder: (c)=> MySplashScreen()));
               },
               child: Container(
                 decoration: const BoxDecoration(
                     gradient: LinearGradient(
                       colors: [
                         Colors.cyan,
                         Colors.amber,
                       ],
                       begin:  FractionalOffset(0.0, 0.0),
                       end:  FractionalOffset(1.0, 0.0),
                       stops: [0.0, 1.0],
                       tileMode: TileMode.clamp,
                     )
                 ),
                 width: MediaQuery.of(context).size.width - 90,
                 height: 50,
                 child: const Center(
                   child: Text(
                     "Order Has Benn Picked - Confirm",
                     style: TextStyle(color: Colors.white, fontSize: 15.0),
                   ),
                 ),
               ),
             ),
           ),
         ),
       ],
     ),
    );
  }
}
