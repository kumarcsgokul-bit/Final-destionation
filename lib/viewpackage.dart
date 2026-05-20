// // // import 'dart:convert';
// // //
// // // import 'package:final_destination/booking.dart';
// // // import 'package:final_destination/view_extradetails.dart';
// // // import 'package:flutter/material.dart';
// // // import 'package:http/http.dart' as http;
// // // import 'package:shared_preferences/shared_preferences.dart';
// // //
// // // void main(){
// // //   runApp(viewpackage());
// // //
// // // }
// // // class viewpackage extends StatelessWidget {
// // //   const viewpackage({Key? key}) : super(key: key);
// // //
// // //   @override
// // //   Widget build(BuildContext context) {
// // //     return MaterialApp(home: viewpackagesub(),);
// // //   }
// // // }
// // // class viewpackagesub extends StatefulWidget {
// // //   const viewpackagesub({Key? key}) : super(key: key);
// // //
// // //   @override
// // //   State<viewpackagesub> createState() => _viewpackagesubState();
// // // }
// // //
// // // class _viewpackagesubState extends State<viewpackagesub> {
// // //   Future<List<Joke>> _getJokes() async {
// // //     SharedPreferences prefs = await SharedPreferences.getInstance();
// // //     String b = prefs.getString("lid").toString();
// // //     String foodimage="";
// // //     var data =
// // //     await http.post(Uri.parse(prefs.getString("ip").toString()+"/userviewpackage"),
// // //         body: {"id":b}
// // //     );
// // //
// // //     var jsonData = json.decode(data.body);
// // // //    print(jsonData);
// // //     List<Joke> jokes = [];
// // //     for (var joke in jsonData["message"]) {
// // //       print(joke);
// // //       Joke newJoke = Joke(
// // //         joke["id"].toString(),
// // //         joke["title"].toString(),
// // //         joke["category"].toString(),
// // //         joke["name"].toString(),
// // //         joke["package_details"],
// // //         joke["amount"].toString(),
// // //         prefs.getString('ip').toString()+joke["a"].toString(),
// // //         prefs.getString('ip').toString()+joke["photo2"].toString(),
// // //         prefs.getString('ip').toString()+joke["photo3"].toString(),
// // //
// // //       );
// // //       jokes.add(newJoke);
// // //     }
// // //     return jokes;
// // //   }
// // //
// // //   @override
// // //   Widget build(BuildContext context) {
// // //     return Scaffold(body:
// // //     Container(
// // //
// // //       child:
// // //       FutureBuilder(
// // //         future: _getJokes(),
// // //         builder: (BuildContext context, AsyncSnapshot snapshot) {
// // // //              print("snapshot"+snapshot.toString());
// // //           if (snapshot.data == null) {
// // //             return Container(
// // //               child: Center(
// // //                 child: Text("Loading..."),
// // //               ),
// // //             );
// // //           } else {
// // //             return ListView.builder(
// // //               itemCount: snapshot.data.length,
// // //               itemBuilder: (BuildContext context, int index) {
// // //                 var i = snapshot.data![index];
// // //                 return Padding(
// // //                   padding: const EdgeInsets.all(8.0),
// // //                   child: Card(
// // //                     elevation: 3,
// // //                     shape: RoundedRectangleBorder(
// // //                       borderRadius: BorderRadius.circular(10),
// // //                       side: BorderSide(color: Colors.grey.shade300),
// // //                     ),
// // //                     child: Padding(
// // //                       padding: const EdgeInsets.all(16.0),
// // //                       child: Column(
// // //                         crossAxisAlignment: CrossAxisAlignment.start,
// // //                         children: [
// // //
// // //                           SizedBox(height: 10),
// // //
// // //                           _buildRow("title:", i.title.toString()),
// // //                           _buildRow("category", i.category.toString()),
// // //                           _buildRow("name:", i.name.toString()),
// // //                           _buildRow("package_details:", i.package_details.toString()),
// // //                           _buildRow("amount:", i.amount.toString()),
// // //                           Image.network(i.photo1.toString(),height: 200,width: 200,),
// // //                           Image.network(i.photo2.toString(),height: 200,width: 200,),
// // //                           Image.network(i.photo3.toString(),height: 200,width: 200,),
// // //                           Row(children: [
// // //                             ElevatedButton(onPressed: () async {
// // //                               SharedPreferences sh=await SharedPreferences.getInstance();
// // //                               sh.setString('ownid', i.id.toString());
// // //                               Navigator.push(context, MaterialPageRoute(builder: (context)=>booking()));
// // //                             }, child: Text('Book')),
// // //                             ElevatedButton(onPressed: () async {
// // //                               SharedPreferences sh=await SharedPreferences.getInstance();
// // //                               sh.setString('oid', i.id.toString());
// // //                               Navigator.push(context, MaterialPageRoute(builder: (context)=>view_extradetails()));
// // //                             }, child: Text('Extra details')),
// // //                           ],)
// // //
// // //                         ],
// // //                       ),
// // //                     ),
// // //                   ),
// // //                 );
// // //               },
// // //             );
// // //
// // //
// // //           }
// // //         },
// // //
// // //
// // //       ),
// // //
// // //
// // //
// // //
// // //
// // //     ),
// // //     );
// // //   }
// // //   Widget _buildRow(String label, String value) {
// // //     return Padding(
// // //       padding: const EdgeInsets.symmetric(vertical: 4),
// // //       child: Row(
// // //         children: [
// // //           SizedBox(
// // //             width: 100,
// // //             child: Text(
// // //               label,
// // //               style: TextStyle(
// // //                 fontWeight: FontWeight.bold,
// // //               ),
// // //             ),
// // //           ),
// // //           SizedBox(width: 5),
// // //           Flexible(
// // //             child: Text(
// // //               value,
// // //               style: TextStyle(
// // //                 color: Colors.grey.shade800,
// // //               ),
// // //             ),
// // //           ),
// // //         ],
// // //       ),
// // //     );
// // //   }
// // //
// // // }
// // // class Joke {
// // //   final String id;
// // //   final String title;
// // //   final String category;
// // //   final String name;
// // //   final String package_details;
// // //   final String amount;
// // //   final String photo1;
// // //   final String photo2;
// // //   final String photo3;
// // //
// // //
// // //
// // //   Joke(this.id,this.title,this.category,this.name,this.package_details, this.amount,this.photo1,this.photo2,this.photo3);
// // // //  print("hiiiii");
// // // }
// // //
// // //
// //
// // //
// // // //
// // // // import 'dart:convert';
// // // // import 'package:final_destination/booking.dart';
// // // // import 'package:final_destination/view_extradetails.dart';
// // // // import 'package:final_destination/home.dart';
// // // // import 'package:flutter/material.dart';
// // // // import 'package:http/http.dart' as http;
// // // // import 'package:shared_preferences/shared_preferences.dart';
// // // //
// // // // void main() {
// // // //   runApp(viewpackage());
// // // // }
// // // //
// // // // class viewpackage extends StatelessWidget {
// // // //   const viewpackage({Key? key}) : super(key: key);
// // // //
// // // //   @override
// // // //   Widget build(BuildContext context) {
// // // //     return MaterialApp(
// // // //       debugShowCheckedModeBanner: false,
// // // //       theme: ThemeData(
// // // //         primaryColor: const Color(0xFF0F2A1D),
// // // //         scaffoldBackgroundColor: const Color(0xFFE3EED4),
// // // //         fontFamily: 'Poppins',
// // // //       ),
// // // //       home: viewpackagesub(),
// // // //     );
// // // //   }
// // // // }
// // // //
// // // // class viewpackagesub extends StatefulWidget {
// // // //   const viewpackagesub({Key? key}) : super(key: key);
// // // //
// // // //   @override
// // // //   State<viewpackagesub> createState() => _viewpackagesubState();
// // // // }
// // // //
// // // // class _viewpackagesubState extends State<viewpackagesub> {
// // // //   Future<List<Joke>> _getJokes() async {
// // // //     SharedPreferences prefs = await SharedPreferences.getInstance();
// // // //     String b = prefs.getString("lid").toString();
// // // //     String foodimage = "";
// // // //     var data = await http.post(
// // // //       Uri.parse(prefs.getString("ip").toString() + "/userviewpackage"),
// // // //       body: {"id": b},
// // // //     );
// // // //
// // // //     var jsonData = json.decode(data.body);
// // // //     List<Joke> jokes = [];
// // // //     for (var joke in jsonData["message"]) {
// // // //       print(joke);
// // // //       Joke newJoke = Joke(
// // // //         joke["id"].toString(),
// // // //         joke["title"].toString(),
// // // //         joke["category"].toString(),
// // // //         joke["name"].toString(),
// // // //         joke["package_details"],
// // // //         joke["amount"].toString(),
// // // //         prefs.getString('ip').toString() + joke["photo1"].toString(),
// // // //         prefs.getString('ip').toString() + joke["photo2"].toString(),
// // // //         prefs.getString('ip').toString() + joke["photo3"].toString(),
// // // //       );
// // // //       jokes.add(newJoke);
// // // //     }
// // // //     return jokes;
// // // //   }
// // // //
// // // //   @override
// // // //   Widget build(BuildContext context) {
// // // //     return Scaffold(
// // // //       backgroundColor: const Color(0xFFE3EED4),
// // // //       appBar: AppBar(
// // // //         backgroundColor: Colors.white,
// // // //         elevation: 2,
// // // //         title: Text(
// // // //           'Travel Packages',
// // // //           style: const TextStyle(
// // // //             fontSize: 24,
// // // //             fontWeight: FontWeight.w800,
// // // //             color: Color(0xFF0F2A1D),
// // // //             fontFamily: 'Poppins',
// // // //             letterSpacing: 1,
// // // //           ),
// // // //         ),
// // // //         centerTitle: true,
// // // //         leading: IconButton(
// // // //           icon: const Icon(Icons.arrow_back_ios, color: Color(0xFF0F2A1D), size: 22),
// // // //           onPressed: () => Navigator.push(
// // // //             context,
// // // //             MaterialPageRoute(builder: (context) => UserHomeApp()),
// // // //           ),
// // // //         ),
// // // //       ),
// // // //       body: Container(
// // // //         child: FutureBuilder(
// // // //           future: _getJokes(),
// // // //           builder: (BuildContext context, AsyncSnapshot snapshot) {
// // // //             if (snapshot.data == null) {
// // // //               return Center(
// // // //                 child: Column(
// // // //                   mainAxisAlignment: MainAxisAlignment.center,
// // // //                   children: [
// // // //                     CircularProgressIndicator(
// // // //                       color: const Color(0xFF0F2A1D),
// // // //                     ),
// // // //                     const SizedBox(height: 20),
// // // //                     Text(
// // // //                       "Loading packages...",
// // // //                       style: TextStyle(
// // // //                         color: const Color(0xFF0F2A1D),
// // // //                         fontSize: 16,
// // // //                         fontFamily: 'Poppins',
// // // //                         fontWeight: FontWeight.w500,
// // // //                       ),
// // // //                     ),
// // // //                   ],
// // // //                 ),
// // // //               );
// // // //             } else if (snapshot.data.length == 0) {
// // // //               return Center(
// // // //                 child: Column(
// // // //                   mainAxisAlignment: MainAxisAlignment.center,
// // // //                   children: [
// // // //                     Icon(
// // // //                       Icons.card_travel_outlined,
// // // //                       size: 100,
// // // //                       color: const Color(0xFF0F2A1D).withOpacity(0.3),
// // // //                     ),
// // // //                     const SizedBox(height: 20),
// // // //                     Text(
// // // //                       'No packages available',
// // // //                       style: const TextStyle(
// // // //                         fontSize: 20,
// // // //                         fontWeight: FontWeight.w800,
// // // //                         color: Color(0xFF0F2A1D),
// // // //                         fontFamily: 'Poppins',
// // // //                       ),
// // // //                     ),
// // // //                     const SizedBox(height: 10),
// // // //                     Text(
// // // //                       'Check back later for exciting travel packages',
// // // //                       style: TextStyle(
// // // //                         fontSize: 14,
// // // //                         color: const Color(0xFF0F2A1D).withOpacity(0.6),
// // // //                         fontFamily: 'Poppins',
// // // //                         fontWeight: FontWeight.w500,
// // // //                       ),
// // // //                     ),
// // // //                   ],
// // // //                 ),
// // // //               );
// // // //             } else {
// // // //               return ListView.builder(
// // // //                 padding: const EdgeInsets.all(16),
// // // //                 itemCount: snapshot.data.length,
// // // //                 itemBuilder: (BuildContext context, int index) {
// // // //                   var i = snapshot.data![index];
// // // //                   return Padding(
// // // //                     padding: const EdgeInsets.only(bottom: 16),
// // // //                     child: Card(
// // // //                       elevation: 4,
// // // //                       shape: RoundedRectangleBorder(
// // // //                         borderRadius: BorderRadius.circular(20),
// // // //                       ),
// // // //                       child: Column(
// // // //                         crossAxisAlignment: CrossAxisAlignment.start,
// // // //                         children: [
// // // //                           // Header with gradient
// // // //                           Container(
// // // //                             decoration: const BoxDecoration(
// // // //                               gradient: LinearGradient(
// // // //                                 colors: [Color(0xFF0F2A1D), Color(0xFF1A3F2B)],
// // // //                                 begin: Alignment.topLeft,
// // // //                                 end: Alignment.bottomRight,
// // // //                               ),
// // // //                               borderRadius: BorderRadius.only(
// // // //                                 topLeft: Radius.circular(20),
// // // //                                 topRight: Radius.circular(20),
// // // //                               ),
// // // //                             ),
// // // //                             padding: const EdgeInsets.all(16),
// // // //                             child: Row(
// // // //                               children: [
// // // //                                 Container(
// // // //                                   padding: const EdgeInsets.all(8),
// // // //                                   decoration: BoxDecoration(
// // // //                                     color: Colors.white.withOpacity(0.2),
// // // //                                     borderRadius: BorderRadius.circular(10),
// // // //                                   ),
// // // //                                   child: const Icon(
// // // //                                     Icons.card_travel,
// // // //                                     color: Colors.white,
// // // //                                     size: 20,
// // // //                                   ),
// // // //                                 ),
// // // //                                 const SizedBox(width: 12),
// // // //                                 Expanded(
// // // //                                   child: Text(
// // // //                                     i.title.toString(),
// // // //                                     style: const TextStyle(
// // // //                                       color: Colors.white,
// // // //                                       fontSize: 20,
// // // //                                       fontWeight: FontWeight.w800,
// // // //                                       fontFamily: 'Poppins',
// // // //                                     ),
// // // //                                   ),
// // // //                                 ),
// // // //                               ],
// // // //                             ),
// // // //                           ),
// // // //
// // // //                           Padding(
// // // //                             padding: const EdgeInsets.all(16),
// // // //                             child: Column(
// // // //                               crossAxisAlignment: CrossAxisAlignment.start,
// // // //                               children: [
// // // //                                 // Company Name Badge
// // // //                                 Container(
// // // //                                   padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
// // // //                                   decoration: BoxDecoration(
// // // //                                     color: const Color(0xFF0F2A1D).withOpacity(0.1),
// // // //                                     borderRadius: BorderRadius.circular(10),
// // // //                                   ),
// // // //                                   child: Row(
// // // //                                     mainAxisSize: MainAxisSize.min,
// // // //                                     children: [
// // // //                                       const Icon(
// // // //                                         Icons.business,
// // // //                                         size: 16,
// // // //                                         color: Color(0xFF0F2A1D),
// // // //                                       ),
// // // //                                       const SizedBox(width: 8),
// // // //                                       Text(
// // // //                                         i.name.toString(),
// // // //                                         style: const TextStyle(
// // // //                                           fontSize: 14,
// // // //                                           fontWeight: FontWeight.w700,
// // // //                                           color: Color(0xFF0F2A1D),
// // // //                                           fontFamily: 'Poppins',
// // // //                                         ),
// // // //                                       ),
// // // //                                     ],
// // // //                                   ),
// // // //                                 ),
// // // //
// // // //                                 const SizedBox(height: 16),
// // // //
// // // //                                 // Category
// // // //                                 _buildInfoRow(Icons.category, 'Category', i.category.toString()),
// // // //
// // // //                                 const SizedBox(height: 12),
// // // //
// // // //                                 // Amount with premium styling
// // // //                                 Container(
// // // //                                   padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
// // // //                                   decoration: BoxDecoration(
// // // //                                     color: const Color(0xFF0F2A1D).withOpacity(0.05),
// // // //                                     borderRadius: BorderRadius.circular(10),
// // // //                                     border: Border.all(
// // // //                                       color: const Color(0xFF0F2A1D).withOpacity(0.2),
// // // //                                     ),
// // // //                                   ),
// // // //                                   child: Row(
// // // //                                     mainAxisSize: MainAxisSize.min,
// // // //                                     children: [
// // // //                                       const Icon(
// // // //                                         Icons.currency_rupee,
// // // //                                         size: 18,
// // // //                                         color: Color(0xFF0F2A1D),
// // // //                                       ),
// // // //                                       const SizedBox(width: 4),
// // // //                                       Text(
// // // //                                         i.amount.toString(),
// // // //                                         style: const TextStyle(
// // // //                                           fontSize: 18,
// // // //                                           fontWeight: FontWeight.w800,
// // // //                                           color: Color(0xFF0F2A1D),
// // // //                                           fontFamily: 'Poppins',
// // // //                                         ),
// // // //                                       ),
// // // //                                       const Text(
// // // //                                         ' per person',
// // // //                                         style: TextStyle(
// // // //                                           fontSize: 12,
// // // //                                           color: Color(0xFF0F2A1D),
// // // //                                           fontWeight: FontWeight.w500,
// // // //                                         ),
// // // //                                       ),
// // // //                                     ],
// // // //                                   ),
// // // //                                 ),
// // // //
// // // //                                 const SizedBox(height: 16),
// // // //
// // // //                                 // Package Details
// // // //                                 Container(
// // // //                                   padding: const EdgeInsets.all(12),
// // // //                                   decoration: BoxDecoration(
// // // //                                     color: const Color(0xFFE3EED4).withOpacity(0.3),
// // // //                                     borderRadius: BorderRadius.circular(15),
// // // //                                     border: Border.all(
// // // //                                       color: const Color(0xFF0F2A1D).withOpacity(0.1),
// // // //                                     ),
// // // //                                   ),
// // // //                                   child: Column(
// // // //                                     crossAxisAlignment: CrossAxisAlignment.start,
// // // //                                     children: [
// // // //                                       const Text(
// // // //                                         'Package Details',
// // // //                                         style: TextStyle(
// // // //                                           fontSize: 16,
// // // //                                           fontWeight: FontWeight.w800,
// // // //                                           color: Color(0xFF0F2A1D),
// // // //                                           fontFamily: 'Poppins',
// // // //                                         ),
// // // //                                       ),
// // // //                                       const SizedBox(height: 8),
// // // //                                       Text(
// // // //                                         i.package_details.toString(),
// // // //                                         style: TextStyle(
// // // //                                           fontSize: 14,
// // // //                                           color: const Color(0xFF0F2A1D).withOpacity(0.8),
// // // //                                           fontFamily: 'Poppins',
// // // //                                           fontWeight: FontWeight.w500,
// // // //                                           height: 1.5,
// // // //                                         ),
// // // //                                       ),
// // // //                                     ],
// // // //                                   ),
// // // //                                 ),
// // // //
// // // //                                 const SizedBox(height: 16),
// // // //
// // // //                                 // Photo Gallery Title
// // // //                                 const Text(
// // // //                                   'Gallery',
// // // //                                   style: TextStyle(
// // // //                                     fontSize: 16,
// // // //                                     fontWeight: FontWeight.w800,
// // // //                                     color: Color(0xFF0F2A1D),
// // // //                                     fontFamily: 'Poppins',
// // // //                                   ),
// // // //                                 ),
// // // //
// // // //                                 const SizedBox(height: 12),
// // // //
// // // //                                 // Photo Gallery - Horizontal Scroll
// // // //                                 SingleChildScrollView(
// // // //                                   scrollDirection: Axis.horizontal,
// // // //                                   child: Row(
// // // //                                     children: [
// // // //                                       _buildGalleryImage(i.photo1.toString()),
// // // //                                       const SizedBox(width: 12),
// // // //                                       _buildGalleryImage(i.photo2.toString()),
// // // //                                       const SizedBox(width: 12),
// // // //                                       _buildGalleryImage(i.photo3.toString()),
// // // //                                     ],
// // // //                                   ),
// // // //                                 ),
// // // //
// // // //                                 const SizedBox(height: 20),
// // // //
// // // //                                 // Action Buttons
// // // //                                 Row(
// // // //                                   children: [
// // // //                                     Expanded(
// // // //                                       child: ElevatedButton(
// // // //                                         onPressed: () async {
// // // //                                           SharedPreferences sh = await SharedPreferences.getInstance();
// // // //                                           sh.setString('ownid', i.id.toString());
// // // //                                           Navigator.push(
// // // //                                             context,
// // // //                                             MaterialPageRoute(builder: (context) => booking()),
// // // //                                           );
// // // //                                         },
// // // //                                         style: ElevatedButton.styleFrom(
// // // //                                           backgroundColor: const Color(0xFF0F2A1D),
// // // //                                           foregroundColor: Colors.white,
// // // //                                           padding: const EdgeInsets.symmetric(vertical: 14),
// // // //                                           shape: RoundedRectangleBorder(
// // // //                                             borderRadius: BorderRadius.circular(12),
// // // //                                           ),
// // // //                                           elevation: 4,
// // // //                                         ),
// // // //                                         child: Row(
// // // //                                           mainAxisAlignment: MainAxisAlignment.center,
// // // //                                           children: const [
// // // //                                             Icon(Icons.book_online, size: 18),
// // // //                                             SizedBox(width: 8),
// // // //                                             Text(
// // // //                                               'BOOK NOW',
// // // //                                               style: TextStyle(
// // // //                                                 fontSize: 14,
// // // //                                                 fontWeight: FontWeight.w800,
// // // //                                                 fontFamily: 'Poppins',
// // // //                                               ),
// // // //                                             ),
// // // //                                           ],
// // // //                                         ),
// // // //                                       ),
// // // //                                     ),
// // // //                                     const SizedBox(width: 12),
// // // //                                     Expanded(
// // // //                                       child: OutlinedButton(
// // // //                                         onPressed: () async {
// // // //                                           SharedPreferences sh = await SharedPreferences.getInstance();
// // // //                                           sh.setString('oid', i.id.toString());
// // // //                                           Navigator.push(
// // // //                                             context,
// // // //                                             MaterialPageRoute(builder: (context) => view_extradetails()),
// // // //                                           );
// // // //                                         },
// // // //                                         style: OutlinedButton.styleFrom(
// // // //                                           side: const BorderSide(color: Color(0xFF0F2A1D), width: 1.5),
// // // //                                           foregroundColor: const Color(0xFF0F2A1D),
// // // //                                           padding: const EdgeInsets.symmetric(vertical: 14),
// // // //                                           shape: RoundedRectangleBorder(
// // // //                                             borderRadius: BorderRadius.circular(12),
// // // //                                           ),
// // // //                                         ),
// // // //                                         child: Row(
// // // //                                           mainAxisAlignment: MainAxisAlignment.center,
// // // //                                           children: const [
// // // //                                             Icon(Icons.info_outline, size: 18),
// // // //                                             SizedBox(width: 8),
// // // //                                             Text(
// // // //                                               'DETAILS',
// // // //                                               style: TextStyle(
// // // //                                                 fontSize: 14,
// // // //                                                 fontWeight: FontWeight.w800,
// // // //                                                 fontFamily: 'Poppins',
// // // //                                               ),
// // // //                                             ),
// // // //                                           ],
// // // //                                         ),
// // // //                                       ),
// // // //                                     ),
// // // //                                   ],
// // // //                                 ),
// // // //                               ],
// // // //                             ),
// // // //                           ),
// // // //                         ],
// // // //                       ),
// // // //                     ),
// // // //                   );
// // // //                 },
// // // //               );
// // // //             }
// // // //           },
// // // //         ),
// // // //       ),
// // // //     );
// // // //   }
// // // //
// // // //   Widget _buildInfoRow(IconData icon, String label, String value) {
// // // //     return Row(
// // // //       crossAxisAlignment: CrossAxisAlignment.start,
// // // //       children: [
// // // //         Icon(
// // // //           icon,
// // // //           size: 18,
// // // //           color: const Color(0xFF0F2A1D).withOpacity(0.7),
// // // //         ),
// // // //         const SizedBox(width: 12),
// // // //         SizedBox(
// // // //           width: 80,
// // // //           child: Text(
// // // //             label,
// // // //             style: TextStyle(
// // // //               fontWeight: FontWeight.w700,
// // // //               color: const Color(0xFF0F2A1D).withOpacity(0.8),
// // // //               fontSize: 14,
// // // //               fontFamily: 'Poppins',
// // // //             ),
// // // //           ),
// // // //         ),
// // // //         const Text(
// // // //           ':',
// // // //           style: TextStyle(
// // // //             color: Color(0xFF0F2A1D),
// // // //             fontWeight: FontWeight.w700,
// // // //           ),
// // // //         ),
// // // //         const SizedBox(width: 12),
// // // //         Expanded(
// // // //           child: Text(
// // // //             value,
// // // //             style: const TextStyle(
// // // //               fontSize: 14,
// // // //               color: Color(0xFF0F2A1D),
// // // //               fontWeight: FontWeight.w600,
// // // //               fontFamily: 'Poppins',
// // // //             ),
// // // //             softWrap: true,
// // // //           ),
// // // //         ),
// // // //       ],
// // // //     );
// // // //   }
// // // //
// // // //   Widget _buildGalleryImage(String imageUrl) {
// // // //     return Container(
// // // //       width: 150,
// // // //       height: 120,
// // // //       decoration: BoxDecoration(
// // // //         borderRadius: BorderRadius.circular(15),
// // // //         boxShadow: [
// // // //           BoxShadow(
// // // //             color: const Color(0xFF0F2A1D).withOpacity(0.2),
// // // //             blurRadius: 8,
// // // //             offset: const Offset(0, 4),
// // // //           ),
// // // //         ],
// // // //       ),
// // // //       child: ClipRRect(
// // // //         borderRadius: BorderRadius.circular(15),
// // // //         child: Image.network(
// // // //           imageUrl,
// // // //           fit: BoxFit.cover,
// // // //           loadingBuilder: (BuildContext context, Widget child, ImageChunkEvent? loadingProgress) {
// // // //             if (loadingProgress == null) return child;
// // // //             return Container(
// // // //               color: const Color(0xFFE3EED4).withOpacity(0.3),
// // // //               child: Center(
// // // //                 child: CircularProgressIndicator(
// // // //                   value: loadingProgress.expectedTotalBytes != null
// // // //                       ? loadingProgress.cumulativeBytesLoaded / loadingProgress.expectedTotalBytes!
// // // //                       : null,
// // // //                   color: const Color(0xFF0F2A1D),
// // // //                 ),
// // // //               ),
// // // //             );
// // // //           },
// // // //           errorBuilder: (BuildContext context, Object error, StackTrace? stackTrace) {
// // // //             return Container(
// // // //               color: const Color(0xFFE3EED4).withOpacity(0.3),
// // // //               child: Center(
// // // //                 child: Icon(
// // // //                   Icons.broken_image,
// // // //                   size: 40,
// // // //                   color: const Color(0xFF0F2A1D).withOpacity(0.3),
// // // //                 ),
// // // //               ),
// // // //             );
// // // //           },
// // // //         ),
// // // //       ),
// // // //     );
// // // //   }
// // // // }
// // // //
// // // // class Joke {
// // // //   final String id;
// // // //   final String title;
// // // //   final String category;
// // // //   final String name;
// // // //   final String package_details;
// // // //   final String amount;
// // // //   final String photo1;
// // // //   final String photo2;
// // // //   final String photo3;
// // // //
// // // //   Joke(this.id, this.title, this.category, this.name, this.package_details, this.amount, this.photo1, this.photo2, this.photo3);
// // // // }
// // //
// // // //
// // // // import 'dart:convert';
// // // // import 'package:final_destination/booking.dart';
// // // // import 'package:final_destination/view_extradetails.dart';
// // // // import 'package:final_destination/home.dart';
// // // // import 'package:flutter/material.dart';
// // // // import 'package:http/http.dart' as http;
// // // // import 'package:shared_preferences/shared_preferences.dart';
// // // //
// // // // void main() {
// // // //   runApp(viewpackage());
// // // // }
// // // //
// // // // class viewpackage extends StatelessWidget {
// // // //   const viewpackage({Key? key}) : super(key: key);
// // // //
// // // //   @override
// // // //   Widget build(BuildContext context) {
// // // //     return MaterialApp(
// // // //       debugShowCheckedModeBanner: false,
// // // //       theme: ThemeData(
// // // //         primaryColor: const Color(0xFF0F2A1D),
// // // //         scaffoldBackgroundColor: const Color(0xFFE3EED4),
// // // //         fontFamily: 'Poppins',
// // // //       ),
// // // //       home: viewpackagesub(),
// // // //     );
// // // //   }
// // // // }
// // // //
// // // // class viewpackagesub extends StatefulWidget {
// // // //   const viewpackagesub({Key? key}) : super(key: key);
// // // //
// // // //   @override
// // // //   State<viewpackagesub> createState() => _viewpackagesubState();
// // // // }
// // // //
// // // // class _viewpackagesubState extends State<viewpackagesub> {
// // // //   // Map to track expanded state for each package
// // // //   Map<int, bool> _expandedStates = {};
// // // //
// // // //   Future<List<Joke>> _getJokes() async {
// // // //     SharedPreferences prefs = await SharedPreferences.getInstance();
// // // //     String b = prefs.getString("lid").toString();
// // // //     String foodimage = "";
// // // //     var data = await http.post(
// // // //       Uri.parse(prefs.getString("ip").toString() + "/userviewpackage"),
// // // //       body: {"id": b},
// // // //     );
// // // //
// // // //     var jsonData = json.decode(data.body);
// // // //     List<Joke> jokes = [];
// // // //     for (var joke in jsonData["message"]) {
// // // //       print(joke);
// // // //       Joke newJoke = Joke(
// // // //         joke["id"].toString(),
// // // //         joke["title"].toString(),
// // // //         joke["category"].toString(),
// // // //         joke["name"].toString(),
// // // //         joke["package_details"],
// // // //         joke["amount"].toString(),
// // // //         prefs.getString('ip').toString() + joke["photo1"].toString(),
// // // //         prefs.getString('ip').toString() + joke["photo2"].toString(),
// // // //         prefs.getString('ip').toString() + joke["photo3"].toString(),
// // // //       );
// // // //       jokes.add(newJoke);
// // // //     }
// // // //     return jokes;
// // // //   }
// // // //
// // // //   void _toggleExpand(int index) {
// // // //     setState(() {
// // // //       _expandedStates[index] = !(_expandedStates[index] ?? false);
// // // //     });
// // // //   }
// // // //
// // // //   @override
// // // //   Widget build(BuildContext context) {
// // // //     return Scaffold(
// // // //       backgroundColor: const Color(0xFFE3EED4),
// // // //       appBar: AppBar(
// // // //         backgroundColor: Colors.white,
// // // //         elevation: 2,
// // // //         title: Text(
// // // //           'Travel Packages',
// // // //           style: const TextStyle(
// // // //             fontSize: 24,
// // // //             fontWeight: FontWeight.w800,
// // // //             color: Color(0xFF0F2A1D),
// // // //             fontFamily: 'Poppins',
// // // //             letterSpacing: 1,
// // // //           ),
// // // //         ),
// // // //         centerTitle: true,
// // // //         leading: IconButton(
// // // //           icon: const Icon(Icons.arrow_back_ios, color: Color(0xFF0F2A1D), size: 22),
// // // //           onPressed: () => Navigator.push(
// // // //             context,
// // // //             MaterialPageRoute(builder: (context) => UserHomeApp()),
// // // //           ),
// // // //         ),
// // // //       ),
// // // //       body: Container(
// // // //         child: FutureBuilder(
// // // //           future: _getJokes(),
// // // //           builder: (BuildContext context, AsyncSnapshot snapshot) {
// // // //             if (snapshot.data == null) {
// // // //               return Center(
// // // //                 child: Column(
// // // //                   mainAxisAlignment: MainAxisAlignment.center,
// // // //                   children: [
// // // //                     CircularProgressIndicator(
// // // //                       color: const Color(0xFF0F2A1D),
// // // //                     ),
// // // //                     const SizedBox(height: 20),
// // // //                     Text(
// // // //                       "Loading packages...",
// // // //                       style: TextStyle(
// // // //                         color: const Color(0xFF0F2A1D),
// // // //                         fontSize: 16,
// // // //                         fontFamily: 'Poppins',
// // // //                         fontWeight: FontWeight.w600,
// // // //                       ),
// // // //                     ),
// // // //                   ],
// // // //                 ),
// // // //               );
// // // //             } else if (snapshot.data.length == 0) {
// // // //               return Center(
// // // //                 child: Column(
// // // //                   mainAxisAlignment: MainAxisAlignment.center,
// // // //                   children: [
// // // //                     Icon(
// // // //                       Icons.card_travel_outlined,
// // // //                       size: 100,
// // // //                       color: const Color(0xFF0F2A1D).withOpacity(0.3),
// // // //                     ),
// // // //                     const SizedBox(height: 20),
// // // //                     Text(
// // // //                       'No packages available',
// // // //                       style: const TextStyle(
// // // //                         fontSize: 20,
// // // //                         fontWeight: FontWeight.w800,
// // // //                         color: Color(0xFF0F2A1D),
// // // //                         fontFamily: 'Poppins',
// // // //                       ),
// // // //                     ),
// // // //                     const SizedBox(height: 10),
// // // //                     Text(
// // // //                       'Check back later for exciting travel packages',
// // // //                       style: TextStyle(
// // // //                         fontSize: 14,
// // // //                         color: const Color(0xFF0F2A1D).withOpacity(0.6),
// // // //                         fontFamily: 'Poppins',
// // // //                         fontWeight: FontWeight.w600,
// // // //                       ),
// // // //                     ),
// // // //                   ],
// // // //                 ),
// // // //               );
// // // //             } else {
// // // //               return ListView.builder(
// // // //                 padding: const EdgeInsets.all(16),
// // // //                 itemCount: snapshot.data.length,
// // // //                 itemBuilder: (BuildContext context, int index) {
// // // //                   var i = snapshot.data![index];
// // // //                   bool isExpanded = _expandedStates[index] ?? false;
// // // //                   bool isLongDescription = i.package_details.toString().length > 150;
// // // //
// // // //                   return Padding(
// // // //                     padding: const EdgeInsets.only(bottom: 16),
// // // //                     child: Card(
// // // //                       elevation: 4,
// // // //                       shape: RoundedRectangleBorder(
// // // //                         borderRadius: BorderRadius.circular(20),
// // // //                       ),
// // // //                       child: Column(
// // // //                         crossAxisAlignment: CrossAxisAlignment.start,
// // // //                         children: [
// // // //                           // Header with gradient
// // // //                           Container(
// // // //                             decoration: const BoxDecoration(
// // // //                               gradient: LinearGradient(
// // // //                                 colors: [Color(0xFF0F2A1D), Color(0xFF1A3F2B)],
// // // //                                 begin: Alignment.topLeft,
// // // //                                 end: Alignment.bottomRight,
// // // //                               ),
// // // //                               borderRadius: BorderRadius.only(
// // // //                                 topLeft: Radius.circular(20),
// // // //                                 topRight: Radius.circular(20),
// // // //                               ),
// // // //                             ),
// // // //                             padding: const EdgeInsets.all(16),
// // // //                             child: Row(
// // // //                               children: [
// // // //                                 Container(
// // // //                                   padding: const EdgeInsets.all(8),
// // // //                                   decoration: BoxDecoration(
// // // //                                     color: Colors.white.withOpacity(0.2),
// // // //                                     borderRadius: BorderRadius.circular(10),
// // // //                                   ),
// // // //                                   child: const Icon(
// // // //                                     Icons.card_travel,
// // // //                                     color: Colors.white,
// // // //                                     size: 20,
// // // //                                   ),
// // // //                                 ),
// // // //                                 const SizedBox(width: 12),
// // // //                                 Expanded(
// // // //                                   child: Text(
// // // //                                     i.title.toString(),
// // // //                                     style: const TextStyle(
// // // //                                       color: Colors.white,
// // // //                                       fontSize: 20,
// // // //                                       fontWeight: FontWeight.w800,
// // // //                                       fontFamily: 'Poppins',
// // // //                                     ),
// // // //                                   ),
// // // //                                 ),
// // // //                               ],
// // // //                             ),
// // // //                           ),
// // // //
// // // //                           Padding(
// // // //                             padding: const EdgeInsets.all(16),
// // // //                             child: Column(
// // // //                               crossAxisAlignment: CrossAxisAlignment.start,
// // // //                               children: [
// // // //                                 // Company Name Badge
// // // //                                 Container(
// // // //                                   padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
// // // //                                   decoration: BoxDecoration(
// // // //                                     color: const Color(0xFF0F2A1D).withOpacity(0.1),
// // // //                                     borderRadius: BorderRadius.circular(10),
// // // //                                   ),
// // // //                                   child: Row(
// // // //                                     mainAxisSize: MainAxisSize.min,
// // // //                                     children: [
// // // //                                       const Icon(
// // // //                                         Icons.business,
// // // //                                         size: 16,
// // // //                                         color: Color(0xFF0F2A1D),
// // // //                                       ),
// // // //                                       const SizedBox(width: 8),
// // // //                                       Text(
// // // //                                         i.name.toString(),
// // // //                                         style: const TextStyle(
// // // //                                           fontSize: 14,
// // // //                                           fontWeight: FontWeight.w800,
// // // //                                           color: Color(0xFF0F2A1D),
// // // //                                           fontFamily: 'Poppins',
// // // //                                         ),
// // // //                                       ),
// // // //                                     ],
// // // //                                   ),
// // // //                                 ),
// // // //
// // // //                                 const SizedBox(height: 16),
// // // //
// // // //                                 // Category
// // // //                                 _buildInfoRow(Icons.category, 'Category', i.category.toString()),
// // // //
// // // //                                 const SizedBox(height: 12),
// // // //
// // // //                                 // Amount with premium styling
// // // //                                 Container(
// // // //                                   padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
// // // //                                   decoration: BoxDecoration(
// // // //                                     gradient: LinearGradient(
// // // //                                       colors: [
// // // //                                         const Color(0xFF0F2A1D).withOpacity(0.1),
// // // //                                         const Color(0xFFE3EED4).withOpacity(0.5),
// // // //                                       ],
// // // //                                       begin: Alignment.topLeft,
// // // //                                       end: Alignment.bottomRight,
// // // //                                     ),
// // // //                                     borderRadius: BorderRadius.circular(15),
// // // //                                     border: Border.all(
// // // //                                       color: const Color(0xFF0F2A1D).withOpacity(0.3),
// // // //                                     ),
// // // //                                   ),
// // // //                                   child: Row(
// // // //                                     mainAxisSize: MainAxisSize.min,
// // // //                                     children: [
// // // //                                       const Icon(
// // // //                                         Icons.currency_rupee,
// // // //                                         size: 22,
// // // //                                         color: Color(0xFF0F2A1D),
// // // //                                       ),
// // // //                                       const SizedBox(width: 4),
// // // //                                       Text(
// // // //                                         i.amount.toString(),
// // // //                                         style: const TextStyle(
// // // //                                           fontSize: 24,
// // // //                                           fontWeight: FontWeight.w900,
// // // //                                           color: Color(0xFF0F2A1D),
// // // //                                           fontFamily: 'Poppins',
// // // //                                         ),
// // // //                                       ),
// // // //                                       const Text(
// // // //                                         ' / person',
// // // //                                         style: TextStyle(
// // // //                                           fontSize: 14,
// // // //                                           color: Color(0xFF0F2A1D),
// // // //                                           fontWeight: FontWeight.w600,
// // // //                                           fontFamily: 'Poppins',
// // // //                                         ),
// // // //                                       ),
// // // //                                     ],
// // // //                                   ),
// // // //                                 ),
// // // //
// // // //                                 const SizedBox(height: 20),
// // // //
// // // //                                 // Package Details Section - Enhanced Styling with Expandable Content
// // // //                                 Container(
// // // //                                   width: double.infinity,
// // // //                                   padding: const EdgeInsets.all(18),
// // // //                                   decoration: BoxDecoration(
// // // //                                     gradient: LinearGradient(
// // // //                                       begin: Alignment.topLeft,
// // // //                                       end: Alignment.bottomRight,
// // // //                                       colors: [
// // // //                                         const Color(0xFF0F2A1D).withOpacity(0.03),
// // // //                                         const Color(0xFFE3EED4).withOpacity(0.4),
// // // //                                       ],
// // // //                                     ),
// // // //                                     borderRadius: BorderRadius.circular(18),
// // // //                                     border: Border.all(
// // // //                                       color: const Color(0xFF0F2A1D).withOpacity(0.15),
// // // //                                       width: 1.5,
// // // //                                     ),
// // // //                                     boxShadow: [
// // // //                                       BoxShadow(
// // // //                                         color: const Color(0xFF0F2A1D).withOpacity(0.05),
// // // //                                         blurRadius: 10,
// // // //                                         offset: const Offset(0, 4),
// // // //                                       ),
// // // //                                     ],
// // // //                                   ),
// // // //                                   child: Column(
// // // //                                     crossAxisAlignment: CrossAxisAlignment.start,
// // // //                                     children: [
// // // //                                       // Title with icon
// // // //                                       Row(
// // // //                                         children: [
// // // //                                           Container(
// // // //                                             padding: const EdgeInsets.all(6),
// // // //                                             decoration: BoxDecoration(
// // // //                                               color: const Color(0xFF0F2A1D).withOpacity(0.1),
// // // //                                               borderRadius: BorderRadius.circular(8),
// // // //                                             ),
// // // //                                             child: const Icon(
// // // //                                               Icons.description_outlined,
// // // //                                               size: 18,
// // // //                                               color: Color(0xFF0F2A1D),
// // // //                                             ),
// // // //                                           ),
// // // //                                           const SizedBox(width: 10),
// // // //                                           const Text(
// // // //                                             'Package Details',
// // // //                                             style: TextStyle(
// // // //                                               fontSize: 18,
// // // //                                               fontWeight: FontWeight.w900,
// // // //                                               color: Color(0xFF0F2A1D),
// // // //                                               fontFamily: 'Poppins',
// // // //                                               letterSpacing: 0.5,
// // // //                                             ),
// // // //                                           ),
// // // //                                         ],
// // // //                                       ),
// // // //
// // // //                                       const SizedBox(height: 16),
// // // //
// // // //                                       // Description with expandable content
// // // //                                       Container(
// // // //                                         padding: const EdgeInsets.symmetric(horizontal: 4),
// // // //                                         child: Column(
// // // //                                           crossAxisAlignment: CrossAxisAlignment.start,
// // // //                                           children: [
// // // //                                             Text(
// // // //                                               isExpanded
// // // //                                                   ? i.package_details.toString()
// // // //                                                   : (isLongDescription
// // // //                                                   ? '${i.package_details.toString().substring(0, 150)}...'
// // // //                                                   : i.package_details.toString()),
// // // //                                               style: const TextStyle(
// // // //                                                 fontSize: 15,
// // // //                                                 color: Color(0xFF0F2A1D),
// // // //                                                 fontFamily: 'Poppins',
// // // //                                                 fontWeight: FontWeight.w700,
// // // //                                                 height: 1.7,
// // // //                                                 letterSpacing: 0.3,
// // // //                                               ),
// // // //                                             ),
// // // //
// // // //                                             if (isLongDescription)
// // // //                                               Padding(
// // // //                                                 padding: const EdgeInsets.only(top: 12),
// // // //                                                 child: GestureDetector(
// // // //                                                   onTap: () => _toggleExpand(index),
// // // //                                                   child: Container(
// // // //                                                     padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
// // // //                                                     decoration: BoxDecoration(
// // // //                                                       color: const Color(0xFF0F2A1D).withOpacity(0.1),
// // // //                                                       borderRadius: BorderRadius.circular(30),
// // // //                                                     ),
// // // //                                                     child: Row(
// // // //                                                       mainAxisSize: MainAxisSize.min,
// // // //                                                       children: [
// // // //                                                         Text(
// // // //                                                           isExpanded ? 'Show Less' : 'View More',
// // // //                                                           style: const TextStyle(
// // // //                                                             color: Color(0xFF0F2A1D),
// // // //                                                             fontSize: 13,
// // // //                                                             fontWeight: FontWeight.w800,
// // // //                                                             fontFamily: 'Poppins',
// // // //                                                           ),
// // // //                                                         ),
// // // //                                                         const SizedBox(width: 6),
// // // //                                                         Icon(
// // // //                                                           isExpanded ? Icons.expand_less : Icons.expand_more,
// // // //                                                           size: 16,
// // // //                                                           color: const Color(0xFF0F2A1D),
// // // //                                                         ),
// // // //                                                       ],
// // // //                                                     ),
// // // //                                                   ),
// // // //                                                 ),
// // // //                                               ),
// // // //                                           ],
// // // //                                         ),
// // // //                                       ),
// // // //                                     ],
// // // //                                   ),
// // // //                                 ),
// // // //
// // // //                                 const SizedBox(height: 20),
// // // //
// // // //                                 // Photo Gallery Title
// // // //                                 Row(
// // // //                                   children: [
// // // //                                     Container(
// // // //                                       padding: const EdgeInsets.all(6),
// // // //                                       decoration: BoxDecoration(
// // // //                                         color: const Color(0xFF0F2A1D).withOpacity(0.1),
// // // //                                         borderRadius: BorderRadius.circular(8),
// // // //                                       ),
// // // //                                       child: const Icon(
// // // //                                         Icons.photo_library_outlined,
// // // //                                         size: 18,
// // // //                                         color: Color(0xFF0F2A1D),
// // // //                                       ),
// // // //                                     ),
// // // //                                     const SizedBox(width: 10),
// // // //                                     const Text(
// // // //                                       'Gallery',
// // // //                                       style: TextStyle(
// // // //                                         fontSize: 18,
// // // //                                         fontWeight: FontWeight.w900,
// // // //                                         color: Color(0xFF0F2A1D),
// // // //                                         fontFamily: 'Poppins',
// // // //                                       ),
// // // //                                     ),
// // // //                                   ],
// // // //                                 ),
// // // //
// // // //                                 const SizedBox(height: 12),
// // // //
// // // //                                 // Photo Gallery - Horizontal Scroll
// // // //                                 SingleChildScrollView(
// // // //                                   scrollDirection: Axis.horizontal,
// // // //                                   child: Row(
// // // //                                     children: [
// // // //                                       _buildGalleryImage(i.photo1.toString()),
// // // //                                       const SizedBox(width: 12),
// // // //                                       _buildGalleryImage(i.photo2.toString()),
// // // //                                       const SizedBox(width: 12),
// // // //                                       _buildGalleryImage(i.photo3.toString()),
// // // //                                     ],
// // // //                                   ),
// // // //                                 ),
// // // //
// // // //                                 const SizedBox(height: 20),
// // // //
// // // //                                 // Action Buttons
// // // //                                 Row(
// // // //                                   children: [
// // // //                                     Expanded(
// // // //                                       child: ElevatedButton(
// // // //                                         onPressed: () async {
// // // //                                           SharedPreferences sh = await SharedPreferences.getInstance();
// // // //                                           sh.setString('ownid', i.id.toString());
// // // //                                           Navigator.push(
// // // //                                             context,
// // // //                                             MaterialPageRoute(builder: (context) => booking()),
// // // //                                           );
// // // //                                         },
// // // //                                         style: ElevatedButton.styleFrom(
// // // //                                           backgroundColor: const Color(0xFF0F2A1D),
// // // //                                           foregroundColor: Colors.white,
// // // //                                           padding: const EdgeInsets.symmetric(vertical: 16),
// // // //                                           shape: RoundedRectangleBorder(
// // // //                                             borderRadius: BorderRadius.circular(15),
// // // //                                           ),
// // // //                                           elevation: 6,
// // // //                                           shadowColor: const Color(0xFF0F2A1D).withOpacity(0.5),
// // // //                                         ),
// // // //                                         child: Row(
// // // //                                           mainAxisAlignment: MainAxisAlignment.center,
// // // //                                           children: const [
// // // //                                             Icon(Icons.book_online, size: 20),
// // // //                                             SizedBox(width: 8),
// // // //                                             Text(
// // // //                                               'BOOK NOW',
// // // //                                               style: TextStyle(
// // // //                                                 fontSize: 15,
// // // //                                                 fontWeight: FontWeight.w900,
// // // //                                                 fontFamily: 'Poppins',
// // // //                                                 letterSpacing: 0.5,
// // // //                                               ),
// // // //                                             ),
// // // //                                           ],
// // // //                                         ),
// // // //                                       ),
// // // //                                     ),
// // // //                                     const SizedBox(width: 12),
// // // //                                     Expanded(
// // // //                                       child: OutlinedButton(
// // // //                                         onPressed: () async {
// // // //                                           SharedPreferences sh = await SharedPreferences.getInstance();
// // // //                                           sh.setString('oid', i.id.toString());
// // // //                                           Navigator.push(
// // // //                                             context,
// // // //                                             MaterialPageRoute(builder: (context) => view_extradetails()),
// // // //                                           );
// // // //                                         },
// // // //                                         style: OutlinedButton.styleFrom(
// // // //                                           side: const BorderSide(color: Color(0xFF0F2A1D), width: 2),
// // // //                                           foregroundColor: const Color(0xFF0F2A1D),
// // // //                                           padding: const EdgeInsets.symmetric(vertical: 16),
// // // //                                           shape: RoundedRectangleBorder(
// // // //                                             borderRadius: BorderRadius.circular(15),
// // // //                                           ),
// // // //                                         ),
// // // //                                         child: Row(
// // // //                                           mainAxisAlignment: MainAxisAlignment.center,
// // // //                                           children: const [
// // // //                                             Icon(Icons.info_outline, size: 20),
// // // //                                             SizedBox(width: 8),
// // // //                                             Text(
// // // //                                               'DETAILS',
// // // //                                               style: TextStyle(
// // // //                                                 fontSize: 15,
// // // //                                                 fontWeight: FontWeight.w900,
// // // //                                                 fontFamily: 'Poppins',
// // // //                                               ),
// // // //                                             ),
// // // //                                           ],
// // // //                                         ),
// // // //                                       ),
// // // //                                     ),
// // // //                                   ],
// // // //                                 ),
// // // //                               ],
// // // //                             ),
// // // //                           ),
// // // //                         ],
// // // //                       ),
// // // //                     ),
// // // //                   );
// // // //                 },
// // // //               );
// // // //             }
// // // //           },
// // // //         ),
// // // //       ),
// // // //     );
// // // //   }
// // // //
// // // //   Widget _buildInfoRow(IconData icon, String label, String value) {
// // // //     return Row(
// // // //       crossAxisAlignment: CrossAxisAlignment.start,
// // // //       children: [
// // // //         Icon(
// // // //           icon,
// // // //           size: 18,
// // // //           color: const Color(0xFF0F2A1D).withOpacity(0.7),
// // // //         ),
// // // //         const SizedBox(width: 12),
// // // //         SizedBox(
// // // //           width: 80,
// // // //           child: Text(
// // // //             label,
// // // //             style: const TextStyle(
// // // //               fontWeight: FontWeight.w800,
// // // //               color: Color(0xFF0F2A1D),
// // // //               fontSize: 14,
// // // //               fontFamily: 'Poppins',
// // // //             ),
// // // //           ),
// // // //         ),
// // // //         const Text(
// // // //           ':',
// // // //           style: TextStyle(
// // // //             color: Color(0xFF0F2A1D),
// // // //             fontWeight: FontWeight.w800,
// // // //           ),
// // // //         ),
// // // //         const SizedBox(width: 12),
// // // //         Expanded(
// // // //           child: Text(
// // // //             value,
// // // //             style: const TextStyle(
// // // //               fontSize: 14,
// // // //               color: Color(0xFF0F2A1D),
// // // //               fontWeight: FontWeight.w700,
// // // //               fontFamily: 'Poppins',
// // // //             ),
// // // //             softWrap: true,
// // // //           ),
// // // //         ),
// // // //       ],
// // // //     );
// // // //   }
// // // //
// // // //   Widget _buildGalleryImage(String imageUrl) {
// // // //     return Container(
// // // //       width: 160,
// // // //       height: 130,
// // // //       decoration: BoxDecoration(
// // // //         borderRadius: BorderRadius.circular(18),
// // // //         boxShadow: [
// // // //           BoxShadow(
// // // //             color: const Color(0xFF0F2A1D).withOpacity(0.2),
// // // //             blurRadius: 10,
// // // //             offset: const Offset(0, 5),
// // // //           ),
// // // //         ],
// // // //       ),
// // // //       child: ClipRRect(
// // // //         borderRadius: BorderRadius.circular(18),
// // // //         child: Image.network(
// // // //           imageUrl,
// // // //           fit: BoxFit.cover,
// // // //           loadingBuilder: (BuildContext context, Widget child, ImageChunkEvent? loadingProgress) {
// // // //             if (loadingProgress == null) return child;
// // // //             return Container(
// // // //               color: const Color(0xFFE3EED4).withOpacity(0.3),
// // // //               child: Center(
// // // //                 child: CircularProgressIndicator(
// // // //                   value: loadingProgress.expectedTotalBytes != null
// // // //                       ? loadingProgress.cumulativeBytesLoaded / loadingProgress.expectedTotalBytes!
// // // //                       : null,
// // // //                   color: const Color(0xFF0F2A1D),
// // // //                 ),
// // // //               ),
// // // //             );
// // // //           },
// // // //           errorBuilder: (BuildContext context, Object error, StackTrace? stackTrace) {
// // // //             return Container(
// // // //               color: const Color(0xFFE3EED4).withOpacity(0.3),
// // // //               child: Center(
// // // //                 child: Icon(
// // // //                   Icons.broken_image,
// // // //                   size: 40,
// // // //                   color: const Color(0xFF0F2A1D).withOpacity(0.3),
// // // //                 ),
// // // //               ),
// // // //             );
// // // //           },
// // // //         ),
// // // //       ),
// // // //     );
// // // //   }
// // // // }
// // // //
// // // // class Joke {
// // // //   final String id;
// // // //   final String title;
// // // //   final String category;
// // // //   final String name;
// // // //   final String package_details;
// // // //   final String amount;
// // // //   final String photo1;
// // // //   final String photo2;
// // // //   final String photo3;
// // // //
// // // //   Joke(this.id, this.title, this.category, this.name, this.package_details, this.amount, this.photo1, this.photo2, this.photo3);
// // // // }
// // //
// // // // import 'dart:convert';
// // // // import 'package:final_destination/booking.dart';
// // // // import 'package:final_destination/view_extradetails.dart';
// // // // import 'package:final_destination/home.dart';
// // // // import 'package:flutter/material.dart';
// // // // import 'package:http/http.dart' as http;
// // // // import 'package:shared_preferences/shared_preferences.dart';
// // // //
// // // // void main() {
// // // //   runApp(viewpackage());
// // // // }
// // // //
// // // // class viewpackage extends StatelessWidget {
// // // //   const viewpackage({Key? key}) : super(key: key);
// // // //
// // // //   @override
// // // //   Widget build(BuildContext context) {
// // // //     return MaterialApp(
// // // //       debugShowCheckedModeBanner: false,
// // // //       theme: ThemeData(
// // // //         primaryColor: const Color(0xFF0F2A1D),
// // // //         scaffoldBackgroundColor: const Color(0xFFE3EED4),
// // // //         fontFamily: 'Poppins',
// // // //       ),
// // // //       home: viewpackagesub(),
// // // //     );
// // // //   }
// // // // }
// // // //
// // // // class viewpackagesub extends StatefulWidget {
// // // //   const viewpackagesub({Key? key}) : super(key: key);
// // // //
// // // //   @override
// // // //   State<viewpackagesub> createState() => _viewpackagesubState();
// // // // }
// // // //
// // // // class _viewpackagesubState extends State<viewpackagesub> {
// // // //   // Map to track expanded state for each package
// // // //   Map<int, bool> _expandedStates = {};
// // // //
// // // //   Future<List<Joke>> _getJokes() async {
// // // //     SharedPreferences prefs = await SharedPreferences.getInstance();
// // // //     String b = prefs.getString("lid").toString();
// // // //     String foodimage = "";
// // // //     var data = await http.post(
// // // //       Uri.parse(prefs.getString("ip").toString() + "/userviewpackage"),
// // // //       body: {"id": b},
// // // //     );
// // // //
// // // //     var jsonData = json.decode(data.body);
// // // //     List<Joke> jokes = [];
// // // //     for (var joke in jsonData["message"]) {
// // // //       print(joke);
// // // //       Joke newJoke = Joke(
// // // //         joke["id"].toString(),
// // // //         joke["title"].toString(),
// // // //         joke["category"].toString(),
// // // //         joke["name"].toString(),
// // // //         joke["package_details"],
// // // //         joke["amount"].toString(),
// // // //         prefs.getString('ip').toString() + joke["photo1"].toString(),
// // // //         prefs.getString('ip').toString() + joke["photo2"].toString(),
// // // //         prefs.getString('ip').toString() + joke["photo3"].toString(),
// // // //       );
// // // //       jokes.add(newJoke);
// // // //     }
// // // //     return jokes;
// // // //   }
// // // //
// // // //   void _toggleExpand(int index) {
// // // //     setState(() {
// // // //       _expandedStates[index] = !(_expandedStates[index] ?? false);
// // // //     });
// // // //   }
// // // //
// // // //   void _showEnlargedImage(BuildContext context, List<String> images, int initialIndex) {
// // // //     showDialog(
// // // //       context: context,
// // // //       builder: (BuildContext context) {
// // // //         return Dialog(
// // // //           backgroundColor: Colors.transparent,
// // // //           insetPadding: EdgeInsets.zero,
// // // //           child: Container(
// // // //             width: double.infinity,
// // // //             height: double.infinity,
// // // //             color: Colors.transparent,
// // // //             child: Stack(
// // // //               children: [
// // // //                 // PageView for swipe navigation
// // // //                 PageView.builder(
// // // //                   itemCount: images.length,
// // // //                   initialPage : initialIndex,
// // // //                   onPageChanged: (index) {
// // // //                     // Just for navigation, no need to update state
// // // //                   },
// // // //                   itemBuilder: (context, index) {
// // // //                     return Center(
// // // //                       child: GestureDetector(
// // // //                         onTap: () => Navigator.pop(context),
// // // //                         child: Container(
// // // //                           width: double.infinity,
// // // //                           height: double.infinity,
// // // //                           child: Image.network(
// // // //                             images[index],
// // // //                             fit: BoxFit.contain,
// // // //                             loadingBuilder: (BuildContext context, Widget child, ImageChunkEvent? loadingProgress) {
// // // //                               if (loadingProgress == null) return child;
// // // //                               return Center(
// // // //                                 child: CircularProgressIndicator(
// // // //                                   value: loadingProgress.expectedTotalBytes != null
// // // //                                       ? loadingProgress.cumulativeBytesLoaded / loadingProgress.expectedTotalBytes!
// // // //                                       : null,
// // // //                                   color: const Color(0xFF0F2A1D),
// // // //                                 ),
// // // //                               );
// // // //                             },
// // // //                             errorBuilder: (BuildContext context, Object error, StackTrace? stackTrace) {
// // // //                               return Center(
// // // //                                 child: Column(
// // // //                                   mainAxisAlignment: MainAxisAlignment.center,
// // // //                                   children: [
// // // //                                     Icon(
// // // //                                       Icons.broken_image,
// // // //                                       size: 60,
// // // //                                       color: const Color(0xFF0F2A1D).withOpacity(0.3),
// // // //                                     ),
// // // //                                     const SizedBox(height: 10),
// // // //                                     Text(
// // // //                                       'Failed to load image',
// // // //                                       style: TextStyle(
// // // //                                         color: const Color(0xFF0F2A1D).withOpacity(0.7),
// // // //                                         fontFamily: 'Poppins',
// // // //                                       ),
// // // //                                     ),
// // // //                                   ],
// // // //                                 ),
// // // //                               );
// // // //                             },
// // // //                           ),
// // // //                         ),
// // // //                       ),
// // // //                     );
// // // //                   },
// // // //                 ),
// // // //
// // // //                 // Image counter
// // // //                 Positioned(
// // // //                   top: 40,
// // // //                   left: 20,
// // // //                   child: Container(
// // // //                     padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
// // // //                     decoration: BoxDecoration(
// // // //                       color: const Color(0xFF0F2A1D).withOpacity(0.1),
// // // //                       borderRadius: BorderRadius.circular(20),
// // // //                       border: Border.all(
// // // //                         color: const Color(0xFF0F2A1D).withOpacity(0.2),
// // // //                       ),
// // // //                     ),
// // // //                     child: Text(
// // // //                       '${initialIndex + 1} / ${images.length}',
// // // //                       style: const TextStyle(
// // // //                         color: Color(0xFF0F2A1D),
// // // //                         fontSize: 14,
// // // //                         fontWeight: FontWeight.w600,
// // // //                         fontFamily: 'Poppins',
// // // //                       ),
// // // //                     ),
// // // //                   ),
// // // //                 ),
// // // //
// // // //                 // Close button
// // // //                 Positioned(
// // // //                   top: 40,
// // // //                   right: 20,
// // // //                   child: GestureDetector(
// // // //                     onTap: () => Navigator.pop(context),
// // // //                     child: Container(
// // // //                       padding: const EdgeInsets.all(12),
// // // //                       decoration: BoxDecoration(
// // // //                         color: const Color(0xFF0F2A1D).withOpacity(0.1),
// // // //                         borderRadius: BorderRadius.circular(30),
// // // //                         border: Border.all(
// // // //                           color: const Color(0xFF0F2A1D).withOpacity(0.2),
// // // //                         ),
// // // //                       ),
// // // //                       child: const Icon(
// // // //                         Icons.close,
// // // //                         color: Color(0xFF0F2A1D),
// // // //                         size: 24,
// // // //                       ),
// // // //                     ),
// // // //                   ),
// // // //                 ),
// // // //               ],
// // // //             ),
// // // //           ),
// // // //         );
// // // //       },
// // // //     );
// // // //   }
// // // //
// // // //   @override
// // // //   Widget build(BuildContext context) {
// // // //     return Scaffold(
// // // //       backgroundColor: const Color(0xFFE3EED4),
// // // //       appBar: AppBar(
// // // //         backgroundColor: Colors.white,
// // // //         elevation: 2,
// // // //         title: Text(
// // // //           'Travel Packages',
// // // //           style: const TextStyle(
// // // //             fontSize: 24,
// // // //             fontWeight: FontWeight.w800,
// // // //             color: Color(0xFF0F2A1D),
// // // //             fontFamily: 'Poppins',
// // // //             letterSpacing: 1,
// // // //           ),
// // // //         ),
// // // //         centerTitle: true,
// // // //         leading: IconButton(
// // // //           icon: const Icon(Icons.arrow_back_ios, color: Color(0xFF0F2A1D), size: 22),
// // // //           onPressed: () => Navigator.push(
// // // //             context,
// // // //             MaterialPageRoute(builder: (context) => UserHomeApp()),
// // // //           ),
// // // //         ),
// // // //       ),
// // // //       body: Container(
// // // //         child: FutureBuilder(
// // // //           future: _getJokes(),
// // // //           builder: (BuildContext context, AsyncSnapshot snapshot) {
// // // //             if (snapshot.data == null) {
// // // //               return Center(
// // // //                 child: Column(
// // // //                   mainAxisAlignment: MainAxisAlignment.center,
// // // //                   children: [
// // // //                     CircularProgressIndicator(
// // // //                       color: const Color(0xFF0F2A1D),
// // // //                     ),
// // // //                     const SizedBox(height: 20),
// // // //                     Text(
// // // //                       "Loading packages...",
// // // //                       style: TextStyle(
// // // //                         color: const Color(0xFF0F2A1D),
// // // //                         fontSize: 16,
// // // //                         fontFamily: 'Poppins',
// // // //                         fontWeight: FontWeight.w600,
// // // //                       ),
// // // //                     ),
// // // //                   ],
// // // //                 ),
// // // //               );
// // // //             } else if (snapshot.data.length == 0) {
// // // //               return Center(
// // // //                 child: Column(
// // // //                   mainAxisAlignment: MainAxisAlignment.center,
// // // //                   children: [
// // // //                     Icon(
// // // //                       Icons.card_travel_outlined,
// // // //                       size: 100,
// // // //                       color: const Color(0xFF0F2A1D).withOpacity(0.3),
// // // //                     ),
// // // //                     const SizedBox(height: 20),
// // // //                     Text(
// // // //                       'No packages available',
// // // //                       style: const TextStyle(
// // // //                         fontSize: 20,
// // // //                         fontWeight: FontWeight.w800,
// // // //                         color: Color(0xFF0F2A1D),
// // // //                         fontFamily: 'Poppins',
// // // //                       ),
// // // //                     ),
// // // //                     const SizedBox(height: 10),
// // // //                     Text(
// // // //                       'Check back later for exciting travel packages',
// // // //                       style: TextStyle(
// // // //                         fontSize: 14,
// // // //                         color: const Color(0xFF0F2A1D).withOpacity(0.6),
// // // //                         fontFamily: 'Poppins',
// // // //                         fontWeight: FontWeight.w600,
// // // //                       ),
// // // //                     ),
// // // //                   ],
// // // //                 ),
// // // //               );
// // // //             } else {
// // // //               return ListView.builder(
// // // //                 padding: const EdgeInsets.all(16),
// // // //                 itemCount: snapshot.data.length,
// // // //                 itemBuilder: (BuildContext context, int index) {
// // // //                   var i = snapshot.data![index];
// // // //                   bool isExpanded = _expandedStates[index] ?? false;
// // // //                   bool isLongDescription = i.package_details.toString().length > 150;
// // // //
// // // //                   // Create list of images for this package
// // // //                   List<String> packageImages = [
// // // //                     i.photo1.toString(),
// // // //                     i.photo2.toString(),
// // // //                     i.photo3.toString(),
// // // //                   ];
// // // //
// // // //                   return Padding(
// // // //                     padding: const EdgeInsets.only(bottom: 16),
// // // //                     child: Card(
// // // //                       elevation: 4,
// // // //                       shape: RoundedRectangleBorder(
// // // //                         borderRadius: BorderRadius.circular(20),
// // // //                       ),
// // // //                       child: Column(
// // // //                         crossAxisAlignment: CrossAxisAlignment.start,
// // // //                         children: [
// // // //                           // Header with gradient
// // // //                           Container(
// // // //                             decoration: const BoxDecoration(
// // // //                               gradient: LinearGradient(
// // // //                                 colors: [Color(0xFF0F2A1D), Color(0xFF1A3F2B)],
// // // //                                 begin: Alignment.topLeft,
// // // //                                 end: Alignment.bottomRight,
// // // //                               ),
// // // //                               borderRadius: BorderRadius.only(
// // // //                                 topLeft: Radius.circular(20),
// // // //                                 topRight: Radius.circular(20),
// // // //                               ),
// // // //                             ),
// // // //                             padding: const EdgeInsets.all(16),
// // // //                             child: Row(
// // // //                               children: [
// // // //                                 Container(
// // // //                                   padding: const EdgeInsets.all(8),
// // // //                                   decoration: BoxDecoration(
// // // //                                     color: Colors.white.withOpacity(0.2),
// // // //                                     borderRadius: BorderRadius.circular(10),
// // // //                                   ),
// // // //                                   child: const Icon(
// // // //                                     Icons.card_travel,
// // // //                                     color: Colors.white,
// // // //                                     size: 20,
// // // //                                   ),
// // // //                                 ),
// // // //                                 const SizedBox(width: 12),
// // // //                                 Expanded(
// // // //                                   child: Text(
// // // //                                     i.title.toString(),
// // // //                                     style: const TextStyle(
// // // //                                       color: Colors.white,
// // // //                                       fontSize: 20,
// // // //                                       fontWeight: FontWeight.w800,
// // // //                                       fontFamily: 'Poppins',
// // // //                                     ),
// // // //                                   ),
// // // //                                 ),
// // // //                               ],
// // // //                             ),
// // // //                           ),
// // // //
// // // //                           Padding(
// // // //                             padding: const EdgeInsets.all(16),
// // // //                             child: Column(
// // // //                               crossAxisAlignment: CrossAxisAlignment.start,
// // // //                               children: [
// // // //                                 // Company Name Badge
// // // //                                 Container(
// // // //                                   padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
// // // //                                   decoration: BoxDecoration(
// // // //                                     color: const Color(0xFF0F2A1D).withOpacity(0.1),
// // // //                                     borderRadius: BorderRadius.circular(10),
// // // //                                   ),
// // // //                                   child: Row(
// // // //                                     mainAxisSize: MainAxisSize.min,
// // // //                                     children: [
// // // //                                       const Icon(
// // // //                                         Icons.business,
// // // //                                         size: 16,
// // // //                                         color: Color(0xFF0F2A1D),
// // // //                                       ),
// // // //                                       const SizedBox(width: 8),
// // // //                                       Text(
// // // //                                         i.name.toString(),
// // // //                                         style: const TextStyle(
// // // //                                           fontSize: 14,
// // // //                                           fontWeight: FontWeight.w800,
// // // //                                           color: Color(0xFF0F2A1D),
// // // //                                           fontFamily: 'Poppins',
// // // //                                         ),
// // // //                                       ),
// // // //                                     ],
// // // //                                   ),
// // // //                                 ),
// // // //
// // // //                                 const SizedBox(height: 16),
// // // //
// // // //                                 // Category
// // // //                                 _buildInfoRow(Icons.category, 'Category', i.category.toString()),
// // // //
// // // //                                 const SizedBox(height: 12),
// // // //
// // // //                                 // Amount with premium styling
// // // //                                 Container(
// // // //                                   padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
// // // //                                   decoration: BoxDecoration(
// // // //                                     gradient: LinearGradient(
// // // //                                       colors: [
// // // //                                         const Color(0xFF0F2A1D).withOpacity(0.1),
// // // //                                         const Color(0xFFE3EED4).withOpacity(0.5),
// // // //                                       ],
// // // //                                       begin: Alignment.topLeft,
// // // //                                       end: Alignment.bottomRight,
// // // //                                     ),
// // // //                                     borderRadius: BorderRadius.circular(15),
// // // //                                     border: Border.all(
// // // //                                       color: const Color(0xFF0F2A1D).withOpacity(0.3),
// // // //                                     ),
// // // //                                   ),
// // // //                                   child: Row(
// // // //                                     mainAxisSize: MainAxisSize.min,
// // // //                                     children: [
// // // //                                       const Icon(
// // // //                                         Icons.currency_rupee,
// // // //                                         size: 22,
// // // //                                         color: Color(0xFF0F2A1D),
// // // //                                       ),
// // // //                                       const SizedBox(width: 4),
// // // //                                       Text(
// // // //                                         i.amount.toString(),
// // // //                                         style: const TextStyle(
// // // //                                           fontSize: 24,
// // // //                                           fontWeight: FontWeight.w900,
// // // //                                           color: Color(0xFF0F2A1D),
// // // //                                           fontFamily: 'Poppins',
// // // //                                         ),
// // // //                                       ),
// // // //                                       const Text(
// // // //                                         ' / person',
// // // //                                         style: TextStyle(
// // // //                                           fontSize: 14,
// // // //                                           color: Color(0xFF0F2A1D),
// // // //                                           fontWeight: FontWeight.w600,
// // // //                                           fontFamily: 'Poppins',
// // // //                                         ),
// // // //                                       ),
// // // //                                     ],
// // // //                                   ),
// // // //                                 ),
// // // //
// // // //                                 const SizedBox(height: 20),
// // // //
// // // //                                 // Package Details Section - Enhanced Styling with Expandable Content
// // // //                                 Container(
// // // //                                   width: double.infinity,
// // // //                                   padding: const EdgeInsets.all(18),
// // // //                                   decoration: BoxDecoration(
// // // //                                     gradient: LinearGradient(
// // // //                                       begin: Alignment.topLeft,
// // // //                                       end: Alignment.bottomRight,
// // // //                                       colors: [
// // // //                                         const Color(0xFF0F2A1D).withOpacity(0.03),
// // // //                                         const Color(0xFFE3EED4).withOpacity(0.4),
// // // //                                       ],
// // // //                                     ),
// // // //                                     borderRadius: BorderRadius.circular(18),
// // // //                                     border: Border.all(
// // // //                                       color: const Color(0xFF0F2A1D).withOpacity(0.15),
// // // //                                       width: 1.5,
// // // //                                     ),
// // // //                                     boxShadow: [
// // // //                                       BoxShadow(
// // // //                                         color: const Color(0xFF0F2A1D).withOpacity(0.05),
// // // //                                         blurRadius: 10,
// // // //                                         offset: const Offset(0, 4),
// // // //                                       ),
// // // //                                     ],
// // // //                                   ),
// // // //                                   child: Column(
// // // //                                     crossAxisAlignment: CrossAxisAlignment.start,
// // // //                                     children: [
// // // //                                       // Title with icon
// // // //                                       Row(
// // // //                                         children: [
// // // //                                           Container(
// // // //                                             padding: const EdgeInsets.all(6),
// // // //                                             decoration: BoxDecoration(
// // // //                                               color: const Color(0xFF0F2A1D).withOpacity(0.1),
// // // //                                               borderRadius: BorderRadius.circular(8),
// // // //                                             ),
// // // //                                             child: const Icon(
// // // //                                               Icons.description_outlined,
// // // //                                               size: 18,
// // // //                                               color: Color(0xFF0F2A1D),
// // // //                                             ),
// // // //                                           ),
// // // //                                           const SizedBox(width: 10),
// // // //                                           const Text(
// // // //                                             'Package Details',
// // // //                                             style: TextStyle(
// // // //                                               fontSize: 18,
// // // //                                               fontWeight: FontWeight.w900,
// // // //                                               color: Color(0xFF0F2A1D),
// // // //                                               fontFamily: 'Poppins',
// // // //                                               letterSpacing: 0.5,
// // // //                                             ),
// // // //                                           ),
// // // //                                         ],
// // // //                                       ),
// // // //
// // // //                                       const SizedBox(height: 16),
// // // //
// // // //                                       // Description with expandable content
// // // //                                       Container(
// // // //                                         padding: const EdgeInsets.symmetric(horizontal: 4),
// // // //                                         child: Column(
// // // //                                           crossAxisAlignment: CrossAxisAlignment.start,
// // // //                                           children: [
// // // //                                             Text(
// // // //                                               isExpanded
// // // //                                                   ? i.package_details.toString()
// // // //                                                   : (isLongDescription
// // // //                                                   ? '${i.package_details.toString().substring(0, 150)}...'
// // // //                                                   : i.package_details.toString()),
// // // //                                               style: const TextStyle(
// // // //                                                 fontSize: 15,
// // // //                                                 color: Color(0xFF0F2A1D),
// // // //                                                 fontFamily: 'Poppins',
// // // //                                                 fontWeight: FontWeight.w700,
// // // //                                                 height: 1.7,
// // // //                                                 letterSpacing: 0.3,
// // // //                                               ),
// // // //                                             ),
// // // //
// // // //                                             if (isLongDescription)
// // // //                                               Padding(
// // // //                                                 padding: const EdgeInsets.only(top: 12),
// // // //                                                 child: GestureDetector(
// // // //                                                   onTap: () => _toggleExpand(index),
// // // //                                                   child: Container(
// // // //                                                     padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
// // // //                                                     decoration: BoxDecoration(
// // // //                                                       color: const Color(0xFF0F2A1D).withOpacity(0.1),
// // // //                                                       borderRadius: BorderRadius.circular(30),
// // // //                                                     ),
// // // //                                                     child: Row(
// // // //                                                       mainAxisSize: MainAxisSize.min,
// // // //                                                       children: [
// // // //                                                         Text(
// // // //                                                           isExpanded ? 'Show Less' : 'View More',
// // // //                                                           style: const TextStyle(
// // // //                                                             color: Color(0xFF0F2A1D),
// // // //                                                             fontSize: 13,
// // // //                                                             fontWeight: FontWeight.w800,
// // // //                                                             fontFamily: 'Poppins',
// // // //                                                           ),
// // // //                                                         ),
// // // //                                                         const SizedBox(width: 6),
// // // //                                                         Icon(
// // // //                                                           isExpanded ? Icons.expand_less : Icons.expand_more,
// // // //                                                           size: 16,
// // // //                                                           color: const Color(0xFF0F2A1D),
// // // //                                                         ),
// // // //                                                       ],
// // // //                                                     ),
// // // //                                                   ),
// // // //                                                 ),
// // // //                                               ),
// // // //                                           ],
// // // //                                         ),
// // // //                                       ),
// // // //                                     ],
// // // //                                   ),
// // // //                                 ),
// // // //
// // // //                                 const SizedBox(height: 20),
// // // //
// // // //                                 // Photo Gallery Title
// // // //                                 Row(
// // // //                                   children: [
// // // //                                     Container(
// // // //                                       padding: const EdgeInsets.all(6),
// // // //                                       decoration: BoxDecoration(
// // // //                                         color: const Color(0xFF0F2A1D).withOpacity(0.1),
// // // //                                         borderRadius: BorderRadius.circular(8),
// // // //                                       ),
// // // //                                       child: const Icon(
// // // //                                         Icons.photo_library_outlined,
// // // //                                         size: 18,
// // // //                                         color: Color(0xFF0F2A1D),
// // // //                                       ),
// // // //                                     ),
// // // //                                     const SizedBox(width: 10),
// // // //                                     const Text(
// // // //                                       'Gallery',
// // // //                                       style: TextStyle(
// // // //                                         fontSize: 18,
// // // //                                         fontWeight: FontWeight.w900,
// // // //                                         color: Color(0xFF0F2A1D),
// // // //                                         fontFamily: 'Poppins',
// // // //                                       ),
// // // //                                     ),
// // // //                                   ],
// // // //                                 ),
// // // //
// // // //                                 const SizedBox(height: 12),
// // // //
// // // //                                 // Photo Gallery - Horizontal Scroll
// // // //                                 SingleChildScrollView(
// // // //                                   scrollDirection: Axis.horizontal,
// // // //                                   child: Row(
// // // //                                     children: [
// // // //                                       _buildGalleryImage(i.photo1.toString(), 0, packageImages, context),
// // // //                                       const SizedBox(width: 12),
// // // //                                       _buildGalleryImage(i.photo2.toString(), 1, packageImages, context),
// // // //                                       const SizedBox(width: 12),
// // // //                                       _buildGalleryImage(i.photo3.toString(), 2, packageImages, context),
// // // //                                     ],
// // // //                                   ),
// // // //                                 ),
// // // //
// // // //                                 const SizedBox(height: 20),
// // // //
// // // //                                 // Action Buttons
// // // //                                 Row(
// // // //                                   children: [
// // // //                                     Expanded(
// // // //                                       child: ElevatedButton(
// // // //                                         onPressed: () async {
// // // //                                           SharedPreferences sh = await SharedPreferences.getInstance();
// // // //                                           sh.setString('ownid', i.id.toString());
// // // //                                           Navigator.push(
// // // //                                             context,
// // // //                                             MaterialPageRoute(builder: (context) => booking()),
// // // //                                           );
// // // //                                         },
// // // //                                         style: ElevatedButton.styleFrom(
// // // //                                           backgroundColor: const Color(0xFF0F2A1D),
// // // //                                           foregroundColor: Colors.white,
// // // //                                           padding: const EdgeInsets.symmetric(vertical: 16),
// // // //                                           shape: RoundedRectangleBorder(
// // // //                                             borderRadius: BorderRadius.circular(15),
// // // //                                           ),
// // // //                                           elevation: 6,
// // // //                                           shadowColor: const Color(0xFF0F2A1D).withOpacity(0.5),
// // // //                                         ),
// // // //                                         child: Row(
// // // //                                           mainAxisAlignment: MainAxisAlignment.center,
// // // //                                           children: const [
// // // //                                             Icon(Icons.book_online, size: 20),
// // // //                                             SizedBox(width: 8),
// // // //                                             Text(
// // // //                                               'BOOK NOW',
// // // //                                               style: TextStyle(
// // // //                                                 fontSize: 15,
// // // //                                                 fontWeight: FontWeight.w900,
// // // //                                                 fontFamily: 'Poppins',
// // // //                                                 letterSpacing: 0.5,
// // // //                                               ),
// // // //                                             ),
// // // //                                           ],
// // // //                                         ),
// // // //                                       ),
// // // //                                     ),
// // // //                                     const SizedBox(width: 12),
// // // //                                     Expanded(
// // // //                                       child: OutlinedButton(
// // // //                                         onPressed: () async {
// // // //                                           SharedPreferences sh = await SharedPreferences.getInstance();
// // // //                                           sh.setString('oid', i.id.toString());
// // // //                                           Navigator.push(
// // // //                                             context,
// // // //                                             MaterialPageRoute(builder: (context) => view_extradetails()),
// // // //                                           );
// // // //                                         },
// // // //                                         style: OutlinedButton.styleFrom(
// // // //                                           side: const BorderSide(color: Color(0xFF0F2A1D), width: 2),
// // // //                                           foregroundColor: const Color(0xFF0F2A1D),
// // // //                                           padding: const EdgeInsets.symmetric(vertical: 16),
// // // //                                           shape: RoundedRectangleBorder(
// // // //                                             borderRadius: BorderRadius.circular(15),
// // // //                                           ),
// // // //                                         ),
// // // //                                         child: Row(
// // // //                                           mainAxisAlignment: MainAxisAlignment.center,
// // // //                                           children: const [
// // // //                                             Icon(Icons.info_outline, size: 20),
// // // //                                             SizedBox(width: 8),
// // // //                                             Text(
// // // //                                               'DETAILS',
// // // //                                               style: TextStyle(
// // // //                                                 fontSize: 15,
// // // //                                                 fontWeight: FontWeight.w900,
// // // //                                                 fontFamily: 'Poppins',
// // // //                                               ),
// // // //                                             ),
// // // //                                           ],
// // // //                                         ),
// // // //                                       ),
// // // //                                     ),
// // // //                                   ],
// // // //                                 ),
// // // //                               ],
// // // //                             ),
// // // //                           ),
// // // //                         ],
// // // //                       ),
// // // //                     ),
// // // //                   );
// // // //                 },
// // // //               );
// // // //             }
// // // //           },
// // // //         ),
// // // //       ),
// // // //     );
// // // //   }
// // // //
// // // //   Widget _buildInfoRow(IconData icon, String label, String value) {
// // // //     return Row(
// // // //       crossAxisAlignment: CrossAxisAlignment.start,
// // // //       children: [
// // // //         Icon(
// // // //           icon,
// // // //           size: 18,
// // // //           color: const Color(0xFF0F2A1D).withOpacity(0.7),
// // // //         ),
// // // //         const SizedBox(width: 12),
// // // //         SizedBox(
// // // //           width: 80,
// // // //           child: Text(
// // // //             label,
// // // //             style: const TextStyle(
// // // //               fontWeight: FontWeight.w800,
// // // //               color: Color(0xFF0F2A1D),
// // // //               fontSize: 14,
// // // //               fontFamily: 'Poppins',
// // // //             ),
// // // //           ),
// // // //         ),
// // // //         const Text(
// // // //           ':',
// // // //           style: TextStyle(
// // // //             color: Color(0xFF0F2A1D),
// // // //             fontWeight: FontWeight.w800,
// // // //           ),
// // // //         ),
// // // //         const SizedBox(width: 12),
// // // //         Expanded(
// // // //           child: Text(
// // // //             value,
// // // //             style: const TextStyle(
// // // //               fontSize: 14,
// // // //               color: Color(0xFF0F2A1D),
// // // //               fontWeight: FontWeight.w700,
// // // //               fontFamily: 'Poppins',
// // // //             ),
// // // //             softWrap: true,
// // // //           ),
// // // //         ),
// // // //       ],
// // // //     );
// // // //   }
// // // //
// // // //   Widget _buildGalleryImage(String imageUrl, int index, List<String> allImages, BuildContext context) {
// // // //     return GestureDetector(
// // // //       onTap: () => _showEnlargedImage(context, allImages, index),
// // // //       child: Container(
// // // //         width: 160,
// // // //         height: 130,
// // // //         decoration: BoxDecoration(
// // // //           borderRadius: BorderRadius.circular(18),
// // // //           boxShadow: [
// // // //             BoxShadow(
// // // //               color: const Color(0xFF0F2A1D).withOpacity(0.2),
// // // //               blurRadius: 10,
// // // //               offset: const Offset(0, 5),
// // // //             ),
// // // //           ],
// // // //         ),
// // // //         child: Stack(
// // // //           children: [
// // // //             ClipRRect(
// // // //               borderRadius: BorderRadius.circular(18),
// // // //               child: Image.network(
// // // //                 imageUrl,
// // // //                 fit: BoxFit.cover,
// // // //                 width: double.infinity,
// // // //                 height: double.infinity,
// // // //                 loadingBuilder: (BuildContext context, Widget child, ImageChunkEvent? loadingProgress) {
// // // //                   if (loadingProgress == null) return child;
// // // //                   return Container(
// // // //                     color: const Color(0xFFE3EED4).withOpacity(0.3),
// // // //                     child: Center(
// // // //                       child: CircularProgressIndicator(
// // // //                         value: loadingProgress.expectedTotalBytes != null
// // // //                             ? loadingProgress.cumulativeBytesLoaded / loadingProgress.expectedTotalBytes!
// // // //                             : null,
// // // //                         color: const Color(0xFF0F2A1D),
// // // //                       ),
// // // //                     ),
// // // //                   );
// // // //                 },
// // // //                 errorBuilder: (BuildContext context, Object error, StackTrace? stackTrace) {
// // // //                   return Container(
// // // //                     color: const Color(0xFFE3EED4).withOpacity(0.3),
// // // //                     child: Center(
// // // //                       child: Icon(
// // // //                         Icons.broken_image,
// // // //                         size: 40,
// // // //                         color: const Color(0xFF0F2A1D).withOpacity(0.3),
// // // //                       ),
// // // //                     ),
// // // //                   );
// // // //                 },
// // // //               ),
// // // //             ),
// // // //             // Enlarge icon overlay
// // // //             Positioned(
// // // //               bottom: 8,
// // // //               right: 8,
// // // //               child: Container(
// // // //                 padding: const EdgeInsets.all(6),
// // // //                 decoration: BoxDecoration(
// // // //                   color: const Color(0xFF0F2A1D).withOpacity(0.7),
// // // //                   borderRadius: BorderRadius.circular(20),
// // // //                 ),
// // // //                 child: const Icon(
// // // //                   Icons.open_in_full,
// // // //                   color: Colors.white,
// // // //                   size: 16,
// // // //                 ),
// // // //               ),
// // // //             ),
// // // //           ],
// // // //         ),
// // // //       ),
// // // //     );
// // // //   }
// // // // }
// // // //
// // // // class Joke {
// // // //   final String id;
// // // //   final String title;
// // // //   final String category;
// // // //   final String name;
// // // //   final String package_details;
// // // //   final String amount;
// // // //   final String photo1;
// // // //   final String photo2;
// // // //   final String photo3;
// // // //
// // // //   Joke(this.id, this.title, this.category, this.name, this.package_details, this.amount, this.photo1, this.photo2, this.photo3);
// // // // }
// // //
// // //
// // //
// // //
// // //
// // //
// // // import 'dart:convert';
// // // import 'package:final_destination/booking.dart';
// // // import 'package:final_destination/view_extradetails.dart';
// // // import 'package:final_destination/home.dart';
// // // import 'package:flutter/material.dart';
// // // import 'package:http/http.dart' as http;
// // // import 'package:shared_preferences/shared_preferences.dart';
// // //
// // // void main() {
// // //   runApp(viewpackage());
// // // }
// // //
// // // class viewpackage extends StatelessWidget {
// // //   const viewpackage({Key? key}) : super(key: key);
// // //
// // //   @override
// // //   Widget build(BuildContext context) {
// // //     return MaterialApp(
// // //       debugShowCheckedModeBanner: false,
// // //       theme: ThemeData(
// // //         primaryColor: const Color(0xFF0F2A1D),
// // //         scaffoldBackgroundColor: const Color(0xFFE3EED4),
// // //         fontFamily: 'Poppins',
// // //       ),
// // //       home: viewpackagesub(),
// // //     );
// // //   }
// // // }
// // //
// // // class viewpackagesub extends StatefulWidget {
// // //   const viewpackagesub({Key? key}) : super(key: key);
// // //
// // //   @override
// // //   State<viewpackagesub> createState() => _viewpackagesubState();
// // // }
// // //
// // // class _viewpackagesubState extends State<viewpackagesub> {
// // //   // Map to track expanded state for each package
// // //   Map<int, bool> _expandedStates = {};
// // //
// // //   Future<List<Joke>> _getJokes() async {
// // //     SharedPreferences prefs = await SharedPreferences.getInstance();
// // //     String b = prefs.getString("lid").toString();
// // //     String foodimage = "";
// // //     var data = await http.post(
// // //       Uri.parse(prefs.getString("ip").toString() + "/userviewpackage"),
// // //       body: {"id": b},
// // //     );
// // //
// // //     var jsonData = json.decode(data.body);
// // //     List<Joke> jokes = [];
// // //     for (var joke in jsonData["message"]) {
// // //       print(joke);
// // //       Joke newJoke = Joke(
// // //         joke["id"].toString(),
// // //         joke["title"].toString(),
// // //         joke["category"].toString(),
// // //         joke["name"].toString(),
// // //         joke["package_details"],
// // //         joke["guide_no"],
// // //         joke["amount"].toString(),
// // //         prefs.getString('ip').toString() + joke["photo1"].toString(),
// // //         prefs.getString('ip').toString() + joke["photo2"].toString(),
// // //         prefs.getString('ip').toString() + joke["photo3"].toString(),
// // //       );
// // //       jokes.add(newJoke);
// // //     }
// // //     return jokes;
// // //   }
// // //
// // //   void _toggleExpand(int index) {
// // //     setState(() {
// // //       _expandedStates[index] = !(_expandedStates[index] ?? false);
// // //     });
// // //   }
// // //
// // //   void _showEnlargedImage(BuildContext context, List<String> images, int initialIndex) {
// // //     // Create a controller for the PageView
// // //     PageController _pageController = PageController(initialPage: initialIndex);
// // //     int currentIndex = initialIndex;
// // //
// // //     showDialog(
// // //       context: context,
// // //       builder: (BuildContext context) {
// // //         return StatefulBuilder(
// // //           builder: (context, setState) {
// // //             return Dialog(
// // //               backgroundColor: Colors.transparent,
// // //               insetPadding: EdgeInsets.zero,
// // //               child: Container(
// // //                 width: double.infinity,
// // //                 height: double.infinity,
// // //                 color: Colors.transparent,
// // //                 child: Stack(
// // //                   children: [
// // //                     // PageView for swipe navigation
// // //                     PageView.builder(
// // //                       controller: _pageController,
// // //                       itemCount: images.length,
// // //                       onPageChanged: (index) {
// // //                         setState(() {
// // //                           currentIndex = index;
// // //                         });
// // //                       },
// // //                       itemBuilder: (context, index) {
// // //                         return Center(
// // //                           child: GestureDetector(
// // //                             onTap: () => Navigator.pop(context),
// // //                             child: Container(
// // //                               width: double.infinity,
// // //                               height: double.infinity,
// // //                               child: Image.network(
// // //                                 images[index],
// // //                                 fit: BoxFit.contain,
// // //                                 loadingBuilder: (BuildContext context, Widget child, ImageChunkEvent? loadingProgress) {
// // //                                   if (loadingProgress == null) return child;
// // //                                   return Center(
// // //                                     child: CircularProgressIndicator(
// // //                                       value: loadingProgress.expectedTotalBytes != null
// // //                                           ? loadingProgress.cumulativeBytesLoaded / loadingProgress.expectedTotalBytes!
// // //                                           : null,
// // //                                       color: const Color(0xFF0F2A1D),
// // //                                     ),
// // //                                   );
// // //                                 },
// // //                                 errorBuilder: (BuildContext context, Object error, StackTrace? stackTrace) {
// // //                                   return Center(
// // //                                     child: Column(
// // //                                       mainAxisAlignment: MainAxisAlignment.center,
// // //                                       children: [
// // //                                         Icon(
// // //                                           Icons.broken_image,
// // //                                           size: 60,
// // //                                           color: const Color(0xFF0F2A1D).withOpacity(0.3),
// // //                                         ),
// // //                                         const SizedBox(height: 10),
// // //                                         Text(
// // //                                           'Failed to load image',
// // //                                           style: TextStyle(
// // //                                             color: const Color(0xFF0F2A1D).withOpacity(0.7),
// // //                                             fontFamily: 'Poppins',
// // //                                           ),
// // //                                         ),
// // //                                       ],
// // //                                     ),
// // //                                   );
// // //                                 },
// // //                               ),
// // //                             ),
// // //                           ),
// // //                         );
// // //                       },
// // //                     ),
// // //
// // //                     // Image counter
// // //                     Positioned(
// // //                       top: 40,
// // //                       left: 20,
// // //                       child: Container(
// // //                         padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
// // //                         decoration: BoxDecoration(
// // //                           color: const Color(0xFF0F2A1D).withOpacity(0.1),
// // //                           borderRadius: BorderRadius.circular(20),
// // //                           border: Border.all(
// // //                             color: const Color(0xFF0F2A1D).withOpacity(0.2),
// // //                           ),
// // //                         ),
// // //                         child: Text(
// // //                           '${currentIndex + 1} / ${images.length}',
// // //                           style: const TextStyle(
// // //                             color: Color(0xFF0F2A1D),
// // //                             fontSize: 14,
// // //                             fontWeight: FontWeight.w600,
// // //                             fontFamily: 'Poppins',
// // //                           ),
// // //                         ),
// // //                       ),
// // //                     ),
// // //
// // //                     // Close button
// // //                     Positioned(
// // //                       top: 40,
// // //                       right: 20,
// // //                       child: GestureDetector(
// // //                         onTap: () => Navigator.pop(context),
// // //                         child: Container(
// // //                           padding: const EdgeInsets.all(12),
// // //                           decoration: BoxDecoration(
// // //                             color: const Color(0xFF0F2A1D).withOpacity(0.1),
// // //                             borderRadius: BorderRadius.circular(30),
// // //                             border: Border.all(
// // //                               color: const Color(0xFF0F2A1D).withOpacity(0.2),
// // //                             ),
// // //                           ),
// // //                           child: const Icon(
// // //                             Icons.close,
// // //                             color: Color(0xFF0F2A1D),
// // //                             size: 24,
// // //                           ),
// // //                         ),
// // //                       ),
// // //                     ),
// // //                   ],
// // //                 ),
// // //               ),
// // //             );
// // //           },
// // //         );
// // //       },
// // //     );
// // //   }
// // //
// // //   @override
// // //   Widget build(BuildContext context) {
// // //     return Scaffold(
// // //       backgroundColor: const Color(0xFFE3EED4),
// // //       appBar: AppBar(
// // //         backgroundColor: Colors.white,
// // //         elevation: 2,
// // //         title: Text(
// // //           'Travel Packages',
// // //           style: const TextStyle(
// // //             fontSize: 24,
// // //             fontWeight: FontWeight.w800,
// // //             color: Color(0xFF0F2A1D),
// // //             fontFamily: 'Poppins',
// // //             letterSpacing: 1,
// // //           ),
// // //         ),
// // //         centerTitle: true,
// // //         leading: IconButton(
// // //           icon: const Icon(Icons.arrow_back_ios, color: Color(0xFF0F2A1D), size: 22),
// // //           onPressed: () => Navigator.push(
// // //             context,
// // //             MaterialPageRoute(builder: (context) => UserHomeApp()),
// // //           ),
// // //         ),
// // //       ),
// // //       body: Container(
// // //         child: FutureBuilder(
// // //           future: _getJokes(),
// // //           builder: (BuildContext context, AsyncSnapshot snapshot) {
// // //             if (snapshot.data == null) {
// // //               return Center(
// // //                 child: Column(
// // //                   mainAxisAlignment: MainAxisAlignment.center,
// // //                   children: [
// // //                     CircularProgressIndicator(
// // //                       color: const Color(0xFF0F2A1D),
// // //                     ),
// // //                     const SizedBox(height: 20),
// // //                     Text(
// // //                       "Loading packages...",
// // //                       style: TextStyle(
// // //                         color: const Color(0xFF0F2A1D),
// // //                         fontSize: 16,
// // //                         fontFamily: 'Poppins',
// // //                         fontWeight: FontWeight.w600,
// // //                       ),
// // //                     ),
// // //                   ],
// // //                 ),
// // //               );
// // //             } else if (snapshot.data.length == 0) {
// // //               return Center(
// // //                 child: Column(
// // //                   mainAxisAlignment: MainAxisAlignment.center,
// // //                   children: [
// // //                     Icon(
// // //                       Icons.card_travel_outlined,
// // //                       size: 100,
// // //                       color: const Color(0xFF0F2A1D).withOpacity(0.3),
// // //                     ),
// // //                     const SizedBox(height: 20),
// // //                     Text(
// // //                       'No packages available',
// // //                       style: const TextStyle(
// // //                         fontSize: 20,
// // //                         fontWeight: FontWeight.w800,
// // //                         color: Color(0xFF0F2A1D),
// // //                         fontFamily: 'Poppins',
// // //                       ),
// // //                     ),
// // //                     const SizedBox(height: 10),
// // //                     Text(
// // //                       'Check back later for exciting travel packages',
// // //                       style: TextStyle(
// // //                         fontSize: 14,
// // //                         color: const Color(0xFF0F2A1D).withOpacity(0.6),
// // //                         fontFamily: 'Poppins',
// // //                         fontWeight: FontWeight.w600,
// // //                       ),
// // //                     ),
// // //                   ],
// // //                 ),
// // //               );
// // //             } else {
// // //               return ListView.builder(
// // //                 padding: const EdgeInsets.all(16),
// // //                 itemCount: snapshot.data.length,
// // //                 itemBuilder: (BuildContext context, int index) {
// // //                   var i = snapshot.data![index];
// // //                   bool isExpanded = _expandedStates[index] ?? false;
// // //                   bool isLongDescription = i.package_details.toString().length > 150;
// // //                   bool guide_no = i.guide_no.toString().length > 150;
// // //
// // //                   // Create list of images for this package
// // //                   List<String> packageImages = [
// // //                     i.photo1.toString(),
// // //                     i.photo2.toString(),
// // //                     i.photo3.toString(),
// // //                   ];
// // //
// // //                   return Padding(
// // //                     padding: const EdgeInsets.only(bottom: 16),
// // //                     child: Card(
// // //                       elevation: 4,
// // //                       shape: RoundedRectangleBorder(
// // //                         borderRadius: BorderRadius.circular(20),
// // //                       ),
// // //                       child: Column(
// // //                         crossAxisAlignment: CrossAxisAlignment.start,
// // //                         children: [
// // //                           // Header with gradient
// // //                           Container(
// // //                             decoration: const BoxDecoration(
// // //                               gradient: LinearGradient(
// // //                                 colors: [Color(0xFF0F2A1D), Color(0xFF1A3F2B)],
// // //                                 begin: Alignment.topLeft,
// // //                                 end: Alignment.bottomRight,
// // //                               ),
// // //                               borderRadius: BorderRadius.only(
// // //                                 topLeft: Radius.circular(20),
// // //                                 topRight: Radius.circular(20),
// // //                               ),
// // //                             ),
// // //                             padding: const EdgeInsets.all(16),
// // //                             child: Row(
// // //                               children: [
// // //                                 Container(
// // //                                   padding: const EdgeInsets.all(8),
// // //                                   decoration: BoxDecoration(
// // //                                     color: Colors.white.withOpacity(0.2),
// // //                                     borderRadius: BorderRadius.circular(10),
// // //                                   ),
// // //                                   child: const Icon(
// // //                                     Icons.card_travel,
// // //                                     color: Colors.white,
// // //                                     size: 20,
// // //                                   ),
// // //                                 ),
// // //                                 const SizedBox(width: 12),
// // //                                 Expanded(
// // //                                   child: Text(
// // //                                     i.title.toString(),
// // //                                     style: const TextStyle(
// // //                                       color: Colors.white,
// // //                                       fontSize: 20,
// // //                                       fontWeight: FontWeight.w800,
// // //                                       fontFamily: 'Poppins',
// // //                                     ),
// // //                                   ),
// // //                                 ),
// // //                               ],
// // //                             ),
// // //                           ),
// // //
// // //                           Padding(
// // //                             padding: const EdgeInsets.all(16),
// // //                             child: Column(
// // //                               crossAxisAlignment: CrossAxisAlignment.start,
// // //                               children: [
// // //                                 // Company Name Badge
// // //                                 Container(
// // //                                   padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
// // //                                   decoration: BoxDecoration(
// // //                                     color: const Color(0xFF0F2A1D).withOpacity(0.1),
// // //                                     borderRadius: BorderRadius.circular(10),
// // //                                   ),
// // //                                   child: Row(
// // //                                     mainAxisSize: MainAxisSize.min,
// // //                                     children: [
// // //                                       const Icon(
// // //                                         Icons.business,
// // //                                         size: 16,
// // //                                         color: Color(0xFF0F2A1D),
// // //                                       ),
// // //                                       const SizedBox(width: 8),
// // //                                       Text(
// // //                                         i.name.toString(),
// // //                                         style: const TextStyle(
// // //                                           fontSize: 14,
// // //                                           fontWeight: FontWeight.w800,
// // //                                           color: Color(0xFF0F2A1D),
// // //                                           fontFamily: 'Poppins',
// // //                                         ),
// // //                                       ),
// // //                                     ],
// // //                                   ),
// // //                                 ),
// // //
// // //                                 const SizedBox(height: 16),
// // //
// // //                                 // Category
// // //                                 _buildInfoRow(Icons.category, 'Category', i.category.toString()),
// // //
// // //                                 const SizedBox(height: 12),
// // //
// // //                                 // Amount with premium styling
// // //                                 Container(
// // //                                   padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
// // //                                   decoration: BoxDecoration(
// // //                                     gradient: LinearGradient(
// // //                                       colors: [
// // //                                         const Color(0xFF0F2A1D).withOpacity(0.1),
// // //                                         const Color(0xFFE3EED4).withOpacity(0.5),
// // //                                       ],
// // //                                       begin: Alignment.topLeft,
// // //                                       end: Alignment.bottomRight,
// // //                                     ),
// // //                                     borderRadius: BorderRadius.circular(15),
// // //                                     border: Border.all(
// // //                                       color: const Color(0xFF0F2A1D).withOpacity(0.3),
// // //                                     ),
// // //                                   ),
// // //                                   child: Row(
// // //                                     mainAxisSize: MainAxisSize.min,
// // //                                     children: [
// // //                                       const Icon(
// // //                                         Icons.currency_rupee,
// // //                                         size: 22,
// // //                                         color: Color(0xFF0F2A1D),
// // //                                       ),
// // //                                       const SizedBox(width: 4),
// // //                                       Text(
// // //                                         i.amount.toString(),
// // //                                         style: const TextStyle(
// // //                                           fontSize: 24,
// // //                                           fontWeight: FontWeight.w900,
// // //                                           color: Color(0xFF0F2A1D),
// // //                                           fontFamily: 'Poppins',
// // //                                         ),
// // //                                       ),
// // //                                       const Text(
// // //                                         ' / person',
// // //                                         style: TextStyle(
// // //                                           fontSize: 14,
// // //                                           color: Color(0xFF0F2A1D),
// // //                                           fontWeight: FontWeight.w600,
// // //                                           fontFamily: 'Poppins',
// // //                                         ),
// // //                                       ),
// // //                                     ],
// // //                                   ),
// // //                                 ),
// // //
// // //                                 const SizedBox(height: 20),
// // //
// // //                                 // Package Details Section - Enhanced Styling with Expandable Content
// // //                                 Container(
// // //                                   width: double.infinity,
// // //                                   padding: const EdgeInsets.all(18),
// // //                                   decoration: BoxDecoration(
// // //                                     gradient: LinearGradient(
// // //                                       begin: Alignment.topLeft,
// // //                                       end: Alignment.bottomRight,
// // //                                       colors: [
// // //                                         const Color(0xFF0F2A1D).withOpacity(0.03),
// // //                                         const Color(0xFFE3EED4).withOpacity(0.4),
// // //                                       ],
// // //                                     ),
// // //                                     borderRadius: BorderRadius.circular(18),
// // //                                     border: Border.all(
// // //                                       color: const Color(0xFF0F2A1D).withOpacity(0.15),
// // //                                       width: 1.5,
// // //                                     ),
// // //                                     boxShadow: [
// // //                                       BoxShadow(
// // //                                         color: const Color(0xFF0F2A1D).withOpacity(0.05),
// // //                                         blurRadius: 10,
// // //                                         offset: const Offset(0, 4),
// // //                                       ),
// // //                                     ],
// // //                                   ),
// // //                                   child: Column(
// // //                                     crossAxisAlignment: CrossAxisAlignment.start,
// // //                                     children: [
// // //                                       // Title with icon
// // //                                       Row(
// // //                                         children: [
// // //                                           Container(
// // //                                             padding: const EdgeInsets.all(6),
// // //                                             decoration: BoxDecoration(
// // //                                               color: const Color(0xFF0F2A1D).withOpacity(0.1),
// // //                                               borderRadius: BorderRadius.circular(8),
// // //                                             ),
// // //                                             child: const Icon(
// // //                                               Icons.description_outlined,
// // //                                               size: 18,
// // //                                               color: Color(0xFF0F2A1D),
// // //                                             ),
// // //                                           ),
// // //                                           const SizedBox(width: 10),
// // //                                           const Text(
// // //                                             'Package Details',
// // //                                             style: TextStyle(
// // //                                               fontSize: 18,
// // //                                               fontWeight: FontWeight.w900,
// // //                                               color: Color(0xFF0F2A1D),
// // //                                               fontFamily: 'Poppins',
// // //                                               letterSpacing: 0.5,
// // //                                             ),
// // //                                           ),
// // //                                         ],
// // //                                       ),
// // //
// // //                                       const SizedBox(height: 16),
// // //
// // //                                       // Description with expandable content
// // //                                       Container(
// // //                                         padding: const EdgeInsets.symmetric(horizontal: 4),
// // //                                         child: Column(
// // //                                           crossAxisAlignment: CrossAxisAlignment.start,
// // //                                           children: [
// // //                                             Text(
// // //                                               isExpanded
// // //                                                   ? i.package_details.toString()
// // //                                                   : (isLongDescription
// // //                                                   ? '${i.package_details.toString().substring(0, 150)}...'
// // //                                                   : i.package_details.toString()),
// // //                                               style: const TextStyle(
// // //                                                 fontSize: 15,
// // //                                                 color: Color(0xFF0F2A1D),
// // //                                                 fontFamily: 'Poppins',
// // //                                                 fontWeight: FontWeight.w700,
// // //                                                 height: 1.7,
// // //                                                 letterSpacing: 0.3,
// // //                                               ),
// // //                                             ),
// // //
// // //                                             if (isLongDescription)
// // //                                               Padding(
// // //                                                 padding: const EdgeInsets.only(top: 12),
// // //                                                 child: GestureDetector(
// // //                                                   onTap: () => _toggleExpand(index),
// // //                                                   child: Container(
// // //                                                     padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
// // //                                                     decoration: BoxDecoration(
// // //                                                       color: const Color(0xFF0F2A1D).withOpacity(0.1),
// // //                                                       borderRadius: BorderRadius.circular(30),
// // //                                                     ),
// // //                                                     child: Row(
// // //                                                       mainAxisSize: MainAxisSize.min,
// // //                                                       children: [
// // //                                                         Text(
// // //                                                           isExpanded ? 'Show Less' : 'View More',
// // //                                                           style: const TextStyle(
// // //                                                             color: Color(0xFF0F2A1D),
// // //                                                             fontSize: 13,
// // //                                                             fontWeight: FontWeight.w800,
// // //                                                             fontFamily: 'Poppins',
// // //                                                           ),
// // //                                                         ),
// // //                                                         const SizedBox(width: 6),
// // //                                                         Icon(
// // //                                                           isExpanded ? Icons.expand_less : Icons.expand_more,
// // //                                                           size: 16,
// // //                                                           color: const Color(0xFF0F2A1D),
// // //                                                         ),
// // //                                                       ],
// // //                                                     ),
// // //                                                   ),
// // //                                                 ),
// // //                                               ),
// // //                                           ],
// // //                                         ),
// // //                                       ),
// // //                                     ],
// // //                                   ),
// // //                                 ),
// // //
// // //                                 const SizedBox(height: 20),
// // //
// // //                                 // Photo Gallery Title
// // //                                 Row(
// // //                                   children: [
// // //                                     Container(
// // //                                       padding: const EdgeInsets.all(6),
// // //                                       decoration: BoxDecoration(
// // //                                         color: const Color(0xFF0F2A1D).withOpacity(0.1),
// // //                                         borderRadius: BorderRadius.circular(8),
// // //                                       ),
// // //                                       child: const Icon(
// // //                                         Icons.photo_library_outlined,
// // //                                         size: 18,
// // //                                         color: Color(0xFF0F2A1D),
// // //                                       ),
// // //                                     ),
// // //                                     const SizedBox(width: 10),
// // //                                     const Text(
// // //                                       'Gallery',
// // //                                       style: TextStyle(
// // //                                         fontSize: 18,
// // //                                         fontWeight: FontWeight.w900,
// // //                                         color: Color(0xFF0F2A1D),
// // //                                         fontFamily: 'Poppins',
// // //                                       ),
// // //                                     ),
// // //                                   ],
// // //                                 ),
// // //
// // //                                 const SizedBox(height: 12),
// // //
// // //                                 // Photo Gallery - Horizontal Scroll
// // //                                 SingleChildScrollView(
// // //                                   scrollDirection: Axis.horizontal,
// // //                                   child: Row(
// // //                                     children: [
// // //                                       _buildGalleryImage(i.photo1.toString(), 0, packageImages, context),
// // //                                       const SizedBox(width: 12),
// // //                                       _buildGalleryImage(i.photo2.toString(), 1, packageImages, context),
// // //                                       const SizedBox(width: 12),
// // //                                       _buildGalleryImage(i.photo3.toString(), 2, packageImages, context),
// // //                                     ],
// // //                                   ),
// // //                                 ),
// // //
// // //                                 const SizedBox(height: 20),
// // //
// // //                                 // Action Buttons
// // //                                 Row(
// // //                                   children: [
// // //                                     Expanded(
// // //                                       child: ElevatedButton(
// // //                                         onPressed: () async {
// // //                                           SharedPreferences sh = await SharedPreferences.getInstance();
// // //                                           sh.setString('ownid', i.id.toString());
// // //                                           Navigator.push(
// // //                                             context,
// // //                                             MaterialPageRoute(builder: (context) => booking()),
// // //                                           );
// // //                                         },
// // //                                         style: ElevatedButton.styleFrom(
// // //                                           backgroundColor: const Color(0xFF0F2A1D),
// // //                                           foregroundColor: Colors.white,
// // //                                           padding: const EdgeInsets.symmetric(vertical: 16),
// // //                                           shape: RoundedRectangleBorder(
// // //                                             borderRadius: BorderRadius.circular(15),
// // //                                           ),
// // //                                           elevation: 6,
// // //                                           shadowColor: const Color(0xFF0F2A1D).withOpacity(0.5),
// // //                                         ),
// // //                                         child: Row(
// // //                                           mainAxisAlignment: MainAxisAlignment.center,
// // //                                           children: const [
// // //                                             Icon(Icons.book_online, size: 20),
// // //                                             SizedBox(width: 8),
// // //                                             Text(
// // //                                               'BOOK NOW',
// // //                                               style: TextStyle(
// // //                                                 fontSize: 15,
// // //                                                 fontWeight: FontWeight.w900,
// // //                                                 fontFamily: 'Poppins',
// // //                                                 letterSpacing: 0.5,
// // //                                               ),
// // //                                             ),
// // //                                           ],
// // //                                         ),
// // //                                       ),
// // //                                     ),
// // //                                     const SizedBox(width: 12),
// // //                                     Expanded(
// // //                                       child: OutlinedButton(
// // //                                         onPressed: () async {
// // //                                           SharedPreferences sh = await SharedPreferences.getInstance();
// // //                                           sh.setString('oid', i.id.toString());
// // //                                           Navigator.push(
// // //                                             context,
// // //                                             MaterialPageRoute(builder: (context) => view_extradetails()),
// // //                                           );
// // //                                         },
// // //                                         style: OutlinedButton.styleFrom(
// // //                                           side: const BorderSide(color: Color(0xFF0F2A1D), width: 2),
// // //                                           foregroundColor: const Color(0xFF0F2A1D),
// // //                                           padding: const EdgeInsets.symmetric(vertical: 16),
// // //                                           shape: RoundedRectangleBorder(
// // //                                             borderRadius: BorderRadius.circular(15),
// // //                                           ),
// // //                                         ),
// // //                                         child: Row(
// // //                                           mainAxisAlignment: MainAxisAlignment.center,
// // //                                           children: const [
// // //                                             Icon(Icons.info_outline, size: 20),
// // //                                             SizedBox(width: 8),
// // //                                             Text(
// // //                                               'DETAILS',
// // //                                               style: TextStyle(
// // //                                                 fontSize: 15,
// // //                                                 fontWeight: FontWeight.w900,
// // //                                                 fontFamily: 'Poppins',
// // //                                               ),
// // //                                             ),
// // //                                           ],
// // //                                         ),
// // //                                       ),
// // //                                     ),
// // //                                   ],
// // //                                 ),
// // //                               ],
// // //                             ),
// // //                           ),
// // //                         ],
// // //                       ),
// // //                     ),
// // //                   );
// // //                 },
// // //               );
// // //             }
// // //           },
// // //         ),
// // //       ),
// // //     );
// // //   }
// // //
// // //   Widget _buildInfoRow(IconData icon, String label, String value) {
// // //     return Row(
// // //       crossAxisAlignment: CrossAxisAlignment.start,
// // //       children: [
// // //         Icon(
// // //           icon,
// // //           size: 18,
// // //           color: const Color(0xFF0F2A1D).withOpacity(0.7),
// // //         ),
// // //         const SizedBox(width: 12),
// // //         SizedBox(
// // //           width: 80,
// // //           child: Text(
// // //             label,
// // //             style: const TextStyle(
// // //               fontWeight: FontWeight.w800,
// // //               color: Color(0xFF0F2A1D),
// // //               fontSize: 14,
// // //               fontFamily: 'Poppins',
// // //             ),
// // //           ),
// // //         ),
// // //         const Text(
// // //           ':',
// // //           style: TextStyle(
// // //             color: Color(0xFF0F2A1D),
// // //             fontWeight: FontWeight.w800,
// // //           ),
// // //         ),
// // //         const SizedBox(width: 12),
// // //         Expanded(
// // //           child: Text(
// // //             value,
// // //             style: const TextStyle(
// // //               fontSize: 14,
// // //               color: Color(0xFF0F2A1D),
// // //               fontWeight: FontWeight.w700,
// // //               fontFamily: 'Poppins',
// // //             ),
// // //             softWrap: true,
// // //           ),
// // //         ),
// // //       ],
// // //     );
// // //   }
// // //
// // //   Widget _buildGalleryImage(String imageUrl, int index, List<String> allImages, BuildContext context) {
// // //     return GestureDetector(
// // //       onTap: () => _showEnlargedImage(context, allImages, index),
// // //       child: Container(
// // //         width: 160,
// // //         height: 130,
// // //         decoration: BoxDecoration(
// // //           borderRadius: BorderRadius.circular(18),
// // //           boxShadow: [
// // //             BoxShadow(
// // //               color: const Color(0xFF0F2A1D).withOpacity(0.2),
// // //               blurRadius: 10,
// // //               offset: const Offset(0, 5),
// // //             ),
// // //           ],
// // //         ),
// // //         child: Stack(
// // //           children: [
// // //             ClipRRect(
// // //               borderRadius: BorderRadius.circular(18),
// // //               child: Image.network(
// // //                 imageUrl,
// // //                 fit: BoxFit.cover,
// // //                 width: double.infinity,
// // //                 height: double.infinity,
// // //                 loadingBuilder: (BuildContext context, Widget child, ImageChunkEvent? loadingProgress) {
// // //                   if (loadingProgress == null) return child;
// // //                   return Container(
// // //                     color: const Color(0xFFE3EED4).withOpacity(0.3),
// // //                     child: Center(
// // //                       child: CircularProgressIndicator(
// // //                         value: loadingProgress.expectedTotalBytes != null
// // //                             ? loadingProgress.cumulativeBytesLoaded / loadingProgress.expectedTotalBytes!
// // //                             : null,
// // //                         color: const Color(0xFF0F2A1D),
// // //                       ),
// // //                     ),
// // //                   );
// // //                 },
// // //                 errorBuilder: (BuildContext context, Object error, StackTrace? stackTrace) {
// // //                   return Container(
// // //                     color: const Color(0xFFE3EED4).withOpacity(0.3),
// // //                     child: Center(
// // //                       child: Icon(
// // //                         Icons.broken_image,
// // //                         size: 40,
// // //                         color: const Color(0xFF0F2A1D).withOpacity(0.3),
// // //                       ),
// // //                     ),
// // //                   );
// // //                 },
// // //               ),
// // //             ),
// // //             // Enlarge icon overlay
// // //             Positioned(
// // //               bottom: 8,
// // //               right: 8,
// // //               child: Container(
// // //                 padding: const EdgeInsets.all(6),
// // //                 decoration: BoxDecoration(
// // //                   color: const Color(0xFF0F2A1D).withOpacity(0.7),
// // //                   borderRadius: BorderRadius.circular(20),
// // //                 ),
// // //                 child: const Icon(
// // //                   Icons.open_in_full,
// // //                   color: Colors.white,
// // //                   size: 16,
// // //                 ),
// // //               ),
// // //             ),
// // //           ],
// // //         ),
// // //       ),
// // //     );
// // //   }
// // // }
// // //
// // // class Joke {
// // //   final String id;
// // //   final String title;
// // //   final String category;
// // //   final String name;
// // //   final String package_details;
// // //   final String guide_no;
// // //   final String amount;
// // //   final String photo1;
// // //   final String photo2;
// // //   final String photo3;
// // //
// // //   Joke(this.id, this.title, this.category, this.name, this.package_details,this.guide_no, this.amount, this.photo1, this.photo2, this.photo3);
// // // }
// //
// // //
// // //
// // // import 'dart:convert';
// // // import 'package:final_destination/booking.dart';
// // // import 'package:final_destination/view_extradetails.dart';
// // // import 'package:final_destination/home.dart';
// // // import 'package:flutter/material.dart';
// // // import 'package:http/http.dart' as http;
// // // import 'package:shared_preferences/shared_preferences.dart';
// // //
// // // void main() {
// // //   runApp(viewpackage());
// // // }
// // //
// // // class viewpackage extends StatelessWidget {
// // //   const viewpackage({Key? key}) : super(key: key);
// // //
// // //   @override
// // //   Widget build(BuildContext context) {
// // //     return MaterialApp(
// // //       debugShowCheckedModeBanner: false,
// // //       theme: ThemeData(
// // //         primaryColor: const Color(0xFF0F2A1D),
// // //         scaffoldBackgroundColor: const Color(0xFFE3EED4),
// // //         fontFamily: 'Poppins',
// // //       ),
// // //       home: viewpackagesub(),
// // //     );
// // //   }
// // // }
// // //
// // // class viewpackagesub extends StatefulWidget {
// // //   const viewpackagesub({Key? key}) : super(key: key);
// // //
// // //   @override
// // //   State<viewpackagesub> createState() => _viewpackagesubState();
// // // }
// // //
// // // class _viewpackagesubState extends State<viewpackagesub> {
// // //   // Map to track expanded state for each package
// // //   Map<int, bool> _expandedStates = {};
// // //
// // //   Future<List<Joke>> _getJokes() async {
// // //     SharedPreferences prefs = await SharedPreferences.getInstance();
// // //     String b = prefs.getString("lid").toString();
// // //     String foodimage = "";
// // //     var data = await http.post(
// // //       Uri.parse(prefs.getString("ip").toString() + "/userviewpackage"),
// // //       body: {"id": b},
// // //     );
// // //
// // //     var jsonData = json.decode(data.body);
// // //     List<Joke> jokes = [];
// // //     for (var joke in jsonData["message"]) {
// // //       print(joke);
// // //       Joke newJoke = Joke(
// // //         joke["id"].toString(),
// // //         joke["title"].toString(),
// // //         joke["category"].toString(),
// // //         joke["name"].toString(),
// // //         joke["package_details"],
// // //         joke["guide_no"].toString(),
// // //         joke["amount"].toString(),
// // //         prefs.getString('ip').toString() + joke["photo1"].toString(),
// // //         prefs.getString('ip').toString() + joke["photo2"].toString(),
// // //         prefs.getString('ip').toString() + joke["photo3"].toString(),
// // //       );
// // //       jokes.add(newJoke);
// // //     }
// // //     return jokes;
// // //   }
// // //
// // //   void _toggleExpand(int index) {
// // //     setState(() {
// // //       _expandedStates[index] = !(_expandedStates[index] ?? false);
// // //     });
// // //   }
// // //
// // //   void _showEnlargedImage(BuildContext context, List<String> images, int initialIndex) {
// // //     // Create a controller for the PageView
// // //     PageController _pageController = PageController(initialPage: initialIndex);
// // //     int currentIndex = initialIndex;
// // //
// // //     showDialog(
// // //       context: context,
// // //       builder: (BuildContext context) {
// // //         return StatefulBuilder(
// // //           builder: (context, setState) {
// // //             return Dialog(
// // //               backgroundColor: Colors.transparent,
// // //               insetPadding: EdgeInsets.zero,
// // //               child: Container(
// // //                 width: double.infinity,
// // //                 height: double.infinity,
// // //                 color: Colors.transparent,
// // //                 child: Stack(
// // //                   children: [
// // //                     // PageView for swipe navigation
// // //                     PageView.builder(
// // //                       controller: _pageController,
// // //                       itemCount: images.length,
// // //                       onPageChanged: (index) {
// // //                         setState(() {
// // //                           currentIndex = index;
// // //                         });
// // //                       },
// // //                       itemBuilder: (context, index) {
// // //                         return Center(
// // //                           child: GestureDetector(
// // //                             onTap: () => Navigator.pop(context),
// // //                             child: Container(
// // //                               width: double.infinity,
// // //                               height: double.infinity,
// // //                               child: Image.network(
// // //                                 images[index],
// // //                                 fit: BoxFit.contain,
// // //                                 loadingBuilder: (BuildContext context, Widget child, ImageChunkEvent? loadingProgress) {
// // //                                   if (loadingProgress == null) return child;
// // //                                   return Center(
// // //                                     child: CircularProgressIndicator(
// // //                                       value: loadingProgress.expectedTotalBytes != null
// // //                                           ? loadingProgress.cumulativeBytesLoaded / loadingProgress.expectedTotalBytes!
// // //                                           : null,
// // //                                       color: const Color(0xFF0F2A1D),
// // //                                     ),
// // //                                   );
// // //                                 },
// // //                                 errorBuilder: (BuildContext context, Object error, StackTrace? stackTrace) {
// // //                                   return Center(
// // //                                     child: Column(
// // //                                       mainAxisAlignment: MainAxisAlignment.center,
// // //                                       children: [
// // //                                         Icon(
// // //                                           Icons.broken_image,
// // //                                           size: 60,
// // //                                           color: const Color(0xFF0F2A1D).withOpacity(0.3),
// // //                                         ),
// // //                                         const SizedBox(height: 10),
// // //                                         Text(
// // //                                           'Failed to load image',
// // //                                           style: TextStyle(
// // //                                             color: const Color(0xFF0F2A1D).withOpacity(0.7),
// // //                                             fontFamily: 'Poppins',
// // //                                           ),
// // //                                         ),
// // //                                       ],
// // //                                     ),
// // //                                   );
// // //                                 },
// // //                               ),
// // //                             ),
// // //                           ),
// // //                         );
// // //                       },
// // //                     ),
// // //
// // //                     // Image counter
// // //                     Positioned(
// // //                       top: 40,
// // //                       left: 20,
// // //                       child: Container(
// // //                         padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
// // //                         decoration: BoxDecoration(
// // //                           color: const Color(0xFF0F2A1D).withOpacity(0.1),
// // //                           borderRadius: BorderRadius.circular(20),
// // //                           border: Border.all(
// // //                             color: const Color(0xFF0F2A1D).withOpacity(0.2),
// // //                           ),
// // //                         ),
// // //                         child: Text(
// // //                           '${currentIndex + 1} / ${images.length}',
// // //                           style: const TextStyle(
// // //                             color: Color(0xFF0F2A1D),
// // //                             fontSize: 14,
// // //                             fontWeight: FontWeight.w600,
// // //                             fontFamily: 'Poppins',
// // //                           ),
// // //                         ),
// // //                       ),
// // //                     ),
// // //
// // //                     // Close button
// // //                     Positioned(
// // //                       top: 40,
// // //                       right: 20,
// // //                       child: GestureDetector(
// // //                         onTap: () => Navigator.pop(context),
// // //                         child: Container(
// // //                           padding: const EdgeInsets.all(12),
// // //                           decoration: BoxDecoration(
// // //                             color: const Color(0xFF0F2A1D).withOpacity(0.1),
// // //                             borderRadius: BorderRadius.circular(30),
// // //                             border: Border.all(
// // //                               color: const Color(0xFF0F2A1D).withOpacity(0.2),
// // //                             ),
// // //                           ),
// // //                           child: const Icon(
// // //                             Icons.close,
// // //                             color: Color(0xFF0F2A1D),
// // //                             size: 24,
// // //                           ),
// // //                         ),
// // //                       ),
// // //                     ),
// // //                   ],
// // //                 ),
// // //               ),
// // //             );
// // //           },
// // //         );
// // //       },
// // //     );
// // //   }
// // //
// // //   @override
// // //   Widget build(BuildContext context) {
// // //     return Scaffold(
// // //       backgroundColor: const Color(0xFFE3EED4),
// // //       appBar: AppBar(
// // //         backgroundColor: Colors.white,
// // //         elevation: 2,
// // //         title: Text(
// // //           'Travel Packages',
// // //           style: const TextStyle(
// // //             fontSize: 24,
// // //             fontWeight: FontWeight.w800,
// // //             color: Color(0xFF0F2A1D),
// // //             fontFamily: 'Poppins',
// // //             letterSpacing: 1,
// // //           ),
// // //         ),
// // //         centerTitle: true,
// // //         leading: IconButton(
// // //           icon: const Icon(Icons.arrow_back_ios, color: Color(0xFF0F2A1D), size: 22),
// // //           onPressed: () => Navigator.push(
// // //             context,
// // //             MaterialPageRoute(builder: (context) => UserHomeApp()),
// // //           ),
// // //         ),
// // //       ),
// // //       body: Container(
// // //         child: FutureBuilder(
// // //           future: _getJokes(),
// // //           builder: (BuildContext context, AsyncSnapshot snapshot) {
// // //             if (snapshot.data == null) {
// // //               return Center(
// // //                 child: Column(
// // //                   mainAxisAlignment: MainAxisAlignment.center,
// // //                   children: [
// // //                     CircularProgressIndicator(
// // //                       color: const Color(0xFF0F2A1D),
// // //                     ),
// // //                     const SizedBox(height: 20),
// // //                     Text(
// // //                       "Loading packages...",
// // //                       style: TextStyle(
// // //                         color: const Color(0xFF0F2A1D),
// // //                         fontSize: 16,
// // //                         fontFamily: 'Poppins',
// // //                         fontWeight: FontWeight.w600,
// // //                       ),
// // //                     ),
// // //                   ],
// // //                 ),
// // //               );
// // //             } else if (snapshot.data.length == 0) {
// // //               return Center(
// // //                 child: Column(
// // //                   mainAxisAlignment: MainAxisAlignment.center,
// // //                   children: [
// // //                     Icon(
// // //                       Icons.card_travel_outlined,
// // //                       size: 100,
// // //                       color: const Color(0xFF0F2A1D).withOpacity(0.3),
// // //                     ),
// // //                     const SizedBox(height: 20),
// // //                     Text(
// // //                       'No packages available',
// // //                       style: const TextStyle(
// // //                         fontSize: 20,
// // //                         fontWeight: FontWeight.w800,
// // //                         color: Color(0xFF0F2A1D),
// // //                         fontFamily: 'Poppins',
// // //                       ),
// // //                     ),
// // //                     const SizedBox(height: 10),
// // //                     Text(
// // //                       'Check back later for exciting travel packages',
// // //                       style: TextStyle(
// // //                         fontSize: 14,
// // //                         color: const Color(0xFF0F2A1D).withOpacity(0.6),
// // //                         fontFamily: 'Poppins',
// // //                         fontWeight: FontWeight.w600,
// // //                       ),
// // //                     ),
// // //                   ],
// // //                 ),
// // //               );
// // //             } else {
// // //               return ListView.builder(
// // //                 padding: const EdgeInsets.all(16),
// // //                 itemCount: snapshot.data.length,
// // //                 itemBuilder: (BuildContext context, int index) {
// // //                   var i = snapshot.data![index];
// // //                   bool isExpanded = _expandedStates[index] ?? false;
// // //                   bool isLongDescription = i.package_details.toString().length > 150;
// // //
// // //                   // Create list of images for this package
// // //                   List<String> packageImages = [
// // //                     i.photo1.toString(),
// // //                     i.photo2.toString(),
// // //                     i.photo3.toString(),
// // //                   ];
// // //
// // //                   return Padding(
// // //                     padding: const EdgeInsets.only(bottom: 16),
// // //                     child: Card(
// // //                       elevation: 4,
// // //                       shape: RoundedRectangleBorder(
// // //                         borderRadius: BorderRadius.circular(20),
// // //                       ),
// // //                       child: Column(
// // //                         crossAxisAlignment: CrossAxisAlignment.start,
// // //                         children: [
// // //                           // Header with gradient
// // //                           Container(
// // //                             decoration: const BoxDecoration(
// // //                               gradient: LinearGradient(
// // //                                 colors: [Color(0xFF0F2A1D), Color(0xFF1A3F2B)],
// // //                                 begin: Alignment.topLeft,
// // //                                 end: Alignment.bottomRight,
// // //                               ),
// // //                               borderRadius: BorderRadius.only(
// // //                                 topLeft: Radius.circular(20),
// // //                                 topRight: Radius.circular(20),
// // //                               ),
// // //                             ),
// // //                             padding: const EdgeInsets.all(16),
// // //                             child: Row(
// // //                               children: [
// // //                                 Container(
// // //                                   padding: const EdgeInsets.all(8),
// // //                                   decoration: BoxDecoration(
// // //                                     color: Colors.white.withOpacity(0.2),
// // //                                     borderRadius: BorderRadius.circular(10),
// // //                                   ),
// // //                                   child: const Icon(
// // //                                     Icons.card_travel,
// // //                                     color: Colors.white,
// // //                                     size: 20,
// // //                                   ),
// // //                                 ),
// // //                                 const SizedBox(width: 12),
// // //                                 Expanded(
// // //                                   child: Text(
// // //                                     i.title.toString(),
// // //                                     style: const TextStyle(
// // //                                       color: Colors.white,
// // //                                       fontSize: 20,
// // //                                       fontWeight: FontWeight.w800,
// // //                                       fontFamily: 'Poppins',
// // //                                     ),
// // //                                   ),
// // //                                 ),
// // //                               ],
// // //                             ),
// // //                           ),
// // //
// // //                           Padding(
// // //                             padding: const EdgeInsets.all(16),
// // //                             child: Column(
// // //                               crossAxisAlignment: CrossAxisAlignment.start,
// // //                               children: [
// // //                                 // Company Name Badge
// // //                                 Container(
// // //                                   padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
// // //                                   decoration: BoxDecoration(
// // //                                     color: const Color(0xFF0F2A1D).withOpacity(0.1),
// // //                                     borderRadius: BorderRadius.circular(10),
// // //                                   ),
// // //                                   child: Row(
// // //                                     mainAxisSize: MainAxisSize.min,
// // //                                     children: [
// // //                                       const Icon(
// // //                                         Icons.business,
// // //                                         size: 16,
// // //                                         color: Color(0xFF0F2A1D),
// // //                                       ),
// // //                                       const SizedBox(width: 8),
// // //                                       Text(
// // //                                         i.name.toString(),
// // //                                         style: const TextStyle(
// // //                                           fontSize: 14,
// // //                                           fontWeight: FontWeight.w800,
// // //                                           color: Color(0xFF0F2A1D),
// // //                                           fontFamily: 'Poppins',
// // //                                         ),
// // //                                       ),
// // //                                     ],
// // //                                   ),
// // //                                 ),
// // //
// // //                                 const SizedBox(height: 16),
// // //
// // //                                 // Category
// // //                                 _buildInfoRow(Icons.category, 'Category', i.category.toString()),
// // //
// // //                                 const SizedBox(height: 12),
// // //
// // //                                 // Guide Number
// // //                                 _buildInfoRow(Icons.assignment_ind, 'Guide No', i.guide_no.toString()),
// // //
// // //                                 const SizedBox(height: 12),
// // //
// // //                                 // Amount with premium styling
// // //                                 Container(
// // //                                   padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
// // //                                   decoration: BoxDecoration(
// // //                                     gradient: LinearGradient(
// // //                                       colors: [
// // //                                         const Color(0xFF0F2A1D).withOpacity(0.1),
// // //                                         const Color(0xFFE3EED4).withOpacity(0.5),
// // //                                       ],
// // //                                       begin: Alignment.topLeft,
// // //                                       end: Alignment.bottomRight,
// // //                                     ),
// // //                                     borderRadius: BorderRadius.circular(15),
// // //                                     border: Border.all(
// // //                                       color: const Color(0xFF0F2A1D).withOpacity(0.3),
// // //                                     ),
// // //                                   ),
// // //                                   child: Row(
// // //                                     mainAxisSize: MainAxisSize.min,
// // //                                     children: [
// // //                                       const Icon(
// // //                                         Icons.currency_rupee,
// // //                                         size: 22,
// // //                                         color: Color(0xFF0F2A1D),
// // //                                       ),
// // //                                       const SizedBox(width: 4),
// // //                                       Text(
// // //                                         i.amount.toString(),
// // //                                         style: const TextStyle(
// // //                                           fontSize: 24,
// // //                                           fontWeight: FontWeight.w900,
// // //                                           color: Color(0xFF0F2A1D),
// // //                                           fontFamily: 'Poppins',
// // //                                         ),
// // //                                       ),
// // //                                       const Text(
// // //                                         ' / person',
// // //                                         style: TextStyle(
// // //                                           fontSize: 14,
// // //                                           color: Color(0xFF0F2A1D),
// // //                                           fontWeight: FontWeight.w600,
// // //                                           fontFamily: 'Poppins',
// // //                                         ),
// // //                                       ),
// // //                                     ],
// // //                                   ),
// // //                                 ),
// // //
// // //                                 const SizedBox(height: 20),
// // //
// // //                                 // Package Details Section - Enhanced Styling with Expandable Content
// // //                                 Container(
// // //                                   width: double.infinity,
// // //                                   padding: const EdgeInsets.all(18),
// // //                                   decoration: BoxDecoration(
// // //                                     gradient: LinearGradient(
// // //                                       begin: Alignment.topLeft,
// // //                                       end: Alignment.bottomRight,
// // //                                       colors: [
// // //                                         const Color(0xFF0F2A1D).withOpacity(0.03),
// // //                                         const Color(0xFFE3EED4).withOpacity(0.4),
// // //                                       ],
// // //                                     ),
// // //                                     borderRadius: BorderRadius.circular(18),
// // //                                     border: Border.all(
// // //                                       color: const Color(0xFF0F2A1D).withOpacity(0.15),
// // //                                       width: 1.5,
// // //                                     ),
// // //                                     boxShadow: [
// // //                                       BoxShadow(
// // //                                         color: const Color(0xFF0F2A1D).withOpacity(0.05),
// // //                                         blurRadius: 10,
// // //                                         offset: const Offset(0, 4),
// // //                                       ),
// // //                                     ],
// // //                                   ),
// // //                                   child: Column(
// // //                                     crossAxisAlignment: CrossAxisAlignment.start,
// // //                                     children: [
// // //                                       // Title with icon
// // //                                       Row(
// // //                                         children: [
// // //                                           Container(
// // //                                             padding: const EdgeInsets.all(6),
// // //                                             decoration: BoxDecoration(
// // //                                               color: const Color(0xFF0F2A1D).withOpacity(0.1),
// // //                                               borderRadius: BorderRadius.circular(8),
// // //                                             ),
// // //                                             child: const Icon(
// // //                                               Icons.description_outlined,
// // //                                               size: 18,
// // //                                               color: Color(0xFF0F2A1D),
// // //                                             ),
// // //                                           ),
// // //                                           const SizedBox(width: 10),
// // //                                           const Text(
// // //                                             'Package Details',
// // //                                             style: TextStyle(
// // //                                               fontSize: 18,
// // //                                               fontWeight: FontWeight.w900,
// // //                                               color: Color(0xFF0F2A1D),
// // //                                               fontFamily: 'Poppins',
// // //                                               letterSpacing: 0.5,
// // //                                             ),
// // //                                           ),
// // //                                         ],
// // //                                       ),
// // //
// // //                                       const SizedBox(height: 16),
// // //
// // //                                       // Description with expandable content
// // //                                       Container(
// // //                                         padding: const EdgeInsets.symmetric(horizontal: 4),
// // //                                         child: Column(
// // //                                           crossAxisAlignment: CrossAxisAlignment.start,
// // //                                           children: [
// // //                                             Text(
// // //                                               isExpanded
// // //                                                   ? i.package_details.toString()
// // //                                                   : (isLongDescription
// // //                                                   ? '${i.package_details.toString().substring(0, 150)}...'
// // //                                                   : i.package_details.toString()),
// // //                                               style: const TextStyle(
// // //                                                 fontSize: 15,
// // //                                                 color: Color(0xFF0F2A1D),
// // //                                                 fontFamily: 'Poppins',
// // //                                                 fontWeight: FontWeight.w700,
// // //                                                 height: 1.7,
// // //                                                 letterSpacing: 0.3,
// // //                                               ),
// // //                                             ),
// // //
// // //                                             if (isLongDescription)
// // //                                               Padding(
// // //                                                 padding: const EdgeInsets.only(top: 12),
// // //                                                 child: GestureDetector(
// // //                                                   onTap: () => _toggleExpand(index),
// // //                                                   child: Container(
// // //                                                     padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
// // //                                                     decoration: BoxDecoration(
// // //                                                       color: const Color(0xFF0F2A1D).withOpacity(0.1),
// // //                                                       borderRadius: BorderRadius.circular(30),
// // //                                                     ),
// // //                                                     child: Row(
// // //                                                       mainAxisSize: MainAxisSize.min,
// // //                                                       children: [
// // //                                                         Text(
// // //                                                           isExpanded ? 'Show Less' : 'View More',
// // //                                                           style: const TextStyle(
// // //                                                             color: Color(0xFF0F2A1D),
// // //                                                             fontSize: 13,
// // //                                                             fontWeight: FontWeight.w800,
// // //                                                             fontFamily: 'Poppins',
// // //                                                           ),
// // //                                                         ),
// // //                                                         const SizedBox(width: 6),
// // //                                                         Icon(
// // //                                                           isExpanded ? Icons.expand_less : Icons.expand_more,
// // //                                                           size: 16,
// // //                                                           color: const Color(0xFF0F2A1D),
// // //                                                         ),
// // //                                                       ],
// // //                                                     ),
// // //                                                   ),
// // //                                                 ),
// // //                                               ),
// // //                                           ],
// // //                                         ),
// // //                                       ),
// // //                                     ],
// // //                                   ),
// // //                                 ),
// // //
// // //                                 const SizedBox(height: 20),
// // //
// // //                                 // Photo Gallery Title
// // //                                 Row(
// // //                                   children: [
// // //                                     Container(
// // //                                       padding: const EdgeInsets.all(6),
// // //                                       decoration: BoxDecoration(
// // //                                         color: const Color(0xFF0F2A1D).withOpacity(0.1),
// // //                                         borderRadius: BorderRadius.circular(8),
// // //                                       ),
// // //                                       child: const Icon(
// // //                                         Icons.photo_library_outlined,
// // //                                         size: 18,
// // //                                         color: Color(0xFF0F2A1D),
// // //                                       ),
// // //                                     ),
// // //                                     const SizedBox(width: 10),
// // //                                     const Text(
// // //                                       'Gallery',
// // //                                       style: TextStyle(
// // //                                         fontSize: 18,
// // //                                         fontWeight: FontWeight.w900,
// // //                                         color: Color(0xFF0F2A1D),
// // //                                         fontFamily: 'Poppins',
// // //                                       ),
// // //                                     ),
// // //                                   ],
// // //                                 ),
// // //
// // //                                 const SizedBox(height: 12),
// // //
// // //                                 // Photo Gallery - Horizontal Scroll
// // //                                 SingleChildScrollView(
// // //                                   scrollDirection: Axis.horizontal,
// // //                                   child: Row(
// // //                                     children: [
// // //                                       _buildGalleryImage(i.photo1.toString(), 0, packageImages, context),
// // //                                       const SizedBox(width: 12),
// // //                                       _buildGalleryImage(i.photo2.toString(), 1, packageImages, context),
// // //                                       const SizedBox(width: 12),
// // //                                       _buildGalleryImage(i.photo3.toString(), 2, packageImages, context),
// // //                                     ],
// // //                                   ),
// // //                                 ),
// // //
// // //                                 const SizedBox(height: 20),
// // //
// // //                                 // Action Buttons
// // //                                 Row(
// // //                                   children: [
// // //                                     Expanded(
// // //                                       child: ElevatedButton(
// // //                                         onPressed: () async {
// // //                                           SharedPreferences sh = await SharedPreferences.getInstance();
// // //                                           sh.setString('ownid', i.id.toString());
// // //                                           Navigator.push(
// // //                                             context,
// // //                                             MaterialPageRoute(builder: (context) => booking()),
// // //                                           );
// // //                                         },
// // //                                         style: ElevatedButton.styleFrom(
// // //                                           backgroundColor: const Color(0xFF0F2A1D),
// // //                                           foregroundColor: Colors.white,
// // //                                           padding: const EdgeInsets.symmetric(vertical: 16),
// // //                                           shape: RoundedRectangleBorder(
// // //                                             borderRadius: BorderRadius.circular(15),
// // //                                           ),
// // //                                           elevation: 6,
// // //                                           shadowColor: const Color(0xFF0F2A1D).withOpacity(0.5),
// // //                                         ),
// // //                                         child: Row(
// // //                                           mainAxisAlignment: MainAxisAlignment.center,
// // //                                           children: const [
// // //                                             Icon(Icons.book_online, size: 20),
// // //                                             SizedBox(width: 8),
// // //                                             Text(
// // //                                               'BOOK NOW',
// // //                                               style: TextStyle(
// // //                                                 fontSize: 15,
// // //                                                 fontWeight: FontWeight.w900,
// // //                                                 fontFamily: 'Poppins',
// // //                                                 letterSpacing: 0.5,
// // //                                               ),
// // //                                             ),
// // //                                           ],
// // //                                         ),
// // //                                       ),
// // //                                     ),
// // //                                     const SizedBox(width: 12),
// // //                                     Expanded(
// // //                                       child: OutlinedButton(
// // //                                         onPressed: () async {
// // //                                           SharedPreferences sh = await SharedPreferences.getInstance();
// // //                                           sh.setString('oid', i.id.toString());
// // //                                           Navigator.push(
// // //                                             context,
// // //                                             MaterialPageRoute(builder: (context) => view_extradetails()),
// // //                                           );
// // //                                         },
// // //                                         style: OutlinedButton.styleFrom(
// // //                                           side: const BorderSide(color: Color(0xFF0F2A1D), width: 2),
// // //                                           foregroundColor: const Color(0xFF0F2A1D),
// // //                                           padding: const EdgeInsets.symmetric(vertical: 16),
// // //                                           shape: RoundedRectangleBorder(
// // //                                             borderRadius: BorderRadius.circular(15),
// // //                                           ),
// // //                                         ),
// // //                                         child: Row(
// // //                                           mainAxisAlignment: MainAxisAlignment.center,
// // //                                           children: const [
// // //                                             Icon(Icons.info_outline, size: 20),
// // //                                             SizedBox(width: 8),
// // //                                             Text(
// // //                                               'DETAILS',
// // //                                               style: TextStyle(
// // //                                                 fontSize: 15,
// // //                                                 fontWeight: FontWeight.w900,
// // //                                                 fontFamily: 'Poppins',
// // //                                               ),
// // //                                             ),
// // //                                           ],
// // //                                         ),
// // //                                       ),
// // //                                     ),
// // //                                   ],
// // //                                 ),
// // //                               ],
// // //                             ),
// // //                           ),
// // //                         ],
// // //                       ),
// // //                     ),
// // //                   );
// // //                 },
// // //               );
// // //             }
// // //           },
// // //         ),
// // //       ),
// // //     );
// // //   }
// // //
// // //   Widget _buildInfoRow(IconData icon, String label, String value) {
// // //     return Row(
// // //       crossAxisAlignment: CrossAxisAlignment.start,
// // //       children: [
// // //         Icon(
// // //           icon,
// // //           size: 18,
// // //           color: const Color(0xFF0F2A1D).withOpacity(0.7),
// // //         ),
// // //         const SizedBox(width: 12),
// // //         SizedBox(
// // //           width: 80,
// // //           child: Text(
// // //             label,
// // //             style: const TextStyle(
// // //               fontWeight: FontWeight.w800,
// // //               color: Color(0xFF0F2A1D),
// // //               fontSize: 14,
// // //               fontFamily: 'Poppins',
// // //             ),
// // //           ),
// // //         ),
// // //         const Text(
// // //           ':',
// // //           style: TextStyle(
// // //             color: Color(0xFF0F2A1D),
// // //             fontWeight: FontWeight.w800,
// // //           ),
// // //         ),
// // //         const SizedBox(width: 12),
// // //         Expanded(
// // //           child: Text(
// // //             value,
// // //             style: const TextStyle(
// // //               fontSize: 14,
// // //               color: Color(0xFF0F2A1D),
// // //               fontWeight: FontWeight.w700,
// // //               fontFamily: 'Poppins',
// // //             ),
// // //             softWrap: true,
// // //           ),
// // //         ),
// // //       ],
// // //     );
// // //   }
// // //
// // //   Widget _buildGalleryImage(String imageUrl, int index, List<String> allImages, BuildContext context) {
// // //     return GestureDetector(
// // //       onTap: () => _showEnlargedImage(context, allImages, index),
// // //       child: Container(
// // //         width: 160,
// // //         height: 130,
// // //         decoration: BoxDecoration(
// // //           borderRadius: BorderRadius.circular(18),
// // //           boxShadow: [
// // //             BoxShadow(
// // //               color: const Color(0xFF0F2A1D).withOpacity(0.2),
// // //               blurRadius: 10,
// // //               offset: const Offset(0, 5),
// // //             ),
// // //           ],
// // //         ),
// // //         child: Stack(
// // //           children: [
// // //             ClipRRect(
// // //               borderRadius: BorderRadius.circular(18),
// // //               child: Image.network(
// // //                 imageUrl,
// // //                 fit: BoxFit.cover,
// // //                 width: double.infinity,
// // //                 height: double.infinity,
// // //                 loadingBuilder: (BuildContext context, Widget child, ImageChunkEvent? loadingProgress) {
// // //                   if (loadingProgress == null) return child;
// // //                   return Container(
// // //                     color: const Color(0xFFE3EED4).withOpacity(0.3),
// // //                     child: Center(
// // //                       child: CircularProgressIndicator(
// // //                         value: loadingProgress.expectedTotalBytes != null
// // //                             ? loadingProgress.cumulativeBytesLoaded / loadingProgress.expectedTotalBytes!
// // //                             : null,
// // //                         color: const Color(0xFF0F2A1D),
// // //                       ),
// // //                     ),
// // //                   );
// // //                 },
// // //                 errorBuilder: (BuildContext context, Object error, StackTrace? stackTrace) {
// // //                   return Container(
// // //                     color: const Color(0xFFE3EED4).withOpacity(0.3),
// // //                     child: Center(
// // //                       child: Icon(
// // //                         Icons.broken_image,
// // //                         size: 40,
// // //                         color: const Color(0xFF0F2A1D).withOpacity(0.3),
// // //                       ),
// // //                     ),
// // //                   );
// // //                 },
// // //               ),
// // //             ),
// // //             // Enlarge icon overlay
// // //             Positioned(
// // //               bottom: 8,
// // //               right: 8,
// // //               child: Container(
// // //                 padding: const EdgeInsets.all(6),
// // //                 decoration: BoxDecoration(
// // //                   color: const Color(0xFF0F2A1D).withOpacity(0.7),
// // //                   borderRadius: BorderRadius.circular(20),
// // //                 ),
// // //                 child: const Icon(
// // //                   Icons.open_in_full,
// // //                   color: Colors.white,
// // //                   size: 16,
// // //                 ),
// // //               ),
// // //             ),
// // //           ],
// // //         ),
// // //       ),
// // //     );
// // //   }
// // // }
// // //
// // // class Joke {
// // //   final String id;
// // //   final String title;
// // //   final String category;
// // //   final String name;
// // //   final String package_details;
// // //   final String guide_no;
// // //   final String amount;
// // //   final String photo1;
// // //   final String photo2;
// // //   final String photo3;
// // //
// // //   Joke(this.id, this.title, this.category, this.name, this.package_details, this.guide_no, this.amount, this.photo1, this.photo2, this.photo3);
// // // }
// //
// //
//
// //
// //
// // import 'dart:convert';
// // import 'package:final_destination/booking.dart';
// // import 'package:final_destination/send_package_review.dart';
// // import 'package:final_destination/view_extradetails.dart';
// // import 'package:final_destination/view_travel_company.dart';
// // import 'package:final_destination/home.dart';
// // import 'package:flutter/material.dart';
// // import 'package:http/http.dart' as http;
// // import 'package:shared_preferences/shared_preferences.dart';
// //
// // void main() {
// //   runApp(viewpackage());
// // }
// //
// // class viewpackage extends StatelessWidget {
// //   const viewpackage({Key? key}) : super(key: key);
// //
// //   @override
// //   Widget build(BuildContext context) {
// //     return MaterialApp(
// //       debugShowCheckedModeBanner: false,
// //       theme: ThemeData(
// //         primaryColor: const Color(0xFF0F2A1D),
// //         scaffoldBackgroundColor: const Color(0xFFE3EED4),
// //         fontFamily: 'Poppins',
// //       ),
// //       home: viewpackagesub(),
// //     );
// //   }
// // }
// //
// // class viewpackagesub extends StatefulWidget {
// //   const viewpackagesub({Key? key}) : super(key: key);
// //
// //   @override
// //   State<viewpackagesub> createState() => _viewpackagesubState();
// // }
// //
// // class _viewpackagesubState extends State<viewpackagesub> {
// //   // Map to track expanded state for each package
// //   Map<int, bool> _expandedStates = {};
// //
// //   Future<List<Joke>> _getJokes() async {
// //     SharedPreferences prefs = await SharedPreferences.getInstance();
// //     String b = prefs.getString("lid").toString();
// //     String foodimage = "";
// //     var data = await http.post(
// //       Uri.parse(prefs.getString("ip").toString() + "/userviewpackage"),
// //       body: {"id": b},
// //     );
// //
// //     var jsonData = json.decode(data.body);
// //     List<Joke> jokes = [];
// //     for (var joke in jsonData["message"]) {
// //       print(joke);
// //       Joke newJoke = Joke(
// //         joke["id"].toString(),
// //         joke["title"].toString(),
// //         joke["category"].toString(),
// //         joke["name"].toString(),
// //         joke["package_details"],
// //         joke["guide_details"].toString(),
// //         joke["amount"].toString(),
// //         prefs.getString('ip').toString() + joke["photo1"].toString(),
// //         prefs.getString('ip').toString() + joke["photo2"].toString(),
// //         prefs.getString('ip').toString() + joke["photo3"].toString(),
// //         joke["travel_company_id"]?.toString() ?? "", // Get the travel company ID
// //       );
// //       jokes.add(newJoke);
// //     }
// //     return jokes;
// //   }
// //
// //   void _toggleExpand(int index) {
// //     setState(() {
// //       _expandedStates[index] = !(_expandedStates[index] ?? false);
// //     });
// //   }
// //
// //   void _showEnlargedImage(BuildContext context, List<String> images, int initialIndex) {
// //     // Create a controller for the PageView
// //     PageController _pageController = PageController(initialPage: initialIndex);
// //     int currentIndex = initialIndex;
// //
// //     showDialog(
// //       context: context,
// //       builder: (BuildContext context) {
// //         return StatefulBuilder(
// //           builder: (context, setState) {
// //             return Dialog(
// //               backgroundColor: Colors.transparent,
// //               insetPadding: EdgeInsets.zero,
// //               child: Container(
// //                 width: double.infinity,
// //                 height: double.infinity,
// //                 color: Colors.transparent,
// //                 child: Stack(
// //                   children: [
// //                     // PageView for swipe navigation
// //                     PageView.builder(
// //                       controller: _pageController,
// //                       itemCount: images.length,
// //                       onPageChanged: (index) {
// //                         setState(() {
// //                           currentIndex = index;
// //                         });
// //                       },
// //                       itemBuilder: (context, index) {
// //                         return Center(
// //                           child: GestureDetector(
// //                             onTap: () => Navigator.pop(context),
// //                             child: Container(
// //                               width: double.infinity,
// //                               height: double.infinity,
// //                               child: Image.network(
// //                                 images[index],
// //                                 fit: BoxFit.contain,
// //                                 loadingBuilder: (BuildContext context, Widget child, ImageChunkEvent? loadingProgress) {
// //                                   if (loadingProgress == null) return child;
// //                                   return Center(
// //                                     child: CircularProgressIndicator(
// //                                       value: loadingProgress.expectedTotalBytes != null
// //                                           ? loadingProgress.cumulativeBytesLoaded / loadingProgress.expectedTotalBytes!
// //                                           : null,
// //                                       color: const Color(0xFF0F2A1D),
// //                                     ),
// //                                   );
// //                                 },
// //                                 errorBuilder: (BuildContext context, Object error, StackTrace? stackTrace) {
// //                                   return Center(
// //                                     child: Column(
// //                                       mainAxisAlignment: MainAxisAlignment.center,
// //                                       children: [
// //                                         Icon(
// //                                           Icons.broken_image,
// //                                           size: 60,
// //                                           color: const Color(0xFF0F2A1D).withOpacity(0.3),
// //                                         ),
// //                                         const SizedBox(height: 10),
// //                                         Text(
// //                                           'Failed to load image',
// //                                           style: TextStyle(
// //                                             color: const Color(0xFF0F2A1D).withOpacity(0.7),
// //                                             fontFamily: 'Poppins',
// //                                           ),
// //                                         ),
// //                                       ],
// //                                     ),
// //                                   );
// //                                 },
// //                               ),
// //                             ),
// //                           ),
// //                         );
// //                       },
// //                     ),
// //
// //                     // Image counter
// //                     Positioned(
// //                       top: 40,
// //                       left: 20,
// //                       child: Container(
// //                         padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
// //                         decoration: BoxDecoration(
// //                           color: const Color(0xFF0F2A1D).withOpacity(0.1),
// //                           borderRadius: BorderRadius.circular(20),
// //                           border: Border.all(
// //                             color: const Color(0xFF0F2A1D).withOpacity(0.2),
// //                           ),
// //                         ),
// //                         child: Text(
// //                           '${currentIndex + 1} / ${images.length}',
// //                           style: const TextStyle(
// //                             color: Color(0xFF0F2A1D),
// //                             fontSize: 14,
// //                             fontWeight: FontWeight.w600,
// //                             fontFamily: 'Poppins',
// //                           ),
// //                         ),
// //                       ),
// //                     ),
// //
// //                     // Close button
// //                     Positioned(
// //                       top: 40,
// //                       right: 20,
// //                       child: GestureDetector(
// //                         onTap: () => Navigator.pop(context),
// //                         child: Container(
// //                           padding: const EdgeInsets.all(12),
// //                           decoration: BoxDecoration(
// //                             color: const Color(0xFF0F2A1D).withOpacity(0.1),
// //                             borderRadius: BorderRadius.circular(30),
// //                             border: Border.all(
// //                               color: const Color(0xFF0F2A1D).withOpacity(0.2),
// //                             ),
// //                           ),
// //                           child: const Icon(
// //                             Icons.close,
// //                             color: Color(0xFF0F2A1D),
// //                             size: 24,
// //                           ),
// //                         ),
// //                       ),
// //                     ),
// //                   ],
// //                 ),
// //               ),
// //             );
// //           },
// //         );
// //       },
// //     );
// //   }
// //
// //   @override
// //   Widget build(BuildContext context) {
// //     return Scaffold(
// //       backgroundColor: const Color(0xFFE3EED4),
// //       appBar: AppBar(
// //         backgroundColor: Colors.white,
// //         elevation: 2,
// //         title: Text(
// //           'Travel Packages',
// //           style: const TextStyle(
// //             fontSize: 24,
// //             fontWeight: FontWeight.w800,
// //             color: Color(0xFF0F2A1D),
// //             fontFamily: 'Poppins',
// //             letterSpacing: 1,
// //           ),
// //         ),
// //         centerTitle: true,
// //         leading: IconButton(
// //           icon: const Icon(Icons.arrow_back_ios, color: Color(0xFF0F2A1D), size: 22),
// //           onPressed: () => Navigator.push(
// //             context,
// //             MaterialPageRoute(builder: (context) => UserHomeApp()),
// //           ),
// //         ),
// //       ),
// //       body: Container(
// //         child: FutureBuilder(
// //           future: _getJokes(),
// //           builder: (BuildContext context, AsyncSnapshot snapshot) {
// //             if (snapshot.data == null) {
// //               return Center(
// //                 child: Column(
// //                   mainAxisAlignment: MainAxisAlignment.center,
// //                   children: [
// //                     CircularProgressIndicator(
// //                       color: const Color(0xFF0F2A1D),
// //                     ),
// //                     const SizedBox(height: 20),
// //                     Text(
// //                       "Loading packages...",
// //                       style: TextStyle(
// //                         color: const Color(0xFF0F2A1D),
// //                         fontSize: 16,
// //                         fontFamily: 'Poppins',
// //                         fontWeight: FontWeight.w600,
// //                       ),
// //                     ),
// //                   ],
// //                 ),
// //               );
// //             } else if (snapshot.data.length == 0) {
// //               return Center(
// //                 child: Column(
// //                   mainAxisAlignment: MainAxisAlignment.center,
// //                   children: [
// //                     Icon(
// //                       Icons.card_travel_outlined,
// //                       size: 100,
// //                       color: const Color(0xFF0F2A1D).withOpacity(0.3),
// //                     ),
// //                     const SizedBox(height: 20),
// //                     Text(
// //                       'No packages available',
// //                       style: const TextStyle(
// //                         fontSize: 20,
// //                         fontWeight: FontWeight.w800,
// //                         color: Color(0xFF0F2A1D),
// //                         fontFamily: 'Poppins',
// //                       ),
// //                     ),
// //                     const SizedBox(height: 10),
// //                     Text(
// //                       'Check back later for exciting travel packages',
// //                       style: TextStyle(
// //                         fontSize: 14,
// //                         color: const Color(0xFF0F2A1D).withOpacity(0.6),
// //                         fontFamily: 'Poppins',
// //                         fontWeight: FontWeight.w600,
// //                       ),
// //                     ),
// //                   ],
// //                 ),
// //               );
// //             } else {
// //               return ListView.builder(
// //                 padding: const EdgeInsets.all(16),
// //                 itemCount: snapshot.data.length,
// //                 itemBuilder: (BuildContext context, int index) {
// //                   var i = snapshot.data![index];
// //                   bool isExpanded = _expandedStates[index] ?? false;
// //                   bool isLongDescription = i.package_details.toString().length > 150;
// //
// //                   // Create list of images for this package
// //                   List<String> packageImages = [
// //                     i.photo1.toString(),
// //                     i.photo2.toString(),
// //                     i.photo3.toString(),
// //                   ];
// //
// //                   return Padding(
// //                     padding: const EdgeInsets.only(bottom: 16),
// //                     child: Card(
// //                       elevation: 4,
// //                       shape: RoundedRectangleBorder(
// //                         borderRadius: BorderRadius.circular(20),
// //                       ),
// //                       child: Column(
// //                         crossAxisAlignment: CrossAxisAlignment.start,
// //                         children: [
// //                           // Header with gradient
// //                           Container(
// //                             decoration: const BoxDecoration(
// //                               gradient: LinearGradient(
// //                                 colors: [Color(0xFF0F2A1D), Color(0xFF1A3F2B)],
// //                                 begin: Alignment.topLeft,
// //                                 end: Alignment.bottomRight,
// //                               ),
// //                               borderRadius: BorderRadius.only(
// //                                 topLeft: Radius.circular(20),
// //                                 topRight: Radius.circular(20),
// //                               ),
// //                             ),
// //                             padding: const EdgeInsets.all(16),
// //                             child: Row(
// //                               children: [
// //                                 Container(
// //                                   padding: const EdgeInsets.all(8),
// //                                   decoration: BoxDecoration(
// //                                     color: Colors.white.withOpacity(0.2),
// //                                     borderRadius: BorderRadius.circular(10),
// //                                   ),
// //                                   child: const Icon(
// //                                     Icons.card_travel,
// //                                     color: Colors.white,
// //                                     size: 20,
// //                                   ),
// //                                 ),
// //                                 const SizedBox(width: 12),
// //                                 Expanded(
// //                                   child: Text(
// //                                     i.title.toString(),
// //                                     style: const TextStyle(
// //                                       color: Colors.white,
// //                                       fontSize: 20,
// //                                       fontWeight: FontWeight.w800,
// //                                       fontFamily: 'Poppins',
// //                                     ),
// //                                   ),
// //                                 ),
// //                               ],
// //                             ),
// //                           ),
// //
// //                           Padding(
// //                             padding: const EdgeInsets.all(16),
// //                             child: Column(
// //                               crossAxisAlignment: CrossAxisAlignment.start,
// //                               children: [
// //                                 // Company Name Badge - Clickable to view only this company
// //                                 GestureDetector(
// //                                   onTap: () async {
// //                                     SharedPreferences sh = await SharedPreferences.getInstance();
// //                                     // Store the travel company ID to show only this specific company
// //                                     if (i.travelCompanyId.isNotEmpty) {
// //                                       sh.setString('tid', i.travelCompanyId);
// //                                     } else {
// //                                       // If no ID, store the company name as fallback
// //                                       sh.setString('company_name', i.name.toString());
// //                                     }
// //                                     // Set a flag to indicate we're viewing a single company
// //                                     sh.setBool('view_single_company', true);
// //                                     Navigator.push(
// //                                       context,
// //                                       MaterialPageRoute(builder: (context) => const view_travel_company()),
// //                                     );
// //                                   },
// //                                   child: Container(
// //                                     padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
// //                                     decoration: BoxDecoration(
// //                                       color: const Color(0xFF0F2A1D).withOpacity(0.1),
// //                                       borderRadius: BorderRadius.circular(10),
// //                                     ),
// //                                     child: Row(
// //                                       mainAxisSize: MainAxisSize.min,
// //                                       children: [
// //                                         const Icon(
// //                                           Icons.business,
// //                                           size: 16,
// //                                           color: Color(0xFF0F2A1D),
// //                                         ),
// //                                         const SizedBox(width: 8),
// //                                         Text(
// //                                           i.name.toString(),
// //                                           style: const TextStyle(
// //                                             fontSize: 14,
// //                                             fontWeight: FontWeight.w800,
// //                                             color: Color(0xFF0F2A1D),
// //                                             fontFamily: 'Poppins',
// //                                           ),
// //                                         ),
// //                                         const SizedBox(width: 8),
// //                                         const Icon(
// //                                           Icons.arrow_forward,
// //                                           size: 14,
// //                                           color: Color(0xFF0F2A1D),
// //                                         ),
// //                                       ],
// //                                     ),
// //                                   ),
// //                                 ),
// //
// //                                 const SizedBox(height: 16),
// //
// //                                 // Category
// //                                 _buildInfoRow(Icons.category, 'Category', i.category.toString()),
// //
// //                                 const SizedBox(height: 12),
// //
// //                                 // Guide details
// //                                 _buildInfoRow(Icons.assignment_ind, 'guide_details', i.guide_details.toString()),
// //
// //                                 const SizedBox(height: 12),
// //
// //                                 // Amount with premium styling
// //                                 Container(
// //                                   padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
// //                                   decoration: BoxDecoration(
// //                                     gradient: LinearGradient(
// //                                       colors: [
// //                                         const Color(0xFF0F2A1D).withOpacity(0.1),
// //                                         const Color(0xFFE3EED4).withOpacity(0.5),
// //                                       ],
// //                                       begin: Alignment.topLeft,
// //                                       end: Alignment.bottomRight,
// //                                     ),
// //                                     borderRadius: BorderRadius.circular(15),
// //                                     border: Border.all(
// //                                       color: const Color(0xFF0F2A1D).withOpacity(0.3),
// //                                     ),
// //                                   ),
// //                                   child: Row(
// //                                     mainAxisSize: MainAxisSize.min,
// //                                     children: [
// //                                       const Icon(
// //                                         Icons.currency_rupee,
// //                                         size: 22,
// //                                         color: Color(0xFF0F2A1D),
// //                                       ),
// //                                       const SizedBox(width: 4),
// //                                       Text(
// //                                         i.amount.toString(),
// //                                         style: const TextStyle(
// //                                           fontSize: 24,
// //                                           fontWeight: FontWeight.w900,
// //                                           color: Color(0xFF0F2A1D),
// //                                           fontFamily: 'Poppins',
// //                                         ),
// //                                       ),
// //                                       const Text(
// //                                         ' / person',
// //                                         style: TextStyle(
// //                                           fontSize: 14,
// //                                           color: Color(0xFF0F2A1D),
// //                                           fontWeight: FontWeight.w600,
// //                                           fontFamily: 'Poppins',
// //                                         ),
// //                                       ),
// //                                     ],
// //                                   ),
// //                                 ),
// //
// //                                 const SizedBox(height: 20),
// //
// //                                 // Package Details Section - Enhanced Styling with Expandable Content
// //                                 Container(
// //                                   width: double.infinity,
// //                                   padding: const EdgeInsets.all(18),
// //                                   decoration: BoxDecoration(
// //                                     gradient: LinearGradient(
// //                                       begin: Alignment.topLeft,
// //                                       end: Alignment.bottomRight,
// //                                       colors: [
// //                                         const Color(0xFF0F2A1D).withOpacity(0.03),
// //                                         const Color(0xFFE3EED4).withOpacity(0.4),
// //                                       ],
// //                                     ),
// //                                     borderRadius: BorderRadius.circular(18),
// //                                     border: Border.all(
// //                                       color: const Color(0xFF0F2A1D).withOpacity(0.15),
// //                                       width: 1.5,
// //                                     ),
// //                                     boxShadow: [
// //                                       BoxShadow(
// //                                         color: const Color(0xFF0F2A1D).withOpacity(0.05),
// //                                         blurRadius: 10,
// //                                         offset: const Offset(0, 4),
// //                                       ),
// //                                     ],
// //                                   ),
// //                                   child: Column(
// //                                     crossAxisAlignment: CrossAxisAlignment.start,
// //                                     children: [
// //                                       // Title with icon
// //                                       Row(
// //                                         children: [
// //                                           Container(
// //                                             padding: const EdgeInsets.all(6),
// //                                             decoration: BoxDecoration(
// //                                               color: const Color(0xFF0F2A1D).withOpacity(0.1),
// //                                               borderRadius: BorderRadius.circular(8),
// //                                             ),
// //                                             child: const Icon(
// //                                               Icons.description_outlined,
// //                                               size: 18,
// //                                               color: Color(0xFF0F2A1D),
// //                                             ),
// //                                           ),
// //                                           const SizedBox(width: 10),
// //                                           const Text(
// //                                             'Package Details',
// //                                             style: TextStyle(
// //                                               fontSize: 18,
// //                                               fontWeight: FontWeight.w900,
// //                                               color: Color(0xFF0F2A1D),
// //                                               fontFamily: 'Poppins',
// //                                               letterSpacing: 0.5,
// //                                             ),
// //                                           ),
// //                                         ],
// //                                       ),
// //
// //                                       const SizedBox(height: 16),
// //
// //                                       // Description with expandable content
// //                                       Container(
// //                                         padding: const EdgeInsets.symmetric(horizontal: 4),
// //                                         child: Column(
// //                                           crossAxisAlignment: CrossAxisAlignment.start,
// //                                           children: [
// //                                             Text(
// //                                               isExpanded
// //                                                   ? i.package_details.toString()
// //                                                   : (isLongDescription
// //                                                   ? '${i.package_details.toString().substring(0, 150)}...'
// //                                                   : i.package_details.toString()),
// //                                               style: const TextStyle(
// //                                                 fontSize: 15,
// //                                                 color: Color(0xFF0F2A1D),
// //                                                 fontFamily: 'Poppins',
// //                                                 fontWeight: FontWeight.w700,
// //                                                 height: 1.7,
// //                                                 letterSpacing: 0.3,
// //                                               ),
// //                                             ),
// //
// //                                             if (isLongDescription)
// //                                               Padding(
// //                                                 padding: const EdgeInsets.only(top: 12),
// //                                                 child: GestureDetector(
// //                                                   onTap: () => _toggleExpand(index),
// //                                                   child: Container(
// //                                                     padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
// //                                                     decoration: BoxDecoration(
// //                                                       color: const Color(0xFF0F2A1D).withOpacity(0.1),
// //                                                       borderRadius: BorderRadius.circular(30),
// //                                                     ),
// //                                                     child: Row(
// //                                                       mainAxisSize: MainAxisSize.min,
// //                                                       children: [
// //                                                         Text(
// //                                                           isExpanded ? 'Show Less' : 'View More',
// //                                                           style: const TextStyle(
// //                                                             color: Color(0xFF0F2A1D),
// //                                                             fontSize: 13,
// //                                                             fontWeight: FontWeight.w800,
// //                                                             fontFamily: 'Poppins',
// //                                                           ),
// //                                                         ),
// //                                                         const SizedBox(width: 6),
// //                                                         Icon(
// //                                                           isExpanded ? Icons.expand_less : Icons.expand_more,
// //                                                           size: 16,
// //                                                           color: const Color(0xFF0F2A1D),
// //                                                         ),
// //                                                       ],
// //                                                     ),
// //                                                   ),
// //                                                 ),
// //                                               ),
// //                                           ],
// //                                         ),
// //                                       ),
// //                                     ],
// //                                   ),
// //                                 ),
// //
// //                                 const SizedBox(height: 20),
// //
// //                                 // Photo Gallery Title
// //                                 Row(
// //                                   children: [
// //                                     Container(
// //                                       padding: const EdgeInsets.all(6),
// //                                       decoration: BoxDecoration(
// //                                         color: const Color(0xFF0F2A1D).withOpacity(0.1),
// //                                         borderRadius: BorderRadius.circular(8),
// //                                       ),
// //                                       child: const Icon(
// //                                         Icons.photo_library_outlined,
// //                                         size: 18,
// //                                         color: Color(0xFF0F2A1D),
// //                                       ),
// //                                     ),
// //                                     const SizedBox(width: 10),
// //                                     const Text(
// //                                       'Gallery',
// //                                       style: TextStyle(
// //                                         fontSize: 18,
// //                                         fontWeight: FontWeight.w900,
// //                                         color: Color(0xFF0F2A1D),
// //                                         fontFamily: 'Poppins',
// //                                       ),
// //                                     ),
// //                                   ],
// //                                 ),
// //
// //                                 const SizedBox(height: 12),
// //
// //                                 // Photo Gallery - Horizontal Scroll
// //                                 SingleChildScrollView(
// //                                   scrollDirection: Axis.horizontal,
// //                                   child: Row(
// //                                     children: [
// //                                       _buildGalleryImage(i.photo1.toString(), 0, packageImages, context),
// //                                       const SizedBox(width: 12),
// //                                       _buildGalleryImage(i.photo2.toString(), 1, packageImages, context),
// //                                       const SizedBox(width: 12),
// //                                       _buildGalleryImage(i.photo3.toString(), 2, packageImages, context),
// //                                     ],
// //                                   ),
// //                                 ),
// //
// //                                 const SizedBox(height: 20),
// //
// //                                 // Action Buttons
// //                                 Row(
// //                                   children: [
// //                                     // Book Now Button
// //                                     Expanded(
// //                                       child: ElevatedButton(
// //                                         onPressed: () async {
// //                                           SharedPreferences sh = await SharedPreferences.getInstance();
// //                                           sh.setString('ownid', i.id.toString());
// //                                           Navigator.push(
// //                                             context,
// //                                             MaterialPageRoute(builder: (context) => booking()),
// //                                           );
// //                                         },
// //                                         style: ElevatedButton.styleFrom(
// //                                           backgroundColor: const Color(0xFF0F2A1D),
// //                                           foregroundColor: Colors.white,
// //                                           padding: const EdgeInsets.symmetric(vertical: 12),
// //                                           shape: RoundedRectangleBorder(
// //                                             borderRadius: BorderRadius.circular(10),
// //                                           ),
// //                                           elevation: 4,
// //                                         ),
// //                                         child: const Text(
// //                                           'BOOK',
// //                                           style: TextStyle(
// //                                             fontSize: 12,
// //                                             fontWeight: FontWeight.w800,
// //                                             fontFamily: 'Poppins',
// //                                           ),
// //                                         ),
// //                                       ),
// //                                     ),
// //                                     const SizedBox(width: 8),
// //
// //                                     // Details Button
// //                                     Expanded(
// //                                       child: OutlinedButton(
// //                                         onPressed: () async {
// //                                           SharedPreferences sh = await SharedPreferences.getInstance();
// //                                           sh.setString('oid', i.id.toString());
// //                                           Navigator.push(
// //                                             context,
// //                                             MaterialPageRoute(builder: (context) => view_extradetails()),
// //                                           );
// //                                         },
// //                                         style: OutlinedButton.styleFrom(
// //                                           side: const BorderSide(color: Color(0xFF0F2A1D), width: 1.5),
// //                                           foregroundColor: const Color(0xFF0F2A1D),
// //                                           padding: const EdgeInsets.symmetric(vertical: 12),
// //                                           shape: RoundedRectangleBorder(
// //                                             borderRadius: BorderRadius.circular(10),
// //                                           ),
// //                                         ),
// //                                         child: const Text(
// //                                           'DETAILS',
// //                                           style: TextStyle(
// //                                             fontSize: 12,
// //                                             fontWeight: FontWeight.w800,
// //                                             fontFamily: 'Poppins',
// //                                           ),
// //                                         ),
// //                                       ),
// //                                     ),
// //                                     const SizedBox(width: 8),
// //
// //                                     // View Company Button
// //                                     // Expanded(
// //                                     //   child: OutlinedButton.icon(
// //                                     //     icon: const Icon(Icons.business, size: 14),
// //                                     //     label: const Text(
// //                                     //       'COMPANY',
// //                                     //       style: TextStyle(
// //                                     //         fontSize: 10,
// //                                     //         fontWeight: FontWeight.w800,
// //                                     //         fontFamily: 'Poppins',
// //                                     //       ),
// //                                     //     ),
// //                                     //     onPressed: () async {
// //                                     //       SharedPreferences sh = await SharedPreferences.getInstance();
// //                                     //       // Store the travel company ID to show only this specific company
// //                                     //       if (i.travelCompanyId.isNotEmpty) {
// //                                     //         sh.setString('tid', i.travelCompanyId);
// //                                     //       } else {
// //                                     //         // If no ID, store the company name as fallback
// //                                     //         sh.setString('company_name', i.name.toString());
// //                                     //       }
// //                                     //       // Set a flag to indicate we're viewing a single company
// //                                     //       sh.setBool('view_single_company', true);
// //                                     //       Navigator.push(
// //                                     //         context,
// //                                     //         MaterialPageRoute(builder: (context) => const view_travel_company()),
// //                                     //       );
// //                                     //     },
// //                                     //     style: OutlinedButton.styleFrom(
// //                                     //       side: const BorderSide(color: Color(0xFF0F2A1D), width: 1.5),
// //                                     //       foregroundColor: const Color(0xFF0F2A1D),
// //                                     //       padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 8),
// //                                     //       shape: RoundedRectangleBorder(
// //                                     //         borderRadius: BorderRadius.circular(10),
// //                                     //       ),
// //                                     //     ),
// //                                     //   ),
// //                                     // ),
// //
// //                                     ElevatedButton(onPressed: () async {
// //                                       SharedPreferences sh=await SharedPreferences.getInstance();
// //                                       sh.setString('pid', i.id.toString());
// //                                       Navigator.push(context, MaterialPageRoute(builder: (context)=>PackageReviewPage()));
// //                                     }, child: Text('Send review'))
// //
// //                                   ],
// //                                 ),
// //                               ],
// //                             ),
// //                           ),
// //                         ],
// //                       ),
// //                     ),
// //                   );
// //                 },
// //               );
// //             }
// //           },
// //         ),
// //       ),
// //     );
// //   }
// //
// //   Widget _buildInfoRow(IconData icon, String label, String value) {
// //     return Row(
// //       crossAxisAlignment: CrossAxisAlignment.start,
// //       children: [
// //         Icon(
// //           icon,
// //           size: 18,
// //           color: const Color(0xFF0F2A1D).withOpacity(0.7),
// //         ),
// //         const SizedBox(width: 12),
// //         SizedBox(
// //           width: 80,
// //           child: Text(
// //             label,
// //             style: const TextStyle(
// //               fontWeight: FontWeight.w800,
// //               color: Color(0xFF0F2A1D),
// //               fontSize: 14,
// //               fontFamily: 'Poppins',
// //             ),
// //           ),
// //         ),
// //         const Text(
// //           ':',
// //           style: TextStyle(
// //             color: Color(0xFF0F2A1D),
// //             fontWeight: FontWeight.w800,
// //           ),
// //         ),
// //         const SizedBox(width: 12),
// //         Expanded(
// //           child: Text(
// //             value,
// //             style: const TextStyle(
// //               fontSize: 14,
// //               color: Color(0xFF0F2A1D),
// //               fontWeight: FontWeight.w700,
// //               fontFamily: 'Poppins',
// //             ),
// //             softWrap: true,
// //           ),
// //         ),
// //       ],
// //     );
// //   }
// //
// //   Widget _buildGalleryImage(String imageUrl, int index, List<String> allImages, BuildContext context) {
// //     return GestureDetector(
// //       onTap: () => _showEnlargedImage(context, allImages, index),
// //       child: Container(
// //         width: 160,
// //         height: 130,
// //         decoration: BoxDecoration(
// //           borderRadius: BorderRadius.circular(18),
// //           boxShadow: [
// //             BoxShadow(
// //               color: const Color(0xFF0F2A1D).withOpacity(0.2),
// //               blurRadius: 10,
// //               offset: const Offset(0, 5),
// //             ),
// //           ],
// //         ),
// //         child: Stack(
// //           children: [
// //             ClipRRect(
// //               borderRadius: BorderRadius.circular(18),
// //               child: Image.network(
// //                 imageUrl,
// //                 fit: BoxFit.cover,
// //                 width: double.infinity,
// //                 height: double.infinity,
// //                 loadingBuilder: (BuildContext context, Widget child, ImageChunkEvent? loadingProgress) {
// //                   if (loadingProgress == null) return child;
// //                   return Container(
// //                     color: const Color(0xFFE3EED4).withOpacity(0.3),
// //                     child: Center(
// //                       child: CircularProgressIndicator(
// //                         value: loadingProgress.expectedTotalBytes != null
// //                             ? loadingProgress.cumulativeBytesLoaded / loadingProgress.expectedTotalBytes!
// //                             : null,
// //                         color: const Color(0xFF0F2A1D),
// //                       ),
// //                     ),
// //                   );
// //                 },
// //                 errorBuilder: (BuildContext context, Object error, StackTrace? stackTrace) {
// //                   return Container(
// //                     color: const Color(0xFFE3EED4).withOpacity(0.3),
// //                     child: Center(
// //                       child: Icon(
// //                         Icons.broken_image,
// //                         size: 40,
// //                         color: const Color(0xFF0F2A1D).withOpacity(0.3),
// //                       ),
// //                     ),
// //                   );
// //                 },
// //               ),
// //             ),
// //             // Enlarge icon overlay
// //             Positioned(
// //               bottom: 8,
// //               right: 8,
// //               child: Container(
// //                 padding: const EdgeInsets.all(6),
// //                 decoration: BoxDecoration(
// //                   color: const Color(0xFF0F2A1D).withOpacity(0.7),
// //                   borderRadius: BorderRadius.circular(20),
// //                 ),
// //                 child: const Icon(
// //                   Icons.open_in_full,
// //                   color: Colors.white,
// //                   size: 16,
// //                 ),
// //               ),
// //             ),
// //           ],
// //         ),
// //       ),
// //     );
// //   }
// // }
// //
// // class Joke {
// //   final String id;
// //   final String title;
// //   final String category;
// //   final String name;
// //   final String package_details;
// //   final String guide_details;
// //   final String amount;
// //   final String photo1;
// //   final String photo2;
// //   final String photo3;
// //   final String travelCompanyId;
// //
// //   Joke(
// //       this.id,
// //       this.title,
// //       this.category,
// //       this.name,
// //       this.package_details,
// //       this.guide_details,
// //       this.amount,
// //       this.photo1,
// //       this.photo2,
// //       this.photo3,
// //       this.travelCompanyId,
// //       );
// // }
// //
//
//
//
//
//
//
// import 'dart:convert';
// import 'package:final_destination/booking.dart';
// import 'package:final_destination/send_package_review.dart';
// import 'package:final_destination/view_extradetails.dart';
// import 'package:final_destination/view_travel_company.dart';
// import 'package:final_destination/home.dart';
// import 'package:flutter/material.dart';
// import 'package:http/http.dart' as http;
// import 'package:shared_preferences/shared_preferences.dart';
//
// void main() {
//   runApp(viewpackage());
// }
//
// class viewpackage extends StatelessWidget {
//   const viewpackage({Key? key}) : super(key: key);
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
//       home: viewpackagesub(),
//     );
//   }
// }
//
// class viewpackagesub extends StatefulWidget {
//   const viewpackagesub({Key? key}) : super(key: key);
//
//   @override
//   State<viewpackagesub> createState() => _viewpackagesubState();
// }
//
// class _viewpackagesubState extends State<viewpackagesub> {
//   // Map to track expanded state for each package
//   Map<int, bool> _expandedStates = {};
//
//   Future<List<Joke>> _getJokes() async {
//     SharedPreferences prefs = await SharedPreferences.getInstance();
//     String b = prefs.getString("lid").toString();
//     String foodimage = "";
//     var data = await http.post(
//       Uri.parse(prefs.getString("ip").toString() + "/userviewpackage"),
//       body: {"id": b},
//     );
//
//     var jsonData = json.decode(data.body);
//     List<Joke> jokes = [];
//     for (var joke in jsonData["message"]) {
//       print(joke);
//       Joke newJoke = Joke(
//         joke["id"].toString(),
//         joke["title"].toString(),
//         joke["category"].toString(),
//         joke["name"].toString(),
//         joke["package_details"],
//         joke["guide_details"].toString(),
//         joke["amount"].toString(),
//         prefs.getString('ip').toString() + joke["photo1"].toString(),
//         prefs.getString('ip').toString() + joke["photo2"].toString(),
//         prefs.getString('ip').toString() + joke["photo3"].toString(),
//         joke["travel_company_id"]?.toString() ?? "",
//         double.parse(joke["rating"].toString()), // Get the rating from backend
//       );
//       jokes.add(newJoke);
//     }
//     return jokes;
//   }
//
//   void _toggleExpand(int index) {
//     setState(() {
//       _expandedStates[index] = !(_expandedStates[index] ?? false);
//     });
//   }
//
//   void _showEnlargedImage(BuildContext context, List<String> images, int initialIndex) {
//     // Create a controller for the PageView
//     PageController _pageController = PageController(initialPage: initialIndex);
//     int currentIndex = initialIndex;
//
//     showDialog(
//       context: context,
//       builder: (BuildContext context) {
//         return StatefulBuilder(
//           builder: (context, setState) {
//             return Dialog(
//               backgroundColor: Colors.transparent,
//               insetPadding: EdgeInsets.zero,
//               child: Container(
//                 width: double.infinity,
//                 height: double.infinity,
//                 color: Colors.transparent,
//                 child: Stack(
//                   children: [
//                     // PageView for swipe navigation
//                     PageView.builder(
//                       controller: _pageController,
//                       itemCount: images.length,
//                       onPageChanged: (index) {
//                         setState(() {
//                           currentIndex = index;
//                         });
//                       },
//                       itemBuilder: (context, index) {
//                         return Center(
//                           child: GestureDetector(
//                             onTap: () => Navigator.pop(context),
//                             child: Container(
//                               width: double.infinity,
//                               height: double.infinity,
//                               child: Image.network(
//                                 images[index],
//                                 fit: BoxFit.contain,
//                                 loadingBuilder: (BuildContext context, Widget child, ImageChunkEvent? loadingProgress) {
//                                   if (loadingProgress == null) return child;
//                                   return Center(
//                                     child: CircularProgressIndicator(
//                                       value: loadingProgress.expectedTotalBytes != null
//                                           ? loadingProgress.cumulativeBytesLoaded / loadingProgress.expectedTotalBytes!
//                                           : null,
//                                       color: const Color(0xFF0F2A1D),
//                                     ),
//                                   );
//                                 },
//                                 errorBuilder: (BuildContext context, Object error, StackTrace? stackTrace) {
//                                   return Center(
//                                     child: Column(
//                                       mainAxisAlignment: MainAxisAlignment.center,
//                                       children: [
//                                         Icon(
//                                           Icons.broken_image,
//                                           size: 60,
//                                           color: const Color(0xFF0F2A1D).withOpacity(0.3),
//                                         ),
//                                         const SizedBox(height: 10),
//                                         Text(
//                                           'Failed to load image',
//                                           style: TextStyle(
//                                             color: const Color(0xFF0F2A1D).withOpacity(0.7),
//                                             fontFamily: 'Poppins',
//                                           ),
//                                         ),
//                                       ],
//                                     ),
//                                   );
//                                 },
//                               ),
//                             ),
//                           ),
//                         );
//                       },
//                     ),
//
//                     // Image counter
//                     Positioned(
//                       top: 40,
//                       left: 20,
//                       child: Container(
//                         padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
//                         decoration: BoxDecoration(
//                           color: const Color(0xFF0F2A1D).withOpacity(0.1),
//                           borderRadius: BorderRadius.circular(20),
//                           border: Border.all(
//                             color: const Color(0xFF0F2A1D).withOpacity(0.2),
//                           ),
//                         ),
//                         child: Text(
//                           '${currentIndex + 1} / ${images.length}',
//                           style: const TextStyle(
//                             color: Color(0xFF0F2A1D),
//                             fontSize: 14,
//                             fontWeight: FontWeight.w600,
//                             fontFamily: 'Poppins',
//                           ),
//                         ),
//                       ),
//                     ),
//
//                     // Close button
//                     Positioned(
//                       top: 40,
//                       right: 20,
//                       child: GestureDetector(
//                         onTap: () => Navigator.pop(context),
//                         child: Container(
//                           padding: const EdgeInsets.all(12),
//                           decoration: BoxDecoration(
//                             color: const Color(0xFF0F2A1D).withOpacity(0.1),
//                             borderRadius: BorderRadius.circular(30),
//                             border: Border.all(
//                               color: const Color(0xFF0F2A1D).withOpacity(0.2),
//                             ),
//                           ),
//                           child: const Icon(
//                             Icons.close,
//                             color: Color(0xFF0F2A1D),
//                             size: 24,
//                           ),
//                         ),
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//             );
//           },
//         );
//       },
//     );
//   }
//
//   Widget _buildRatingStars(double rating) {
//     int fullStars = rating.floor();
//     bool hasHalfStar = (rating - fullStars) >= 0.5;
//
//     return Row(
//       children: [
//         ...List.generate(5, (index) {
//           if (index < fullStars) {
//             return const Icon(
//               Icons.star,
//               color: Color(0xFFFFD700),
//               size: 18,
//             );
//           } else if (index == fullStars && hasHalfStar) {
//             return const Icon(
//               Icons.star_half,
//               color: Color(0xFFFFD700),
//               size: 18,
//             );
//           } else {
//             return Icon(
//               Icons.star_border,
//               color: const Color(0xFFFFD700).withOpacity(0.5),
//               size: 18,
//             );
//           }
//         }),
//         const SizedBox(width: 4),
//         Text(
//           rating.toStringAsFixed(1),
//           style: const TextStyle(
//             fontSize: 14,
//             fontWeight: FontWeight.w800,
//             color: Color(0xFF0F2A1D),
//             fontFamily: 'Poppins',
//           ),
//         ),
//       ],
//     );
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
//           'Top Rated Packages',
//           style: const TextStyle(
//             fontSize: 24,
//             fontWeight: FontWeight.w800,
//             color: Color(0xFF0F2A1D),
//             fontFamily: 'Poppins',
//             letterSpacing: 1,
//           ),
//         ),
//         centerTitle: true,
//         leading: IconButton(
//           icon: const Icon(Icons.arrow_back_ios, color: Color(0xFF0F2A1D), size: 22),
//           onPressed: () => Navigator.push(
//             context,
//             MaterialPageRoute(builder: (context) => UserHomeApp()),
//           ),
//         ),
//       ),
//       body: Container(
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
//                       "Loading top rated packages...",
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
//             } else if (snapshot.data.length == 0) {
//               return Center(
//                 child: Column(
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   children: [
//                     Icon(
//                       Icons.card_travel_outlined,
//                       size: 100,
//                       color: const Color(0xFF0F2A1D).withOpacity(0.3),
//                     ),
//                     const SizedBox(height: 20),
//                     Text(
//                       'No packages available',
//                       style: const TextStyle(
//                         fontSize: 20,
//                         fontWeight: FontWeight.w800,
//                         color: Color(0xFF0F2A1D),
//                         fontFamily: 'Poppins',
//                       ),
//                     ),
//                     const SizedBox(height: 10),
//                     Text(
//                       'Check back later for exciting travel packages',
//                       style: TextStyle(
//                         fontSize: 14,
//                         color: const Color(0xFF0F2A1D).withOpacity(0.6),
//                         fontFamily: 'Poppins',
//                         fontWeight: FontWeight.w600,
//                       ),
//                     ),
//                   ],
//                 ),
//               );
//             } else {
//               return ListView.builder(
//                 padding: const EdgeInsets.all(16),
//                 itemCount: snapshot.data.length,
//                 itemBuilder: (BuildContext context, int index) {
//                   var i = snapshot.data![index];
//                   bool isExpanded = _expandedStates[index] ?? false;
//                   bool isLongDescription = i.package_details.toString().length > 150;
//
//                   // Create list of images for this package
//                   List<String> packageImages = [
//                     i.photo1.toString(),
//                     i.photo2.toString(),
//                     i.photo3.toString(),
//                   ];
//
//                   return Padding(
//                     padding: const EdgeInsets.only(bottom: 16),
//                     child: Card(
//                       elevation: 4,
//                       shape: RoundedRectangleBorder(
//                         borderRadius: BorderRadius.circular(20),
//                       ),
//                       child: Column(
//                         crossAxisAlignment: CrossAxisAlignment.start,
//                         children: [
//                           // Header with gradient and rating badge
//                           Container(
//                             decoration: const BoxDecoration(
//                               gradient: LinearGradient(
//                                 colors: [Color(0xFF0F2A1D), Color(0xFF1A3F2B)],
//                                 begin: Alignment.topLeft,
//                                 end: Alignment.bottomRight,
//                               ),
//                               borderRadius: BorderRadius.only(
//                                 topLeft: Radius.circular(20),
//                                 topRight: Radius.circular(20),
//                               ),
//                             ),
//                             padding: const EdgeInsets.all(16),
//                             child: Row(
//                               children: [
//                                 Container(
//                                   padding: const EdgeInsets.all(8),
//                                   decoration: BoxDecoration(
//                                     color: Colors.white.withOpacity(0.2),
//                                     borderRadius: BorderRadius.circular(10),
//                                   ),
//                                   child: const Icon(
//                                     Icons.card_travel,
//                                     color: Colors.white,
//                                     size: 20,
//                                   ),
//                                 ),
//                                 const SizedBox(width: 12),
//                                 Expanded(
//                                   child: Text(
//                                     i.title.toString(),
//                                     style: const TextStyle(
//                                       color: Colors.white,
//                                       fontSize: 20,
//                                       fontWeight: FontWeight.w800,
//                                       fontFamily: 'Poppins',
//                                     ),
//                                   ),
//                                 ),
//                                 // Rating badge in header
//                                 Container(
//                                   padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
//                                   decoration: BoxDecoration(
//                                     color: Colors.white,
//                                     borderRadius: BorderRadius.circular(20),
//                                   ),
//                                   child: Row(
//                                     mainAxisSize: MainAxisSize.min,
//                                     children: [
//                                       const Icon(
//                                         Icons.star,
//                                         color: Color(0xFFFFD700),
//                                         size: 16,
//                                       ),
//                                       const SizedBox(width: 4),
//                                       Text(
//                                         i.rating.toStringAsFixed(1),
//                                         style: const TextStyle(
//                                           color: Color(0xFF0F2A1D),
//                                           fontSize: 14,
//                                           fontWeight: FontWeight.w800,
//                                           fontFamily: 'Poppins',
//                                         ),
//                                       ),
//                                     ],
//                                   ),
//                                 ),
//                               ],
//                             ),
//                           ),
//
//                           Padding(
//                             padding: const EdgeInsets.all(16),
//                             child: Column(
//                               crossAxisAlignment: CrossAxisAlignment.start,
//                               children: [
//                                 // Company Name Badge - Clickable to view only this company
//                                 GestureDetector(
//                                   onTap: () async {
//                                     SharedPreferences sh = await SharedPreferences.getInstance();
//                                     // Store the travel company ID to show only this specific company
//                                     if (i.travelCompanyId.isNotEmpty) {
//                                       sh.setString('tid', i.travelCompanyId);
//                                     } else {
//                                       // If no ID, store the company name as fallback
//                                       sh.setString('company_name', i.name.toString());
//                                     }
//                                     // Set a flag to indicate we're viewing a single company
//                                     sh.setBool('view_single_company', true);
//                                     Navigator.push(
//                                       context,
//                                       MaterialPageRoute(builder: (context) => const view_travel_company()),
//                                     );
//                                   },
//                                   child: Container(
//                                     padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
//                                     decoration: BoxDecoration(
//                                       color: const Color(0xFF0F2A1D).withOpacity(0.1),
//                                       borderRadius: BorderRadius.circular(10),
//                                     ),
//                                     child: Row(
//                                       mainAxisSize: MainAxisSize.min,
//                                       children: [
//                                         const Icon(
//                                           Icons.business,
//                                           size: 16,
//                                           color: Color(0xFF0F2A1D),
//                                         ),
//                                         const SizedBox(width: 8),
//                                         Text(
//                                           i.name.toString(),
//                                           style: const TextStyle(
//                                             fontSize: 14,
//                                             fontWeight: FontWeight.w800,
//                                             color: Color(0xFF0F2A1D),
//                                             fontFamily: 'Poppins',
//                                           ),
//                                         ),
//                                         const SizedBox(width: 8),
//                                         const Icon(
//                                           Icons.arrow_forward,
//                                           size: 14,
//                                           color: Color(0xFF0F2A1D),
//                                         ),
//                                       ],
//                                     ),
//                                   ),
//                                 ),
//
//                                 const SizedBox(height: 16),
//
//                                 // Category
//                                 _buildInfoRow(Icons.category, 'Category', i.category.toString()),
//
//                                 const SizedBox(height: 12),
//
//                                 // Guide details
//                                 _buildInfoRow(Icons.assignment_ind, 'guide_details', i.guide_details.toString()),
//
//                                 const SizedBox(height: 12),
//
//                                 // Amount with premium styling
//                                 Container(
//                                   padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
//                                   decoration: BoxDecoration(
//                                     gradient: LinearGradient(
//                                       colors: [
//                                         const Color(0xFF0F2A1D).withOpacity(0.1),
//                                         const Color(0xFFE3EED4).withOpacity(0.5),
//                                       ],
//                                       begin: Alignment.topLeft,
//                                       end: Alignment.bottomRight,
//                                     ),
//                                     borderRadius: BorderRadius.circular(15),
//                                     border: Border.all(
//                                       color: const Color(0xFF0F2A1D).withOpacity(0.3),
//                                     ),
//                                   ),
//                                   child: Row(
//                                     mainAxisSize: MainAxisSize.min,
//                                     children: [
//                                       const Icon(
//                                         Icons.currency_rupee,
//                                         size: 22,
//                                         color: Color(0xFF0F2A1D),
//                                       ),
//                                       const SizedBox(width: 4),
//                                       Text(
//                                         i.amount.toString(),
//                                         style: const TextStyle(
//                                           fontSize: 24,
//                                           fontWeight: FontWeight.w900,
//                                           color: Color(0xFF0F2A1D),
//                                           fontFamily: 'Poppins',
//                                         ),
//                                       ),
//                                       const Text(
//                                         ' / person',
//                                         style: TextStyle(
//                                           fontSize: 14,
//                                           color: Color(0xFF0F2A1D),
//                                           fontWeight: FontWeight.w600,
//                                           fontFamily: 'Poppins',
//                                         ),
//                                       ),
//                                     ],
//                                   ),
//                                 ),
//
//                                 const SizedBox(height: 20),
//
//                                 // Package Details Section - Enhanced Styling with Expandable Content
//                                 Container(
//                                   width: double.infinity,
//                                   padding: const EdgeInsets.all(18),
//                                   decoration: BoxDecoration(
//                                     gradient: LinearGradient(
//                                       begin: Alignment.topLeft,
//                                       end: Alignment.bottomRight,
//                                       colors: [
//                                         const Color(0xFF0F2A1D).withOpacity(0.03),
//                                         const Color(0xFFE3EED4).withOpacity(0.4),
//                                       ],
//                                     ),
//                                     borderRadius: BorderRadius.circular(18),
//                                     border: Border.all(
//                                       color: const Color(0xFF0F2A1D).withOpacity(0.15),
//                                       width: 1.5,
//                                     ),
//                                     boxShadow: [
//                                       BoxShadow(
//                                         color: const Color(0xFF0F2A1D).withOpacity(0.05),
//                                         blurRadius: 10,
//                                         offset: const Offset(0, 4),
//                                       ),
//                                     ],
//                                   ),
//                                   child: Column(
//                                     crossAxisAlignment: CrossAxisAlignment.start,
//                                     children: [
//                                       // Title with icon
//                                       Row(
//                                         children: [
//                                           Container(
//                                             padding: const EdgeInsets.all(6),
//                                             decoration: BoxDecoration(
//                                               color: const Color(0xFF0F2A1D).withOpacity(0.1),
//                                               borderRadius: BorderRadius.circular(8),
//                                             ),
//                                             child: const Icon(
//                                               Icons.description_outlined,
//                                               size: 18,
//                                               color: Color(0xFF0F2A1D),
//                                             ),
//                                           ),
//                                           const SizedBox(width: 10),
//                                           const Text(
//                                             'Package Details',
//                                             style: TextStyle(
//                                               fontSize: 18,
//                                               fontWeight: FontWeight.w900,
//                                               color: Color(0xFF0F2A1D),
//                                               fontFamily: 'Poppins',
//                                               letterSpacing: 0.5,
//                                             ),
//                                           ),
//                                         ],
//                                       ),
//
//                                       const SizedBox(height: 16),
//
//                                       // Description with expandable content
//                                       Container(
//                                         padding: const EdgeInsets.symmetric(horizontal: 4),
//                                         child: Column(
//                                           crossAxisAlignment: CrossAxisAlignment.start,
//                                           children: [
//                                             Text(
//                                               isExpanded
//                                                   ? i.package_details.toString()
//                                                   : (isLongDescription
//                                                   ? '${i.package_details.toString().substring(0, 150)}...'
//                                                   : i.package_details.toString()),
//                                               style: const TextStyle(
//                                                 fontSize: 15,
//                                                 color: Color(0xFF0F2A1D),
//                                                 fontFamily: 'Poppins',
//                                                 fontWeight: FontWeight.w700,
//                                                 height: 1.7,
//                                                 letterSpacing: 0.3,
//                                               ),
//                                             ),
//
//                                             if (isLongDescription)
//                                               Padding(
//                                                 padding: const EdgeInsets.only(top: 12),
//                                                 child: GestureDetector(
//                                                   onTap: () => _toggleExpand(index),
//                                                   child: Container(
//                                                     padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
//                                                     decoration: BoxDecoration(
//                                                       color: const Color(0xFF0F2A1D).withOpacity(0.1),
//                                                       borderRadius: BorderRadius.circular(30),
//                                                     ),
//                                                     child: Row(
//                                                       mainAxisSize: MainAxisSize.min,
//                                                       children: [
//                                                         Text(
//                                                           isExpanded ? 'Show Less' : 'View More',
//                                                           style: const TextStyle(
//                                                             color: Color(0xFF0F2A1D),
//                                                             fontSize: 13,
//                                                             fontWeight: FontWeight.w800,
//                                                             fontFamily: 'Poppins',
//                                                           ),
//                                                         ),
//                                                         const SizedBox(width: 6),
//                                                         Icon(
//                                                           isExpanded ? Icons.expand_less : Icons.expand_more,
//                                                           size: 16,
//                                                           color: const Color(0xFF0F2A1D),
//                                                         ),
//                                                       ],
//                                                     ),
//                                                   ),
//                                                 ),
//                                               ),
//                                           ],
//                                         ),
//                                       ),
//                                     ],
//                                   ),
//                                 ),
//
//                                 const SizedBox(height: 20),
//
//                                 // Photo Gallery Title
//                                 Row(
//                                   children: [
//                                     Container(
//                                       padding: const EdgeInsets.all(6),
//                                       decoration: BoxDecoration(
//                                         color: const Color(0xFF0F2A1D).withOpacity(0.1),
//                                         borderRadius: BorderRadius.circular(8),
//                                       ),
//                                       child: const Icon(
//                                         Icons.photo_library_outlined,
//                                         size: 18,
//                                         color: Color(0xFF0F2A1D),
//                                       ),
//                                     ),
//                                     const SizedBox(width: 10),
//                                     const Text(
//                                       'Gallery',
//                                       style: TextStyle(
//                                         fontSize: 18,
//                                         fontWeight: FontWeight.w900,
//                                         color: Color(0xFF0F2A1D),
//                                         fontFamily: 'Poppins',
//                                       ),
//                                     ),
//                                   ],
//                                 ),
//
//                                 const SizedBox(height: 12),
//
//                                 // Photo Gallery - Horizontal Scroll
//                                 SingleChildScrollView(
//                                   scrollDirection: Axis.horizontal,
//                                   child: Row(
//                                     children: [
//                                       _buildGalleryImage(i.photo1.toString(), 0, packageImages, context),
//                                       const SizedBox(width: 12),
//                                       _buildGalleryImage(i.photo2.toString(), 1, packageImages, context),
//                                       const SizedBox(width: 12),
//                                       _buildGalleryImage(i.photo3.toString(), 2, packageImages, context),
//                                     ],
//                                   ),
//                                 ),
//
//                                 const SizedBox(height: 20),
//
//                                 // Action Buttons
//                                 Row(
//                                   children: [
//                                     // Book Now Button
//                                     Expanded(
//                                       child: ElevatedButton(
//                                         onPressed: () async {
//                                           SharedPreferences sh = await SharedPreferences.getInstance();
//                                           sh.setString('ownid', i.id.toString());
//                                           Navigator.push(
//                                             context,
//                                             MaterialPageRoute(builder: (context) => booking()),
//                                           );
//                                         },
//                                         style: ElevatedButton.styleFrom(
//                                           backgroundColor: const Color(0xFF0F2A1D),
//                                           foregroundColor: Colors.white,
//                                           padding: const EdgeInsets.symmetric(vertical: 12),
//                                           shape: RoundedRectangleBorder(
//                                             borderRadius: BorderRadius.circular(10),
//                                           ),
//                                           elevation: 4,
//                                         ),
//                                         child: const Text(
//                                           'BOOK',
//                                           style: TextStyle(
//                                             fontSize: 12,
//                                             fontWeight: FontWeight.w800,
//                                             fontFamily: 'Poppins',
//                                           ),
//                                         ),
//                                       ),
//                                     ),
//                                     const SizedBox(width: 8),
//
//                                     // Details Button
//                                     Expanded(
//                                       child: OutlinedButton(
//                                         onPressed: () async {
//                                           SharedPreferences sh = await SharedPreferences.getInstance();
//                                           sh.setString('oid', i.id.toString());
//                                           Navigator.push(
//                                             context,
//                                             MaterialPageRoute(builder: (context) => view_extradetails()),
//                                           );
//                                         },
//                                         style: OutlinedButton.styleFrom(
//                                           side: const BorderSide(color: Color(0xFF0F2A1D), width: 1.5),
//                                           foregroundColor: const Color(0xFF0F2A1D),
//                                           padding: const EdgeInsets.symmetric(vertical: 12),
//                                           shape: RoundedRectangleBorder(
//                                             borderRadius: BorderRadius.circular(10),
//                                           ),
//                                         ),
//                                         child: const Text(
//                                           'DETAILS',
//                                           style: TextStyle(
//                                             fontSize: 12,
//                                             fontWeight: FontWeight.w800,
//                                             fontFamily: 'Poppins',
//                                           ),
//                                         ),
//                                       ),
//                                     ),
//                                     const SizedBox(width: 8),
//
//                                     // Send Review Button
//                                     Expanded(
//                                       child: ElevatedButton(
//                                         onPressed: () async {
//                                           SharedPreferences sh = await SharedPreferences.getInstance();
//                                           sh.setString('pid', i.id.toString());
//                                           Navigator.push(
//                                               context,
//                                               MaterialPageRoute(builder: (context) => PackageReviewPage())
//                                           );
//                                         },
//                                         style: ElevatedButton.styleFrom(
//                                           backgroundColor: const Color(0xFF0F2A1D).withOpacity(0.8),
//                                           foregroundColor: Colors.white,
//                                           padding: const EdgeInsets.symmetric(vertical: 12),
//                                           shape: RoundedRectangleBorder(
//                                             borderRadius: BorderRadius.circular(10),
//                                           ),
//                                           elevation: 2,
//                                         ),
//                                         child: const Text(
//                                           'REVIEW',
//                                           style: TextStyle(
//                                             fontSize: 12,
//                                             fontWeight: FontWeight.w800,
//                                             fontFamily: 'Poppins',
//                                           ),
//                                         ),
//                                       ),
//                                     ),
//                                   ],
//                                 ),
//                               ],
//                             ),
//                           ),
//                         ],
//                       ),
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
//   Widget _buildInfoRow(IconData icon, String label, String value) {
//     return Row(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         Icon(
//           icon,
//           size: 18,
//           color: const Color(0xFF0F2A1D).withOpacity(0.7),
//         ),
//         const SizedBox(width: 12),
//         SizedBox(
//           width: 80,
//           child: Text(
//             label,
//             style: const TextStyle(
//               fontWeight: FontWeight.w800,
//               color: Color(0xFF0F2A1D),
//               fontSize: 14,
//               fontFamily: 'Poppins',
//             ),
//           ),
//         ),
//         const Text(
//           ':',
//           style: TextStyle(
//             color: Color(0xFF0F2A1D),
//             fontWeight: FontWeight.w800,
//           ),
//         ),
//         const SizedBox(width: 12),
//         Expanded(
//           child: Text(
//             value,
//             style: const TextStyle(
//               fontSize: 14,
//               color: Color(0xFF0F2A1D),
//               fontWeight: FontWeight.w700,
//               fontFamily: 'Poppins',
//             ),
//             softWrap: true,
//           ),
//         ),
//       ],
//     );
//   }
//
//   Widget _buildGalleryImage(String imageUrl, int index, List<String> allImages, BuildContext context) {
//     return GestureDetector(
//       onTap: () => _showEnlargedImage(context, allImages, index),
//       child: Container(
//         width: 160,
//         height: 130,
//         decoration: BoxDecoration(
//           borderRadius: BorderRadius.circular(18),
//           boxShadow: [
//             BoxShadow(
//               color: const Color(0xFF0F2A1D).withOpacity(0.2),
//               blurRadius: 10,
//               offset: const Offset(0, 5),
//             ),
//           ],
//         ),
//         child: Stack(
//           children: [
//             ClipRRect(
//               borderRadius: BorderRadius.circular(18),
//               child: Image.network(
//                 imageUrl,
//                 fit: BoxFit.cover,
//                 width: double.infinity,
//                 height: double.infinity,
//                 loadingBuilder: (BuildContext context, Widget child, ImageChunkEvent? loadingProgress) {
//                   if (loadingProgress == null) return child;
//                   return Container(
//                     color: const Color(0xFFE3EED4).withOpacity(0.3),
//                     child: Center(
//                       child: CircularProgressIndicator(
//                         value: loadingProgress.expectedTotalBytes != null
//                             ? loadingProgress.cumulativeBytesLoaded / loadingProgress.expectedTotalBytes!
//                             : null,
//                         color: const Color(0xFF0F2A1D),
//                       ),
//                     ),
//                   );
//                 },
//                 errorBuilder: (BuildContext context, Object error, StackTrace? stackTrace) {
//                   return Container(
//                     color: const Color(0xFFE3EED4).withOpacity(0.3),
//                     child: Center(
//                       child: Icon(
//                         Icons.broken_image,
//                         size: 40,
//                         color: const Color(0xFF0F2A1D).withOpacity(0.3),
//                       ),
//                     ),
//                   );
//                 },
//               ),
//             ),
//             // Enlarge icon overlay
//             Positioned(
//               bottom: 8,
//               right: 8,
//               child: Container(
//                 padding: const EdgeInsets.all(6),
//                 decoration: BoxDecoration(
//                   color: const Color(0xFF0F2A1D).withOpacity(0.7),
//                   borderRadius: BorderRadius.circular(20),
//                 ),
//                 child: const Icon(
//                   Icons.open_in_full,
//                   color: Colors.white,
//                   size: 16,
//                 ),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
//
// class Joke {
//   final String id;
//   final String title;
//   final String category;
//   final String name;
//   final String package_details;
//   final String guide_details;
//   final String amount;
//   final String photo1;
//   final String photo2;
//   final String photo3;
//   final String travelCompanyId;
//   final double rating; // Added rating field
//
//   Joke(
//       this.id,
//       this.title,
//       this.category,
//       this.name,
//       this.package_details,
//       this.guide_details,
//       this.amount,
//       this.photo1,
//       this.photo2,
//       this.photo3,
//       this.travelCompanyId,
//       this.rating, // Added to constructor
//       );
// }



import 'dart:convert';
import 'package:final_destination/booking.dart';
import 'package:final_destination/send_package_review.dart';
import 'package:final_destination/view_company_package.dart';
import 'package:final_destination/view_extradetails.dart';
import 'package:final_destination/view_travel_company.dart';
import 'package:final_destination/home.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  runApp(viewpackage());
}

class viewpackage extends StatelessWidget {
  const viewpackage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: const Color(0xFF0F2A1D),
        scaffoldBackgroundColor: const Color(0xFFE3EED4),
        fontFamily: 'Poppins',
      ),
      home: viewpackagesub(),
    );
  }
}

class viewpackagesub extends StatefulWidget {
  const viewpackagesub({Key? key}) : super(key: key);

  @override
  State<viewpackagesub> createState() => _viewpackagesubState();
}

class _viewpackagesubState extends State<viewpackagesub> {
  // Map to track expanded state for each package
  Map<int, bool> _expandedStates = {};

  // Search functionality
  TextEditingController _searchController = TextEditingController();
  String _searchQuery = "";
  List<Joke> _allPackages = [];
  List<Joke> _filteredPackages = [];
  bool _isLoading = true;

  Future<List<Joke>> _getJokes() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String b = prefs.getString("lid").toString();
    String foodimage = "";
    var data = await http.post(
      Uri.parse(prefs.getString("ip").toString() + "/userviewpackage"),
      body: {"id": b},
    );

    var jsonData = json.decode(data.body);
    List<Joke> jokes = [];
    for (var joke in jsonData["message"]) {
      print(joke);
      Joke newJoke = Joke(
        joke["id"].toString(),
        joke["title"].toString(),
        joke["category"].toString(),
        joke["name"].toString(),
        joke["package_details"],
        joke["guide_details"].toString(),
        joke["amount"].toString(),
        prefs.getString('ip').toString() + joke["photo1"].toString(),
        prefs.getString('ip').toString() + joke["photo2"].toString(),
        prefs.getString('ip').toString() + joke["photo3"].toString(),
        joke["travel_company_id"]?.toString() ?? "",
        double.parse(joke["rating"].toString()), // Get the rating from backend
      );
      jokes.add(newJoke);
    }

    // Store all packages and initialize filtered list
    setState(() {
      _allPackages = jokes;
      _filteredPackages = jokes;
      _isLoading = false;
    });

    return jokes;
  }

  void _filterPackages(String query) {
    setState(() {
      _searchQuery = query;
      if (query.isEmpty) {
        _filteredPackages = List.from(_allPackages);
      } else {
        _filteredPackages = _allPackages.where((package) {
          final titleLower = package.title.toLowerCase();
          final searchLower = query.toLowerCase();
          return titleLower.contains(searchLower);
        }).toList();
      }
      // Reset expanded states when filtering
      _expandedStates.clear();
    });
  }

  void _clearSearch() {
    _searchController.clear();
    _filterPackages('');
  }

  void _toggleExpand(int index) {
    setState(() {
      _expandedStates[index] = !(_expandedStates[index] ?? false);
    });
  }

  void _showEnlargedImage(BuildContext context, List<String> images, int initialIndex) {
    // Create a controller for the PageView
    PageController _pageController = PageController(initialPage: initialIndex);
    int currentIndex = initialIndex;

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return StatefulBuilder(
          builder: (context, setState) {
            return Dialog(
              backgroundColor: Colors.transparent,
              insetPadding: EdgeInsets.zero,
              child: Container(
                width: double.infinity,
                height: double.infinity,
                color: Colors.transparent,
                child: Stack(
                  children: [
                    // PageView for swipe navigation
                    PageView.builder(
                      controller: _pageController,
                      itemCount: images.length,
                      onPageChanged: (index) {
                        setState(() {
                          currentIndex = index;
                        });
                      },
                      itemBuilder: (context, index) {
                        return Center(
                          child: GestureDetector(
                            onTap: () => Navigator.pop(context),
                            child: Container(
                              width: double.infinity,
                              height: double.infinity,
                              child: Image.network(
                                images[index],
                                fit: BoxFit.contain,
                                loadingBuilder: (BuildContext context, Widget child, ImageChunkEvent? loadingProgress) {
                                  if (loadingProgress == null) return child;
                                  return Center(
                                    child: CircularProgressIndicator(
                                      value: loadingProgress.expectedTotalBytes != null
                                          ? loadingProgress.cumulativeBytesLoaded / loadingProgress.expectedTotalBytes!
                                          : null,
                                      color: const Color(0xFF0F2A1D),
                                    ),
                                  );
                                },
                                errorBuilder: (BuildContext context, Object error, StackTrace? stackTrace) {
                                  return Center(
                                    child: Column(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        Icon(
                                          Icons.broken_image,
                                          size: 60,
                                          color: const Color(0xFF0F2A1D).withOpacity(0.3),
                                        ),
                                        const SizedBox(height: 10),
                                        Text(
                                          'Failed to load image',
                                          style: TextStyle(
                                            color: const Color(0xFF0F2A1D).withOpacity(0.7),
                                            fontFamily: 'Poppins',
                                          ),
                                        ),
                                      ],
                                    ),
                                  );
                                },
                              ),
                            ),
                          ),
                        );
                      },
                    ),

                    // Image counter
                    Positioned(
                      top: 40,
                      left: 20,
                      child: Container(
                        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                        decoration: BoxDecoration(
                          color: const Color(0xFF0F2A1D).withOpacity(0.1),
                          borderRadius: BorderRadius.circular(20),
                          border: Border.all(
                            color: const Color(0xFF0F2A1D).withOpacity(0.2),
                          ),
                        ),
                        child: Text(
                          '${currentIndex + 1} / ${images.length}',
                          style: const TextStyle(
                            color: Color(0xFF0F2A1D),
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                            fontFamily: 'Poppins',
                          ),
                        ),
                      ),
                    ),

                    // Close button
                    Positioned(
                      top: 40,
                      right: 20,
                      child: GestureDetector(
                        onTap: () => Navigator.pop(context),
                        child: Container(
                          padding: const EdgeInsets.all(12),
                          decoration: BoxDecoration(
                            color: const Color(0xFF0F2A1D).withOpacity(0.1),
                            borderRadius: BorderRadius.circular(30),
                            border: Border.all(
                              color: const Color(0xFF0F2A1D).withOpacity(0.2),
                            ),
                          ),
                          child: const Icon(
                            Icons.close,
                            color: Color(0xFF0F2A1D),
                            size: 24,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        );
      },
    );
  }

  Widget _buildRatingStars(double rating) {
    int fullStars = rating.floor();
    bool hasHalfStar = (rating - fullStars) >= 0.5;

    return Row(
      children: [
        ...List.generate(5, (index) {
          if (index < fullStars) {
            return const Icon(
              Icons.star,
              color: Color(0xFFFFD700),
              size: 18,
            );
          } else if (index == fullStars && hasHalfStar) {
            return const Icon(
              Icons.star_half,
              color: Color(0xFFFFD700),
              size: 18,
            );
          } else {
            return Icon(
              Icons.star_border,
              color: const Color(0xFFFFD700).withOpacity(0.5),
              size: 18,
            );
          }
        }),
        const SizedBox(width: 4),
        Text(
          rating.toStringAsFixed(1),
          style: const TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w800,
            color: Color(0xFF0F2A1D),
            fontFamily: 'Poppins',
          ),
        ),
      ],
    );
  }

  @override
  void initState() {
    super.initState();
    _getJokes();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFE3EED4),
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 2,
        title: Text(
          'Top Rated Packages',
          style: const TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.w800,
            color: Color(0xFF0F2A1D),
            fontFamily: 'Poppins',
            letterSpacing: 1,
          ),
        ),
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios, color: Color(0xFF0F2A1D), size: 22),
          onPressed: () => Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => UserHomeApp()),
          ),
        ),
      ),
      body: Container(
        child: Column(
          children: [
            // Search Bar
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(15),
                  boxShadow: [
                    BoxShadow(
                      color: const Color(0xFF0F2A1D).withOpacity(0.1),
                      blurRadius: 10,
                      offset: const Offset(0, 5),
                    ),
                  ],
                ),
                child: TextField(
                  controller: _searchController,
                  onChanged: _filterPackages,
                  decoration: InputDecoration(
                    hintText: 'Search packages by title...',
                    hintStyle: TextStyle(
                      color: const Color(0xFF0F2A1D).withOpacity(0.5),
                      fontFamily: 'Poppins',
                      fontSize: 14,
                    ),
                    prefixIcon: Icon(
                      Icons.search,
                      color: const Color(0xFF0F2A1D).withOpacity(0.7),
                    ),
                    suffixIcon: _searchQuery.isNotEmpty
                        ? IconButton(
                      icon: Icon(
                        Icons.clear,
                        color: const Color(0xFF0F2A1D).withOpacity(0.7),
                      ),
                      onPressed: _clearSearch,
                    )
                        : null,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                      borderSide: BorderSide.none,
                    ),
                    filled: true,
                    fillColor: Colors.white,
                    contentPadding: const EdgeInsets.symmetric(vertical: 15),
                  ),
                  style: const TextStyle(
                    color: Color(0xFF0F2A1D),
                    fontFamily: 'Poppins',
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ),

            // Search Results Count
            if (_searchQuery.isNotEmpty && !_isLoading)
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Row(
                  children: [
                    Text(
                      'Found ${_filteredPackages.length} package${_filteredPackages.length != 1 ? 's' : ''}',
                      style: TextStyle(
                        color: const Color(0xFF0F2A1D).withOpacity(0.7),
                        fontFamily: 'Poppins',
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
              ),

            // Package List
            Expanded(
              child: _isLoading
                  ? Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CircularProgressIndicator(
                      color: const Color(0xFF0F2A1D),
                    ),
                    const SizedBox(height: 20),
                    Text(
                      "Loading top rated packages...",
                      style: TextStyle(
                        color: const Color(0xFF0F2A1D),
                        fontSize: 16,
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
              )
                  : _filteredPackages.isEmpty
                  ? Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      _searchQuery.isNotEmpty ? Icons.search_off : Icons.card_travel_outlined,
                      size: 100,
                      color: const Color(0xFF0F2A1D).withOpacity(0.3),
                    ),
                    const SizedBox(height: 20),
                    Text(
                      _searchQuery.isNotEmpty ? 'No matching packages found' : 'No packages available',
                      style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w800,
                        color: Color(0xFF0F2A1D),
                        fontFamily: 'Poppins',
                      ),
                    ),
                    const SizedBox(height: 10),
                    Text(
                      _searchQuery.isNotEmpty
                          ? 'Try searching with a different title'
                          : 'Check back later for exciting travel packages',
                      style: TextStyle(
                        fontSize: 14,
                        color: const Color(0xFF0F2A1D).withOpacity(0.6),
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    if (_searchQuery.isNotEmpty)
                      TextButton(
                        onPressed: _clearSearch,
                        child: Text(
                          'Clear Search',
                          style: TextStyle(
                            color: const Color(0xFF0F2A1D),
                            fontWeight: FontWeight.w800,
                            fontFamily: 'Poppins',
                          ),
                        ),
                      ),
                  ],
                ),
              )
                  : ListView.builder(
                padding: const EdgeInsets.all(16),
                itemCount: _filteredPackages.length,
                itemBuilder: (BuildContext context, int index) {
                  var i = _filteredPackages[index];
                  bool isExpanded = _expandedStates[index] ?? false;
                  bool isLongDescription = i.package_details.toString().length > 150;

                  // Create list of images for this package
                  List<String> packageImages = [
                    i.photo1.toString(),
                    i.photo2.toString(),
                    i.photo3.toString(),
                  ];

                  return Padding(
                    padding: const EdgeInsets.only(bottom: 16),
                    child: Card(
                      elevation: 4,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // Header with gradient and rating badge
                          Container(
                            decoration: const BoxDecoration(
                              gradient: LinearGradient(
                                colors: [Color(0xFF0F2A1D), Color(0xFF1A3F2B)],
                                begin: Alignment.topLeft,
                                end: Alignment.bottomRight,
                              ),
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(20),
                                topRight: Radius.circular(20),
                              ),
                            ),
                            padding: const EdgeInsets.all(16),
                            child: Row(
                              children: [
                                Container(
                                  padding: const EdgeInsets.all(8),
                                  decoration: BoxDecoration(
                                    color: Colors.white.withOpacity(0.2),
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  child: const Icon(
                                    Icons.card_travel,
                                    color: Colors.white,
                                    size: 20,
                                  ),
                                ),
                                const SizedBox(width: 12),
                                Expanded(
                                  child: Text(
                                    i.title.toString(),
                                    style: const TextStyle(
                                      color: Colors.white,
                                      fontSize: 20,
                                      fontWeight: FontWeight.w800,
                                      fontFamily: 'Poppins',
                                    ),
                                  ),
                                ),
                                // Rating badge in header
                                Container(
                                  padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      const Icon(
                                        Icons.star,
                                        color: Color(0xFFFFD700),
                                        size: 16,
                                      ),
                                      const SizedBox(width: 4),
                                      Text(
                                        i.rating.toStringAsFixed(1),
                                        style: const TextStyle(
                                          color: Color(0xFF0F2A1D),
                                          fontSize: 14,
                                          fontWeight: FontWeight.w800,
                                          fontFamily: 'Poppins',
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),

                          Padding(
                            padding: const EdgeInsets.all(16),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                // Company Name Badge - Clickable to view only this company
                                GestureDetector(
                                  onTap: () async {
                                    SharedPreferences sh = await SharedPreferences.getInstance();
                                    // Store the travel company ID to show only this specific company
                                    if (i.travelCompanyId.isNotEmpty) {
                                      sh.setString('tid', i.id.toString());
                                    } else {
                                      // If no ID, store the company name as fallback
                                      sh.setString('company_name', i.name.toString());
                                    }
                                    // Set a flag to indicate we're viewing a single company
                                    sh.setBool('view_single_company', true);
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(builder: (context) => const view_company_package()),
                                    );
                                  },
                                  child: Container(
                                    padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                                    decoration: BoxDecoration(
                                      color: const Color(0xFF0F2A1D).withOpacity(0.1),
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        const Icon(
                                          Icons.business,
                                          size: 16,
                                          color: Color(0xFF0F2A1D),
                                        ),
                                        const SizedBox(width: 8),
                                        Text(
                                          i.name.toString(),
                                          style: const TextStyle(
                                            fontSize: 14,
                                            fontWeight: FontWeight.w800,
                                            color: Color(0xFF0F2A1D),
                                            fontFamily: 'Poppins',
                                          ),
                                        ),
                                        const SizedBox(width: 8),
                                        const Icon(
                                          Icons.arrow_forward,
                                          size: 14,
                                          color: Color(0xFF0F2A1D),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),

                                const SizedBox(height: 16),

                                // Category
                                _buildInfoRow(Icons.category, 'Category', i.category.toString()),

                                const SizedBox(height: 12),

                                // Guide details
                                _buildInfoRow(Icons.assignment_ind, 'Guide', i.guide_details.toString()),

                                const SizedBox(height: 12),

                                // Amount with premium styling
                                Container(
                                  padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                                  decoration: BoxDecoration(
                                    gradient: LinearGradient(
                                      colors: [
                                        const Color(0xFF0F2A1D).withOpacity(0.1),
                                        const Color(0xFFE3EED4).withOpacity(0.5),
                                      ],
                                      begin: Alignment.topLeft,
                                      end: Alignment.bottomRight,
                                    ),
                                    borderRadius: BorderRadius.circular(15),
                                    border: Border.all(
                                      color: const Color(0xFF0F2A1D).withOpacity(0.3),
                                    ),
                                  ),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      const Icon(
                                        Icons.currency_rupee,
                                        size: 22,
                                        color: Color(0xFF0F2A1D),
                                      ),
                                      const SizedBox(width: 4),
                                      Text(
                                        i.amount.toString(),
                                        style: const TextStyle(
                                          fontSize: 24,
                                          fontWeight: FontWeight.w900,
                                          color: Color(0xFF0F2A1D),
                                          fontFamily: 'Poppins',
                                        ),
                                      ),
                                      const Text(
                                        ' / person',
                                        style: TextStyle(
                                          fontSize: 14,
                                          color: Color(0xFF0F2A1D),
                                          fontWeight: FontWeight.w600,
                                          fontFamily: 'Poppins',
                                        ),
                                      ),
                                    ],
                                  ),
                                ),

                                const SizedBox(height: 20),

                                // Package Details Section - Enhanced Styling with Expandable Content
                                Container(
                                  width: double.infinity,
                                  padding: const EdgeInsets.all(18),
                                  decoration: BoxDecoration(
                                    gradient: LinearGradient(
                                      begin: Alignment.topLeft,
                                      end: Alignment.bottomRight,
                                      colors: [
                                        const Color(0xFF0F2A1D).withOpacity(0.03),
                                        const Color(0xFFE3EED4).withOpacity(0.4),
                                      ],
                                    ),
                                    borderRadius: BorderRadius.circular(18),
                                    border: Border.all(
                                      color: const Color(0xFF0F2A1D).withOpacity(0.15),
                                      width: 1.5,
                                    ),
                                    boxShadow: [
                                      BoxShadow(
                                        color: const Color(0xFF0F2A1D).withOpacity(0.05),
                                        blurRadius: 10,
                                        offset: const Offset(0, 4),
                                      ),
                                    ],
                                  ),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      // Title with icon
                                      Row(
                                        children: [
                                          Container(
                                            padding: const EdgeInsets.all(6),
                                            decoration: BoxDecoration(
                                              color: const Color(0xFF0F2A1D).withOpacity(0.1),
                                              borderRadius: BorderRadius.circular(8),
                                            ),
                                            child: const Icon(
                                              Icons.description_outlined,
                                              size: 18,
                                              color: Color(0xFF0F2A1D),
                                            ),
                                          ),
                                          const SizedBox(width: 10),
                                          const Text(
                                            'Package Details',
                                            style: TextStyle(
                                              fontSize: 18,
                                              fontWeight: FontWeight.w900,
                                              color: Color(0xFF0F2A1D),
                                              fontFamily: 'Poppins',
                                              letterSpacing: 0.5,
                                            ),
                                          ),
                                        ],
                                      ),

                                      const SizedBox(height: 16),

                                      // Description with expandable content
                                      Container(
                                        padding: const EdgeInsets.symmetric(horizontal: 4),
                                        child: Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              isExpanded
                                                  ? i.package_details.toString()
                                                  : (isLongDescription
                                                  ? '${i.package_details.toString().substring(0, 150)}...'
                                                  : i.package_details.toString()),
                                              style: const TextStyle(
                                                fontSize: 15,
                                                color: Color(0xFF0F2A1D),
                                                fontFamily: 'Poppins',
                                                fontWeight: FontWeight.w700,
                                                height: 1.7,
                                                letterSpacing: 0.3,
                                              ),
                                            ),

                                            if (isLongDescription)
                                              Padding(
                                                padding: const EdgeInsets.only(top: 12),
                                                child: GestureDetector(
                                                  onTap: () => _toggleExpand(index),
                                                  child: Container(
                                                    padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                                                    decoration: BoxDecoration(
                                                      color: const Color(0xFF0F2A1D).withOpacity(0.1),
                                                      borderRadius: BorderRadius.circular(30),
                                                    ),
                                                    child: Row(
                                                      mainAxisSize: MainAxisSize.min,
                                                      children: [
                                                        Text(
                                                          isExpanded ? 'Show Less' : 'View More',
                                                          style: const TextStyle(
                                                            color: Color(0xFF0F2A1D),
                                                            fontSize: 13,
                                                            fontWeight: FontWeight.w800,
                                                            fontFamily: 'Poppins',
                                                          ),
                                                        ),
                                                        const SizedBox(width: 6),
                                                        Icon(
                                                          isExpanded ? Icons.expand_less : Icons.expand_more,
                                                          size: 16,
                                                          color: const Color(0xFF0F2A1D),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                              ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),

                                const SizedBox(height: 20),

                                // Photo Gallery Title
                                Row(
                                  children: [
                                    Container(
                                      padding: const EdgeInsets.all(6),
                                      decoration: BoxDecoration(
                                        color: const Color(0xFF0F2A1D).withOpacity(0.1),
                                        borderRadius: BorderRadius.circular(8),
                                      ),
                                      child: const Icon(
                                        Icons.photo_library_outlined,
                                        size: 18,
                                        color: Color(0xFF0F2A1D),
                                      ),
                                    ),
                                    const SizedBox(width: 10),
                                    const Text(
                                      'Gallery',
                                      style: TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.w900,
                                        color: Color(0xFF0F2A1D),
                                        fontFamily: 'Poppins',
                                      ),
                                    ),
                                  ],
                                ),

                                const SizedBox(height: 12),

                                // Photo Gallery - Horizontal Scroll
                                SingleChildScrollView(
                                  scrollDirection: Axis.horizontal,
                                  child: Row(
                                    children: [
                                      _buildGalleryImage(i.photo1.toString(), 0, packageImages, context),
                                      const SizedBox(width: 12),
                                      _buildGalleryImage(i.photo2.toString(), 1, packageImages, context),
                                      const SizedBox(width: 12),
                                      _buildGalleryImage(i.photo3.toString(), 2, packageImages, context),
                                    ],
                                  ),
                                ),

                                const SizedBox(height: 20),

                                // Action Buttons
                                Row(
                                  children: [
                                    // Book Now Button
                                    Expanded(
                                      child: ElevatedButton(
                                        onPressed: () async {
                                          SharedPreferences sh = await SharedPreferences.getInstance();
                                          sh.setString('ownid', i.id.toString());
                                          Navigator.push(
                                            context,
                                            MaterialPageRoute(builder: (context) => booking()),
                                          );
                                        },
                                        style: ElevatedButton.styleFrom(
                                          backgroundColor: const Color(0xFF0F2A1D),
                                          foregroundColor: Colors.white,
                                          padding: const EdgeInsets.symmetric(vertical: 12),
                                          shape: RoundedRectangleBorder(
                                            borderRadius: BorderRadius.circular(10),
                                          ),
                                          elevation: 4,
                                        ),
                                        child: const Text(
                                          'BOOK',
                                          style: TextStyle(
                                            fontSize: 12,
                                            fontWeight: FontWeight.w800,
                                            fontFamily: 'Poppins',
                                          ),
                                        ),
                                      ),
                                    ),
                                    const SizedBox(width: 8),

                                    // Details Button
                                    Expanded(
                                      child: OutlinedButton(
                                        onPressed: () async {
                                          SharedPreferences sh = await SharedPreferences.getInstance();
                                          sh.setString('oid', i.id.toString());
                                          Navigator.push(
                                            context,
                                            MaterialPageRoute(builder: (context) => view_extradetails()),
                                          );
                                        },
                                        style: OutlinedButton.styleFrom(
                                          side: const BorderSide(color: Color(0xFF0F2A1D), width: 1.5),
                                          foregroundColor: const Color(0xFF0F2A1D),
                                          padding: const EdgeInsets.symmetric(vertical: 12),
                                          shape: RoundedRectangleBorder(
                                            borderRadius: BorderRadius.circular(10),
                                          ),
                                        ),
                                        child: const Text(
                                          'DETAILS',
                                          style: TextStyle(
                                            fontSize: 12,
                                            fontWeight: FontWeight.w800,
                                            fontFamily: 'Poppins',
                                          ),
                                        ),
                                      ),
                                    ),
                                    const SizedBox(width: 8),

                                    // Send Review Button
                                    Expanded(
                                      child: ElevatedButton(
                                        onPressed: () async {
                                          SharedPreferences sh = await SharedPreferences.getInstance();
                                          sh.setString('pid', i.id.toString());
                                          Navigator.push(
                                              context,
                                              MaterialPageRoute(builder: (context) => PackageReviewPage())
                                          );
                                        },
                                        style: ElevatedButton.styleFrom(
                                          backgroundColor: const Color(0xFF0F2A1D).withOpacity(0.8),
                                          foregroundColor: Colors.white,
                                          padding: const EdgeInsets.symmetric(vertical: 12),
                                          shape: RoundedRectangleBorder(
                                            borderRadius: BorderRadius.circular(10),
                                          ),
                                          elevation: 2,
                                        ),
                                        child: const Text(
                                          'REVIEW',
                                          style: TextStyle(
                                            fontSize: 12,
                                            fontWeight: FontWeight.w800,
                                            fontFamily: 'Poppins',
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildInfoRow(IconData icon, String label, String value) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Icon(
          icon,
          size: 18,
          color: const Color(0xFF0F2A1D).withOpacity(0.7),
        ),
        const SizedBox(width: 12),
        SizedBox(
          width: 60,
          child: Text(
            label,
            style: const TextStyle(
              fontWeight: FontWeight.w800,
              color: Color(0xFF0F2A1D),
              fontSize: 14,
              fontFamily: 'Poppins',
            ),
          ),
        ),
        const Text(
          ':',
          style: TextStyle(
            color: Color(0xFF0F2A1D),
            fontWeight: FontWeight.w800,
          ),
        ),
        const SizedBox(width: 12),
        Expanded(
          child: Text(
            value,
            style: const TextStyle(
              fontSize: 14,
              color: Color(0xFF0F2A1D),
              fontWeight: FontWeight.w700,
              fontFamily: 'Poppins',
            ),
            softWrap: true,
          ),
        ),
      ],
    );
  }

  Widget _buildGalleryImage(String imageUrl, int index, List<String> allImages, BuildContext context) {
    return GestureDetector(
      onTap: () => _showEnlargedImage(context, allImages, index),
      child: Container(
        width: 160,
        height: 130,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(18),
          boxShadow: [
            BoxShadow(
              color: const Color(0xFF0F2A1D).withOpacity(0.2),
              blurRadius: 10,
              offset: const Offset(0, 5),
            ),
          ],
        ),
        child: Stack(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(18),
              child: Image.network(
                imageUrl,
                fit: BoxFit.cover,
                width: double.infinity,
                height: double.infinity,
                loadingBuilder: (BuildContext context, Widget child, ImageChunkEvent? loadingProgress) {
                  if (loadingProgress == null) return child;
                  return Container(
                    color: const Color(0xFFE3EED4).withOpacity(0.3),
                    child: Center(
                      child: CircularProgressIndicator(
                        value: loadingProgress.expectedTotalBytes != null
                            ? loadingProgress.cumulativeBytesLoaded / loadingProgress.expectedTotalBytes!
                            : null,
                        color: const Color(0xFF0F2A1D),
                      ),
                    ),
                  );
                },
                errorBuilder: (BuildContext context, Object error, StackTrace? stackTrace) {
                  return Container(
                    color: const Color(0xFFE3EED4).withOpacity(0.3),
                    child: Center(
                      child: Icon(
                        Icons.broken_image,
                        size: 40,
                        color: const Color(0xFF0F2A1D).withOpacity(0.3),
                      ),
                    ),
                  );
                },
              ),
            ),
            // Enlarge icon overlay
            Positioned(
              bottom: 8,
              right: 8,
              child: Container(
                padding: const EdgeInsets.all(6),
                decoration: BoxDecoration(
                  color: const Color(0xFF0F2A1D).withOpacity(0.7),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: const Icon(
                  Icons.open_in_full,
                  color: Colors.white,
                  size: 16,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class Joke {
  final String id;
  final String title;
  final String category;
  final String name;
  final String package_details;
  final String guide_details;
  final String amount;
  final String photo1;
  final String photo2;
  final String photo3;
  final String travelCompanyId;
  final double rating; // Added rating field

  Joke(
      this.id,
      this.title,
      this.category,
      this.name,
      this.package_details,
      this.guide_details,
      this.amount,
      this.photo1,
      this.photo2,
      this.photo3,
      this.travelCompanyId,
      this.rating, // Added to constructor
      );
}








