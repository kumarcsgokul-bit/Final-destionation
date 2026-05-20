// import 'dart:convert';
//
// import 'package:final_destination/home.dart';
// import 'package:flutter/material.dart';
// import 'package:http/http.dart' as http;
// import 'package:shared_preferences/shared_preferences.dart';
//
// import 'RazorpayScreen.dart';
//
// void main(){
//   runApp(viewbooking_status());
// }
// class viewbooking_status extends StatelessWidget {
//   const viewbooking_status({Key? key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(home: viewbooking_statussub(),);
//   }
// }
// class viewbooking_statussub extends StatefulWidget {
//   const viewbooking_statussub({Key? key}) : super(key: key);
//
//   @override
//   State<viewbooking_statussub> createState() => _viewbooking_statussubState();
// }
//
// class _viewbooking_statussubState extends State<viewbooking_statussub> {
//   Future<List<Joke>> _getJokes() async {
//     SharedPreferences prefs = await SharedPreferences.getInstance();
//     String b = prefs.getString("lid").toString();
//     String foodimage="";
//     var data =
//     await http.post(Uri.parse(prefs.getString("ip").toString()+"/user_viewbooking_status"),
//         body: {"uid":prefs.getString('uid').toString()}
//     );
//
//     var jsonData = json.decode(data.body);
//     prefs.setString('total', jsonData['total'].toString());
// //    print(jsonData);
//     List<Joke> jokes = [];
//     for (var joke in jsonData["message"]) {
//       print(joke);
//       Joke newJoke = Joke(
//           joke["id"].toString(),
//           joke["status"],
//           joke["date"].toString(),
//           joke["total_person"].toString(),
//           prefs.getString('ip').toString()+joke["photo"].toString(),
//           joke["amount"].toString(),
//           joke["package_details"].toString(),
//           joke["travelcompany_name"].toString(),
//           joke["bookingdate"].toString(),
//
//
//       );
//       jokes.add(newJoke);
//     }
//     return jokes;
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(body:
//     Container(
//
//       child:
//       FutureBuilder(
//         future: _getJokes(),
//         builder: (BuildContext context, AsyncSnapshot snapshot) {
// //              print("snapshot"+snapshot.toString());
//           if (snapshot.data == null) {
//             return Container(
//               child: Center(
//                 child: Text("Loading..."),
//               ),
//             );
//           } else {
//             return ListView.builder(
//               itemCount: snapshot.data.length,
//               itemBuilder: (BuildContext context, int index) {
//                 var i = snapshot.data![index];
//                 return Padding(
//                   padding: const EdgeInsets.all(8.0),
//                   child: Card(
//                     elevation: 3,
//                     shape: RoundedRectangleBorder(
//                       borderRadius: BorderRadius.circular(10),
//                       side: BorderSide(color: Colors.grey.shade300),
//                     ),
//                     child: Padding(
//                       padding: const EdgeInsets.all(16.0),
//                       child: Column(
//                         crossAxisAlignment: CrossAxisAlignment.start,
//                         children: [
//
//                           SizedBox(height: 10),
//                           _buildRow("status:", i.status.toString()),
//                           _buildRow("date:", i.date.toString()),
//                           _buildRow("date:", i.date.toString()),
//                           _buildRow("total_person:", i.total_person.toString()),
//                           Image.network(i.photo.toString(),height: 200,width: 200,),
//                           _buildRow("amount:", i.amount.toString()),
//                           _buildRow("package_details:", i.package_details.toString()),
//                           _buildRow("travelcompany_name:", i.travelcompany_name.toString()),
//                           Row(children: [
//                             ElevatedButton(onPressed: () async {
//                               SharedPreferences sh=await SharedPreferences.getInstance();
//                               sh.setString('bid', i.id.toString());
//                               Navigator.push(context, MaterialPageRoute(builder: (context)=>RazorpayScreen()));
//                             }, child: Text('Pay'))
//                           ],)
//
//
//
//
//                         ],
//                       ),
//                     ),
//                   ),
//                 );
//               },
//             );
//
//
//           }
//         },
//
//
//       ),
//
//
//
//
//
//     ),
//         );
//   }
//   Widget _buildRow(String label, String value) {
//     return Padding(
//       padding: const EdgeInsets.symmetric(vertical: 4),
//       child: Row(
//         children: [
//           SizedBox(
//             width: 100,
//             child: Text(
//               label,
//               style: TextStyle(
//                 fontWeight: FontWeight.bold,
//               ),
//             ),
//           ),
//           SizedBox(width: 5),
//           Flexible(
//             child: Text(
//               value,
//               style: TextStyle(
//                 color: Colors.grey.shade800,
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
//
// }
// class Joke {
//   final String id;
//   final String status;
//   final String date;
//   final String total_person;
//   final String photo;
//   final String amount;
//   final String package_details;
//   final String travelcompany_name;
//   final String bookingdate;
//
//
//
//
//
//   Joke(this.id,this.status, this.date,this.total_person,this.photo,this.amount,this.package_details,this.travelcompany_name,this.bookingdate);
// //  print("hiiiii");
// }


//
//
// import 'dart:convert';
// import 'package:final_destination/home.dart';
// import 'package:flutter/material.dart';
// import 'package:http/http.dart' as http;
// import 'package:shared_preferences/shared_preferences.dart';
// import 'RazorpayScreen.dart';
//
// class viewbooking_status extends StatelessWidget {
//   const viewbooking_status({Key? key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return const viewbooking_statussub();
//   }
// }
//
// class viewbooking_statussub extends StatefulWidget {
//   const viewbooking_statussub({Key? key}) : super(key: key);
//
//   @override
//   State<viewbooking_statussub> createState() =>
//       _viewbooking_statussubState();
// }
//
// class _viewbooking_statussubState
//     extends State<viewbooking_statussub> {
//
//   Future<List<Joke>> _getJokes() async {
//     SharedPreferences prefs =
//     await SharedPreferences.getInstance();
//
//     var response = await http.post(
//       Uri.parse(
//         prefs.getString("ip").toString() +
//             "/user_viewbooking_status",
//       ),
//       body: {
//         "uid": prefs.getString('uid').toString()
//       },
//     );
//
//     var jsonData = json.decode(response.body);
//
//     List<Joke> jokes = [];
//
//     for (var joke in jsonData["message"]) {
//       Joke newJoke = Joke(
//         joke["id"].toString(),
//         joke["status"].toString(),
//         joke["date"].toString(),
//         joke["total_person"].toString(),
//         prefs.getString('ip').toString() +
//             joke["photo"].toString(),
//         joke["amount"].toString(),
//         joke["package_details"].toString(),
//         joke["travelcompany_name"].toString(),
//         joke["bookingdate"].toString(),
//       );
//
//       jokes.add(newJoke);
//     }
//
//     return jokes;
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text("Booking Status"),
//       ),
//       body: FutureBuilder<List<Joke>>(
//         future: _getJokes(),
//         builder: (context, snapshot) {
//
//           if (snapshot.connectionState ==
//               ConnectionState.waiting) {
//             return const Center(
//               child: CircularProgressIndicator(),
//             );
//           }
//
//           if (!snapshot.hasData ||
//               snapshot.data!.isEmpty) {
//             return const Center(
//               child: Text("No Bookings Found"),
//             );
//           }
//
//           return ListView.builder(
//             itemCount: snapshot.data!.length,
//             itemBuilder: (context, index) {
//
//               var i = snapshot.data![index];
//
//               return Padding(
//                 padding:
//                 const EdgeInsets.all(8.0),
//                 child: Card(
//                   elevation: 3,
//                   child: Padding(
//                     padding:
//                     const EdgeInsets.all(12),
//                     child: Column(
//                       crossAxisAlignment:
//                       CrossAxisAlignment.start,
//                       children: [
//
//                         _buildRow("Status:", i.status),
//                         _buildRow("Date:", i.date),
//                         _buildRow(
//                             "Total Person:",
//                             i.total_person),
//
//                         const SizedBox(height: 10),
//
//                         Image.network(
//                           i.photo,
//                           height: 200,
//                           width: 200,
//                           fit: BoxFit.cover,
//                         ),
//
//                         const SizedBox(height: 10),
//
//                         _buildRow("Amount:", i.amount),
//                         _buildRow(
//                             "Package:",
//                             i.package_details),
//                         _buildRow(
//                             "Company:",
//                             i.travelcompany_name),
//
//                         const SizedBox(height: 10),
//
//                         ElevatedButton(
//                           onPressed: () async {
//                             SharedPreferences sh =
//                             await SharedPreferences
//                                 .getInstance();
//                             sh.setString( 'bid', i.id);
//                             sh.setString( 'total', i.amount.toString());
//
//                             Navigator.push(
//                               context,
//                               MaterialPageRoute(
//                                 builder: (context) =>
//                                     RazorpayScreen(),
//                               ),
//                             );
//                           },
//                           child: const Text("Pay"),
//                         ),
//                       ],
//                     ),
//                   ),
//                 ),
//               );
//             },
//           );
//         },
//       ),
//     );
//   }
//
//   Widget _buildRow(
//       String label, String value) {
//     return Padding(
//       padding:
//       const EdgeInsets.symmetric(
//           vertical: 4),
//       child: Row(
//         children: [
//           SizedBox(
//             width: 120,
//             child: Text(
//               label,
//               style: const TextStyle(
//                   fontWeight:
//                   FontWeight.bold),
//             ),
//           ),
//           Expanded(
//             child: Text(value),
//           ),
//         ],
//       ),
//     );
//   }
// }
//
// class Joke {
//   final String id;
//   final String status;
//   final String date;
//   final String total_person;
//   final String photo;
//   final String amount;
//   final String package_details;
//   final String travelcompany_name;
//   final String bookingdate;
//
//   Joke(
//       this.id,
//       this.status,
//       this.date,
//       this.total_person,
//       this.photo,
//       this.amount,
//       this.package_details,
//       this.travelcompany_name,
//       this.bookingdate,
//       );
// }
// //
// import 'dart:convert';
// import 'package:final_destination/home.dart';
// import 'package:flutter/material.dart';
// import 'package:http/http.dart' as http;
// import 'package:shared_preferences/shared_preferences.dart';
// import 'RazorpayScreen.dart';
// import 'viewpackage.dart';
//
// void main() {
//   runApp(viewbooking_status());
// }
//
// class viewbooking_status extends StatelessWidget {
//   const viewbooking_status({Key? key}) : super(key: key);
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
//       home: viewbooking_statussub(),
//     );
//   }
// }
//
// class viewbooking_statussub extends StatefulWidget {
//   const viewbooking_statussub({Key? key}) : super(key: key);
//
//   @override
//   State<viewbooking_statussub> createState() => _viewbooking_statussubState();
// }
//
// class _viewbooking_statussubState extends State<viewbooking_statussub> {
//   Future<List<Booking>> _getBookings() async {
//     SharedPreferences prefs = await SharedPreferences.getInstance();
//     var data = await http.post(
//         Uri.parse(prefs.getString("ip").toString() + "/user_viewbooking_status"),
//         body: {"uid": prefs.getString('uid').toString()}
//     );
//
//     var jsonData = json.decode(data.body);
//     prefs.setString('total', jsonData['total'].toString());
//
//     List<Booking> bookings = [];
//     if (jsonData["message"] != null) {
//       for (var booking in jsonData["message"]) {
//         Booking newBooking = Booking(
//           booking["id"].toString(),
//           booking["status"] ?? "",
//           booking["date"].toString(),
//           booking["total_person"].toString(),
//           prefs.getString('ip').toString() + (booking["photo"] ?? ""),
//           booking["amount"].toString(),
//           booking["package_details"].toString(),
//           booking["travelcompany_name"].toString(),
//         );
//         bookings.add(newBooking);
//       }
//     }
//     return bookings;
//   }
//
//   void _showFullDetailsBottomSheet(BuildContext context, String title, String details) {
//     showModalBottomSheet(
//       context: context,
//       isScrollControlled: true,
//       backgroundColor: Colors.transparent,
//       builder: (BuildContext context) {
//         return Container(
//           height: MediaQuery.of(context).size.height * 0.7,
//           decoration: const BoxDecoration(
//             color: Colors.white,
//             borderRadius: BorderRadius.only(
//               topLeft: Radius.circular(25),
//               topRight: Radius.circular(25),
//             ),
//           ),
//           child: Column(
//             children: [
//               // Handle bar
//               Container(
//                 margin: const EdgeInsets.only(top: 12),
//                 width: 40,
//                 height: 4,
//                 decoration: BoxDecoration(
//                   color: Colors.grey[300],
//                   borderRadius: BorderRadius.circular(2),
//                 ),
//               ),
//               // Header
//               Padding(
//                 padding: const EdgeInsets.all(20),
//                 child: Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                   children: [
//                     Text(
//                       title,
//                       style: const TextStyle(
//                         fontSize: 22,
//                         fontWeight: FontWeight.w800,
//                         color: Color(0xFF0F2A1D),
//                         fontFamily: 'Poppins',
//                       ),
//                     ),
//                     IconButton(
//                       icon: const Icon(Icons.close, color: Color(0xFF0F2A1D)),
//                       onPressed: () => Navigator.pop(context),
//                     ),
//                   ],
//                 ),
//               ),
//               const Divider(height: 1, color: Color(0xFF0F2A1D)),
//               // Scrollable content
//               Expanded(
//                 child: SingleChildScrollView(
//                   padding: const EdgeInsets.all(20),
//                   child: Container(
//                     padding: const EdgeInsets.all(16),
//                     decoration: BoxDecoration(
//                       color: const Color(0xFFE3EED4).withOpacity(0.3),
//                       borderRadius: BorderRadius.circular(15),
//                       border: Border.all(
//                         color: const Color(0xFF0F2A1D).withOpacity(0.1),
//                       ),
//                     ),
//                     child: Text(
//                       details,
//                       style: const TextStyle(
//                         color: Color(0xFF0F2A1D),
//                         fontSize: 15,
//                         height: 1.6,
//                         fontFamily: 'Poppins',
//                         fontWeight: FontWeight.w600,
//                       ),
//                     ),
//                   ),
//                 ),
//               ),
//             ],
//           ),
//         );
//       },
//     );
//   }
//
//   Color _getStatusColor(String status) {
//     switch(status.toLowerCase()) {
//       case 'confirmed':
//         return const Color(0xFF4CAF50);
//       case 'pending':
//         return Colors.orange;
//       case 'cancelled':
//         return Colors.red;
//       case 'paid':
//         return const Color(0xFF0F2A1D);
//       default:
//         return const Color(0xFF0F2A1D);
//     }
//   }
//
//   String _getStatusText(String status) {
//     switch(status.toLowerCase()) {
//       case 'confirmed':
//         return 'CONFIRMED';
//       case 'pending':
//         return 'PENDING PAYMENT';
//       case 'cancelled':
//         return 'CANCELLED';
//       case 'paid':
//         return 'PAID';
//       default:
//         return status.toUpperCase();
//     }
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: const Color(0xFFE3EED4),
//       appBar: AppBar(
//         title: Text(
//           'Booking Status',
//           style: const TextStyle(
//             fontSize: 24,
//             fontWeight: FontWeight.w800,
//             color: Color(0xFF0F2A1D),
//             fontFamily: 'Poppins',
//           ),
//         ),
//         centerTitle: true,
//         backgroundColor: Colors.white,
//         elevation: 2,
//         leading: IconButton(
//           icon: const Icon(Icons.arrow_back, color: Color(0xFF0F2A1D)),
//           onPressed: () => Navigator.push(
//               context,
//               MaterialPageRoute(builder: (context) => UserHomeApp())
//           ),
//         ),
//       ),
//       body: FutureBuilder<List<Booking>>(
//         future: _getBookings(),
//         builder: (BuildContext context, AsyncSnapshot<List<Booking>> snapshot) {
//           if (snapshot.connectionState == ConnectionState.waiting) {
//             return Center(
//               child: Column(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: [
//                   CircularProgressIndicator(
//                     color: const Color(0xFF0F2A1D),
//                   ),
//                   const SizedBox(height: 20),
//                   Text(
//                     "Loading your bookings...",
//                     style: const TextStyle(
//                       color: Color(0xFF0F2A1D),
//                       fontSize: 18,
//                       fontFamily: 'Poppins',
//                       fontWeight: FontWeight.w700,
//                     ),
//                   ),
//                 ],
//               ),
//             );
//           } else if (snapshot.hasError) {
//             return Center(
//               child: Column(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: [
//                   Icon(
//                     Icons.error_outline,
//                     size: 60,
//                     color: Colors.red,
//                   ),
//                   const SizedBox(height: 16),
//                   Text(
//                     'Error loading bookings',
//                     style: const TextStyle(
//                       fontSize: 18,
//                       color: Colors.red,
//                       fontFamily: 'Poppins',
//                       fontWeight: FontWeight.w700,
//                     ),
//                   ),
//                 ],
//               ),
//             );
//           } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
//             return Center(
//               child: Column(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: [
//                   Icon(
//                     Icons.book_online_outlined,
//                     size: 100,
//                     color: const Color(0xFF0F2A1D).withOpacity(0.3),
//                   ),
//                   const SizedBox(height: 20),
//                   Text(
//                     'No bookings found',
//                     style: const TextStyle(
//                       fontSize: 22,
//                       fontWeight: FontWeight.w800,
//                       color: Color(0xFF0F2A1D),
//                       fontFamily: 'Poppins',
//                     ),
//                   ),
//                   const SizedBox(height: 10),
//                   Text(
//                     'Book a package to see your bookings here',
//                     style: TextStyle(
//                       fontSize: 16,
//                       color: const Color(0xFF0F2A1D).withOpacity(0.6),
//                       fontFamily: 'Poppins',
//                       fontWeight: FontWeight.w600,
//                     ),
//                   ),
//                   const SizedBox(height: 30),
//                   ElevatedButton(
//                     onPressed: () {
//                       Navigator.push(
//                         context,
//                         MaterialPageRoute(builder: (context) => const viewpackage()),
//                       );
//                     },
//                     style: ElevatedButton.styleFrom(
//                       backgroundColor: const Color(0xFF0F2A1D),
//                       foregroundColor: Colors.white,
//                       padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 12),
//                       shape: RoundedRectangleBorder(
//                         borderRadius: BorderRadius.circular(30),
//                       ),
//                     ),
//                     child: const Text(
//                       'Browse Packages',
//                       style: TextStyle(
//                         color: Colors.white,
//                         fontWeight: FontWeight.w800,
//                         fontFamily: 'Poppins',
//                         fontSize: 16,
//                       ),
//                     ),
//                   ),
//                 ],
//               ),
//             );
//           } else {
//             return ListView.builder(
//               padding: const EdgeInsets.all(16),
//               itemCount: snapshot.data!.length,
//               itemBuilder: (BuildContext context, int index) {
//                 var booking = snapshot.data![index];
//                 Color statusColor = _getStatusColor(booking.status);
//                 String statusText = _getStatusText(booking.status);
//                 bool isPending = booking.status.toLowerCase() == 'pending';
//
//                 return Padding(
//                   padding: const EdgeInsets.only(bottom: 16),
//                   child: Card(
//                     elevation: 4,
//                     shape: RoundedRectangleBorder(
//                       borderRadius: BorderRadius.circular(20),
//                     ),
//                     child: Column(
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: [
//                         // Header with status
//                         Container(
//                           decoration: const BoxDecoration(
//                             gradient: LinearGradient(
//                               colors: [Color(0xFF0F2A1D), Color(0xFF1A3F2B)],
//                               begin: Alignment.topLeft,
//                               end: Alignment.bottomRight,
//                             ),
//                             borderRadius: BorderRadius.only(
//                               topLeft: Radius.circular(20),
//                               topRight: Radius.circular(20),
//                             ),
//                           ),
//                           padding: const EdgeInsets.all(16),
//                           child: Row(
//                             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                             children: [
//                               Text(
//                                 'Booking #${booking.id.substring(0, booking.id.length > 8 ? 8 : booking.id.length)}',
//                                 style: const TextStyle(
//                                   color: Colors.white,
//                                   fontWeight: FontWeight.w800,
//                                   fontSize: 16,
//                                   fontFamily: 'Poppins',
//                                 ),
//                               ),
//                               Container(
//                                 padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
//                                 decoration: BoxDecoration(
//                                   color: statusColor.withOpacity(0.2),
//                                   borderRadius: BorderRadius.circular(20),
//                                   border: Border.all(color: Colors.white.withOpacity(0.3)),
//                                 ),
//                                 child: Text(
//                                   statusText,
//                                   style: const TextStyle(
//                                     color: Colors.white,
//                                     fontWeight: FontWeight.w800,
//                                     fontSize: 12,
//                                     fontFamily: 'Poppins',
//                                   ),
//                                 ),
//                               ),
//                             ],
//                           ),
//                         ),
//
//                         // Content
//                         Padding(
//                           padding: const EdgeInsets.all(16),
//                           child: Column(
//                             crossAxisAlignment: CrossAxisAlignment.start,
//                             children: [
//                               // Travel Company Name
//                               Container(
//                                 padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
//                                 decoration: BoxDecoration(
//                                   color: const Color(0xFF0F2A1D).withOpacity(0.1),
//                                   borderRadius: BorderRadius.circular(10),
//                                 ),
//                                 child: Row(
//                                   children: [
//                                     Icon(
//                                       Icons.business,
//                                       size: 20,
//                                       color: const Color(0xFF0F2A1D),
//                                     ),
//                                     const SizedBox(width: 8),
//                                     Expanded(
//                                       child: Text(
//                                         booking.travelcompany_name,
//                                         style: const TextStyle(
//                                           fontSize: 16,
//                                           fontWeight: FontWeight.w800,
//                                           color: Color(0xFF0F2A1D),
//                                           fontFamily: 'Poppins',
//                                         ),
//                                       ),
//                                     ),
//                                   ],
//                                 ),
//                               ),
//                               const SizedBox(height: 16),
//
//                               // Image
//                               ClipRRect(
//                                 borderRadius: BorderRadius.circular(15),
//                                 child: Image.network(
//                                   booking.photo,
//                                   height: 200,
//                                   width: double.infinity,
//                                   fit: BoxFit.cover,
//                                   errorBuilder: (context, error, stackTrace) {
//                                     return Container(
//                                       height: 200,
//                                       color: Colors.grey[200],
//                                       child: const Center(
//                                         child: Icon(
//                                           Icons.image_not_supported,
//                                           size: 50,
//                                           color: Colors.grey,
//                                         ),
//                                       ),
//                                     );
//                                   },
//                                 ),
//                               ),
//                               const SizedBox(height: 16),
//
//                               // Details Grid with bold subheadings
//                               Container(
//                                 padding: const EdgeInsets.all(16),
//                                 decoration: BoxDecoration(
//                                   color: const Color(0xFFE3EED4).withOpacity(0.3),
//                                   borderRadius: BorderRadius.circular(15),
//                                   border: Border.all(
//                                     color: const Color(0xFF0F2A1D).withOpacity(0.1),
//                                   ),
//                                 ),
//                                 child: Column(
//                                   children: [
//                                     _buildInfoRow(Icons.calendar_today, 'Date', booking.date),
//                                     const SizedBox(height: 12),
//                                     _buildInfoRow(Icons.people, 'Persons', booking.total_person),
//                                     const SizedBox(height: 12),
//                                     _buildInfoRow(Icons.currency_rupee, 'Amount', '₹${booking.amount}'),
//                                     const SizedBox(height: 12),
//
//                                     // Package Details with View More option
//                                     Row(
//                                       crossAxisAlignment: CrossAxisAlignment.start,
//                                       children: [
//                                         Icon(
//                                           Icons.description,
//                                           size: 20,
//                                           color: const Color(0xFF0F2A1D).withOpacity(0.7),
//                                         ),
//                                         const SizedBox(width: 12),
//                                         SizedBox(
//                                           width: 80,
//                                           child: Text(
//                                             'Package',
//                                             style: const TextStyle(
//                                               fontWeight: FontWeight.w800,
//                                               color: Color(0xFF0F2A1D),
//                                               fontSize: 14,
//                                               fontFamily: 'Poppins',
//                                             ),
//                                           ),
//                                         ),
//                                         const Text(
//                                           ':',
//                                           style: TextStyle(
//                                             color: Color(0xFF0F2A1D),
//                                             fontWeight: FontWeight.w800,
//                                           ),
//                                         ),
//                                         const SizedBox(width: 12),
//                                         Expanded(
//                                           child: Column(
//                                             crossAxisAlignment: CrossAxisAlignment.start,
//                                             children: [
//                                               Text(
//                                                 booking.package_details.length > 100
//                                                     ? '${booking.package_details.substring(0, 100)}...'
//                                                     : booking.package_details,
//                                                 style: const TextStyle(
//                                                   color: Color(0xFF0F2A1D),
//                                                   fontSize: 14,
//                                                   fontWeight: FontWeight.w600,
//                                                   height: 1.5,
//                                                   fontFamily: 'Poppins',
//                                                 ),
//                                               ),
//                                               if (booking.package_details.length > 100)
//                                                 Padding(
//                                                   padding: const EdgeInsets.only(top: 8),
//                                                   child: GestureDetector(
//                                                     onTap: () => _showFullDetailsBottomSheet(
//                                                       context,
//                                                       'Package Details',
//                                                       booking.package_details,
//                                                     ),
//                                                     child: Row(
//                                                       mainAxisSize: MainAxisSize.min,
//                                                       children: const [
//                                                         Text(
//                                                           'View More',
//                                                           style: TextStyle(
//                                                             color: Color(0xFF0F2A1D),
//                                                             fontSize: 13,
//                                                             fontWeight: FontWeight.w800,
//                                                             fontFamily: 'Poppins',
//                                                             decoration: TextDecoration.underline,
//                                                           ),
//                                                         ),
//                                                         SizedBox(width: 4),
//                                                         Icon(
//                                                           Icons.arrow_forward,
//                                                           size: 14,
//                                                           color: Color(0xFF0F2A1D),
//                                                         ),
//                                                       ],
//                                                     ),
//                                                   ),
//                                                 ),
//                                             ],
//                                           ),
//                                         ),
//                                       ],
//                                     ),
//                                   ],
//                                 ),
//                               ),
//                               const SizedBox(height: 16),
//
//                               // Pay Button (only if status is pending)
//                               if (isPending)
//                                 Row(
//                                   children: [
//                                     Expanded(
//                                       child: ElevatedButton(
//                                         onPressed: () async {
//                                           SharedPreferences sh = await SharedPreferences.getInstance();
//                                           sh.setString('bid', booking.id);
//                                           sh.setString('amount', booking.amount);
//                                           if (!mounted) return;
//                                           Navigator.push(
//                                             context,
//                                             MaterialPageRoute(builder: (context) =>  RazorpayScreen()),
//                                           );
//                                         },
//                                         style: ElevatedButton.styleFrom(
//                                           backgroundColor: const Color(0xFF0F2A1D),
//                                           foregroundColor: Colors.white,
//                                           padding: const EdgeInsets.symmetric(vertical: 16),
//                                           shape: RoundedRectangleBorder(
//                                             borderRadius: BorderRadius.circular(12),
//                                           ),
//                                           elevation: 4,
//                                         ),
//                                         child: Row(
//                                           mainAxisAlignment: MainAxisAlignment.center,
//                                           children: const [
//                                             Icon(Icons.payment, size: 20),
//                                             SizedBox(width: 8),
//                                             Text(
//                                               'Pay Now',
//                                               style: TextStyle(
//                                                 fontSize: 16,
//                                                 fontWeight: FontWeight.w800,
//                                                 fontFamily: 'Poppins',
//                                               ),
//                                             ),
//                                           ],
//                                         ),
//                                       ),
//                                     ),
//                                   ],
//                                 ),
//
//                               // Show message for paid or confirmed bookings
//                               if (!isPending && booking.status.toLowerCase() != 'cancelled')
//                                 Padding(
//                                   padding: const EdgeInsets.only(top: 8),
//                                   child: Container(
//                                     padding: const EdgeInsets.all(12),
//                                     decoration: BoxDecoration(
//                                       color: const Color(0xFF4CAF50).withOpacity(0.1),
//                                       borderRadius: BorderRadius.circular(10),
//                                       border: Border.all(color: const Color(0xFF4CAF50).withOpacity(0.3)),
//                                     ),
//                                     child: Row(
//                                       children: [
//                                         Icon(
//                                           Icons.check_circle,
//                                           color: const Color(0xFF4CAF50),
//                                           size: 20,
//                                         ),
//                                         const SizedBox(width: 8),
//                                         Expanded(
//                                           child: Text(
//                                             booking.status.toLowerCase() == 'paid'
//                                                 ? 'Payment completed successfully'
//                                                 : 'Booking confirmed',
//                                             style: const TextStyle(
//                                               color: Color(0xFF4CAF50),
//                                               fontSize: 14,
//                                               fontWeight: FontWeight.w700,
//                                               fontFamily: 'Poppins',
//                                             ),
//                                           ),
//                                         ),
//                                       ],
//                                     ),
//                                   ),
//                                 ),
//
//                               // Show message for cancelled bookings
//                               if (booking.status.toLowerCase() == 'cancelled')
//                                 Padding(
//                                   padding: const EdgeInsets.only(top: 8),
//                                   child: Container(
//                                     padding: const EdgeInsets.all(12),
//                                     decoration: BoxDecoration(
//                                       color: Colors.red.withOpacity(0.1),
//                                       borderRadius: BorderRadius.circular(10),
//                                       border: Border.all(color: Colors.red.withOpacity(0.3)),
//                                     ),
//                                     child: Row(
//                                       children: [
//                                         Icon(
//                                           Icons.cancel,
//                                           color: Colors.red,
//                                           size: 20,
//                                         ),
//                                         const SizedBox(width: 8),
//                                         Expanded(
//                                           child: Text(
//                                             'This booking has been cancelled',
//                                             style: const TextStyle(
//                                               color: Colors.red,
//                                               fontSize: 14,
//                                               fontWeight: FontWeight.w700,
//                                               fontFamily: 'Poppins',
//                                             ),
//                                           ),
//                                         ),
//                                       ],
//                                     ),
//                                   ),
//                                 ),
//                             ],
//                           ),
//                         ),
//                       ],
//                     ),
//                   ),
//                 );
//               },
//             );
//           }
//         },
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
//           size: 20,
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
//               color: Color(0xFF0F2A1D),
//               fontSize: 14,
//               fontWeight: FontWeight.w600,
//               height: 1.5,
//               fontFamily: 'Poppins',
//             ),
//             softWrap: true,
//           ),
//         ),
//       ],
//     );
//   }
// }
//
// class Booking {
//   final String id;
//   final String status;
//   final String date;
//   final String total_person;
//   final String photo;
//   final String amount;
//   final String package_details;
//   final String travelcompany_name;
//
//   Booking(
//       this.id,
//       this.status,
//       this.date,
//       this.total_person,
//       this.photo,
//       this.amount,
//       this.package_details,
//       this.travelcompany_name,
//       );
// }
//



// import 'dart:convert';
//
// import 'package:final_destination/home.dart';
// import 'package:flutter/material.dart';
// import 'package:http/http.dart' as http;
// import 'package:shared_preferences/shared_preferences.dart';
//
// import 'RazorpayScreen.dart';
//
// void main() {
//   runApp(viewbooking_status());
// }
//
// class viewbooking_status extends StatelessWidget {
//   const viewbooking_status({Key? key}) : super(key: key);
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
//       home: viewbooking_statussub(),
//     );
//   }
// }
//
// class viewbooking_statussub extends StatefulWidget {
//   const viewbooking_statussub({Key? key}) : super(key: key);
//
//   @override
//   State<viewbooking_statussub> createState() => _viewbooking_statussubState();
// }
//
// class _viewbooking_statussubState extends State<viewbooking_statussub> {
//   // Map to track expanded state for each booking
//   Map<int, bool> _expandedStates = {};
//
//   Future<List<Joke>> _getJokes() async {
//     SharedPreferences prefs = await SharedPreferences.getInstance();
//     String b = prefs.getString("lid").toString();
//     String foodimage = "";
//     var data = await http.post(
//         Uri.parse(prefs.getString("ip").toString() + "/user_viewbooking_status"),
//         body: {"uid": prefs.getString('uid').toString()});
//
//     var jsonData = json.decode(data.body);
//     prefs.setString('total', jsonData['total'].toString());
//     //    print(jsonData);
//     List<Joke> jokes = [];
//     for (var joke in jsonData["message"]) {
//       print(joke);
//       Joke newJoke = Joke(
//         joke["id"].toString(),
//         joke["status"],
//         joke["date"].toString(),
//         joke["total_person"].toString(),
//         prefs.getString('ip').toString() + joke["photo"].toString(),
//         joke["amount"].toString(),
//         joke["package_details"].toString(),
//         joke["travelcompany_name"].toString(),
//         joke["bookingdate"].toString(),
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
//   void _showEnlargedImage(BuildContext context, String imageUrl) {
//     showDialog(
//       context: context,
//       builder: (BuildContext context) {
//         return Dialog(
//           backgroundColor: Colors.transparent,
//           insetPadding: EdgeInsets.zero,
//           child: Container(
//             width: double.infinity,
//             height: double.infinity,
//             color: Colors.transparent,
//             child: Stack(
//               children: [
//                 Center(
//                   child: GestureDetector(
//                     onTap: () => Navigator.pop(context),
//                     child: Container(
//                       width: double.infinity,
//                       height: double.infinity,
//                       child: Image.network(
//                         imageUrl,
//                         fit: BoxFit.contain,
//                         loadingBuilder: (BuildContext context, Widget child,
//                             ImageChunkEvent? loadingProgress) {
//                           if (loadingProgress == null) return child;
//                           return Center(
//                             child: CircularProgressIndicator(
//                               value: loadingProgress.expectedTotalBytes != null
//                                   ? loadingProgress.cumulativeBytesLoaded /
//                                   loadingProgress.expectedTotalBytes!
//                                   : null,
//                               color: const Color(0xFF0F2A1D),
//                             ),
//                           );
//                         },
//                         errorBuilder: (BuildContext context, Object error,
//                             StackTrace? stackTrace) {
//                           return Center(
//                             child: Column(
//                               mainAxisAlignment: MainAxisAlignment.center,
//                               children: [
//                                 Icon(
//                                   Icons.broken_image,
//                                   size: 60,
//                                   color: const Color(0xFF0F2A1D)
//                                       .withOpacity(0.3),
//                                 ),
//                                 const SizedBox(height: 10),
//                                 Text(
//                                   'Failed to load image',
//                                   style: TextStyle(
//                                     color: const Color(0xFF0F2A1D)
//                                         .withOpacity(0.7),
//                                     fontFamily: 'Poppins',
//                                   ),
//                                 ),
//                               ],
//                             ),
//                           );
//                         },
//                       ),
//                     ),
//                   ),
//                 ),
//                 // Close button
//                 Positioned(
//                   top: 40,
//                   right: 20,
//                   child: GestureDetector(
//                     onTap: () => Navigator.pop(context),
//                     child: Container(
//                       padding: const EdgeInsets.all(12),
//                       decoration: BoxDecoration(
//                         color: const Color(0xFF0F2A1D).withOpacity(0.1),
//                         borderRadius: BorderRadius.circular(30),
//                         border: Border.all(
//                           color: const Color(0xFF0F2A1D).withOpacity(0.2),
//                         ),
//                       ),
//                       child: const Icon(
//                         Icons.close,
//                         color: Color(0xFF0F2A1D),
//                         size: 24,
//                       ),
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         );
//       },
//     );
//   }
//
//   Color _getStatusColor(String status) {
//     switch (status.toLowerCase()) {
//       case 'confirmed':
//         return Colors.green;
//       case 'pending':
//         return Colors.orange;
//       case 'cancelled':
//         return Colors.red;
//       default:
//         return const Color(0xFF0F2A1D);
//     }
//   }
//
//   IconData _getStatusIcon(String status) {
//     switch (status.toLowerCase()) {
//       case 'confirmed':
//         return Icons.check_circle;
//       case 'pending':
//         return Icons.pending;
//       case 'cancelled':
//         return Icons.cancel;
//       default:
//         return Icons.info;
//     }
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
//           'Booking Status',
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
//                       "Loading bookings...",
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
//                       Icons.book_online_outlined,
//                       size: 100,
//                       color: const Color(0xFF0F2A1D).withOpacity(0.3),
//                     ),
//                     const SizedBox(height: 20),
//                     Text(
//                       'No bookings found',
//                       style: const TextStyle(
//                         fontSize: 20,
//                         fontWeight: FontWeight.w800,
//                         color: Color(0xFF0F2A1D),
//                         fontFamily: 'Poppins',
//                       ),
//                     ),
//                     const SizedBox(height: 10),
//                     Text(
//                       'Your booking history will appear here',
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
//                   bool isLongDescription = i.package_details.toString().length > 100;
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
//                           // Header with gradient and status
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
//                                     Icons.receipt_long,
//                                     color: Colors.white,
//                                     size: 20,
//                                   ),
//                                 ),
//                                 const SizedBox(width: 12),
//                                 Expanded(
//                                   child: Text(
//                                     'Booking #${i.id.toString().length > 8 ? i.id.toString().substring(0, 8) : i.id.toString()}',
//                                     style: const TextStyle(
//                                       color: Colors.white,
//                                       fontSize: 18,
//                                       fontWeight: FontWeight.w800,
//                                       fontFamily: 'Poppins',
//                                     ),
//                                   ),
//                                 ),
//                                 // Status badge
//                                 Container(
//                                   padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
//                                   decoration: BoxDecoration(
//                                     color: _getStatusColor(i.status.toString()).withOpacity(0.2),
//                                     borderRadius: BorderRadius.circular(20),
//                                     border: Border.all(
//                                       color: Colors.white.withOpacity(0.3),
//                                     ),
//                                   ),
//                                   child: Row(
//                                     mainAxisSize: MainAxisSize.min,
//                                     children: [
//                                       Icon(
//                                         _getStatusIcon(i.status.toString()),
//                                         color: Colors.white,
//                                         size: 14,
//                                       ),
//                                       const SizedBox(width: 4),
//                                       Text(
//                                         i.status.toString().toUpperCase(),
//                                         style: const TextStyle(
//                                           color: Colors.white,
//                                           fontSize: 12,
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
//                                 // Travel Company Name - Styled as badge
//                                 Container(
//                                   padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
//                                   decoration: BoxDecoration(
//                                     color: const Color(0xFF0F2A1D).withOpacity(0.1),
//                                     borderRadius: BorderRadius.circular(10),
//                                   ),
//                                   child: Row(
//                                     mainAxisSize: MainAxisSize.min,
//                                     children: [
//                                       const Icon(
//                                         Icons.business,
//                                         size: 16,
//                                         color: Color(0xFF0F2A1D),
//                                       ),
//                                       const SizedBox(width: 8),
//                                       Text(
//                                         i.travelcompany_name.toString(),
//                                         style: const TextStyle(
//                                           fontSize: 14,
//                                           fontWeight: FontWeight.w800,
//                                           color: Color(0xFF0F2A1D),
//                                           fontFamily: 'Poppins',
//                                         ),
//                                       ),
//                                     ],
//                                   ),
//                                 ),
//
//                                 const SizedBox(height: 16),
//
//                                 // Booking Info in a container
//                                 Container(
//                                   padding: const EdgeInsets.all(12),
//                                   decoration: BoxDecoration(
//                                     color: const Color(0xFF0F2A1D).withOpacity(0.03),
//                                     borderRadius: BorderRadius.circular(12),
//                                   ),
//                                   child: Column(
//                                     children: [
//                                       _buildInfoRow(Icons.calendar_today, 'Travel Date', i.bookingdate.toString()),
//                                       const Divider(height: 16, color: Color(0xFF0F2A1D)),
//                                       _buildInfoRow(Icons.event, 'Booking Date', i.date.toString()),
//                                       const Divider(height: 16, color: Color(0xFF0F2A1D)),
//                                       _buildInfoRow(Icons.people, 'Total Persons', i.total_person.toString()),
//                                     ],
//                                   ),
//                                 ),
//
//                                 const SizedBox(height: 16),
//
//                                 // Package Details Section
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
//                                               fontSize: 16,
//                                               fontWeight: FontWeight.w900,
//                                               color: Color(0xFF0F2A1D),
//                                               fontFamily: 'Poppins',
//                                             ),
//                                           ),
//                                         ],
//                                       ),
//                                       const SizedBox(height: 12),
//
//                                       // Description with expand/collapse
//                                       Text(
//                                         isExpanded
//                                             ? i.package_details.toString()
//                                             : (isLongDescription
//                                             ? '${i.package_details.toString().substring(0, 100)}...'
//                                             : i.package_details.toString()),
//                                         style: const TextStyle(
//                                           fontSize: 14,
//                                           color: Color(0xFF0F2A1D),
//                                           fontFamily: 'Poppins',
//                                           fontWeight: FontWeight.w600,
//                                           height: 1.5,
//                                         ),
//                                       ),
//
//                                       if (isLongDescription)
//                                         Padding(
//                                           padding: const EdgeInsets.only(top: 8),
//                                           child: GestureDetector(
//                                             onTap: () => _toggleExpand(index),
//                                             child: Container(
//                                               padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
//                                               decoration: BoxDecoration(
//                                                 color: const Color(0xFF0F2A1D).withOpacity(0.1),
//                                                 borderRadius: BorderRadius.circular(20),
//                                               ),
//                                               child: Row(
//                                                 mainAxisSize: MainAxisSize.min,
//                                                 children: [
//                                                   Text(
//                                                     isExpanded ? 'Show Less' : 'Read More',
//                                                     style: const TextStyle(
//                                                       color: Color(0xFF0F2A1D),
//                                                       fontSize: 12,
//                                                       fontWeight: FontWeight.w800,
//                                                       fontFamily: 'Poppins',
//                                                     ),
//                                                   ),
//                                                   const SizedBox(width: 4),
//                                                   Icon(
//                                                     isExpanded ? Icons.expand_less : Icons.expand_more,
//                                                     size: 14,
//                                                     color: const Color(0xFF0F2A1D),
//                                                   ),
//                                                 ],
//                                               ),
//                                             ),
//                                           ),
//                                         ),
//                                     ],
//                                   ),
//                                 ),
//
//                                 const SizedBox(height: 16),
//
//                                 // Image Section - Clickable to enlarge
//                                 GestureDetector(
//                                   onTap: () => _showEnlargedImage(context, i.photo.toString()),
//                                   child: Container(
//                                     height: 200,
//                                     width: double.infinity,
//                                     decoration: BoxDecoration(
//                                       borderRadius: BorderRadius.circular(15),
//                                       boxShadow: [
//                                         BoxShadow(
//                                           color: const Color(0xFF0F2A1D).withOpacity(0.2),
//                                           blurRadius: 10,
//                                           offset: const Offset(0, 5),
//                                         ),
//                                       ],
//                                     ),
//                                     child: Stack(
//                                       children: [
//                                         ClipRRect(
//                                           borderRadius: BorderRadius.circular(15),
//                                           child: Image.network(
//                                             i.photo.toString(),
//                                             fit: BoxFit.cover,
//                                             width: double.infinity,
//                                             height: double.infinity,
//                                             loadingBuilder: (BuildContext context, Widget child,
//                                                 ImageChunkEvent? loadingProgress) {
//                                               if (loadingProgress == null) return child;
//                                               return Container(
//                                                 color: const Color(0xFFE3EED4).withOpacity(0.3),
//                                                 child: Center(
//                                                   child: CircularProgressIndicator(
//                                                     value: loadingProgress.expectedTotalBytes != null
//                                                         ? loadingProgress.cumulativeBytesLoaded /
//                                                         loadingProgress.expectedTotalBytes!
//                                                         : null,
//                                                     color: const Color(0xFF0F2A1D),
//                                                   ),
//                                                 ),
//                                               );
//                                             },
//                                             errorBuilder: (BuildContext context, Object error,
//                                                 StackTrace? stackTrace) {
//                                               return Container(
//                                                 color: const Color(0xFFE3EED4).withOpacity(0.3),
//                                                 child: Center(
//                                                   child: Column(
//                                                     mainAxisAlignment: MainAxisAlignment.center,
//                                                     children: [
//                                                       Icon(
//                                                         Icons.broken_image,
//                                                         size: 50,
//                                                         color: const Color(0xFF0F2A1D).withOpacity(0.3),
//                                                       ),
//                                                       const SizedBox(height: 8),
//                                                       Text(
//                                                         'Image not available',
//                                                         style: TextStyle(
//                                                           color: const Color(0xFF0F2A1D).withOpacity(0.5),
//                                                           fontFamily: 'Poppins',
//                                                           fontSize: 12,
//                                                         ),
//                                                       ),
//                                                     ],
//                                                   ),
//                                                 ),
//                                               );
//                                             },
//                                           ),
//                                         ),
//                                         // Enlarge icon overlay
//                                         Positioned(
//                                           bottom: 8,
//                                           right: 8,
//                                           child: Container(
//                                             padding: const EdgeInsets.all(8),
//                                             decoration: BoxDecoration(
//                                               color: const Color(0xFF0F2A1D).withOpacity(0.7),
//                                               borderRadius: BorderRadius.circular(20),
//                                             ),
//                                             child: const Icon(
//                                               Icons.open_in_full,
//                                               color: Colors.white,
//                                               size: 16,
//                                             ),
//                                           ),
//                                         ),
//                                       ],
//                                     ),
//                                   ),
//                                 ),
//
//                                 const SizedBox(height: 20),
//
//                                 // Amount and Payment Section
//                                 Row(
//                                   children: [
//                                     // Amount display
//                                     Container(
//                                       padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
//                                       decoration: BoxDecoration(
//                                         gradient: LinearGradient(
//                                           colors: [
//                                             const Color(0xFF0F2A1D).withOpacity(0.1),
//                                             const Color(0xFFE3EED4).withOpacity(0.5),
//                                           ],
//                                         ),
//                                         borderRadius: BorderRadius.circular(12),
//                                         border: Border.all(
//                                           color: const Color(0xFF0F2A1D).withOpacity(0.3),
//                                         ),
//                                       ),
//                                       child: Row(
//                                         mainAxisSize: MainAxisSize.min,
//                                         children: [
//                                           const Icon(
//                                             Icons.currency_rupee,
//                                             size: 20,
//                                             color: Color(0xFF0F2A1D),
//                                           ),
//                                           const SizedBox(width: 4),
//                                           Text(
//                                             i.amount.toString(),
//                                             style: const TextStyle(
//                                               fontSize: 22,
//                                               fontWeight: FontWeight.w900,
//                                               color: Color(0xFF0F2A1D),
//                                               fontFamily: 'Poppins',
//                                             ),
//                                           ),
//                                         ],
//                                       ),
//                                     ),
//
//                                     const Spacer(),
//
//                                     // PAY BUTTON - ALWAYS SHOWN for all statuses except maybe cancelled
//                                     // This preserves the original functionality where Pay button was always shown
//                                     ElevatedButton(
//                                       onPressed: () async {
//                                         SharedPreferences sh = await SharedPreferences.getInstance();
//                                         sh.setString('bid', i.id.toString());
//                                         Navigator.push(
//                                           context,
//                                           MaterialPageRoute(builder: (context) => RazorpayScreen()),
//                                         );
//                                       },
//                                       style: ElevatedButton.styleFrom(
//                                         backgroundColor: const Color(0xFF0F2A1D),
//                                         foregroundColor: Colors.white,
//                                         padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
//                                         shape: RoundedRectangleBorder(
//                                           borderRadius: BorderRadius.circular(10),
//                                         ),
//                                         elevation: 4,
//                                       ),
//                                       child: const Text(
//                                         'PAY',
//                                         style: TextStyle(
//                                           fontSize: 14,
//                                           fontWeight: FontWeight.w800,
//                                           fontFamily: 'Poppins',
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
//     return Padding(
//       padding: const EdgeInsets.symmetric(vertical: 4),
//       child: Row(
//         children: [
//           Icon(
//             icon,
//             size: 16,
//             color: const Color(0xFF0F2A1D).withOpacity(0.7),
//           ),
//           const SizedBox(width: 10),
//           SizedBox(
//             width: 100,
//             child: Text(
//               label,
//               style: const TextStyle(
//                 fontWeight: FontWeight.w800,
//                 color: Color(0xFF0F2A1D),
//                 fontSize: 13,
//                 fontFamily: 'Poppins',
//               ),
//             ),
//           ),
//           const Text(
//             ':',
//             style: TextStyle(
//               color: Color(0xFF0F2A1D),
//               fontWeight: FontWeight.w800,
//             ),
//           ),
//           const SizedBox(width: 10),
//           Expanded(
//             child: Text(
//               value,
//               style: const TextStyle(
//                 fontSize: 13,
//                 color: Color(0xFF0F2A1D),
//                 fontWeight: FontWeight.w600,
//                 fontFamily: 'Poppins',
//               ),
//               softWrap: true,
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
//   final String status;
//   final String date;
//   final String total_person;
//   final String photo;
//   final String amount;
//   final String package_details;
//   final String travelcompany_name;
//   final String bookingdate;
//
//   Joke(
//       this.id,
//       this.status,
//       this.date,
//       this.total_person,
//       this.photo,
//       this.amount,
//       this.package_details,
//       this.travelcompany_name,
//       this.bookingdate,
//       );
// }
//
//



// import 'dart:convert';
//
// import 'package:final_destination/home.dart';
// import 'package:flutter/material.dart';
// import 'package:http/http.dart' as http;
// import 'package:shared_preferences/shared_preferences.dart';
//
// import 'RazorpayScreen.dart';
//
// void main() {
//   runApp(viewbooking_status());
// }
//
// class viewbooking_status extends StatelessWidget {
//   const viewbooking_status({Key? key}) : super(key: key);
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
//       home: viewbooking_statussub(),
//     );
//   }
// }
//
// class viewbooking_statussub extends StatefulWidget {
//   const viewbooking_statussub({Key? key}) : super(key: key);
//
//   @override
//   State<viewbooking_statussub> createState() => _viewbooking_statussubState();
// }
//
// class _viewbooking_statussubState extends State<viewbooking_statussub> {
//   // Map to track expanded state for each booking
//   Map<int, bool> _expandedStates = {};
//
//   Future<List<Joke>> _getJokes() async {
//     SharedPreferences prefs = await SharedPreferences.getInstance();
//     String b = prefs.getString("lid").toString();
//     String foodimage = "";
//     var data = await http.post(
//         Uri.parse(prefs.getString("ip").toString() + "/user_viewbooking_status"),
//         body: {"uid": prefs.getString('uid').toString()});
//
//     var jsonData = json.decode(data.body);
//     prefs.setString('total', jsonData['total'].toString());
//     //    print(jsonData);
//     List<Joke> jokes = [];
//     for (var joke in jsonData["message"]) {
//       print(joke);
//       Joke newJoke = Joke(
//         joke["id"].toString(),
//         joke["status"],
//         joke["date"].toString(),
//         joke["total_person"].toString(),
//         prefs.getString('ip').toString() + joke["photo"].toString(),
//         joke["amount"].toString(),
//         joke["package_details"].toString(),
//         joke["travelcompany_name"].toString(),
//         joke["bookingdate"].toString(),
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
//   void _showEnlargedImage(BuildContext context, String imageUrl) {
//     showDialog(
//       context: context,
//       builder: (BuildContext context) {
//         return Dialog(
//           backgroundColor: Colors.transparent,
//           insetPadding: EdgeInsets.zero,
//           child: Container(
//             width: double.infinity,
//             height: double.infinity,
//             color: Colors.transparent,
//             child: Stack(
//               children: [
//                 Center(
//                   child: GestureDetector(
//                     onTap: () => Navigator.pop(context),
//                     child: Container(
//                       width: double.infinity,
//                       height: double.infinity,
//                       child: Image.network(
//                         imageUrl,
//                         fit: BoxFit.contain,
//                         loadingBuilder: (BuildContext context, Widget child,
//                             ImageChunkEvent? loadingProgress) {
//                           if (loadingProgress == null) return child;
//                           return Center(
//                             child: CircularProgressIndicator(
//                               value: loadingProgress.expectedTotalBytes != null
//                                   ? loadingProgress.cumulativeBytesLoaded /
//                                   loadingProgress.expectedTotalBytes!
//                                   : null,
//                               color: const Color(0xFF0F2A1D),
//                             ),
//                           );
//                         },
//                         errorBuilder: (BuildContext context, Object error,
//                             StackTrace? stackTrace) {
//                           return Center(
//                             child: Column(
//                               mainAxisAlignment: MainAxisAlignment.center,
//                               children: [
//                                 Icon(
//                                   Icons.broken_image,
//                                   size: 60,
//                                   color: const Color(0xFF0F2A1D)
//                                       .withOpacity(0.3),
//                                 ),
//                                 const SizedBox(height: 10),
//                                 Text(
//                                   'Failed to load image',
//                                   style: TextStyle(
//                                     color: const Color(0xFF0F2A1D)
//                                         .withOpacity(0.7),
//                                     fontFamily: 'Poppins',
//                                   ),
//                                 ),
//                               ],
//                             ),
//                           );
//                         },
//                       ),
//                     ),
//                   ),
//                 ),
//                 // Close button
//                 Positioned(
//                   top: 40,
//                   right: 20,
//                   child: GestureDetector(
//                     onTap: () => Navigator.pop(context),
//                     child: Container(
//                       padding: const EdgeInsets.all(12),
//                       decoration: BoxDecoration(
//                         color: const Color(0xFF0F2A1D).withOpacity(0.1),
//                         borderRadius: BorderRadius.circular(30),
//                         border: Border.all(
//                           color: const Color(0xFF0F2A1D).withOpacity(0.2),
//                         ),
//                       ),
//                       child: const Icon(
//                         Icons.close,
//                         color: Color(0xFF0F2A1D),
//                         size: 24,
//                       ),
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         );
//       },
//     );
//   }
//
//   Color _getStatusColor(String status) {
//     switch (status.toLowerCase()) {
//       case 'confirmed':
//         return Colors.green;
//       case 'pending':
//         return Colors.orange;
//       case 'cancelled':
//         return Colors.red;
//       default:
//         return const Color(0xFF0F2A1D);
//     }
//   }
//
//   IconData _getStatusIcon(String status) {
//     switch (status.toLowerCase()) {
//       case 'confirmed':
//         return Icons.check_circle;
//       case 'pending':
//         return Icons.pending;
//       case 'cancelled':
//         return Icons.cancel;
//       default:
//         return Icons.info;
//     }
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
//           'Booking Status',
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
//                       "Loading bookings...",
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
//                       Icons.book_online_outlined,
//                       size: 100,
//                       color: const Color(0xFF0F2A1D).withOpacity(0.3),
//                     ),
//                     const SizedBox(height: 20),
//                     Text(
//                       'No bookings found',
//                       style: const TextStyle(
//                         fontSize: 20,
//                         fontWeight: FontWeight.w800,
//                         color: Color(0xFF0F2A1D),
//                         fontFamily: 'Poppins',
//                       ),
//                     ),
//                     const SizedBox(height: 10),
//                     Text(
//                       'Your booking history will appear here',
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
//                           // Header with gradient and status
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
//                                     Icons.receipt_long,
//                                     color: Colors.white,
//                                     size: 20,
//                                   ),
//                                 ),
//                                 const SizedBox(width: 12),
//                                 Expanded(
//                                   child: Text(
//                                     'Booking #${i.id.toString().length > 8 ? i.id.toString().substring(0, 8) : i.id.toString()}',
//                                     style: const TextStyle(
//                                       color: Colors.white,
//                                       fontSize: 18,
//                                       fontWeight: FontWeight.w800,
//                                       fontFamily: 'Poppins',
//                                     ),
//                                   ),
//                                 ),
//                                 // Status badge
//                                 Container(
//                                   padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
//                                   decoration: BoxDecoration(
//                                     color: _getStatusColor(i.status.toString()).withOpacity(0.2),
//                                     borderRadius: BorderRadius.circular(20),
//                                     border: Border.all(
//                                       color: Colors.white.withOpacity(0.3),
//                                     ),
//                                   ),
//                                   child: Row(
//                                     mainAxisSize: MainAxisSize.min,
//                                     children: [
//                                       Icon(
//                                         _getStatusIcon(i.status.toString()),
//                                         color: Colors.white,
//                                         size: 14,
//                                       ),
//                                       const SizedBox(width: 4),
//                                       Text(
//                                         i.status.toString().toUpperCase(),
//                                         style: const TextStyle(
//                                           color: Colors.white,
//                                           fontSize: 12,
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
//                                 // Travel Company Name - Styled as badge
//                                 Container(
//                                   padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
//                                   decoration: BoxDecoration(
//                                     color: const Color(0xFF0F2A1D).withOpacity(0.1),
//                                     borderRadius: BorderRadius.circular(10),
//                                   ),
//                                   child: Row(
//                                     mainAxisSize: MainAxisSize.min,
//                                     children: [
//                                       const Icon(
//                                         Icons.business,
//                                         size: 16,
//                                         color: Color(0xFF0F2A1D),
//                                       ),
//                                       const SizedBox(width: 8),
//                                       Text(
//                                         i.travelcompany_name.toString(),
//                                         style: const TextStyle(
//                                           fontSize: 14,
//                                           fontWeight: FontWeight.w800,
//                                           color: Color(0xFF0F2A1D),
//                                           fontFamily: 'Poppins',
//                                         ),
//                                       ),
//                                     ],
//                                   ),
//                                 ),
//
//                                 const SizedBox(height: 16),
//
//                                 // Booking Info in a container
//                                 Container(
//                                   padding: const EdgeInsets.all(12),
//                                   decoration: BoxDecoration(
//                                     color: const Color(0xFF0F2A1D).withOpacity(0.03),
//                                     borderRadius: BorderRadius.circular(12),
//                                   ),
//                                   child: Column(
//                                     children: [
//                                       _buildInfoRow(Icons.calendar_today, 'Travel Date', i.bookingdate.toString()),
//                                       const Divider(height: 16, color: Color(0xFF0F2A1D)),
//                                       _buildInfoRow(Icons.event, 'Booking Date', i.date.toString()),
//                                       const Divider(height: 16, color: Color(0xFF0F2A1D)),
//                                       _buildInfoRow(Icons.people, 'Total Persons', i.total_person.toString()),
//                                     ],
//                                   ),
//                                 ),
//
//                                 const SizedBox(height: 16),
//
//                                 // Image Section - Clickable to enlarge
//                                 GestureDetector(
//                                   onTap: () => _showEnlargedImage(context, i.photo.toString()),
//                                   child: Container(
//                                     height: 200,
//                                     width: double.infinity,
//                                     decoration: BoxDecoration(
//                                       borderRadius: BorderRadius.circular(15),
//                                       boxShadow: [
//                                         BoxShadow(
//                                           color: const Color(0xFF0F2A1D).withOpacity(0.2),
//                                           blurRadius: 10,
//                                           offset: const Offset(0, 5),
//                                         ),
//                                       ],
//                                     ),
//                                     child: Stack(
//                                       children: [
//                                         ClipRRect(
//                                           borderRadius: BorderRadius.circular(15),
//                                           child: Image.network(
//                                             i.photo.toString(),
//                                             fit: BoxFit.cover,
//                                             width: double.infinity,
//                                             height: double.infinity,
//                                             loadingBuilder: (BuildContext context, Widget child,
//                                                 ImageChunkEvent? loadingProgress) {
//                                               if (loadingProgress == null) return child;
//                                               return Container(
//                                                 color: const Color(0xFFE3EED4).withOpacity(0.3),
//                                                 child: Center(
//                                                   child: CircularProgressIndicator(
//                                                     value: loadingProgress.expectedTotalBytes != null
//                                                         ? loadingProgress.cumulativeBytesLoaded /
//                                                         loadingProgress.expectedTotalBytes!
//                                                         : null,
//                                                     color: const Color(0xFF0F2A1D),
//                                                   ),
//                                                 ),
//                                               );
//                                             },
//                                             errorBuilder: (BuildContext context, Object error,
//                                                 StackTrace? stackTrace) {
//                                               return Container(
//                                                 color: const Color(0xFFE3EED4).withOpacity(0.3),
//                                                 child: Center(
//                                                   child: Column(
//                                                     mainAxisAlignment: MainAxisAlignment.center,
//                                                     children: [
//                                                       Icon(
//                                                         Icons.broken_image,
//                                                         size: 50,
//                                                         color: const Color(0xFF0F2A1D).withOpacity(0.3),
//                                                       ),
//                                                       const SizedBox(height: 8),
//                                                       Text(
//                                                         'Image not available',
//                                                         style: TextStyle(
//                                                           color: const Color(0xFF0F2A1D).withOpacity(0.5),
//                                                           fontFamily: 'Poppins',
//                                                           fontSize: 12,
//                                                         ),
//                                                       ),
//                                                     ],
//                                                   ),
//                                                 ),
//                                               );
//                                             },
//                                           ),
//                                         ),
//                                         // Enlarge icon overlay
//                                         Positioned(
//                                           bottom: 8,
//                                           right: 8,
//                                           child: Container(
//                                             padding: const EdgeInsets.all(8),
//                                             decoration: BoxDecoration(
//                                               color: const Color(0xFF0F2A1D).withOpacity(0.7),
//                                               borderRadius: BorderRadius.circular(20),
//                                             ),
//                                             child: const Icon(
//                                               Icons.open_in_full,
//                                               color: Colors.white,
//                                               size: 16,
//                                             ),
//                                           ),
//                                         ),
//                                       ],
//                                     ),
//                                   ),
//                                 ),
//
//                                 const SizedBox(height: 20),
//
//                                 // Amount and Payment Section
//                                 Row(
//                                   children: [
//                                     // Amount display
//                                     Container(
//                                       padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
//                                       decoration: BoxDecoration(
//                                         gradient: LinearGradient(
//                                           colors: [
//                                             const Color(0xFF0F2A1D).withOpacity(0.1),
//                                             const Color(0xFFE3EED4).withOpacity(0.5),
//                                           ],
//                                         ),
//                                         borderRadius: BorderRadius.circular(12),
//                                         border: Border.all(
//                                           color: const Color(0xFF0F2A1D).withOpacity(0.3),
//                                         ),
//                                       ),
//                                       child: Row(
//                                         mainAxisSize: MainAxisSize.min,
//                                         children: [
//                                           const Icon(
//                                             Icons.currency_rupee,
//                                             size: 20,
//                                             color: Color(0xFF0F2A1D),
//                                           ),
//                                           const SizedBox(width: 4),
//                                           Text(
//                                             i.amount.toString(),
//                                             style: const TextStyle(
//                                               fontSize: 22,
//                                               fontWeight: FontWeight.w900,
//                                               color: Color(0xFF0F2A1D),
//                                               fontFamily: 'Poppins',
//                                             ),
//                                           ),
//                                         ],
//                                       ),
//                                     ),
//
//                                     const Spacer(),
//
//                                     // PAY BUTTON - ALWAYS SHOWN for all statuses except maybe cancelled
//                                     // This preserves the original functionality where Pay button was always shown
//                                     ElevatedButton(
//                                       onPressed: () async {
//                                         SharedPreferences sh = await SharedPreferences.getInstance();
//                                         sh.setString('bid', i.id.toString());
//                                         Navigator.push(
//                                           context,
//                                           MaterialPageRoute(builder: (context) => RazorpayScreen()),
//                                         );
//                                       },
//                                       style: ElevatedButton.styleFrom(
//                                         backgroundColor: const Color(0xFF0F2A1D),
//                                         foregroundColor: Colors.white,
//                                         padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
//                                         shape: RoundedRectangleBorder(
//                                           borderRadius: BorderRadius.circular(10),
//                                         ),
//                                         elevation: 4,
//                                       ),
//                                       child: const Text(
//                                         'PAY',
//                                         style: TextStyle(
//                                           fontSize: 14,
//                                           fontWeight: FontWeight.w800,
//                                           fontFamily: 'Poppins',
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
//     return Padding(
//       padding: const EdgeInsets.symmetric(vertical: 4),
//       child: Row(
//         children: [
//           Icon(
//             icon,
//             size: 16,
//             color: const Color(0xFF0F2A1D).withOpacity(0.7),
//           ),
//           const SizedBox(width: 10),
//           SizedBox(
//             width: 100,
//             child: Text(
//               label,
//               style: const TextStyle(
//                 fontWeight: FontWeight.w800,
//                 color: Color(0xFF0F2A1D),
//                 fontSize: 13,
//                 fontFamily: 'Poppins',
//               ),
//             ),
//           ),
//           const Text(
//             ':',
//             style: TextStyle(
//               color: Color(0xFF0F2A1D),
//               fontWeight: FontWeight.w800,
//             ),
//           ),
//           const SizedBox(width: 10),
//           Expanded(
//             child: Text(
//               value,
//               style: const TextStyle(
//                 fontSize: 13,
//                 color: Color(0xFF0F2A1D),
//                 fontWeight: FontWeight.w600,
//                 fontFamily: 'Poppins',
//               ),
//               softWrap: true,
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
//   final String status;
//   final String date;
//   final String total_person;
//   final String photo;
//   final String amount;
//   final String package_details;
//   final String travelcompany_name;
//   final String bookingdate;
//
//   Joke(
//       this.id,
//       this.status,
//       this.date,
//       this.total_person,
//       this.photo,
//       this.amount,
//       this.package_details,
//       this.travelcompany_name,
//       this.bookingdate,
//       );
// }
//
//
//
//
// // import 'dart:convert';
// //
// // import 'package:final_destination/home.dart';
// // import 'package:flutter/material.dart';
// // import 'package:http/http.dart' as http;
// // import 'package:shared_preferences/shared_preferences.dart';
// //
// // import 'RazorpayScreen.dart';
// //
// // void main() {
// //   runApp(viewbooking_status());
// // }
// //
// // class viewbooking_status extends StatelessWidget {
// //   const viewbooking_status({Key? key}) : super(key: key);
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
// //       home: viewbooking_statussub(),
// //     );
// //   }
// // }
// //
// // class viewbooking_statussub extends StatefulWidget {
// //   const viewbooking_statussub({Key? key}) : super(key: key);
// //
// //   @override
// //   State<viewbooking_statussub> createState() => _viewbooking_statussubState();
// // }
// //
// // class _viewbooking_statussubState extends State<viewbooking_statussub> {
// //   bool _isLoading = true;
// //   bool _hasBooking = false;
// //   Joke? _latestBooking;
// //   String? _errorMessage;
// //
// //   @override
// //   void initState() {
// //     super.initState();
// //     _getLatestBooking();
// //   }
// //
// //   Future<void> _getLatestBooking() async {
// //     setState(() {
// //       _isLoading = true;
// //       _errorMessage = null;
// //     });
// //
// //     try {
// //       SharedPreferences prefs = await SharedPreferences.getInstance();
// //       String b = prefs.getString("lid").toString();
// //
// //       var data = await http.post(
// //         Uri.parse(prefs.getString("ip").toString() + "/user_viewbooking_status"),
// //         body: {"uid": prefs.getString('uid').toString()},
// //       );
// //
// //       var jsonData = json.decode(data.body);
// //       prefs.setString('total', jsonData['total'].toString());
// //
// //       if (jsonData["message"] != null && jsonData["message"].isNotEmpty) {
// //         // Get the latest booking (first one in the list)
// //         var latestBookingData = jsonData["message"][0];
// //
// //         setState(() {
// //           _latestBooking = Joke(
// //             latestBookingData["id"].toString(),
// //             latestBookingData["status"],
// //             latestBookingData["date"].toString(),
// //             latestBookingData["total_person"].toString(),
// //             prefs.getString('ip').toString() + latestBookingData["photo"].toString(),
// //             latestBookingData["amount"].toString(),
// //             latestBookingData["package_details"].toString(),
// //             latestBookingData["travelcompany_name"].toString(),
// //             latestBookingData["bookingdate"].toString(),
// //           );
// //           _hasBooking = true;
// //           _isLoading = false;
// //         });
// //       } else {
// //         setState(() {
// //           _hasBooking = false;
// //           _isLoading = false;
// //         });
// //       }
// //     } catch (e) {
// //       setState(() {
// //         _errorMessage = "Failed to load booking details";
// //         _isLoading = false;
// //       });
// //     }
// //   }
// //
// //   Future<void> _refreshBooking() async {
// //     await _getLatestBooking();
// //   }
// //
// //   void _showEnlargedImage(BuildContext context, String imageUrl) {
// //     showDialog(
// //       context: context,
// //       builder: (BuildContext context) {
// //         return Dialog(
// //           backgroundColor: Colors.transparent,
// //           insetPadding: EdgeInsets.zero,
// //           child: Container(
// //             width: double.infinity,
// //             height: double.infinity,
// //             color: Colors.transparent,
// //             child: Stack(
// //               children: [
// //                 Center(
// //                   child: GestureDetector(
// //                     onTap: () => Navigator.pop(context),
// //                     child: Container(
// //                       width: double.infinity,
// //                       height: double.infinity,
// //                       child: Image.network(
// //                         imageUrl,
// //                         fit: BoxFit.contain,
// //                         loadingBuilder: (BuildContext context, Widget child,
// //                             ImageChunkEvent? loadingProgress) {
// //                           if (loadingProgress == null) return child;
// //                           return Center(
// //                             child: CircularProgressIndicator(
// //                               value: loadingProgress.expectedTotalBytes != null
// //                                   ? loadingProgress.cumulativeBytesLoaded /
// //                                   loadingProgress.expectedTotalBytes!
// //                                   : null,
// //                               color: const Color(0xFF0F2A1D),
// //                             ),
// //                           );
// //                         },
// //                         errorBuilder: (BuildContext context, Object error,
// //                             StackTrace? stackTrace) {
// //                           return Center(
// //                             child: Column(
// //                               mainAxisAlignment: MainAxisAlignment.center,
// //                               children: [
// //                                 Icon(
// //                                   Icons.broken_image,
// //                                   size: 60,
// //                                   color: const Color(0xFF0F2A1D)
// //                                       .withOpacity(0.3),
// //                                 ),
// //                                 const SizedBox(height: 10),
// //                                 Text(
// //                                   'Failed to load image',
// //                                   style: TextStyle(
// //                                     color: const Color(0xFF0F2A1D)
// //                                         .withOpacity(0.7),
// //                                     fontFamily: 'Poppins',
// //                                   ),
// //                                 ),
// //                               ],
// //                             ),
// //                           );
// //                         },
// //                       ),
// //                     ),
// //                   ),
// //                 ),
// //                 // Close button
// //                 Positioned(
// //                   top: 40,
// //                   right: 20,
// //                   child: GestureDetector(
// //                     onTap: () => Navigator.pop(context),
// //                     child: Container(
// //                       padding: const EdgeInsets.all(12),
// //                       decoration: BoxDecoration(
// //                         color: const Color(0xFF0F2A1D).withOpacity(0.1),
// //                         borderRadius: BorderRadius.circular(30),
// //                         border: Border.all(
// //                           color: const Color(0xFF0F2A1D).withOpacity(0.2),
// //                         ),
// //                       ),
// //                       child: const Icon(
// //                         Icons.close,
// //                         color: Color(0xFF0F2A1D),
// //                         size: 24,
// //                       ),
// //                     ),
// //                   ),
// //                 ),
// //               ],
// //             ),
// //           ),
// //         );
// //       },
// //     );
// //   }
// //
// //   Color _getStatusColor(String status) {
// //     switch (status.toLowerCase()) {
// //       case 'confirmed':
// //       case 'paid':
// //         return Colors.green;
// //       case 'pending':
// //         return Colors.orange;
// //       case 'cancelled':
// //         return Colors.red;
// //       default:
// //         return const Color(0xFF0F2A1D);
// //     }
// //   }
// //
// //   IconData _getStatusIcon(String status) {
// //     switch (status.toLowerCase()) {
// //       case 'confirmed':
// //       case 'paid':
// //         return Icons.check_circle;
// //       case 'pending':
// //         return Icons.pending;
// //       case 'cancelled':
// //         return Icons.cancel;
// //       default:
// //         return Icons.info;
// //     }
// //   }
// //
// //   String _formatStatus(String status) {
// //     if (status.toLowerCase() == 'paid') {
// //       return 'PAID';
// //     }
// //     return status.toUpperCase();
// //   }
// //
// //   Future<void> _handlePayment() async {
// //     if (_latestBooking == null) return;
// //
// //     SharedPreferences sh = await SharedPreferences.getInstance();
// //     await sh.setString('bid', _latestBooking!.id.toString());
// //
// //     // Navigate to payment screen and wait for result
// //     final result = await Navigator.push(
// //       context,
// //       MaterialPageRoute(builder: (context) => RazorpayScreen()),
// //     );
// //
// //     // If payment was successful, refresh booking status
// //     if (result == true) {
// //       _refreshBooking();
// //
// //       // Show success message
// //       ScaffoldMessenger.of(context).showSnackBar(
// //         SnackBar(
// //           content: Text(
// //             'Payment successful! Booking status updated.',
// //             style: const TextStyle(fontFamily: 'Poppins'),
// //           ),
// //           backgroundColor: Colors.green,
// //           duration: const Duration(seconds: 3),
// //         ),
// //       );
// //     }
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
// //           'Booking Status',
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
// //         actions: [
// //           // Refresh button
// //           IconButton(
// //             icon: const Icon(Icons.refresh, color: Color(0xFF0F2A1D)),
// //             onPressed: _refreshBooking,
// //           ),
// //         ],
// //       ),
// //       body: RefreshIndicator(
// //         onRefresh: _refreshBooking,
// //         color: const Color(0xFF0F2A1D),
// //         child: _buildBody(),
// //       ),
// //     );
// //   }
// //
// //   Widget _buildBody() {
// //     if (_isLoading) {
// //       return Center(
// //         child: Column(
// //           mainAxisAlignment: MainAxisAlignment.center,
// //           children: [
// //             CircularProgressIndicator(
// //               color: const Color(0xFF0F2A1D),
// //             ),
// //             const SizedBox(height: 20),
// //             Text(
// //               "Loading your latest booking...",
// //               style: TextStyle(
// //                 color: const Color(0xFF0F2A1D),
// //                 fontSize: 16,
// //                 fontFamily: 'Poppins',
// //                 fontWeight: FontWeight.w600,
// //               ),
// //             ),
// //           ],
// //         ),
// //       );
// //     }
// //
// //     if (_errorMessage != null) {
// //       return Center(
// //         child: Column(
// //           mainAxisAlignment: MainAxisAlignment.center,
// //           children: [
// //             Icon(
// //               Icons.error_outline,
// //               size: 80,
// //               color: const Color(0xFF0F2A1D).withOpacity(0.3),
// //             ),
// //             const SizedBox(height: 20),
// //             Text(
// //               _errorMessage!,
// //               style: const TextStyle(
// //                 fontSize: 18,
// //                 fontWeight: FontWeight.w800,
// //                 color: Color(0xFF0F2A1D),
// //                 fontFamily: 'Poppins',
// //               ),
// //             ),
// //             const SizedBox(height: 10),
// //             Text(
// //               'Pull down to refresh',
// //               style: TextStyle(
// //                 fontSize: 14,
// //                 color: const Color(0xFF0F2A1D).withOpacity(0.6),
// //                 fontFamily: 'Poppins',
// //               ),
// //             ),
// //             const SizedBox(height: 20),
// //             ElevatedButton(
// //               onPressed: _refreshBooking,
// //               style: ElevatedButton.styleFrom(
// //                 backgroundColor: const Color(0xFF0F2A1D),
// //                 foregroundColor: Colors.white,
// //                 padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
// //               ),
// //               child: const Text('Try Again'),
// //             ),
// //           ],
// //         ),
// //       );
// //     }
// //
// //     if (!_hasBooking || _latestBooking == null) {
// //       return Center(
// //         child: Column(
// //           mainAxisAlignment: MainAxisAlignment.center,
// //           children: [
// //             Icon(
// //               Icons.book_online_outlined,
// //               size: 100,
// //               color: const Color(0xFF0F2A1D).withOpacity(0.3),
// //             ),
// //             const SizedBox(height: 20),
// //             Text(
// //               'No bookings found',
// //               style: const TextStyle(
// //                 fontSize: 20,
// //                 fontWeight: FontWeight.w800,
// //                 color: Color(0xFF0F2A1D),
// //                 fontFamily: 'Poppins',
// //               ),
// //             ),
// //             const SizedBox(height: 10),
// //             Text(
// //               'Your booking history will appear here',
// //               style: TextStyle(
// //                 fontSize: 14,
// //                 color: const Color(0xFF0F2A1D).withOpacity(0.6),
// //                 fontFamily: 'Poppins',
// //                 fontWeight: FontWeight.w600,
// //               ),
// //             ),
// //             const SizedBox(height: 20),
// //             ElevatedButton(
// //               onPressed: () => Navigator.push(
// //                 context,
// //                 MaterialPageRoute(builder: (context) => UserHomeApp()),
// //               ),
// //               style: ElevatedButton.styleFrom(
// //                 backgroundColor: const Color(0xFF0F2A1D),
// //                 foregroundColor: Colors.white,
// //                 padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
// //               ),
// //               child: const Text('Browse Packages'),
// //             ),
// //           ],
// //         ),
// //       );
// //     }
// //
// //     return SingleChildScrollView(
// //       physics: const AlwaysScrollableScrollPhysics(),
// //       padding: const EdgeInsets.all(16),
// //       child: _buildBookingDetailCard(_latestBooking!),
// //     );
// //   }
// //
// //   Widget _buildBookingDetailCard(Joke booking) {
// //     return Card(
// //       elevation: 4,
// //       shape: RoundedRectangleBorder(
// //         borderRadius: BorderRadius.circular(20),
// //       ),
// //       child: Column(
// //         crossAxisAlignment: CrossAxisAlignment.start,
// //         children: [
// //           // Header with gradient and status
// //           Container(
// //             decoration: const BoxDecoration(
// //               gradient: LinearGradient(
// //                 colors: [Color(0xFF0F2A1D), Color(0xFF1A3F2B)],
// //                 begin: Alignment.topLeft,
// //                 end: Alignment.bottomRight,
// //               ),
// //               borderRadius: BorderRadius.only(
// //                 topLeft: Radius.circular(20),
// //                 topRight: Radius.circular(20),
// //               ),
// //             ),
// //             padding: const EdgeInsets.all(16),
// //             child: Row(
// //               children: [
// //                 Container(
// //                   padding: const EdgeInsets.all(8),
// //                   decoration: BoxDecoration(
// //                     color: Colors.white.withOpacity(0.2),
// //                     borderRadius: BorderRadius.circular(10),
// //                   ),
// //                   child: const Icon(
// //                     Icons.receipt_long,
// //                     color: Colors.white,
// //                     size: 20,
// //                   ),
// //                 ),
// //                 const SizedBox(width: 12),
// //                 Expanded(
// //                   child: Text(
// //                     'Booking #${booking.id.toString().length > 8 ? booking.id.toString().substring(0, 8) : booking.id.toString()}',
// //                     style: const TextStyle(
// //                       color: Colors.white,
// //                       fontSize: 18,
// //                       fontWeight: FontWeight.w800,
// //                       fontFamily: 'Poppins',
// //                     ),
// //                   ),
// //                 ),
// //                 // Status badge
// //                 Container(
// //                   padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
// //                   decoration: BoxDecoration(
// //                     color: _getStatusColor(booking.status.toString()).withOpacity(0.2),
// //                     borderRadius: BorderRadius.circular(20),
// //                     border: Border.all(
// //                       color: Colors.white.withOpacity(0.3),
// //                     ),
// //                   ),
// //                   child: Row(
// //                     mainAxisSize: MainAxisSize.min,
// //                     children: [
// //                       Icon(
// //                         _getStatusIcon(booking.status.toString()),
// //                         color: Colors.white,
// //                         size: 14,
// //                       ),
// //                       const SizedBox(width: 4),
// //                       Text(
// //                         _formatStatus(booking.status.toString()),
// //                         style: const TextStyle(
// //                           color: Colors.white,
// //                           fontSize: 12,
// //                           fontWeight: FontWeight.w800,
// //                           fontFamily: 'Poppins',
// //                         ),
// //                       ),
// //                     ],
// //                   ),
// //                 ),
// //               ],
// //             ),
// //           ),
// //
// //           Padding(
// //             padding: const EdgeInsets.all(16),
// //             child: Column(
// //               crossAxisAlignment: CrossAxisAlignment.start,
// //               children: [
// //                 // Travel Company Name - Styled as badge
// //                 Container(
// //                   padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
// //                   decoration: BoxDecoration(
// //                     color: const Color(0xFF0F2A1D).withOpacity(0.1),
// //                     borderRadius: BorderRadius.circular(10),
// //                   ),
// //                   child: Row(
// //                     mainAxisSize: MainAxisSize.min,
// //                     children: [
// //                       const Icon(
// //                         Icons.business,
// //                         size: 16,
// //                         color: Color(0xFF0F2A1D),
// //                       ),
// //                       const SizedBox(width: 8),
// //                       Text(
// //                         booking.travelcompany_name.toString(),
// //                         style: const TextStyle(
// //                           fontSize: 14,
// //                           fontWeight: FontWeight.w800,
// //                           color: Color(0xFF0F2A1D),
// //                           fontFamily: 'Poppins',
// //                         ),
// //                       ),
// //                     ],
// //                   ),
// //                 ),
// //
// //                 const SizedBox(height: 16),
// //
// //                 // Package Details
// //                 Container(
// //                   padding: const EdgeInsets.all(12),
// //                   decoration: BoxDecoration(
// //                     color: const Color(0xFF0F2A1D).withOpacity(0.03),
// //                     borderRadius: BorderRadius.circular(12),
// //                   ),
// //                   child: Column(
// //                     crossAxisAlignment: CrossAxisAlignment.start,
// //                     children: [
// //                       const Text(
// //                         'Package Details',
// //                         style: TextStyle(
// //                           fontSize: 16,
// //                           fontWeight: FontWeight.w800,
// //                           color: Color(0xFF0F2A1D),
// //                           fontFamily: 'Poppins',
// //                         ),
// //                       ),
// //                       const SizedBox(height: 8),
// //                       Text(
// //                         booking.package_details.toString(),
// //                         style: const TextStyle(
// //                           fontSize: 13,
// //                           color: Color(0xFF0F2A1D),
// //                           fontWeight: FontWeight.w600,
// //                           fontFamily: 'Poppins',
// //                         ),
// //                       ),
// //                       const SizedBox(height: 12),
// //                       _buildInfoRow(Icons.calendar_today, 'Travel Date', booking.bookingdate.toString()),
// //                       const Divider(height: 16, color: Color(0xFF0F2A1D)),
// //                       _buildInfoRow(Icons.event, 'Booking Date', booking.date.toString()),
// //                       const Divider(height: 16, color: Color(0xFF0F2A1D)),
// //                       _buildInfoRow(Icons.people, 'Total Persons', booking.total_person.toString()),
// //                     ],
// //                   ),
// //                 ),
// //
// //                 const SizedBox(height: 16),
// //
// //                 // Image Section - Clickable to enlarge
// //                 GestureDetector(
// //                   onTap: () => _showEnlargedImage(context, booking.photo.toString()),
// //                   child: Container(
// //                     height: 200,
// //                     width: double.infinity,
// //                     decoration: BoxDecoration(
// //                       borderRadius: BorderRadius.circular(15),
// //                       boxShadow: [
// //                         BoxShadow(
// //                           color: const Color(0xFF0F2A1D).withOpacity(0.2),
// //                           blurRadius: 10,
// //                           offset: const Offset(0, 5),
// //                         ),
// //                       ],
// //                     ),
// //                     child: Stack(
// //                       children: [
// //                         ClipRRect(
// //                           borderRadius: BorderRadius.circular(15),
// //                           child: Image.network(
// //                             booking.photo.toString(),
// //                             fit: BoxFit.cover,
// //                             width: double.infinity,
// //                             height: double.infinity,
// //                             loadingBuilder: (BuildContext context, Widget child,
// //                                 ImageChunkEvent? loadingProgress) {
// //                               if (loadingProgress == null) return child;
// //                               return Container(
// //                                 color: const Color(0xFFE3EED4).withOpacity(0.3),
// //                                 child: Center(
// //                                   child: CircularProgressIndicator(
// //                                     value: loadingProgress.expectedTotalBytes != null
// //                                         ? loadingProgress.cumulativeBytesLoaded /
// //                                         loadingProgress.expectedTotalBytes!
// //                                         : null,
// //                                     color: const Color(0xFF0F2A1D),
// //                                   ),
// //                                 ),
// //                               );
// //                             },
// //                             errorBuilder: (BuildContext context, Object error,
// //                                 StackTrace? stackTrace) {
// //                               return Container(
// //                                 color: const Color(0xFFE3EED4).withOpacity(0.3),
// //                                 child: Center(
// //                                   child: Column(
// //                                     mainAxisAlignment: MainAxisAlignment.center,
// //                                     children: [
// //                                       Icon(
// //                                         Icons.broken_image,
// //                                         size: 50,
// //                                         color: const Color(0xFF0F2A1D).withOpacity(0.3),
// //                                       ),
// //                                       const SizedBox(height: 8),
// //                                       Text(
// //                                         'Image not available',
// //                                         style: TextStyle(
// //                                           color: const Color(0xFF0F2A1D).withOpacity(0.5),
// //                                           fontFamily: 'Poppins',
// //                                           fontSize: 12,
// //                                         ),
// //                                       ),
// //                                     ],
// //                                   ),
// //                                 ),
// //                               );
// //                             },
// //                           ),
// //                         ),
// //                         // Enlarge icon overlay
// //                         Positioned(
// //                           bottom: 8,
// //                           right: 8,
// //                           child: Container(
// //                             padding: const EdgeInsets.all(8),
// //                             decoration: BoxDecoration(
// //                               color: const Color(0xFF0F2A1D).withOpacity(0.7),
// //                               borderRadius: BorderRadius.circular(20),
// //                             ),
// //                             child: const Icon(
// //                               Icons.open_in_full,
// //                               color: Colors.white,
// //                               size: 16,
// //                             ),
// //                           ),
// //                         ),
// //                       ],
// //                     ),
// //                   ),
// //                 ),
// //
// //                 const SizedBox(height: 20),
// //
// //                 // Amount and Payment Section
// //                 Row(
// //                   children: [
// //                     // Amount display
// //                     Container(
// //                       padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
// //                       decoration: BoxDecoration(
// //                         gradient: LinearGradient(
// //                           colors: [
// //                             const Color(0xFF0F2A1D).withOpacity(0.1),
// //                             const Color(0xFFE3EED4).withOpacity(0.5),
// //                           ],
// //                         ),
// //                         borderRadius: BorderRadius.circular(12),
// //                         border: Border.all(
// //                           color: const Color(0xFF0F2A1D).withOpacity(0.3),
// //                         ),
// //                       ),
// //                       child: Row(
// //                         mainAxisSize: MainAxisSize.min,
// //                         children: [
// //                           const Icon(
// //                             Icons.currency_rupee,
// //                             size: 20,
// //                             color: Color(0xFF0F2A1D),
// //                           ),
// //                           const SizedBox(width: 4),
// //                           Text(
// //                             booking.amount.toString(),
// //                             style: const TextStyle(
// //                               fontSize: 22,
// //                               fontWeight: FontWeight.w900,
// //                               color: Color(0xFF0F2A1D),
// //                               fontFamily: 'Poppins',
// //                             ),
// //                           ),
// //                         ],
// //                       ),
// //                     ),
// //
// //                     const Spacer(),
// //
// //                     // Pay Button - Show only if not already paid
// //                     if (booking.status.toLowerCase() != 'paid')
// //                       ElevatedButton(
// //                         onPressed: _handlePayment,
// //                         style: ElevatedButton.styleFrom(
// //                           backgroundColor: const Color(0xFF0F2A1D),
// //                           foregroundColor: Colors.white,
// //                           padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
// //                           shape: RoundedRectangleBorder(
// //                             borderRadius: BorderRadius.circular(10),
// //                           ),
// //                           elevation: 4,
// //                         ),
// //                         child: const Text(
// //                           'PAY NOW',
// //                           style: TextStyle(
// //                             fontSize: 14,
// //                             fontWeight: FontWeight.w800,
// //                             fontFamily: 'Poppins',
// //                           ),
// //                         ),
// //                       )
// //                     else
// //                       Container(
// //                         padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
// //                         decoration: BoxDecoration(
// //                           color: Colors.green.withOpacity(0.1),
// //                           borderRadius: BorderRadius.circular(20),
// //                           border: Border.all(color: Colors.green),
// //                         ),
// //                         child: Row(
// //                           mainAxisSize: MainAxisSize.min,
// //                           children: const [
// //                             Icon(
// //                               Icons.paid,
// //                               color: Colors.green,
// //                               size: 18,
// //                             ),
// //                             SizedBox(width: 8),
// //                             Text(
// //                               'PAID',
// //                               style: TextStyle(
// //                                 color: Colors.green,
// //                                 fontWeight: FontWeight.w800,
// //                                 fontFamily: 'Poppins',
// //                               ),
// //                             ),
// //                           ],
// //                         ),
// //                       ),
// //                   ],
// //                 ),
// //               ],
// //             ),
// //           ),
// //         ],
// //       ),
// //     );
// //   }
// //
// //   Widget _buildInfoRow(IconData icon, String label, String value) {
// //     return Padding(
// //       padding: const EdgeInsets.symmetric(vertical: 4),
// //       child: Row(
// //         children: [
// //           Icon(
// //             icon,
// //             size: 16,
// //             color: const Color(0xFF0F2A1D).withOpacity(0.7),
// //           ),
// //           const SizedBox(width: 10),
// //           SizedBox(
// //             width: 100,
// //             child: Text(
// //               label,
// //               style: const TextStyle(
// //                 fontWeight: FontWeight.w800,
// //                 color: Color(0xFF0F2A1D),
// //                 fontSize: 13,
// //                 fontFamily: 'Poppins',
// //               ),
// //             ),
// //           ),
// //           const Text(
// //             ':',
// //             style: TextStyle(
// //               color: Color(0xFF0F2A1D),
// //               fontWeight: FontWeight.w800,
// //             ),
// //           ),
// //           const SizedBox(width: 10),
// //           Expanded(
// //             child: Text(
// //               value,
// //               style: const TextStyle(
// //                 fontSize: 13,
// //                 color: Color(0xFF0F2A1D),
// //                 fontWeight: FontWeight.w600,
// //                 fontFamily: 'Poppins',
// //               ),
// //               softWrap: true,
// //             ),
// //           ),
// //         ],
// //       ),
// //     );
// //   }
// // }
// //
// // class Joke {
// //   final String id;
// //   final String status;
// //   final String date;
// //   final String total_person;
// //   final String photo;
// //   final String amount;
// //   final String package_details;
// //   final String travelcompany_name;
// //   final String bookingdate;
// //
// //   Joke(
// //       this.id,
// //       this.status,
// //       this.date,
// //       this.total_person,
// //       this.photo,
// //       this.amount,
// //       this.package_details,
// //       this.travelcompany_name,
// //       this.bookingdate,
// //       );
// // }



// import 'dart:convert';
//
// import 'package:final_destination/home.dart';
// import 'package:flutter/material.dart';
// import 'package:http/http.dart' as http;
// import 'package:shared_preferences/shared_preferences.dart';
//
// import 'RazorpayScreen.dart';
//
// void main() {
//   runApp(viewbooking_status());
// }
//
// class viewbooking_status extends StatelessWidget {
//   const viewbooking_status({Key? key}) : super(key: key);
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
//       home: viewbooking_statussub(),
//     );
//   }
// }
//
// class viewbooking_statussub extends StatefulWidget {
//   const viewbooking_statussub({Key? key}) : super(key: key);
//
//   @override
//   State<viewbooking_statussub> createState() => _viewbooking_statussubState();
// }
//
// class _viewbooking_statussubState extends State<viewbooking_statussub> {
//   bool _isLoading = true;
//   bool _hasBooking = false;
//   Joke? _latestBooking;
//   String? _errorMessage;
//
//   @override
//   void initState() {
//     super.initState();
//     _getLatestBooking();
//   }
//
//   Future<void> _getLatestBooking() async {
//     setState(() {
//       _isLoading = true;
//       _errorMessage = null;
//     });
//
//     try {
//       SharedPreferences prefs = await SharedPreferences.getInstance();
//       String b = prefs.getString("lid").toString();
//
//       var data = await http.post(
//         Uri.parse(prefs.getString("ip").toString() + "/user_viewbooking_status"),
//         body: {"uid": prefs.getString('uid').toString()},
//       );
//
//       var jsonData = json.decode(data.body);
//       prefs.setString('total', jsonData['total'].toString());
//
//       if (jsonData["message"] != null && jsonData["message"].isNotEmpty) {
//         // Get the latest booking (first one in the list)
//         var latestBookingData = jsonData["message"][0];
//
//         setState(() {
//           _latestBooking = Joke(
//             latestBookingData["id"].toString(),
//             latestBookingData["status"],
//             latestBookingData["date"].toString(),
//             latestBookingData["total_person"].toString(),
//             prefs.getString('ip').toString() + latestBookingData["photo"].toString(),
//             latestBookingData["amount"].toString(),
//             latestBookingData["package_details"].toString(),
//             latestBookingData["travelcompany_name"].toString(),
//             latestBookingData["bookingdate"].toString(),
//           );
//           _hasBooking = true;
//           _isLoading = false;
//         });
//       } else {
//         setState(() {
//           _hasBooking = false;
//           _isLoading = false;
//         });
//       }
//     } catch (e) {
//       setState(() {
//         _errorMessage = "Failed to load booking details";
//         _isLoading = false;
//       });
//     }
//   }
//
//   Future<void> _refreshBooking() async {
//     await _getLatestBooking();
//   }
//
//   void _showEnlargedImage(BuildContext context, String imageUrl) {
//     showDialog(
//       context: context,
//       builder: (BuildContext context) {
//         return Dialog(
//           backgroundColor: Colors.transparent,
//           insetPadding: EdgeInsets.zero,
//           child: Container(
//             width: double.infinity,
//             height: double.infinity,
//             color: Colors.transparent,
//             child: Stack(
//               children: [
//                 Center(
//                   child: GestureDetector(
//                     onTap: () => Navigator.pop(context),
//                     child: Container(
//                       width: double.infinity,
//                       height: double.infinity,
//                       child: Image.network(
//                         imageUrl,
//                         fit: BoxFit.contain,
//                         loadingBuilder: (BuildContext context, Widget child,
//                             ImageChunkEvent? loadingProgress) {
//                           if (loadingProgress == null) return child;
//                           return Center(
//                             child: CircularProgressIndicator(
//                               value: loadingProgress.expectedTotalBytes != null
//                                   ? loadingProgress.cumulativeBytesLoaded /
//                                   loadingProgress.expectedTotalBytes!
//                                   : null,
//                               color: const Color(0xFF0F2A1D),
//                             ),
//                           );
//                         },
//                         errorBuilder: (BuildContext context, Object error,
//                             StackTrace? stackTrace) {
//                           return Center(
//                             child: Column(
//                               mainAxisAlignment: MainAxisAlignment.center,
//                               children: [
//                                 Icon(
//                                   Icons.broken_image,
//                                   size: 60,
//                                   color: const Color(0xFF0F2A1D)
//                                       .withOpacity(0.3),
//                                 ),
//                                 const SizedBox(height: 10),
//                                 Text(
//                                   'Failed to load image',
//                                   style: TextStyle(
//                                     color: const Color(0xFF0F2A1D)
//                                         .withOpacity(0.7),
//                                     fontFamily: 'Poppins',
//                                   ),
//                                 ),
//                               ],
//                             ),
//                           );
//                         },
//                       ),
//                     ),
//                   ),
//                 ),
//                 // Close button
//                 Positioned(
//                   top: 40,
//                   right: 20,
//                   child: GestureDetector(
//                     onTap: () => Navigator.pop(context),
//                     child: Container(
//                       padding: const EdgeInsets.all(12),
//                       decoration: BoxDecoration(
//                         color: const Color(0xFF0F2A1D).withOpacity(0.1),
//                         borderRadius: BorderRadius.circular(30),
//                         border: Border.all(
//                           color: const Color(0xFF0F2A1D).withOpacity(0.2),
//                         ),
//                       ),
//                       child: const Icon(
//                         Icons.close,
//                         color: Color(0xFF0F2A1D),
//                         size: 24,
//                       ),
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         );
//       },
//     );
//   }
//
//   Color _getStatusColor(String status) {
//     switch (status.toLowerCase()) {
//       case 'confirmed':
//       case 'paid':
//         return Colors.green;
//       case 'pending':
//         return Colors.orange;
//       case 'cancelled':
//         return Colors.red;
//       default:
//         return const Color(0xFF0F2A1D);
//     }
//   }
//
//   IconData _getStatusIcon(String status) {
//     switch (status.toLowerCase()) {
//       case 'confirmed':
//       case 'paid':
//         return Icons.check_circle;
//       case 'pending':
//         return Icons.pending;
//       case 'cancelled':
//         return Icons.cancel;
//       default:
//         return Icons.info;
//     }
//   }
//
//   String _formatStatus(String status) {
//     if (status.toLowerCase() == 'paid') {
//       return 'PAID';
//     }
//     return status.toUpperCase();
//   }
//
//   Future<void> _handlePayment() async {
//     if (_latestBooking == null) return;
//
//     SharedPreferences sh = await SharedPreferences.getInstance();
//     await sh.setString('bid', _latestBooking!.id.toString());
//
//     // Navigate to payment screen and wait for result
//     final result = await Navigator.push(
//       context,
//       MaterialPageRoute(builder: (context) => RazorpayScreen()),
//     );
//
//     // If payment was successful, refresh booking status
//     if (result == true) {
//       _refreshBooking();
//
//       // Show success message
//       ScaffoldMessenger.of(context).showSnackBar(
//         SnackBar(
//           content: Text(
//             'Payment successful! Booking status updated.',
//             style: const TextStyle(fontFamily: 'Poppins'),
//           ),
//           backgroundColor: Colors.green,
//           duration: const Duration(seconds: 3),
//         ),
//       );
//     }
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
//           'Booking Status',
//           style: const TextStyle(
//             fontSize: 24,
//             fontWeight: FontWeight.w800,
//             color: Color(0xFF0F2A1D),
//             fontFamily: 'Poppins',
//             letterSpacing: 1,
//           ),
//         ),
//         centerTitle: true,
//         // leading: IconButton(
//         //   icon: const Icon(Icons.arrow_back_ios, color: Color(0xFF0F2A1D), size: 22),
//         //   onPressed: () => Navigator.push(
//         //     context,
//         //     MaterialPageRoute(builder: (context) => UserHomeApp()),
//         //   ),
//         // ),
//         actions: [
//           // Refresh button
//           IconButton(
//             icon: const Icon(Icons.refresh, color: Color(0xFF0F2A1D)),
//             onPressed: _refreshBooking,
//           ),
//         ],
//       ),
//       body: RefreshIndicator(
//         onRefresh: _refreshBooking,
//         color: const Color(0xFF0F2A1D),
//         child: _buildBody(),
//       ),
//     );
//   }
//
//   Widget _buildBody() {
//     if (_isLoading) {
//       return Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             CircularProgressIndicator(
//               color: const Color(0xFF0F2A1D),
//             ),
//             const SizedBox(height: 20),
//             Text(
//               "Loading your latest booking...",
//               style: TextStyle(
//                 color: const Color(0xFF0F2A1D),
//                 fontSize: 16,
//                 fontFamily: 'Poppins',
//                 fontWeight: FontWeight.w600,
//               ),
//             ),
//           ],
//         ),
//       );
//     }
//
//     if (_errorMessage != null) {
//       return Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             Icon(
//               Icons.error_outline,
//               size: 80,
//               color: const Color(0xFF0F2A1D).withOpacity(0.3),
//             ),
//             const SizedBox(height: 20),
//             Text(
//               _errorMessage!,
//               style: const TextStyle(
//                 fontSize: 18,
//                 fontWeight: FontWeight.w800,
//                 color: Color(0xFF0F2A1D),
//                 fontFamily: 'Poppins',
//               ),
//             ),
//             const SizedBox(height: 10),
//             Text(
//               'Pull down to refresh',
//               style: TextStyle(
//                 fontSize: 14,
//                 color: const Color(0xFF0F2A1D).withOpacity(0.6),
//                 fontFamily: 'Poppins',
//               ),
//             ),
//             const SizedBox(height: 20),
//             ElevatedButton(
//               onPressed: _refreshBooking,
//               style: ElevatedButton.styleFrom(
//                 backgroundColor: const Color(0xFF0F2A1D),
//                 foregroundColor: Colors.white,
//                 padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
//               ),
//               child: const Text('Try Again'),
//             ),
//           ],
//         ),
//       );
//     }
//
//     if (!_hasBooking || _latestBooking == null) {
//       return Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             Icon(
//               Icons.book_online_outlined,
//               size: 100,
//               color: const Color(0xFF0F2A1D).withOpacity(0.3),
//             ),
//             const SizedBox(height: 20),
//             Text(
//               'No bookings found',
//               style: const TextStyle(
//                 fontSize: 20,
//                 fontWeight: FontWeight.w800,
//                 color: Color(0xFF0F2A1D),
//                 fontFamily: 'Poppins',
//               ),
//             ),
//             const SizedBox(height: 10),
//             Text(
//               'Your booking history will appear here',
//               style: TextStyle(
//                 fontSize: 14,
//                 color: const Color(0xFF0F2A1D).withOpacity(0.6),
//                 fontFamily: 'Poppins',
//                 fontWeight: FontWeight.w600,
//               ),
//             ),
//             const SizedBox(height: 20),
//             ElevatedButton(
//               onPressed: () => Navigator.push(
//                 context,
//                 MaterialPageRoute(builder: (context) => UserHomeApp()),
//               ),
//               style: ElevatedButton.styleFrom(
//                 backgroundColor: const Color(0xFF0F2A1D),
//                 foregroundColor: Colors.white,
//                 padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
//               ),
//               child: const Text('Browse Packages'),
//             ),
//           ],
//         ),
//       );
//     }
//
//     return SingleChildScrollView(
//       physics: const AlwaysScrollableScrollPhysics(),
//       padding: const EdgeInsets.all(16),
//       child: _buildBookingDetailCard(_latestBooking!),
//     );
//   }
//
//   Widget _buildBookingDetailCard(Joke booking) {
//     return Card(
//       elevation: 4,
//       shape: RoundedRectangleBorder(
//         borderRadius: BorderRadius.circular(20),
//       ),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           // Header with gradient and status
//           Container(
//             decoration: const BoxDecoration(
//               gradient: LinearGradient(
//                 colors: [Color(0xFF0F2A1D), Color(0xFF1A3F2B)],
//                 begin: Alignment.topLeft,
//                 end: Alignment.bottomRight,
//               ),
//               borderRadius: BorderRadius.only(
//                 topLeft: Radius.circular(20),
//                 topRight: Radius.circular(20),
//               ),
//             ),
//             padding: const EdgeInsets.all(16),
//             child: Row(
//               children: [
//                 Container(
//                   padding: const EdgeInsets.all(8),
//                   decoration: BoxDecoration(
//                     color: Colors.white.withOpacity(0.2),
//                     borderRadius: BorderRadius.circular(10),
//                   ),
//                   child: const Icon(
//                     Icons.receipt_long,
//                     color: Colors.white,
//                     size: 20,
//                   ),
//                 ),
//                 const SizedBox(width: 12),
//                 Expanded(
//                   child: Text(
//                     'Booking #${booking.id.toString().length > 8 ? booking.id.toString().substring(0, 8) : booking.id.toString()}',
//                     style: const TextStyle(
//                       color: Colors.white,
//                       fontSize: 18,
//                       fontWeight: FontWeight.w800,
//                       fontFamily: 'Poppins',
//                     ),
//                   ),
//                 ),
//                 // Status badge
//                 Container(
//                   padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
//                   decoration: BoxDecoration(
//                     color: _getStatusColor(booking.status.toString()).withOpacity(0.2),
//                     borderRadius: BorderRadius.circular(20),
//                     border: Border.all(
//                       color: Colors.white.withOpacity(0.3),
//                     ),
//                   ),
//                   child: Row(
//                     mainAxisSize: MainAxisSize.min,
//                     children: [
//                       Icon(
//                         _getStatusIcon(booking.status.toString()),
//                         color: Colors.white,
//                         size: 14,
//                       ),
//                       const SizedBox(width: 4),
//                       Text(
//                         _formatStatus(booking.status.toString()),
//                         style: const TextStyle(
//                           color: Colors.white,
//                           fontSize: 12,
//                           fontWeight: FontWeight.w800,
//                           fontFamily: 'Poppins',
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
//               ],
//             ),
//           ),
//
//           Padding(
//             padding: const EdgeInsets.all(16),
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 // Travel Company Name - Styled as badge
//                 Container(
//                   padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
//                   decoration: BoxDecoration(
//                     color: const Color(0xFF0F2A1D).withOpacity(0.1),
//                     borderRadius: BorderRadius.circular(10),
//                   ),
//                   child: Row(
//                     mainAxisSize: MainAxisSize.min,
//                     children: [
//                       const Icon(
//                         Icons.business,
//                         size: 16,
//                         color: Color(0xFF0F2A1D),
//                       ),
//                       const SizedBox(width: 8),
//                       Text(
//                         booking.travelcompany_name.toString(),
//                         style: const TextStyle(
//                           fontSize: 14,
//                           fontWeight: FontWeight.w800,
//                           color: Color(0xFF0F2A1D),
//                           fontFamily: 'Poppins',
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
//
//                 const SizedBox(height: 16),
//
//                 // Package Details
//                 Container(
//                   padding: const EdgeInsets.all(12),
//                   decoration: BoxDecoration(
//                     color: const Color(0xFF0F2A1D).withOpacity(0.03),
//                     borderRadius: BorderRadius.circular(12),
//                   ),
//                   child: Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       const Text(
//                         'Package Details',
//                         style: TextStyle(
//                           fontSize: 16,
//                           fontWeight: FontWeight.w800,
//                           color: Color(0xFF0F2A1D),
//                           fontFamily: 'Poppins',
//                         ),
//                       ),
//                       const SizedBox(height: 8),
//                       Text(
//                         booking.package_details.toString(),
//                         style: const TextStyle(
//                           fontSize: 13,
//                           color: Color(0xFF0F2A1D),
//                           fontWeight: FontWeight.w600,
//                           fontFamily: 'Poppins',
//                         ),
//                       ),
//                       const SizedBox(height: 12),
//                       _buildInfoRow(Icons.calendar_today, 'Travel Date', booking.bookingdate.toString()),
//                       const Divider(height: 16, color: Color(0xFF0F2A1D)),
//                       _buildInfoRow(Icons.event, 'Booking Date', booking.date.toString()),
//                       const Divider(height: 16, color: Color(0xFF0F2A1D)),
//                       _buildInfoRow(Icons.people, 'Total Persons', booking.total_person.toString()),
//                     ],
//                   ),
//                 ),
//
//                 const SizedBox(height: 16),
//
//                 // Image Section - Clickable to enlarge
//                 GestureDetector(
//                   onTap: () => _showEnlargedImage(context, booking.photo.toString()),
//                   child: Container(
//                     height: 200,
//                     width: double.infinity,
//                     decoration: BoxDecoration(
//                       borderRadius: BorderRadius.circular(15),
//                       boxShadow: [
//                         BoxShadow(
//                           color: const Color(0xFF0F2A1D).withOpacity(0.2),
//                           blurRadius: 10,
//                           offset: const Offset(0, 5),
//                         ),
//                       ],
//                     ),
//                     child: Stack(
//                       children: [
//                         ClipRRect(
//                           borderRadius: BorderRadius.circular(15),
//                           child: Image.network(
//                             booking.photo.toString(),
//                             fit: BoxFit.cover,
//                             width: double.infinity,
//                             height: double.infinity,
//                             loadingBuilder: (BuildContext context, Widget child,
//                                 ImageChunkEvent? loadingProgress) {
//                               if (loadingProgress == null) return child;
//                               return Container(
//                                 color: const Color(0xFFE3EED4).withOpacity(0.3),
//                                 child: Center(
//                                   child: CircularProgressIndicator(
//                                     value: loadingProgress.expectedTotalBytes != null
//                                         ? loadingProgress.cumulativeBytesLoaded /
//                                         loadingProgress.expectedTotalBytes!
//                                         : null,
//                                     color: const Color(0xFF0F2A1D),
//                                   ),
//                                 ),
//                               );
//                             },
//                             errorBuilder: (BuildContext context, Object error,
//                                 StackTrace? stackTrace) {
//                               return Container(
//                                 color: const Color(0xFFE3EED4).withOpacity(0.3),
//                                 child: Center(
//                                   child: Column(
//                                     mainAxisAlignment: MainAxisAlignment.center,
//                                     children: [
//                                       Icon(
//                                         Icons.broken_image,
//                                         size: 50,
//                                         color: const Color(0xFF0F2A1D).withOpacity(0.3),
//                                       ),
//                                       const SizedBox(height: 8),
//                                       Text(
//                                         'Image not available',
//                                         style: TextStyle(
//                                           color: const Color(0xFF0F2A1D).withOpacity(0.5),
//                                           fontFamily: 'Poppins',
//                                           fontSize: 12,
//                                         ),
//                                       ),
//                                     ],
//                                   ),
//                                 ),
//                               );
//                             },
//                           ),
//                         ),
//                         // Enlarge icon overlay
//                         Positioned(
//                           bottom: 8,
//                           right: 8,
//                           child: Container(
//                             padding: const EdgeInsets.all(8),
//                             decoration: BoxDecoration(
//                               color: const Color(0xFF0F2A1D).withOpacity(0.7),
//                               borderRadius: BorderRadius.circular(20),
//                             ),
//                             child: const Icon(
//                               Icons.open_in_full,
//                               color: Colors.white,
//                               size: 16,
//                             ),
//                           ),
//                         ),
//                       ],
//                     ),
//                   ),
//                 ),
//
//                 const SizedBox(height: 20),
//
//                 // Amount and Payment Section
//                 Row(
//                   children: [
//                     // Amount display
//                     Container(
//                       padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
//                       decoration: BoxDecoration(
//                         gradient: LinearGradient(
//                           colors: [
//                             const Color(0xFF0F2A1D).withOpacity(0.1),
//                             const Color(0xFFE3EED4).withOpacity(0.5),
//                           ],
//                         ),
//                         borderRadius: BorderRadius.circular(12),
//                         border: Border.all(
//                           color: const Color(0xFF0F2A1D).withOpacity(0.3),
//                         ),
//                       ),
//                       child: Row(
//                         mainAxisSize: MainAxisSize.min,
//                         children: [
//                           const Icon(
//                             Icons.currency_rupee,
//                             size: 20,
//                             color: Color(0xFF0F2A1D),
//                           ),
//                           const SizedBox(width: 4),
//                           Text(
//                             booking.amount.toString(),
//                             style: const TextStyle(
//                               fontSize: 22,
//                               fontWeight: FontWeight.w900,
//                               color: Color(0xFF0F2A1D),
//                               fontFamily: 'Poppins',
//                             ),
//                           ),
//                         ],
//                       ),
//                     ),
//
//                     const Spacer(),
//
//                     // Pay Button - Show only if not already paid
//                     if (booking.status.toLowerCase() != 'paid')
//                       ElevatedButton(
//                         onPressed: _handlePayment,
//                         style: ElevatedButton.styleFrom(
//                           backgroundColor: const Color(0xFF0F2A1D),
//                           foregroundColor: Colors.white,
//                           padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
//                           shape: RoundedRectangleBorder(
//                             borderRadius: BorderRadius.circular(10),
//                           ),
//                           elevation: 4,
//                         ),
//                         child: const Text(
//                           'PAY NOW',
//                           style: TextStyle(
//                             fontSize: 14,
//                             fontWeight: FontWeight.w800,
//                             fontFamily: 'Poppins',
//                           ),
//                         ),
//                       )
//                     else
//                       Container(
//                         padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
//                         decoration: BoxDecoration(
//                           color: Colors.green.withOpacity(0.1),
//                           borderRadius: BorderRadius.circular(20),
//                           border: Border.all(color: Colors.green),
//                         ),
//                         child: Row(
//                           mainAxisSize: MainAxisSize.min,
//                           children: const [
//                             Icon(
//                               Icons.paid,
//                               color: Colors.green,
//                               size: 18,
//                             ),
//                             SizedBox(width: 8),
//                             Text(
//                               'PAID',
//                               style: TextStyle(
//                                 color: Colors.green,
//                                 fontWeight: FontWeight.w800,
//                                 fontFamily: 'Poppins',
//                               ),
//                             ),
//                           ],
//                         ),
//                       ),
//                   ],
//                 ),
//               ],
//             ),
//           ),
//         ],
//       ),
//     );
//   }
//
//   Widget _buildInfoRow(IconData icon, String label, String value) {
//     return Padding(
//       padding: const EdgeInsets.symmetric(vertical: 4),
//       child: Row(
//         children: [
//           Icon(
//             icon,
//             size: 16,
//             color: const Color(0xFF0F2A1D).withOpacity(0.7),
//           ),
//           const SizedBox(width: 10),
//           SizedBox(
//             width: 100,
//             child: Text(
//               label,
//               style: const TextStyle(
//                 fontWeight: FontWeight.w800,
//                 color: Color(0xFF0F2A1D),
//                 fontSize: 13,
//                 fontFamily: 'Poppins',
//               ),
//             ),
//           ),
//           const Text(
//             ':',
//             style: TextStyle(
//               color: Color(0xFF0F2A1D),
//               fontWeight: FontWeight.w800,
//             ),
//           ),
//           const SizedBox(width: 10),
//           Expanded(
//             child: Text(
//               value,
//               style: const TextStyle(
//                 fontSize: 13,
//                 color: Color(0xFF0F2A1D),
//                 fontWeight: FontWeight.w600,
//                 fontFamily: 'Poppins',
//               ),
//               softWrap: true,
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
//   final String status;
//   final String date;
//   final String total_person;
//   final String photo;
//   final String amount;
//   final String package_details;
//   final String travelcompany_name;
//   final String bookingdate;
//
//   Joke(
//       this.id,
//       this.status,
//       this.date,
//       this.total_person,
//       this.photo,
//       this.amount,
//       this.package_details,
//       this.travelcompany_name,
//       this.bookingdate,
//       );
// }
//
//

import 'dart:convert';
import 'package:final_destination/RazorpayScreen.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  runApp(viewbooking_status());
}

class viewbooking_status extends StatelessWidget {
  const viewbooking_status({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: const Color(0xFF0F2A1D),
        fontFamily: 'Poppins',
        scaffoldBackgroundColor: const Color(0xFFE3EED4),
      ),
      home: const viewbooking_statussub(),
    );
  }
}

class viewbooking_statussub extends StatefulWidget {
  const viewbooking_statussub({Key? key}) : super(key: key);

  @override
  State<viewbooking_statussub> createState() => _viewbooking_statussubState();
}

class _viewbooking_statussubState extends State<viewbooking_statussub> {
  Future<List<Joke>> _getJokes() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String ip = prefs.getString("ip") ?? "http://localhost";
    String uid = prefs.getString('uid') ?? "";

    var response = await http.post(
      Uri.parse("$ip/user_viewbooking_status"),
      body: {"uid": uid},
    );

    var jsonData = json.decode(response.body);
    prefs.setString('total', jsonData['total'].toString());

    List<Joke> jokes = [];
    for (var joke in jsonData["message"]) {
      jokes.add(Joke(
        joke["id"].toString(),
        joke["status"],
        joke["date"].toString(),
        joke["total_person"].toString(),
        "$ip${joke["photo"].toString()}",
        joke["amount"].toString(),
        joke["package_details"].toString(),
        joke["travelcompany_name"].toString(),
        joke["bookingdate"].toString(),
      ));
    }
    return jokes;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFE3EED4),
      appBar: AppBar(
        backgroundColor: const Color(0xFF0F2A1D),
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text(
          'My Bookings',
          style: TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        centerTitle: true,
      ),
      body: FutureBuilder(
        future: _getJokes(),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(
                color: Color(0xFF0F2A1D),
              ),
            );
          }
          if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.card_travel,
                    size: 80,
                    color: const Color(0xFF0F2A1D).withOpacity(0.3),
                  ),
                  const SizedBox(height: 20),
                  const Text(
                    'No bookings found',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                      color: Color(0xFF0F2A1D),
                    ),
                  ),
                ],
              ),
            );
          }
          return ListView.builder(
            padding: const EdgeInsets.all(16),
            itemCount: snapshot.data.length,
            itemBuilder: (BuildContext context, int index) {
              var booking = snapshot.data![index];
              return Container(
                margin: const EdgeInsets.only(bottom: 20),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.2),
                      spreadRadius: 2,
                      blurRadius: 10,
                      offset: const Offset(0, 5),
                    ),
                  ],
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Header with status and booking ID
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                      decoration: BoxDecoration(
                        color: const Color(0xFF0F2A1D).withOpacity(0.05),
                        borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(20),
                          topRight: Radius.circular(20),
                        ),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Booking #${booking.id}',
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 14,
                              color: Color(0xFF0F2A1D),
                            ),
                          ),
                          Container(
                            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
                            decoration: BoxDecoration(
                              color: _getStatusColor(booking.status).withOpacity(0.1),
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: Text(
                              booking.status,
                              style: TextStyle(
                                color: _getStatusColor(booking.status),
                                fontWeight: FontWeight.w600,
                                fontSize: 12,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),

                    // Image
                    ClipRRect(
                      borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(20),
                        topRight: Radius.circular(20),
                      ),
                      child: Image.network(
                        booking.photo,
                        height: 200,
                        width: double.infinity,
                        fit: BoxFit.cover,
                        errorBuilder: (context, error, stackTrace) {
                          return Container(
                            height: 200,
                            color: Colors.grey[200],
                            child: const Center(
                              child: Icon(
                                Icons.image_not_supported,
                                size: 50,
                                color: Colors.grey,
                              ),
                            ),
                          );
                        },
                      ),
                    ),

                    // Details
                    Padding(
                      padding: const EdgeInsets.all(20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // Travel Company & Package
                          Row(
                            children: [
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      booking.travelcompany_name,
                                      style: const TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold,
                                        color: Color(0xFF0F2A1D),
                                      ),
                                    ),
                                    const SizedBox(height: 4),
                                    Text(
                                      'Package: ${booking.package_details}',
                                      style: TextStyle(
                                        fontSize: 14,
                                        color: Colors.grey[600],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 15),

                          // Booking Details Grid
                          Row(
                            children: [
                              Expanded(
                                child: _buildInfoChip(
                                  icon: Icons.calendar_today,
                                  label: 'Booking Date',
                                  value: _formatDate(booking.bookingdate),
                                ),
                              ),
                              const SizedBox(width: 10),
                              Expanded(
                                child: _buildInfoChip(
                                  icon: Icons.people,
                                  label: 'Persons',
                                  value: booking.total_person,
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 10),
                          Row(
                            children: [
                              Expanded(
                                child: _buildInfoChip(
                                  icon: Icons.date_range,
                                  label: 'Travel Date',
                                  value: _formatDate(booking.date),
                                ),
                              ),
                              const SizedBox(width: 10),
                              Expanded(
                                child: _buildInfoChip(
                                  icon: Icons.currency_rupee,
                                  label: 'Amount',
                                  value: '₹${booking.amount}',
                                  highlight: true,
                                ),
                              ),
                            ],
                          ),

                          const SizedBox(height: 20),

                          // Pay Button - Always visible as per original functionality
                          SizedBox(
                            width: double.infinity,
                            child: ElevatedButton(
                              onPressed: () async {
                                SharedPreferences prefs = await SharedPreferences.getInstance();
                                prefs.setString('bid', booking.id);
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(builder: (context) => RazorpayScreen()),
                                );
                              },
                              style: ElevatedButton.styleFrom(
                                backgroundColor: const Color(0xFF0F2A1D),
                                padding: const EdgeInsets.symmetric(vertical: 16),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(12),
                                ),
                              ),
                              child: const Text(
                                'Pay Now',
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              );
            },
          );
        },
      ),
    );
  }

  Color _getStatusColor(String status) {
    switch (status.toLowerCase()) {
      case 'confirmed':
        return Colors.green;
      case 'pending':
        return Colors.orange;
      case 'cancelled':
        return Colors.red;
      default:
        return Colors.grey;
    }
  }

  String _formatDate(String dateStr) {
    // Simple formatting: just return as is, you can enhance if needed
    return dateStr;
  }

  Widget _buildInfoChip({
    required IconData icon,
    required String label,
    required String value,
    bool highlight = false,
  }) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      decoration: BoxDecoration(
        color: highlight
            ? const Color(0xFF0F2A1D).withOpacity(0.1)
            : Colors.grey[50],
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: highlight
              ? const Color(0xFF0F2A1D).withOpacity(0.2)
              : Colors.grey.shade200,
        ),
      ),
      child: Row(
        children: [
          Icon(
            icon,
            size: 16,
            color: highlight ? const Color(0xFF0F2A1D) : Colors.grey[600],
          ),
          const SizedBox(width: 8),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  label,
                  style: TextStyle(
                    fontSize: 10,
                    color: Colors.grey[500],
                  ),
                ),
                Text(
                  value,
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: highlight ? FontWeight.bold : FontWeight.w500,
                    color: highlight ? const Color(0xFF0F2A1D) : Colors.black87,
                  ),
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class Joke {
  final String id;
  final String status;
  final String date;
  final String total_person;
  final String photo;
  final String amount;
  final String package_details;
  final String travelcompany_name;
  final String bookingdate;

  Joke(
      this.id,
      this.status,
      this.date,
      this.total_person,
      this.photo,
      this.amount,
      this.package_details,
      this.travelcompany_name,
      this.bookingdate,
      );
}