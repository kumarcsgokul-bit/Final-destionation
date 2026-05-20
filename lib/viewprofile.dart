// import 'dart:convert';
//
// import 'package:flutter/material.dart';
// import 'package:http/http.dart' as http;
// import 'package:shared_preferences/shared_preferences.dart';
//
// import 'editprofile.dart';
//
// void main(){
//   runApp(viewprofile());
// }
//  class viewprofile extends StatelessWidget {
//    const viewprofile({Key? key}) : super(key: key);
//
//    @override
//    Widget build(BuildContext context) {
//      return MaterialApp(home: viewprofilesub(),);
//    }
//  }
//  class viewprofilesub extends StatefulWidget {
//    const viewprofilesub({Key? key}) : super(key: key);
//
//    @override
//    State<viewprofilesub> createState() => _viewprofilesubState();
//  }
//
//  class _viewprofilesubState extends State<viewprofilesub> {
//    Future<List<Joke>> _getJokes() async {
//      SharedPreferences prefs = await SharedPreferences.getInstance();
//      String b = prefs.getString("lid").toString();
//      String foodimage="";
//      var data =
//      await http.post(Uri.parse(prefs.getString("ip").toString()+"/user_viewprofile"),
//          body: {"uid":prefs.getString('uid').toString()}
//      );
//
//      var jsonData = json.decode(data.body);
// //    print(jsonData);
//      List<Joke> jokes = [];
//      for (var joke in jsonData["message"]) {
//        print(joke);
//        Joke newJoke = Joke(
//            joke["id"].toString(),
//            joke["name"],
//            joke["email"].toString(),
//            joke["phone"].toString(),
//            prefs.getString('ip').toString()+joke["proof"].toString(),
//            joke["housename"].toString(),
//            joke["post"].toString(),
//            joke["pin"].toString(),
//            joke["place"].toString(),
//            joke["latitude"].toString(),
//            joke["longitude"].toString(),
//            prefs.getString('ip').toString()+joke["photo"].toString(),
//
//
//
//
//      );
//        jokes.add(newJoke);
//      }
//      return jokes;
//    }
//
//    @override
//    Widget build(BuildContext context) {
//      return Scaffold(body:
//      Container(
//
//        child:
//        FutureBuilder(
//          future: _getJokes(),
//          builder: (BuildContext context, AsyncSnapshot snapshot) {
// //              print("snapshot"+snapshot.toString());
//            if (snapshot.data == null) {
//              return Container(
//                child: Center(
//                  child: Text("Loading..."),
//                ),
//              );
//            } else {
//              return ListView.builder(
//                itemCount: snapshot.data.length,
//                itemBuilder: (BuildContext context, int index) {
//                  var i = snapshot.data![index];
//                  return Padding(
//                    padding: const EdgeInsets.all(8.0),
//                    child: Card(
//                      elevation: 3,
//                      shape: RoundedRectangleBorder(
//                        borderRadius: BorderRadius.circular(10),
//                        side: BorderSide(color: Colors.grey.shade300),
//                      ),
//                      child: Padding(
//                        padding: const EdgeInsets.all(16.0),
//                        child: Column(
//                          crossAxisAlignment: CrossAxisAlignment.start,
//                          children: [
//
//                            SizedBox(height: 10),
//                            _buildRow("name:", i.name.toString()),
//                            _buildRow("email:", i.email.toString()),
//                            _buildRow("phone:", i.phone.toString()),
//                            Image.network(i.proof.toString(),height: 200,width: 200,),
//                            _buildRow("housename:", i.housename.toString()),
//                            _buildRow("post:", i.post.toString()),
//                            _buildRow("pin:", i.pin.toString()),
//                            _buildRow("place:", i.place.toString()),
//                            _buildRow("latitude:", i.latitude.toString()),
//                            _buildRow("longitude:", i.longitude.toString()),
//                            Image.network(i.photo.toString(),height: 200,width: 200,),
//                            Row(children: [
//                              ElevatedButton(onPressed: (){
//                                Navigator.push(context, MaterialPageRoute(builder: (context)=>editprofilesub(
//                                  id:i.id.toString(),
//                                  name:i.name.toString(),
//                                  email:i.email.toString(),
//                                  phone:i.phone.toString(),
//                                  housename:i.housename.toString(),
//                                  post:i.post.toString(),
//                                  pin:i.pin.toString(),
//                                  place:i.place.toString(),
//                                    latitude:i.latitude.toString(),
//                                    longitude:i.longitude.toString(),
//
//
//                                )));
//                              }, child: Text("editprofile"))
//                            ],)
//
//
//
//
//
//
//
//                          ],
//                        ),
//                      ),
//                    ),
//                  );
//                },
//              );
//
//
//            }
//          },
//
//
//        ),
//
//
//
//
//
//      ),
//      );
//    }
//    Widget _buildRow(String label, String value) {
//      return Padding(
//        padding: const EdgeInsets.symmetric(vertical: 4),
//        child: Row(
//          children: [
//            SizedBox(
//              width: 100,
//              child: Text(
//                label,
//                style: TextStyle(
//                  fontWeight: FontWeight.bold,
//                ),
//              ),
//            ),
//            SizedBox(width: 5),
//            Flexible(
//              child: Text(
//                value,
//                style: TextStyle(
//                  color: Colors.grey.shade800,
//                ),
//              ),
//            ),
//          ],
//        ),
//      );
//    }
//
//  }
// class Joke {
//   final String id;
//   final String name;
//   final String email;
//   final String phone;
//   final String proof;
//   final String housename;
//   final String post;
//   final String pin;
//   final String place;
//   final String latitude;
//   final String longitude;
//   final String photo;
//
//
//
//
//
//
//
//
//
//
//   Joke(this.id,this.name, this.email,this.phone,this.proof,this.housename,this.post,this.pin,this.place,this.latitude,this.longitude,this.photo);
// //  print("hiiiii");
// }

// import 'dart:convert';
// import 'dart:ui';
//
// import 'package:final_destination/home.dart';
// import 'package:flutter/material.dart';
// import 'package:http/http.dart' as http;
// import 'package:shared_preferences/shared_preferences.dart';
//
// import 'editprofile.dart';
// import 'user.dart'; // Assuming this is your home page
//
// void main() {
//   runApp(viewprofile());
// }
//
// class viewprofile extends StatelessWidget {
//   const viewprofile({Key? key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: viewprofilesub(),
//       debugShowCheckedModeBanner: false,
//       theme: ThemeData.dark().copyWith(
//         scaffoldBackgroundColor: Colors.black, // Changed to solid black
//         primaryColor: const Color(0xFF2EF21D),
//       ),
//     );
//   }
// }
//
// class viewprofilesub extends StatefulWidget {
//   const viewprofilesub({Key? key}) : super(key: key);
//
//   @override
//   State<viewprofilesub> createState() => _viewprofilesubState();
// }
//
// class _viewprofilesubState extends State<viewprofilesub> {
//   Future<List<Joke>> _getJokes() async {
//     SharedPreferences prefs = await SharedPreferences.getInstance();
//     String b = prefs.getString("lid").toString();
//     String foodimage = "";
//     var data = await http.post(
//       Uri.parse(prefs.getString("ip").toString() + "/user_viewprofile"),
//       body: {"uid": prefs.getString('uid').toString()},
//     );
//
//     var jsonData = json.decode(data.body);
//     List<Joke> jokes = [];
//     for (var joke in jsonData["message"]) {
//       print(joke);
//       Joke newJoke = Joke(
//         joke["id"].toString(),
//         joke["name"],
//         joke["email"].toString(),
//         joke["phone"].toString(),
//         prefs.getString('ip').toString() + joke["proof"].toString(),
//         joke["housename"].toString(),
//         joke["post"].toString(),
//         joke["pin"].toString(),
//         joke["place"].toString(),
//         joke["latitude"].toString(),
//         joke["longitude"].toString(),
//         prefs.getString('ip').toString() + joke["photo"].toString(),
//       );
//       jokes.add(newJoke);
//     }
//     return jokes;
//   }
//
//   Widget _buildGlassContainer(
//       {required Widget child,
//         double? height,
//         EdgeInsets? padding,
//         double borderRadius = 25}) {
//     return Container(
//       height: height,
//       padding: padding ?? const EdgeInsets.all(0),
//       decoration: BoxDecoration(
//         borderRadius: BorderRadius.circular(borderRadius),
//         gradient: LinearGradient(
//           begin: Alignment.topLeft,
//           end: Alignment.bottomRight,
//           colors: [
//             Colors.white.withOpacity(0.15),
//             Colors.white.withOpacity(0.05),
//           ],
//         ),
//         border: Border.all(
//           color: Colors.white.withOpacity(0.2),
//           width: 1.5,
//         ),
//         boxShadow: [
//           BoxShadow(
//             color: Colors.black.withOpacity(0.3),
//             blurRadius: 30,
//             spreadRadius: 5,
//           ),
//         ],
//       ),
//       child: ClipRRect(
//         borderRadius: BorderRadius.circular(borderRadius),
//         child: BackdropFilter(
//           filter: ImageFilter.blur(sigmaX: 15, sigmaY: 15),
//           child: child,
//         ),
//       ),
//     );
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.black, // Solid black background
//       appBar: AppBar(
//         title: Text(
//           'PROFILE DETAILS',
//           style: TextStyle(
//             fontWeight: FontWeight.w800,
//             fontSize: 20,
//             letterSpacing: 3.0,
//             color: Colors.white,
//             fontFamily: 'Montserrat',
//             shadows: [
//               Shadow(
//                 color: Colors.black.withOpacity(0.8),
//                 blurRadius: 12,
//                 offset: const Offset(0, 2),
//               ),
//               Shadow(
//                 color: const Color(0xFF2EF21D).withOpacity(0.3),
//                 blurRadius: 25,
//                 offset: const Offset(0, 0),
//               ),
//             ],
//           ),
//         ),
//         centerTitle: true,
//         backgroundColor: Colors.black,
//         elevation: 0,
//         flexibleSpace: Container(
//           decoration: BoxDecoration(
//             gradient: LinearGradient(
//               begin: Alignment.topCenter,
//               end: Alignment.bottomCenter,
//               colors: [
//                 Colors.black.withOpacity(0.95),
//                 Colors.black.withOpacity(0.7),
//               ],
//             ),
//             border: Border(
//               bottom: BorderSide(
//                 color: const Color(0xFF2EF21D).withOpacity(0.3),
//                 width: 1.0,
//               ),
//             ),
//           ),
//         ),
//         iconTheme: const IconThemeData(color: Colors.white),
//         leading: IconButton(
//           icon: const Icon(Icons.arrow_back_ios_new_rounded),
//           onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (context)=>user())),
//         ),
//         actions: [
//           // Home button added to AppBar
//           IconButton(
//             icon: Container(
//               decoration: BoxDecoration(
//                 shape: BoxShape.circle,
//                 gradient: LinearGradient(
//                   colors: [
//                     Colors.black.withOpacity(0.8),
//                     Colors.black.withOpacity(0.6),
//                   ],
//                 ),
//                 border: Border.all(
//                   color: Colors.white.withOpacity(0.3),
//                   width: 1,
//                 ),
//                 boxShadow: [
//                   BoxShadow(
//                     color: const Color(0xFF2EF21D).withOpacity(0.2),
//                     blurRadius: 10,
//                   ),
//                 ],
//               ),
//               child: const Padding(
//                 padding: EdgeInsets.all(8.0),
//                 child: Icon(
//                   Icons.home_outlined,
//                   size: 22,
//                   color: Colors.white,
//                 ),
//               ),
//             ),
//             onPressed: () {
//               Navigator.pushReplacement(
//                 context,
//                 MaterialPageRoute(builder: (context) => user()), // Navigate to home page
//               );
//             },
//           ),
//           const SizedBox(width: 10),
//         ],
//       ),
//       body: Container(
//         decoration: const BoxDecoration(
//           gradient: LinearGradient(
//             begin: Alignment.topCenter,
//             end: Alignment.bottomCenter,
//             colors: [
//               Color(0xFF0A0A0A),
//               Color(0xFF121212),
//               Colors.black,
//             ],
//           ),
//         ),
//         padding: const EdgeInsets.all(20),
//         child: FutureBuilder(
//           future: _getJokes(),
//           builder: (BuildContext context, AsyncSnapshot snapshot) {
//             if (snapshot.data == null) {
//               return Center(
//                 child: _buildGlassContainer(
//                   padding: const EdgeInsets.all(40),
//                   child: Column(
//                     mainAxisSize: MainAxisSize.min,
//                     children: [
//                       CircularProgressIndicator(
//                         color: const Color(0xFF2EF21D),
//                         strokeWidth: 3,
//                       ),
//                       const SizedBox(height: 20),
//                       Text(
//                         'Loading Profile...',
//                         style: TextStyle(
//                           color: Colors.white.withOpacity(0.9),
//                           fontSize: 16,
//                           fontWeight: FontWeight.w600,
//                           letterSpacing: 1.2,
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
//               );
//             } else {
//               return ListView.builder(
//                 itemCount: snapshot.data.length,
//                 itemBuilder: (BuildContext context, int index) {
//                   var i = snapshot.data![index];
//                   return Column(
//                     children: [
//                       // Profile Header with Image
//                       _buildGlassContainer(
//                         padding: const EdgeInsets.all(25),
//                         child: Row(
//                           children: [
//                             Container(
//                               width: 100,
//                               height: 100,
//                               decoration: BoxDecoration(
//                                 shape: BoxShape.circle,
//                                 gradient: LinearGradient(
//                                   colors: [
//                                     const Color(0xFF0F3D3A),
//                                     const Color(0xFF2EF21D),
//                                   ],
//                                   begin: Alignment.topLeft,
//                                   end: Alignment.bottomRight,
//                                 ),
//                                 border: Border.all(
//                                   color: const Color(0xFF2EF21D).withOpacity(0.3),
//                                   width: 2,
//                                 ),
//                                 boxShadow: [
//                                   BoxShadow(
//                                     color: const Color(0xFF2EF21D).withOpacity(0.3),
//                                     blurRadius: 20,
//                                   ),
//                                 ],
//                               ),
//                               child: ClipRRect(
//                                 borderRadius: BorderRadius.circular(50),
//                                 child: Image.network(
//                                   i.photo.toString(),
//                                   height: 100,
//                                   width: 100,
//                                   fit: BoxFit.cover,
//                                   errorBuilder: (context, error, stackTrace) {
//                                     return Center(
//                                       child: Icon(
//                                         Icons.person,
//                                         size: 40,
//                                         color: Colors.white,
//                                       ),
//                                     );
//                                   },
//                                 ),
//                               ),
//                             ),
//                             const SizedBox(width: 20),
//                             Expanded(
//                               child: Column(
//                                 crossAxisAlignment: CrossAxisAlignment.start,
//                                 children: [
//                                   Text(
//                                     i.name.toString().toUpperCase(),
//                                     style: TextStyle(
//                                       fontSize: 24,
//                                       fontWeight: FontWeight.w800,
//                                       color: Colors.white,
//                                       fontFamily: 'Montserrat',
//                                       letterSpacing: 1.5,
//                                       height: 1.2,
//                                     ),
//                                   ),
//                                   const SizedBox(height: 8),
//                                   Text(
//                                     'Premium Member',
//                                     style: TextStyle(
//                                       fontSize: 14,
//                                       color: const Color(0xFF2EF21D),
//                                       fontFamily: 'Poppins',
//                                       letterSpacing: 1.2,
//                                     ),
//                                   ),
//                                   const SizedBox(height: 5),
//                                   Text(
//                                     i.email.toString(),
//                                     style: TextStyle(
//                                       fontSize: 14,
//                                       color: Colors.white.withOpacity(0.7),
//                                       fontFamily: 'Inter',
//                                     ),
//                                   ),
//                                 ],
//                               ),
//                             ),
//                           ],
//                         ),
//                       ),
//
//                       const SizedBox(height: 20),
//
//                       // Personal Information
//                       _buildGlassContainer(
//                         padding: const EdgeInsets.all(25),
//                         child: Column(
//                           crossAxisAlignment: CrossAxisAlignment.start,
//                           children: [
//                             Row(
//                               children: [
//                                 Icon(
//                                   Icons.person_outline_rounded,
//                                   color: const Color(0xFF2EF21D),
//                                   size: 20,
//                                 ),
//                                 const SizedBox(width: 10),
//                                 Text(
//                                   'PERSONAL INFORMATION',
//                                   style: TextStyle(
//                                     fontSize: 16,
//                                     fontWeight: FontWeight.w700,
//                                     color: Colors.white,
//                                     fontFamily: 'Montserrat',
//                                     letterSpacing: 1.5,
//                                   ),
//                                 ),
//                               ],
//                             ),
//                             const SizedBox(height: 20),
//                             Divider(
//                               color: const Color(0xFF2EF21D).withOpacity(0.3),
//                               height: 1,
//                             ),
//                             const SizedBox(height: 20),
//                             _buildDetailRow('Full Name', i.name.toString(), Icons.person),
//                             _buildDetailRow('Email', i.email.toString(), Icons.email),
//                             _buildDetailRow('Phone', i.phone.toString(), Icons.phone),
//                             _buildDetailRow('House Name', i.housename.toString(), Icons.home),
//                             _buildDetailRow('Place', i.place.toString(), Icons.location_city),
//                             _buildDetailRow('Post', i.post.toString(), Icons.local_post_office),
//                             _buildDetailRow('PIN', i.pin.toString(), Icons.pin_drop),
//                           ],
//                         ),
//                       ),
//
//                       const SizedBox(height: 20),
//
//                       // Location Information
//                       _buildGlassContainer(
//                         padding: const EdgeInsets.all(25),
//                         child: Column(
//                           crossAxisAlignment: CrossAxisAlignment.start,
//                           children: [
//                             Row(
//                               children: [
//                                 Icon(
//                                   Icons.location_on_outlined,
//                                   color: const Color(0xFF2EF21D),
//                                   size: 20,
//                                 ),
//                                 const SizedBox(width: 10),
//                                 Text(
//                                   'LOCATION DETAILS',
//                                   style: TextStyle(
//                                     fontSize: 16,
//                                     fontWeight: FontWeight.w700,
//                                     color: Colors.white,
//                                     fontFamily: 'Montserrat',
//                                     letterSpacing: 1.5,
//                                   ),
//                                 ),
//                               ],
//                             ),
//                             const SizedBox(height: 20),
//                             Divider(
//                               color: const Color(0xFF2EF21D).withOpacity(0.3),
//                               height: 1,
//                             ),
//                             const SizedBox(height: 20),
//                             _buildDetailRow('Latitude', i.latitude.toString(), Icons.explore),
//                             _buildDetailRow('Longitude', i.longitude.toString(), Icons.explore),
//                           ],
//                         ),
//                       ),
//
//                       const SizedBox(height: 20),
//
//                       // Proof Document
//                       _buildGlassContainer(
//                         padding: const EdgeInsets.all(25),
//                         child: Column(
//                           crossAxisAlignment: CrossAxisAlignment.start,
//                           children: [
//                             Row(
//                               children: [
//                                 Icon(
//                                   Icons.verified_outlined,
//                                   color: const Color(0xFF2EF21D),
//                                   size: 20,
//                                 ),
//                                 const SizedBox(width: 10),
//                                 Text(
//                                   'VERIFICATION DOCUMENT',
//                                   style: TextStyle(
//                                     fontSize: 16,
//                                     fontWeight: FontWeight.w700,
//                                     color: Colors.white,
//                                     fontFamily: 'Montserrat',
//                                     letterSpacing: 1.5,
//                                   ),
//                                 ),
//                               ],
//                             ),
//                             const SizedBox(height: 20),
//                             Divider(
//                               color: const Color(0xFF2EF21D).withOpacity(0.3),
//                               height: 1,
//                             ),
//                             const SizedBox(height: 20),
//                             Center(
//                               child: _buildGlassContainer(
//                                 padding: EdgeInsets.zero,
//                                 height: 250,
//                                 borderRadius: 15,
//                                 child: ClipRRect(
//                                   borderRadius: BorderRadius.circular(15),
//                                   child: Image.network(
//                                     i.proof.toString(),
//                                     height: 250,
//                                     width: double.infinity,
//                                     fit: BoxFit.cover,
//                                     errorBuilder: (context, error, stackTrace) {
//                                       return Center(
//                                         child: Column(
//                                           mainAxisAlignment: MainAxisAlignment.center,
//                                           children: [
//                                             Icon(
//                                               Icons.document_scanner_outlined,
//                                               size: 60,
//                                               color: Colors.white.withOpacity(0.5),
//                                             ),
//                                             const SizedBox(height: 10),
//                                             Text(
//                                               'Document not available',
//                                               style: TextStyle(
//                                                 color: Colors.white.withOpacity(0.7),
//                                                 fontSize: 14,
//                                               ),
//                                             ),
//                                           ],
//                                         ),
//                                       );
//                                     },
//                                   ),
//                                 ),
//                               ),
//                             ),
//                           ],
//                         ),
//                       ),
//
//                       const SizedBox(height: 30),
//
//                       // Action Buttons Row
//                       Row(
//                         children: [
//                           Expanded(
//                             child: SizedBox(
//                               height: 55,
//                               child: ElevatedButton(
//                                 onPressed: () {
//                                   Navigator.push(
//                                     context,
//                                     MaterialPageRoute(
//                                       builder: (context) => editprofilesub(
//                                         id: i.id.toString(),
//                                         name: i.name.toString(),
//                                         email: i.email.toString(),
//                                         phone: i.phone.toString(),
//                                         housename: i.housename.toString(),
//                                         post: i.post.toString(),
//                                         pin: i.pin.toString(),
//                                         place: i.place.toString(),
//                                         latitude: i.latitude.toString(),
//                                         longitude: i.longitude.toString(),
//                                       ),
//                                     ),
//                                   );
//                                 },
//                                 style: ElevatedButton.styleFrom(
//                                   backgroundColor: const Color(0xFF2EF21D),
//                                   shape: RoundedRectangleBorder(
//                                     borderRadius: BorderRadius.circular(15),
//                                   ),
//                                   elevation: 10,
//                                   shadowColor: const Color(0xFF2EF21D).withOpacity(0.5),
//                                 ),
//                                 child: Row(
//                                   mainAxisAlignment: MainAxisAlignment.center,
//                                   children: [
//                                     Icon(Icons.edit_outlined, color: Colors.black),
//                                     const SizedBox(width: 10),
//                                     Text(
//                                       'EDIT PROFILE',
//                                       style: TextStyle(
//                                         color: Colors.black,
//                                         fontSize: 16,
//                                         fontWeight: FontWeight.bold,
//                                         letterSpacing: 1.5,
//                                       ),
//                                     ),
//                                   ],
//                                 ),
//                               ),
//                             ),
//                           ),
//                           const SizedBox(width: 15),
//                           SizedBox(
//                             height: 55,
//                             child: ElevatedButton(
//                               onPressed: () {
//                                 Navigator.pushReplacement(
//                                   context,
//                                   MaterialPageRoute(builder: (context) => user()), // Navigate to home
//                                 );
//                               },
//                               style: ElevatedButton.styleFrom(
//                                 backgroundColor: Colors.black,
//                                 shape: RoundedRectangleBorder(
//                                   borderRadius: BorderRadius.circular(15),
//                                   side: BorderSide(
//                                     color: const Color(0xFF2EF21D).withOpacity(0.5),
//                                     width: 2,
//                                   ),
//                                 ),
//                                 elevation: 5,
//                               ),
//                               child: Row(
//                                 mainAxisAlignment: MainAxisAlignment.center,
//                                 children: [
//                                   Icon(Icons.home, color: const Color(0xFF2EF21D)),
//                                   const SizedBox(width: 10),
//                                   Text(
//                                     'HOME',
//                                     style: TextStyle(
//                                       color: const Color(0xFF2EF21D),
//                                       fontSize: 16,
//                                       fontWeight: FontWeight.bold,
//                                       letterSpacing: 1.5,
//                                     ),
//                                   ),
//                                 ],
//                               ),
//                             ),
//                           ),
//                         ],
//                       ),
//
//                       const SizedBox(height: 40),
//                     ],
//                   );
//                 },
//               );
//             }
//           },
//         ),
//       ),
//     );
//   }
//
//   Widget _buildDetailRow(String label, String value, IconData icon) {
//     return Padding(
//       padding: const EdgeInsets.symmetric(vertical: 12),
//       child: Row(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           Container(
//             width: 40,
//             height: 40,
//             decoration: BoxDecoration(
//               shape: BoxShape.circle,
//               gradient: LinearGradient(
//                 colors: [
//                   Colors.black.withOpacity(0.8),
//                   Colors.black.withOpacity(0.6),
//                 ],
//               ),
//               border: Border.all(
//                 color: const Color(0xFF2EF21D).withOpacity(0.3),
//                 width: 1,
//               ),
//             ),
//             child: Icon(
//               icon,
//               color: const Color(0xFF2EF21D),
//               size: 20,
//             ),
//           ),
//           const SizedBox(width: 15),
//           Expanded(
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 Text(
//                   label.toUpperCase(),
//                   style: TextStyle(
//                     fontSize: 12,
//                     color: Colors.white.withOpacity(0.6),
//                     fontFamily: 'Poppins',
//                     letterSpacing: 1.2,
//                     fontWeight: FontWeight.w600,
//                   ),
//                 ),
//                 const SizedBox(height: 4),
//                 Text(
//                   value,
//                   style: TextStyle(
//                     fontSize: 16,
//                     color: Colors.white,
//                     fontFamily: 'Inter',
//                     fontWeight: FontWeight.w500,
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
//
// class Joke {
//   final String id;
//   final String name;
//   final String email;
//   final String phone;
//   final String proof;
//   final String housename;
//   final String post;
//   final String pin;
//   final String place;
//   final String latitude;
//   final String longitude;
//   final String photo;
//
//   Joke(this.id, this.name, this.email, this.phone, this.proof, this.housename,
//       this.post, this.pin, this.place, this.latitude, this.longitude,
//       this.photo);
// }
//


// import 'dart:convert';
// import 'package:final_destination/home.dart';
// import 'package:flutter/material.dart';
// import 'package:http/http.dart' as http;
// import 'package:shared_preferences/shared_preferences.dart';
// import 'package:final_destination/editprofile.dart';
//
// void main() {
//   runApp(viewprofile());
// }
//
// class viewprofile extends StatelessWidget {
//   const viewprofile({Key? key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       theme: ThemeData(
//         primaryColor: Color(0xFF1A237E),
//         fontFamily: 'Poppins',
//       ),
//       home: viewprofilesub(),
//     );
//   }
// }
//
// class viewprofilesub extends StatefulWidget {
//   const viewprofilesub({Key? key}) : super(key: key);
//
//   @override
//   State<viewprofilesub> createState() => _viewprofilesubState();
// }
//
// class _viewprofilesubState extends State<viewprofilesub> {
//   Future<List<Joke>> _getJokes() async {
//     SharedPreferences prefs = await SharedPreferences.getInstance();
//     String b = prefs.getString("lid").toString();
//     String foodimage = "";
//     var data = await http.post(
//       Uri.parse(prefs.getString("ip").toString() + "/user_viewprofile"),
//       body: {"uid": prefs.getString('uid').toString()},
//     );
//
//     var jsonData = json.decode(data.body);
//     List<Joke> jokes = [];
//     for (var joke in jsonData["message"]) {
//       print(joke);
//       Joke newJoke = Joke(
//         joke["id"].toString(),
//         joke["name"],
//         joke["email"].toString(),
//         joke["phone"].toString(),
//         prefs.getString('ip').toString() + joke["proof"].toString(),
//         joke["housename"].toString(),
//         joke["post"].toString(),
//         joke["pin"].toString(),
//         joke["place"].toString(),
//         joke["latitude"].toString(),
//         joke["longitude"].toString(),
//         prefs.getString('ip').toString() + joke["photo"].toString(),
//       );
//       jokes.add(newJoke);
//     }
//     return jokes;
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: Color(0xFF1A237E),
//         elevation: 0,
//         title: Text(
//           'TRAVELIX',
//           style: TextStyle(
//             fontSize: 24,
//             fontWeight: FontWeight.bold,
//             letterSpacing: 2,
//           ),
//         ),
//         centerTitle: true,
//         leading: IconButton(
//           icon: Icon(Icons.arrow_back),
//           onPressed: ()=>Navigator.push(context,MaterialPageRoute(builder: (context)=>UserHomeApp())),
//
//         ),
//         actions: [
//           IconButton(
//             icon: Icon(Icons.edit),
//             onPressed: () {},
//           ),
//         ],
//       ),
//       body: Container(
//         decoration: BoxDecoration(
//           gradient: LinearGradient(
//             begin: Alignment.topCenter,
//             end: Alignment.bottomCenter,
//             colors: [
//               Color(0xFF1A237E),
//               Color(0xFF3949AB),
//               Colors.white,
//             ],
//           ),
//         ),
//         child: FutureBuilder(
//           future: _getJokes(),
//           builder: (BuildContext context, AsyncSnapshot snapshot) {
//             if (snapshot.data == null) {
//               return Center(
//                 child: CircularProgressIndicator(
//                   color: Colors.white,
//                 ),
//               );
//             } else {
//               return ListView.builder(
//                 itemCount: snapshot.data.length,
//                 itemBuilder: (BuildContext context, int index) {
//                   var i = snapshot.data![index];
//                   return Padding(
//                     padding: const EdgeInsets.all(16.0),
//                     child: Column(
//                       children: [
//                         // Profile Header Card
//                         Card(
//                           elevation: 8,
//                           shape: RoundedRectangleBorder(
//                             borderRadius: BorderRadius.circular(20),
//                           ),
//                           child: Container(
//                             width: double.infinity,
//                             padding: EdgeInsets.all(20),
//                             decoration: BoxDecoration(
//                               gradient: LinearGradient(
//                                 colors: [Color(0xFF1A237E), Color(0xFF3949AB)],
//                                 begin: Alignment.topLeft,
//                                 end: Alignment.bottomRight,
//                               ),
//                               borderRadius: BorderRadius.circular(20),
//                             ),
//                             child: Column(
//                               children: [
//                                 // Profile Photo
//                                 Container(
//                                   width: 120,
//                                   height: 120,
//                                   decoration: BoxDecoration(
//                                     shape: BoxShape.circle,
//                                     border: Border.all(
//                                       color: Colors.white,
//                                       width: 4,
//                                     ),
//                                     boxShadow: [
//                                       BoxShadow(
//                                         color: Colors.black.withOpacity(0.2),
//                                         blurRadius: 10,
//                                         spreadRadius: 2,
//                                       ),
//                                     ],
//                                   ),
//                                   child: ClipOval(
//                                     child: Image.network(
//                                       i.photo.toString(),
//                                       fit: BoxFit.cover,
//                                       loadingBuilder: (BuildContext context,
//                                           Widget child,
//                                           ImageChunkEvent? loadingProgress) {
//                                         if (loadingProgress == null)
//                                           return child;
//                                         return Center(
//                                           child: CircularProgressIndicator(
//                                             value: loadingProgress
//                                                 .expectedTotalBytes !=
//                                                 null
//                                                 ? loadingProgress
//                                                 .cumulativeBytesLoaded /
//                                                 loadingProgress
//                                                     .expectedTotalBytes!
//                                                 : null,
//                                           ),
//                                         );
//                                       },
//                                       errorBuilder: (BuildContext context,
//                                           Object error,
//                                           StackTrace? stackTrace) {
//                                         return Container(
//                                           color: Colors.white,
//                                           child: Icon(
//                                             Icons.person,
//                                             size: 60,
//                                             color: Color(0xFF1A237E),
//                                           ),
//                                         );
//                                       },
//                                     ),
//                                   ),
//                                 ),
//                                 SizedBox(height: 20),
//                                 Text(
//                                   i.name.toString(),
//                                   style: TextStyle(
//                                     fontSize: 28,
//                                     fontWeight: FontWeight.bold,
//                                     color: Colors.white,
//                                   ),
//                                 ),
//                                 SizedBox(height: 5),
//                                 Text(
//                                   i.email.toString(),
//                                   style: TextStyle(
//                                     fontSize: 16,
//                                     color: Colors.white70,
//                                   ),
//                                 ),
//                                 SizedBox(height: 20),
//                                 ElevatedButton(
//                                   onPressed: () {
//                                     Navigator.push(
//                                       context,
//                                       MaterialPageRoute(
//                                         builder: (context) => editprofilesub(
//                                           id: i.id.toString(),
//                                           name: i.name.toString(),
//                                           email: i.email.toString(),
//                                           phone: i.phone.toString(),
//                                           housename: i.housename.toString(),
//                                           post: i.post.toString(),
//                                           pin: i.pin.toString(),
//                                           place: i.place.toString(),
//                                           latitude: i.latitude.toString(),
//                                           longitude: i.longitude.toString(),
//                                         ),
//                                       ),
//                                     );
//                                   },
//                                   style: ElevatedButton.styleFrom(
//                                     backgroundColor: Colors.white,
//                                     foregroundColor: Color(0xFF1A237E),
//                                     padding: EdgeInsets.symmetric(
//                                         horizontal: 30, vertical: 12),
//                                     shape: RoundedRectangleBorder(
//                                       borderRadius: BorderRadius.circular(30),
//                                     ),
//                                   ),
//                                   child: Text(
//                                     'Edit Profile',
//                                     style: TextStyle(
//                                       fontSize: 16,
//                                       fontWeight: FontWeight.bold,
//                                     ),
//                                   ),
//                                 ),
//                               ],
//                             ),
//                           ),
//                         ),
//                         SizedBox(height: 20),
//
//                         // Personal Information Card
//                         Card(
//                           elevation: 5,
//                           shape: RoundedRectangleBorder(
//                             borderRadius: BorderRadius.circular(15),
//                           ),
//                           child: Padding(
//                             padding: const EdgeInsets.all(20),
//                             child: Column(
//                               crossAxisAlignment: CrossAxisAlignment.start,
//                               children: [
//                                 Row(
//                                   children: [
//                                     Icon(
//                                       Icons.person_outline,
//                                       color: Color(0xFF1A237E),
//                                       size: 20,
//                                     ),
//                                     SizedBox(width: 10),
//                                     Text(
//                                       'Personal Information',
//                                       style: TextStyle(
//                                         fontSize: 20,
//                                         fontWeight: FontWeight.bold,
//                                         color: Color(0xFF1A237E),
//                                       ),
//                                     ),
//                                   ],
//                                 ),
//                                 SizedBox(height: 20),
//                                 _buildInfoRow('Name', i.name.toString()),
//                                 _buildInfoRow('Email', i.email.toString()),
//                                 _buildInfoRow('Phone', i.phone.toString()),
//                               ],
//                             ),
//                           ),
//                         ),
//                         SizedBox(height: 15),
//
//                         // Address Information Card
//                         Card(
//                           elevation: 5,
//                           shape: RoundedRectangleBorder(
//                             borderRadius: BorderRadius.circular(15),
//                           ),
//                           child: Padding(
//                             padding: const EdgeInsets.all(20),
//                             child: Column(
//                               crossAxisAlignment: CrossAxisAlignment.start,
//                               children: [
//                                 Row(
//                                   children: [
//                                     Icon(
//                                       Icons.home_outlined,
//                                       color: Color(0xFF1A237E),
//                                       size: 20,
//                                     ),
//                                     SizedBox(width: 10),
//                                     Text(
//                                       'Address Information',
//                                       style: TextStyle(
//                                         fontSize: 20,
//                                         fontWeight: FontWeight.bold,
//                                         color: Color(0xFF1A237E),
//                                       ),
//                                     ),
//                                   ],
//                                 ),
//                                 SizedBox(height: 20),
//                                 _buildInfoRow(
//                                     'House Name', i.housename.toString()),
//                                 _buildInfoRow('Post', i.post.toString()),
//                                 _buildInfoRow('Place', i.place.toString()),
//                                 _buildInfoRow('PIN Code', i.pin.toString()),
//                                 _buildInfoRow('Latitude', i.latitude.toString()),
//                                 _buildInfoRow('Longitude', i.longitude.toString()),
//                               ],
//                             ),
//                           ),
//                         ),
//                         SizedBox(height: 15),
//
//                         // Proof Document Card
//                         Card(
//                           elevation: 5,
//                           shape: RoundedRectangleBorder(
//                             borderRadius: BorderRadius.circular(15),
//                           ),
//                           child: Padding(
//                             padding: const EdgeInsets.all(20),
//                             child: Column(
//                               crossAxisAlignment: CrossAxisAlignment.start,
//                               children: [
//                                 Row(
//                                   children: [
//                                     Icon(
//                                       Icons.verified_outlined,
//                                       color: Color(0xFF1A237E),
//                                       size: 20,
//                                     ),
//                                     SizedBox(width: 10),
//                                     Text(
//                                       'Proof Document',
//                                       style: TextStyle(
//                                         fontSize: 20,
//                                         fontWeight: FontWeight.bold,
//                                         color: Color(0xFF1A237E),
//                                       ),
//                                     ),
//                                   ],
//                                 ),
//                                 SizedBox(height: 20),
//                                 Center(
//                                   child: Container(
//                                     width: double.infinity,
//                                     height: 250,
//                                     decoration: BoxDecoration(
//                                       borderRadius: BorderRadius.circular(10),
//                                       color: Colors.grey[100],
//                                       border: Border.all(
//                                         color: Colors.grey
//                                       ),
//                                     ),
//                                     child: ClipRRect(
//                                       borderRadius: BorderRadius.circular(10),
//                                       child: Image.network(
//                                         i.proof.toString(),
//                                         fit: BoxFit.cover,
//                                         loadingBuilder: (BuildContext context,
//                                             Widget child,
//                                             ImageChunkEvent? loadingProgress) {
//                                           if (loadingProgress == null)
//                                             return child;
//                                           return Center(
//                                             child: CircularProgressIndicator(
//                                               value: loadingProgress
//                                                   .expectedTotalBytes !=
//                                                   null
//                                                   ? loadingProgress
//                                                   .cumulativeBytesLoaded /
//                                                   loadingProgress
//                                                       .expectedTotalBytes!
//                                                   : null,
//                                             ),
//                                           );
//                                         },
//                                         errorBuilder: (BuildContext context,
//                                             Object error,
//                                             StackTrace? stackTrace) {
//                                           return Center(
//                                             child: Column(
//                                               mainAxisAlignment:
//                                               MainAxisAlignment.center,
//                                               children: [
//                                                 Icon(
//                                                   Icons.document_scanner,
//                                                   size: 60,
//                                                   color: Colors.grey[400],
//                                                 ),
//                                                 SizedBox(height: 10),
//                                                 Text(
//                                                   'Proof Document',
//                                                   style: TextStyle(
//                                                     color: Colors.grey[600],
//                                                   ),
//                                                 ),
//                                               ],
//                                             ),
//                                           );
//                                         },
//                                       ),
//                                     ),
//                                   ),
//                                 ),
//                               ],
//                             ),
//                           ),
//                         ),
//                       ],
//                     ),
//                   );
//                 },
//               );
//             }
//           },
//         ),
//       ),
//     );
//   }
//
//   Widget _buildInfoRow(String label, String value) {
//     return Padding(
//       padding: const EdgeInsets.symmetric(vertical: 8),
//       child: Row(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           Container(
//             width: 100,
//             child: Text(
//               label,
//               style: TextStyle(
//                 fontWeight: FontWeight.w600,
//                 color: Colors.grey[700],
//                 fontSize: 15,
//               ),
//             ),
//           ),
//           SizedBox(width: 10),
//           Expanded(
//             child: Text(
//               value,
//               style: TextStyle(
//                 fontSize: 16,
//                 color: Colors.black87,
//                 fontWeight: FontWeight.w500,
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
//
// class Joke {
//   final String id;
//   final String name;
//   final String email;
//   final String phone;
//   final String proof;
//   final String housename;
//   final String post;
//   final String pin;
//   final String place;
//   final String latitude;
//   final String longitude;
//   final String photo;
//
//   Joke(this.id, this.name, this.email, this.phone, this.proof, this.housename,
//       this.post, this.pin, this.place, this.latitude, this.longitude, this.photo);
// }

//
// import 'dart:convert';
// import 'package:final_destination/home.dart';
// import 'package:flutter/material.dart';
// import 'package:http/http.dart' as http;
// import 'package:shared_preferences/shared_preferences.dart';
// import 'package:final_destination/editprofile.dart';
//
// void main() {
//   runApp(viewprofile());
// }
//
// class viewprofile extends StatelessWidget {
//   const viewprofile({Key? key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       theme: ThemeData(
//         primaryColor: const Color(0xFF0F2A1D),
//         scaffoldBackgroundColor: const Color(0xFFE3EED4),
//         fontFamily: 'Poppins',
//       ),
//       home: viewprofilesub(),
//     );
//   }
// }
//
// class viewprofilesub extends StatefulWidget {
//   const viewprofilesub({Key? key}) : super(key: key);
//
//   @override
//   State<viewprofilesub> createState() => _viewprofilesubState();
// }
//
// class _viewprofilesubState extends State<viewprofilesub> {
//   Future<List<Joke>> _getJokes() async {
//     SharedPreferences prefs = await SharedPreferences.getInstance();
//     String b = prefs.getString("lid").toString();
//     String foodimage = "";
//     var data = await http.post(
//       Uri.parse(prefs.getString("ip").toString() + "/user_viewprofile"),
//       body: {"uid": prefs.getString('uid').toString()},
//     );
//
//     var jsonData = json.decode(data.body);
//     List<Joke> jokes = [];
//     for (var joke in jsonData["message"]) {
//       print(joke);
//       Joke newJoke = Joke(
//         joke["id"].toString(),
//         joke["name"],
//         joke["email"].toString(),
//         joke["phone"].toString(),
//         prefs.getString('ip').toString() + joke["proof"].toString(),
//         joke["housename"].toString(),
//         joke["post"].toString(),
//         joke["pin"].toString(),
//         joke["place"].toString(),
//         joke["latitude"].toString(),
//         joke["longitude"].toString(),
//         prefs.getString('ip').toString() + joke["photo"].toString(),
//       );
//       jokes.add(newJoke);
//     }
//     return jokes;
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: const Color(0xFFE3EED4),
//       appBar: AppBar(
//         backgroundColor: Colors.white,
//         elevation: 2,
//         title: Text(
//           'My Profile',
//           style: TextStyle(
//             fontSize: 24,
//             fontWeight: FontWeight.w800,
//             color: const Color(0xFF0F2A1D),
//             fontFamily: 'Poppins',
//             letterSpacing: 1,
//           ),
//         ),
//         centerTitle: true,
//         leading: IconButton(
//           icon: const Icon(Icons.arrow_back, color: Color(0xFF0F2A1D)),
//           onPressed: () => Navigator.push(
//             context,
//             MaterialPageRoute(builder: (context) => UserHomeApp()),
//           ),
//         ),
//         actions: [
//           IconButton(
//             icon: const Icon(Icons.edit, color: Color(0xFF0F2A1D)),
//             onPressed: () {},
//           ),
//         ],
//       ),
//       body: Container(
//         decoration: BoxDecoration(
//           gradient: LinearGradient(
//             begin: Alignment.topCenter,
//             end: Alignment.bottomCenter,
//             colors: [
//               const Color(0xFFE3EED4),
//               Colors.white,
//             ],
//           ),
//         ),
//         child: FutureBuilder(
//           future: _getJokes(),
//           builder: (BuildContext context, AsyncSnapshot snapshot) {
//             if (snapshot.data == null) {
//               return Center(
//                 child: Column(
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   children: [
//                     CircularProgressIndicator(
//                       color: const Color(0xFF0F2A1D),
//                     ),
//                     const SizedBox(height: 20),
//                     Text(
//                       "Loading profile...",
//                       style: TextStyle(
//                         color: const Color(0xFF0F2A1D),
//                         fontSize: 16,
//                         fontFamily: 'Poppins',
//                         fontWeight: FontWeight.w600,
//                       ),
//                     ),
//                   ],
//                 ),
//               );
//             } else {
//               return ListView.builder(
//                 itemCount: snapshot.data.length,
//                 itemBuilder: (BuildContext context, int index) {
//                   var i = snapshot.data![index];
//                   return Padding(
//                     padding: const EdgeInsets.all(16.0),
//                     child: Column(
//                       children: [
//                         // Profile Header Card
//                         Card(
//                           elevation: 8,
//                           shape: RoundedRectangleBorder(
//                             borderRadius: BorderRadius.circular(20),
//                           ),
//                           child: Container(
//                             width: double.infinity,
//                             padding: const EdgeInsets.all(20),
//                             decoration: BoxDecoration(
//                               gradient: const LinearGradient(
//                                 colors: [Color(0xFF0F2A1D), Color(0xFF1A3F2B)],
//                                 begin: Alignment.topLeft,
//                                 end: Alignment.bottomRight,
//                               ),
//                               borderRadius: BorderRadius.circular(20),
//                               boxShadow: [
//                                 BoxShadow(
//                                   color: const Color(0xFF0F2A1D).withOpacity(0.3),
//                                   blurRadius: 15,
//                                   offset: const Offset(0, 5),
//                                 ),
//                               ],
//                             ),
//                             child: Column(
//                               children: [
//                                 // Profile Photo
//                                 Container(
//                                   width: 120,
//                                   height: 120,
//                                   decoration: BoxDecoration(
//                                     shape: BoxShape.circle,
//                                     border: Border.all(
//                                       color: Colors.white,
//                                       width: 4,
//                                     ),
//                                     boxShadow: [
//                                       BoxShadow(
//                                         color: Colors.black.withOpacity(0.2),
//                                         blurRadius: 10,
//                                         spreadRadius: 2,
//                                       ),
//                                     ],
//                                   ),
//                                   child: ClipOval(
//                                     child: Image.network(
//                                       i.photo.toString(),
//                                       fit: BoxFit.cover,
//                                       loadingBuilder: (BuildContext context,
//                                           Widget child,
//                                           ImageChunkEvent? loadingProgress) {
//                                         if (loadingProgress == null)
//                                           return child;
//                                         return Center(
//                                           child: CircularProgressIndicator(
//                                             value: loadingProgress
//                                                 .expectedTotalBytes !=
//                                                 null
//                                                 ? loadingProgress
//                                                 .cumulativeBytesLoaded /
//                                                 loadingProgress
//                                                     .expectedTotalBytes!
//                                                 : null,
//                                             color: Colors.white,
//                                           ),
//                                         );
//                                       },
//                                       errorBuilder: (BuildContext context,
//                                           Object error,
//                                           StackTrace? stackTrace) {
//                                         return Container(
//                                           color: Colors.white,
//                                           child: Icon(
//                                             Icons.person,
//                                             size: 60,
//                                             color: const Color(0xFF0F2A1D),
//                                           ),
//                                         );
//                                       },
//                                     ),
//                                   ),
//                                 ),
//                                 const SizedBox(height: 20),
//                                 Text(
//                                   i.name.toString(),
//                                   style: const TextStyle(
//                                     fontSize: 28,
//                                     fontWeight: FontWeight.w800,
//                                     color: Colors.white,
//                                     fontFamily: 'Poppins',
//                                   ),
//                                 ),
//                                 const SizedBox(height: 5),
//                                 Text(
//                                   i.email.toString(),
//                                   style: const TextStyle(
//                                     fontSize: 16,
//                                     color: Colors.white70,
//                                     fontFamily: 'Poppins',
//                                     fontWeight: FontWeight.w500,
//                                   ),
//                                 ),
//                                 const SizedBox(height: 20),
//                                 ElevatedButton(
//                                   onPressed: () {
//                                     Navigator.push(
//                                       context,
//                                       MaterialPageRoute(
//                                         builder: (context) => editprofilesub(
//                                           id: i.id.toString(),
//                                           name: i.name.toString(),
//                                           email: i.email.toString(),
//                                           phone: i.phone.toString(),
//                                           housename: i.housename.toString(),
//                                           post: i.post.toString(),
//                                           pin: i.pin.toString(),
//                                           place: i.place.toString(),
//                                           latitude: i.latitude.toString(),
//                                           longitude: i.longitude.toString(),
//                                         ),
//                                       ),
//                                     );
//                                   },
//                                   style: ElevatedButton.styleFrom(
//                                     backgroundColor: Colors.white,
//                                     foregroundColor: const Color(0xFF0F2A1D),
//                                     padding: const EdgeInsets.symmetric(
//                                         horizontal: 30, vertical: 12),
//                                     shape: RoundedRectangleBorder(
//                                       borderRadius: BorderRadius.circular(30),
//                                     ),
//                                     elevation: 4,
//                                   ),
//                                   child: const Text(
//                                     'Edit Profile',
//                                     style: TextStyle(
//                                       fontSize: 16,
//                                       fontWeight: FontWeight.w800,
//                                       fontFamily: 'Poppins',
//                                     ),
//                                   ),
//                                 ),
//                               ],
//                             ),
//                           ),
//                         ),
//                         const SizedBox(height: 20),
//
//                         // Personal Information Card
//                         Card(
//                           elevation: 5,
//                           shape: RoundedRectangleBorder(
//                             borderRadius: BorderRadius.circular(15),
//                           ),
//                           child: Padding(
//                             padding: const EdgeInsets.all(20),
//                             child: Column(
//                               crossAxisAlignment: CrossAxisAlignment.start,
//                               children: [
//                                 Row(
//                                   children: [
//                                     const Icon(
//                                       Icons.person_outline,
//                                       color: Color(0xFF0F2A1D),
//                                       size: 20,
//                                     ),
//                                     const SizedBox(width: 10),
//                                     const Text(
//                                       'Personal Information',
//                                       style: TextStyle(
//                                         fontSize: 20,
//                                         fontWeight: FontWeight.w800,
//                                         color: Color(0xFF0F2A1D),
//                                         fontFamily: 'Poppins',
//                                       ),
//                                     ),
//                                   ],
//                                 ),
//                                 const SizedBox(height: 20),
//                                 _buildInfoRow('Name', i.name.toString()),
//                                 _buildInfoRow('Email', i.email.toString()),
//                                 _buildInfoRow('Phone', i.phone.toString()),
//                               ],
//                             ),
//                           ),
//                         ),
//                         const SizedBox(height: 15),
//
//                         // Address Information Card
//                         Card(
//                           elevation: 5,
//                           shape: RoundedRectangleBorder(
//                             borderRadius: BorderRadius.circular(15),
//                           ),
//                           child: Padding(
//                             padding: const EdgeInsets.all(20),
//                             child: Column(
//                               crossAxisAlignment: CrossAxisAlignment.start,
//                               children: [
//                                 Row(
//                                   children: [
//                                     const Icon(
//                                       Icons.home_outlined,
//                                       color: Color(0xFF0F2A1D),
//                                       size: 20,
//                                     ),
//                                     const SizedBox(width: 10),
//                                     const Text(
//                                       'Address Information',
//                                       style: TextStyle(
//                                         fontSize: 20,
//                                         fontWeight: FontWeight.w800,
//                                         color: Color(0xFF0F2A1D),
//                                         fontFamily: 'Poppins',
//                                       ),
//                                     ),
//                                   ],
//                                 ),
//                                 const SizedBox(height: 20),
//                                 _buildInfoRow(
//                                     'House Name', i.housename.toString()),
//                                 _buildInfoRow('Post', i.post.toString()),
//                                 _buildInfoRow('Place', i.place.toString()),
//                                 _buildInfoRow('PIN Code', i.pin.toString()),
//                                 _buildInfoRow('Latitude', i.latitude.toString()),
//                                 _buildInfoRow('Longitude', i.longitude.toString()),
//                               ],
//                             ),
//                           ),
//                         ),
//                         const SizedBox(height: 15),
//
//                         // Proof Document Card
//                         Card(
//                           elevation: 5,
//                           shape: RoundedRectangleBorder(
//                             borderRadius: BorderRadius.circular(15),
//                           ),
//                           child: Padding(
//                             padding: const EdgeInsets.all(20),
//                             child: Column(
//                               crossAxisAlignment: CrossAxisAlignment.start,
//                               children: [
//                                 Row(
//                                   children: [
//                                     const Icon(
//                                       Icons.verified_outlined,
//                                       color: Color(0xFF0F2A1D),
//                                       size: 20,
//                                     ),
//                                     const SizedBox(width: 10),
//                                     const Text(
//                                       'Proof Document',
//                                       style: TextStyle(
//                                         fontSize: 20,
//                                         fontWeight: FontWeight.w800,
//                                         color: Color(0xFF0F2A1D),
//                                         fontFamily: 'Poppins',
//                                       ),
//                                     ),
//                                   ],
//                                 ),
//                                 const SizedBox(height: 20),
//                                 Center(
//                                   child: Container(
//                                     width: double.infinity,
//                                     height: 250,
//                                     decoration: BoxDecoration(
//                                       borderRadius: BorderRadius.circular(10),
//                                       color: const Color(0xFFE3EED4).withOpacity(0.3),
//                                       border: Border.all(
//                                         color: const Color(0xFF0F2A1D).withOpacity(0.2),
//                                       ),
//                                     ),
//                                     child: ClipRRect(
//                                       borderRadius: BorderRadius.circular(10),
//                                       child: Image.network(
//                                         i.proof.toString(),
//                                         fit: BoxFit.cover,
//                                         loadingBuilder: (BuildContext context,
//                                             Widget child,
//                                             ImageChunkEvent? loadingProgress) {
//                                           if (loadingProgress == null)
//                                             return child;
//                                           return Center(
//                                             child: CircularProgressIndicator(
//                                               value: loadingProgress
//                                                   .expectedTotalBytes !=
//                                                   null
//                                                   ? loadingProgress
//                                                   .cumulativeBytesLoaded /
//                                                   loadingProgress
//                                                       .expectedTotalBytes!
//                                                   : null,
//                                               color: const Color(0xFF0F2A1D),
//                                             ),
//                                           );
//                                         },
//                                         errorBuilder: (BuildContext context,
//                                             Object error,
//                                             StackTrace? stackTrace) {
//                                           return Center(
//                                             child: Column(
//                                               mainAxisAlignment:
//                                               MainAxisAlignment.center,
//                                               children: [
//                                                 Icon(
//                                                   Icons.document_scanner,
//                                                   size: 60,
//                                                   color: const Color(0xFF0F2A1D).withOpacity(0.3),
//                                                 ),
//                                                 const SizedBox(height: 10),
//                                                 Text(
//                                                   'Proof Document',
//                                                   style: TextStyle(
//                                                     color: const Color(0xFF0F2A1D).withOpacity(0.5),
//                                                     fontFamily: 'Poppins',
//                                                     fontWeight: FontWeight.w500,
//                                                   ),
//                                                 ),
//                                               ],
//                                             ),
//                                           );
//                                         },
//                                       ),
//                                     ),
//                                   ),
//                                 ),
//                               ],
//                             ),
//                           ),
//                         ),
//                       ],
//                     ),
//                   );
//                 },
//               );
//             }
//           },
//         ),
//       ),
//     );
//   }
//
//   Widget _buildInfoRow(String label, String value) {
//     return Padding(
//       padding: const EdgeInsets.symmetric(vertical: 8),
//       child: Row(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           Container(
//             width: 100,
//             child: Text(
//               label,
//               style: TextStyle(
//                 fontWeight: FontWeight.w700,
//                 color: const Color(0xFF0F2A1D).withOpacity(0.8),
//                 fontSize: 14,
//                 fontFamily: 'Poppins',
//               ),
//             ),
//           ),
//           const SizedBox(width: 10),
//           Expanded(
//             child: Text(
//               value,
//               style: const TextStyle(
//                 fontSize: 14,
//                 color: Color(0xFF0F2A1D),
//                 fontWeight: FontWeight.w600,
//                 fontFamily: 'Poppins',
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
//
// class Joke {
//   final String id;
//   final String name;
//   final String email;
//   final String phone;
//   final String proof;
//   final String housename;
//   final String post;
//   final String pin;
//   final String place;
//   final String latitude;
//   final String longitude;
//   final String photo;
//
//   Joke(this.id, this.name, this.email, this.phone, this.proof, this.housename,
//       this.post, this.pin, this.place, this.latitude, this.longitude, this.photo);
// }

import 'dart:convert';
import 'package:final_destination/home.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:final_destination/editprofile.dart';

void main() {
  runApp(viewprofile());
}

class viewprofile extends StatelessWidget {
  const viewprofile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: const Color(0xFF0F2A1D),
        scaffoldBackgroundColor: const Color(0xFFE3EED4),
        fontFamily: 'Poppins',
      ),
      home: viewprofilesub(),
    );
  }
}

class viewprofilesub extends StatefulWidget {
  const viewprofilesub({Key? key}) : super(key: key);

  @override
  State<viewprofilesub> createState() => _viewprofilesubState();
}

class _viewprofilesubState extends State<viewprofilesub> {
  Future<UserProfile> _getUserProfile() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String userId = prefs.getString("lid") ?? "";      // ✅ correct key
    String ipAddress = prefs.getString("ip") ?? "http://localhost";

    final response = await http.post(
      Uri.parse("$ipAddress/user_viewprofile"),
      body: {"uid": userId},                           // backend expects "uid"
    );

    if (response.statusCode == 200) {
      var jsonData = json.decode(response.body);
      if (jsonData["message"] != null && jsonData["message"].isNotEmpty) {
        var item = jsonData["message"][0];
        return UserProfile(
          id: item["id"].toString(),
          name: item["name"] ?? "",
          email: item["email"] ?? "",
          phone: item["phone"] ?? "",
          proof: item["proof"] != null ? "$ipAddress${item["proof"]}" : "",
          housename: item["housename"] ?? "",
          post: item["post"] ?? "",
          pin: item["pin"] ?? "",
          place: item["place"] ?? "",
          latitude: item["latitude"] ?? "",
          longitude: item["longitude"] ?? "",
          photo: item["photo"] != null ? "$ipAddress${item["photo"]}" : "",
        );
      } else {
        throw Exception("No profile data found");
      }
    } else {
      throw Exception("Failed to load profile (status ${response.statusCode})");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFE3EED4),
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 2,
        title: const Text(
          'My Profile',
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.w800,
            color: Color(0xFF0F2A1D),
            fontFamily: 'Poppins',
            letterSpacing: 1,
          ),
        ),
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Color(0xFF0F2A1D)),
          onPressed: () => Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => UserHomeApp()),
          ),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.edit, color: Color(0xFF0F2A1D)),
            onPressed: () {
              // Will be handled after data is loaded via the builder below
            },
          ),
        ],
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              const Color(0xFFE3EED4),
              Colors.white,
            ],
          ),
        ),
        child: FutureBuilder<UserProfile>(
          future: _getUserProfile(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CircularProgressIndicator(color: Color(0xFF0F2A1D)),
                    SizedBox(height: 20),
                    Text(
                      "Loading profile...",
                      style: TextStyle(
                        color: Color(0xFF0F2A1D),
                        fontSize: 16,
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
              );
            } else if (snapshot.hasError) {
              return Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Icon(Icons.error_outline, color: Colors.red, size: 60),
                    const SizedBox(height: 16),
                    Text(
                      "Error: ${snapshot.error}",
                      style: const TextStyle(color: Colors.red),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 20),
                    ElevatedButton(
                      onPressed: () {
                        setState(() {}); // retry
                      },
                      child: const Text("Retry"),
                    ),
                  ],
                ),
              );
            } else if (!snapshot.hasData) {
              return const Center(
                child: Text("No profile data available"),
              );
            }

            final profile = snapshot.data!;
            return SingleChildScrollView(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: [
                  // Profile Header Card
                  Card(
                    elevation: 8,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Container(
                      width: double.infinity,
                      padding: const EdgeInsets.all(20),
                      decoration: BoxDecoration(
                        gradient: const LinearGradient(
                          colors: [Color(0xFF0F2A1D), Color(0xFF1A3F2B)],
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                        ),
                        borderRadius: BorderRadius.circular(20),
                        boxShadow: [
                          BoxShadow(
                            color: const Color(0xFF0F2A1D).withOpacity(0.3),
                            blurRadius: 15,
                            offset: const Offset(0, 5),
                          ),
                        ],
                      ),
                      child: Column(
                        children: [
                          // Profile Photo
                          Container(
                            width: 120,
                            height: 120,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              border: Border.all(color: Colors.white, width: 4),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black.withOpacity(0.2),
                                  blurRadius: 10,
                                  spreadRadius: 2,
                                ),
                              ],
                            ),
                            child: ClipOval(
                              child: profile.photo.isNotEmpty
                                  ? Image.network(
                                profile.photo,
                                fit: BoxFit.cover,
                                loadingBuilder: (context, child, progress) {
                                  if (progress == null) return child;
                                  return const Center(
                                    child: CircularProgressIndicator(
                                      color: Colors.white,
                                    ),
                                  );
                                },
                                errorBuilder: (context, error, stack) {
                                  return Container(
                                    color: Colors.white,
                                    child: const Icon(
                                      Icons.person,
                                      size: 60,
                                      color: Color(0xFF0F2A1D),
                                    ),
                                  );
                                },
                              )
                                  : Container(
                                color: Colors.white,
                                child: const Icon(
                                  Icons.person,
                                  size: 60,
                                  color: Color(0xFF0F2A1D),
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(height: 20),
                          Text(
                            profile.name,
                            style: const TextStyle(
                              fontSize: 28,
                              fontWeight: FontWeight.w800,
                              color: Colors.white,
                              fontFamily: 'Poppins',
                            ),
                          ),
                          const SizedBox(height: 5),
                          Text(
                            profile.email,
                            style: const TextStyle(
                              fontSize: 16,
                              color: Colors.white70,
                              fontFamily: 'Poppins',
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          const SizedBox(height: 20),
                          ElevatedButton(
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => editprofilesub(
                                    id: profile.id,
                                    name: profile.name,
                                    email: profile.email,
                                    phone: profile.phone,
                                    housename: profile.housename,
                                    post: profile.post,
                                    pin: profile.pin,
                                    place: profile.place,
                                    latitude: profile.latitude,
                                    longitude: profile.longitude,
                                  ),
                                ),
                              ).then((_) => setState(() {})); // refresh after edit
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.white,
                              foregroundColor: const Color(0xFF0F2A1D),
                              padding: const EdgeInsets.symmetric(
                                horizontal: 30,
                                vertical: 12,
                              ),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(30),
                              ),
                              elevation: 4,
                            ),
                            child: const Text(
                              'Edit Profile',
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w800,
                                fontFamily: 'Poppins',
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),

                  // Personal Information Card
                  Card(
                    elevation: 5,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Row(
                            children: [
                              Icon(Icons.person_outline,
                                  color: Color(0xFF0F2A1D), size: 20),
                              SizedBox(width: 10),
                              Text(
                                'Personal Information',
                                style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.w800,
                                  color: Color(0xFF0F2A1D),
                                  fontFamily: 'Poppins',
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 20),
                          _buildInfoRow('Name', profile.name),
                          _buildInfoRow('Email', profile.email),
                          _buildInfoRow('Phone', profile.phone),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 15),

                  // Address Information Card
                  Card(
                    elevation: 5,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Row(
                            children: [
                              Icon(Icons.home_outlined,
                                  color: Color(0xFF0F2A1D), size: 20),
                              SizedBox(width: 10),
                              Text(
                                'Address Information',
                                style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.w800,
                                  color: Color(0xFF0F2A1D),
                                  fontFamily: 'Poppins',
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 20),
                          _buildInfoRow('House Name', profile.housename),
                          _buildInfoRow('Post', profile.post),
                          _buildInfoRow('Place', profile.place),
                          _buildInfoRow('PIN Code', profile.pin),
                          _buildInfoRow('Latitude', profile.latitude),
                          _buildInfoRow('Longitude', profile.longitude),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 15),

                  // Proof Document Card
                  Card(
                    elevation: 5,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Row(
                            children: [
                              Icon(Icons.verified_outlined,
                                  color: Color(0xFF0F2A1D), size: 20),
                              SizedBox(width: 10),
                              Text(
                                'Proof Document',
                                style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.w800,
                                  color: Color(0xFF0F2A1D),
                                  fontFamily: 'Poppins',
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 20),
                          Center(
                            child: Container(
                              width: double.infinity,
                              height: 250,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color:
                                const Color(0xFFE3EED4).withOpacity(0.3),
                                border: Border.all(
                                  color: const Color(0xFF0F2A1D)
                                      .withOpacity(0.2),
                                ),
                              ),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(10),
                                child: profile.proof.isNotEmpty
                                    ? Image.network(
                                  profile.proof,
                                  fit: BoxFit.cover,
                                  loadingBuilder:
                                      (context, child, progress) {
                                    if (progress == null) return child;
                                    return const Center(
                                      child: CircularProgressIndicator(
                                        color: Color(0xFF0F2A1D),
                                      ),
                                    );
                                  },
                                  errorBuilder: (context, error, stack) {
                                    return _buildDocumentPlaceholder();
                                  },
                                )
                                    : _buildDocumentPlaceholder(),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }

  Widget _buildInfoRow(String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: 100,
            child: Text(
              label,
              style: TextStyle(
                fontWeight: FontWeight.w700,
                color: const Color(0xFF0F2A1D).withOpacity(0.8),
                fontSize: 14,
                fontFamily: 'Poppins',
              ),
            ),
          ),
          const SizedBox(width: 10),
          Expanded(
            child: Text(
              value.isNotEmpty ? value : 'Not provided',
              style: const TextStyle(
                fontSize: 14,
                color: Color(0xFF0F2A1D),
                fontWeight: FontWeight.w600,
                fontFamily: 'Poppins',
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildDocumentPlaceholder() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.document_scanner,
            size: 60,
            color: const Color(0xFF0F2A1D).withOpacity(0.3),
          ),
          const SizedBox(height: 10),
          Text(
            'Proof Document',
            style: TextStyle(
              color: const Color(0xFF0F2A1D).withOpacity(0.5),
              fontFamily: 'Poppins',
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }
}

class UserProfile {
  final String id;
  final String name;
  final String email;
  final String phone;
  final String proof;
  final String housename;
  final String post;
  final String pin;
  final String place;
  final String latitude;
  final String longitude;
  final String photo;

  UserProfile({
    required this.id,
    required this.name,
    required this.email,
    required this.phone,
    required this.proof,
    required this.housename,
    required this.post,
    required this.pin,
    required this.place,
    required this.latitude,
    required this.longitude,
    required this.photo,
  });
}