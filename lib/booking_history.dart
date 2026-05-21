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
//   runApp(viewbooking_history());
// }
// class viewbooking_history extends StatelessWidget {
//   const viewbooking_history({Key? key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(home: viewbooking_historysub(),);
//   }
// }
// class viewbooking_historysub extends StatefulWidget {
//   const viewbooking_historysub({Key? key}) : super(key: key);
//
//   @override
//   State<viewbooking_historysub> createState() => _viewbooking_historysubState();
// }
//
// class _viewbooking_historysubState extends State<viewbooking_historysub> {
//   Future<List<Joke>> _getJokes() async {
//     SharedPreferences prefs = await SharedPreferences.getInstance();
//     String b = prefs.getString("lid").toString();
//     String foodimage="";
//     var data =
//     await http.post(Uri.parse(prefs.getString("ip").toString()+"/user_booking_history"),
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
//         joke["id"].toString(),
//         joke["status"],
//         joke["date"].toString(),
//         joke["total_person"].toString(),
//         prefs.getString('ip').toString()+joke["photo1"].toString(),
//         prefs.getString('ip').toString()+joke["photo2"].toString(),
//         prefs.getString('ip').toString()+joke["photo3"].toString(),
//         joke["amount"].toString(),
//         joke["package_details"].toString(),
//         joke["travelcompany_name"].toString(),
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
//                           _buildRow("total_person:", i.total_person.toString()),
//                           Image.network(i.photo1.toString(),height: 200,width: 200,),
//                           Image.network(i.photo2.toString(),height: 200,width: 200,),
//                           Image.network(i.photo3.toString(),height: 200,width: 200,),
//                           _buildRow("amount:", i.amount.toString()),
//                           _buildRow("package_details:", i.package_details.toString()),
//                           _buildRow("travelcompany_name:", i.travelcompany_name.toString()),
//
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
//     );
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
//   final String photo1;
//   final String photo2;
//   final String photo3;
//   final String amount;
//   final String package_details;
//   final String travelcompany_name;
//
//
//
//
//
//   Joke(this.id,this.status, this.date,this.total_person,this.photo1,this.photo2,this.photo3,this.amount,this.package_details,this.travelcompany_name);
// //  print("hiiiii");
// }

//
// import 'dart:convert';
//
// import 'package:final_destination/RazorpayScreen.dart';
// import 'package:flutter/material.dart';
// import 'package:http/http.dart' as http;
// import 'package:shared_preferences/shared_preferences.dart';
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
//         scaffoldBackgroundColor: const Color(0xFFF4F6F9),
//         primaryColor: const Color(0xFF0F3D3A),
//         fontFamily: 'Roboto',
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
//   Future<List<BookingItem>> _getBookings() async {
//     SharedPreferences prefs = await SharedPreferences.getInstance();
//     var data = await http.post(
//       Uri.parse(prefs.getString("ip").toString() + "/user_viewbooking_status"),
//       body: {"uid": prefs.getString('uid').toString()},
//     );
//
//     var jsonData = json.decode(data.body);
//     prefs.setString('total', jsonData['total'].toString());
//
//     List<BookingItem> bookings = [];
//     for (var item in jsonData["message"]) {
//       BookingItem booking = BookingItem(
//         id: item["id"].toString(),
//         status: item["status"].toString(),
//         date: item["date"].toString(),
//         totalPerson: item["total_person"].toString(),
//         photo: prefs.getString('ip').toString() + item["photo"].toString(),
//         amount: item["amount"].toString(),
//         packageDetails: item["package_details"].toString(),
//         travelCompanyName: item["travelcompany_name"].toString(),
//         bookingDate: item["bookingdate"].toString(),
//       );
//       bookings.add(booking);
//     }
//     return bookings;
//   }
//
//   Color _getStatusColor(String status) {
//     switch (status.toLowerCase()) {
//       case 'confirmed':
//         return const Color(0xFF2ECC71);
//       case 'pending':
//         return const Color(0xFFF39C12);
//       case 'cancelled':
//         return const Color(0xFFE74C3C);
//       default:
//         return const Color(0xFF95A5A6);
//     }
//   }
//
//   IconData _getStatusIcon(String status) {
//     switch (status.toLowerCase()) {
//       case 'confirmed':
//         return Icons.check_circle_rounded;
//       case 'pending':
//         return Icons.hourglass_top_rounded;
//       case 'cancelled':
//         return Icons.cancel_rounded;
//       default:
//         return Icons.info_rounded;
//     }
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: const Color(0xFFF4F6F9),
//       appBar: AppBar(
//         backgroundColor: const Color(0xFF0F3D3A),
//         elevation: 0,
//         centerTitle: true,
//         leading: IconButton(
//           icon: const Icon(Icons.arrow_back_ios, color: Colors.white, size: 20),
//           onPressed: () => Navigator.pop(context),
//         ),
//         title: const Text(
//           'My Bookings',
//           style: TextStyle(
//             color: Colors.white,
//             fontSize: 20,
//             fontWeight: FontWeight.w600,
//             letterSpacing: 0.5,
//           ),
//         ),
//       ),
//       body: FutureBuilder<List<BookingItem>>(
//         future: _getBookings(),
//         builder: (BuildContext context, AsyncSnapshot<List<BookingItem>> snapshot) {
//           if (snapshot.connectionState == ConnectionState.waiting) {
//             return const Center(
//               child: CircularProgressIndicator(
//                 color: Color(0xFF0F3D3A),
//               ),
//             );
//           } else if (snapshot.hasError) {
//             return Center(
//               child: Column(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: [
//                   const Icon(Icons.wifi_off_rounded,
//                       size: 64, color: Color(0xFF0F3D3A)),
//                   const SizedBox(height: 16),
//                   const Text(
//                     'Network Error',
//                     style: TextStyle(
//                         fontSize: 18,
//                         fontWeight: FontWeight.bold,
//                         color: Color(0xFF0F3D3A)),
//                   ),
//                   const SizedBox(height: 8),
//                   Text(
//                     'Please check your connection and try again.',
//                     style: TextStyle(fontSize: 14, color: Colors.grey.shade600),
//                   ),
//                   const SizedBox(height: 20),
//                   ElevatedButton(
//                     onPressed: () => setState(() {}),
//                     style: ElevatedButton.styleFrom(
//                       backgroundColor: const Color(0xFF0F3D3A),
//                       shape: RoundedRectangleBorder(
//                           borderRadius: BorderRadius.circular(12)),
//                     ),
//                     child: const Text('Retry',
//                         style: TextStyle(color: Colors.white)),
//                   ),
//                 ],
//               ),
//             );
//           } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
//             return Center(
//               child: Column(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: [
//                   Icon(Icons.luggage_rounded,
//                       size: 80, color: Colors.grey.shade400),
//                   const SizedBox(height: 16),
//                   Text(
//                     'No Bookings Found',
//                     style: TextStyle(
//                         fontSize: 20,
//                         fontWeight: FontWeight.bold,
//                         color: Colors.grey.shade700),
//                   ),
//                   const SizedBox(height: 8),
//                   Text(
//                     'You have not made any bookings yet.',
//                     style:
//                     TextStyle(fontSize: 14, color: Colors.grey.shade500),
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
//                 return _buildBookingCard(context, booking);
//               },
//             );
//           }
//         },
//       ),
//     );
//   }
//
//   Widget _buildBookingCard(BuildContext context, BookingItem booking) {
//     final statusColor = _getStatusColor(booking.status);
//     final statusIcon = _getStatusIcon(booking.status);
//
//     return Container(
//       margin: const EdgeInsets.only(bottom: 16),
//       decoration: BoxDecoration(
//         color: Colors.white,
//         borderRadius: BorderRadius.circular(16),
//         boxShadow: [
//           BoxShadow(
//             color: Colors.black.withOpacity(0.07),
//             blurRadius: 12,
//             offset: const Offset(0, 4),
//           ),
//         ],
//       ),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           // Image Section
//           ClipRRect(
//             borderRadius:
//             const BorderRadius.vertical(top: Radius.circular(16)),
//             child: Image.network(
//               booking.photo,
//               height: 180,
//               width: double.infinity,
//               fit: BoxFit.cover,
//               errorBuilder: (context, error, stackTrace) => Container(
//                 height: 180,
//                 color: Colors.grey.shade200,
//                 child: const Center(
//                   child: Icon(Icons.broken_image_rounded,
//                       size: 50, color: Colors.grey),
//                 ),
//               ),
//               loadingBuilder: (context, child, loadingProgress) {
//                 if (loadingProgress == null) return child;
//                 return Container(
//                   height: 180,
//                   color: Colors.grey.shade100,
//                   child: const Center(
//                     child: CircularProgressIndicator(
//                       color: Color(0xFF0F3D3A),
//                       strokeWidth: 2,
//                     ),
//                   ),
//                 );
//               },
//             ),
//           ),
//
//           Padding(
//             padding: const EdgeInsets.all(16),
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 // Travel Company Name + Status Badge
//                 Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     Expanded(
//                       child: Text(
//                         booking.travelCompanyName,
//                         style: const TextStyle(
//                           fontSize: 17,
//                           fontWeight: FontWeight.bold,
//                           color: Color(0xFF1A1A2E),
//                         ),
//                       ),
//                     ),
//                     const SizedBox(width: 10),
//                     Container(
//                       padding: const EdgeInsets.symmetric(
//                           horizontal: 10, vertical: 5),
//                       decoration: BoxDecoration(
//                         color: statusColor.withOpacity(0.12),
//                         borderRadius: BorderRadius.circular(20),
//                         border: Border.all(
//                             color: statusColor.withOpacity(0.4), width: 1),
//                       ),
//                       child: Row(
//                         mainAxisSize: MainAxisSize.min,
//                         children: [
//                           Icon(statusIcon, size: 13, color: statusColor),
//                           const SizedBox(width: 4),
//                           Text(
//                             booking.status.toUpperCase(),
//                             style: TextStyle(
//                               fontSize: 11,
//                               fontWeight: FontWeight.w700,
//                               color: statusColor,
//                               letterSpacing: 0.5,
//                             ),
//                           ),
//                         ],
//                       ),
//                     ),
//                   ],
//                 ),
//
//                 const SizedBox(height: 12),
//
//                 // Package Details
//                 Text(
//                   booking.packageDetails,
//                   style: TextStyle(
//                     fontSize: 13,
//                     color: Colors.grey.shade600,
//                     height: 1.4,
//                   ),
//                   maxLines: 2,
//                   overflow: TextOverflow.ellipsis,
//                 ),
//
//                 const SizedBox(height: 14),
//                 const Divider(height: 1),
//                 const SizedBox(height: 14),
//
//                 // Info Grid
//                 Row(
//                   children: [
//                     Expanded(
//                       child: _infoTile(
//                           Icons.calendar_today_rounded,
//                           'Travel Date',
//                           booking.date),
//                     ),
//                     Expanded(
//                       child: _infoTile(
//                           Icons.book_online_rounded,
//                           'Booking Date',
//                           booking.bookingDate),
//                     ),
//                   ],
//                 ),
//                 const SizedBox(height: 12),
//                 Row(
//                   children: [
//                     Expanded(
//                       child: _infoTile(
//                           Icons.people_alt_rounded,
//                           'Travellers',
//                           '${booking.totalPerson} Person(s)'),
//                     ),
//                     Expanded(
//                       child: _infoTile(
//                           Icons.confirmation_number_rounded,
//                           'Booking ID',
//                           '#${booking.id}'),
//                     ),
//                   ],
//                 ),
//
//                 const SizedBox(height: 14),
//                 const Divider(height: 1),
//                 const SizedBox(height: 14),
//
//                 // Amount + Pay Button Row
//                 Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                   crossAxisAlignment: CrossAxisAlignment.center,
//                   children: [
//                     Column(
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: [
//                         Text(
//                           'Total Amount',
//                           style: TextStyle(
//                             fontSize: 12,
//                             color: Colors.grey.shade500,
//                           ),
//                         ),
//                         const SizedBox(height: 2),
//                         Text(
//                           '₹${booking.amount}',
//                           style: const TextStyle(
//                             fontSize: 22,
//                             fontWeight: FontWeight.bold,
//                             color: Color(0xFF0F3D3A),
//                           ),
//                         ),
//                       ],
//                     ),
//
//                     // Pay Button (only if not cancelled)
//                     if (booking.status.toLowerCase() != 'cancelled')
//                       ElevatedButton.icon(
//                         onPressed: () async {
//                           SharedPreferences sh =
//                           await SharedPreferences.getInstance();
//                           sh.setString('bid', booking.id);
//                           Navigator.push(
//                             context,
//                             MaterialPageRoute(
//                               builder: (context) => RazorpayScreen(),
//                             ),
//                           );
//                         },
//                         icon: const Icon(Icons.payment_rounded, size: 18),
//                         label: const Text(
//                           'Pay Now',
//                           style: TextStyle(
//                             fontSize: 14,
//                             fontWeight: FontWeight.w600,
//                             letterSpacing: 0.5,
//                           ),
//                         ),
//                         style: ElevatedButton.styleFrom(
//                           backgroundColor: const Color(0xFF0F3D3A),
//                           foregroundColor: Colors.white,
//                           padding: const EdgeInsets.symmetric(
//                               horizontal: 20, vertical: 12),
//                           shape: RoundedRectangleBorder(
//                             borderRadius: BorderRadius.circular(12),
//                           ),
//                           elevation: 2,
//                         ),
//                       ),
//
//                     if (booking.status.toLowerCase() == 'cancelled')
//                       Container(
//                         padding: const EdgeInsets.symmetric(
//                             horizontal: 16, vertical: 10),
//                         decoration: BoxDecoration(
//                           color: Colors.red.shade50,
//                           borderRadius: BorderRadius.circular(12),
//                           border: Border.all(color: Colors.red.shade200),
//                         ),
//                         child: Text(
//                           'Booking Cancelled',
//                           style: TextStyle(
//                             color: Colors.red.shade400,
//                             fontSize: 13,
//                             fontWeight: FontWeight.w600,
//                           ),
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
//   Widget _infoTile(IconData icon, String label, String value) {
//     return Row(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         Icon(icon, size: 16, color: const Color(0xFF2EF21D)),
//         const SizedBox(width: 6),
//         Expanded(
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               Text(
//                 label,
//                 style: TextStyle(
//                   fontSize: 11,
//                   color: Colors.grey.shade500,
//                 ),
//               ),
//               const SizedBox(height: 2),
//               Text(
//                 value,
//                 style: const TextStyle(
//                   fontSize: 13,
//                   fontWeight: FontWeight.w600,
//                   color: Color(0xFF1A1A2E),
//                 ),
//                 overflow: TextOverflow.ellipsis,
//               ),
//             ],
//           ),
//         ),
//       ],
//     );
//   }
// }
//
// class BookingItem {
//   final String id;
//   final String status;
//   final String date;
//   final String totalPerson;
//   final String photo;
//   final String amount;
//   final String packageDetails;
//   final String travelCompanyName;
//   final String bookingDate;
//
//   BookingItem({
//     required this.id,
//     required this.status,
//     required this.date,
//     required this.totalPerson,
//     required this.photo,
//     required this.amount,
//     required this.packageDetails,
//     required this.travelCompanyName,
//     required this.bookingDate,
//   });
// }

import 'dart:convert';
import 'package:final_destination/home.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  runApp(viewbooking_history());
}

class viewbooking_history extends StatelessWidget {
  const viewbooking_history({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: const Color(0xFF0F2A1D),
        fontFamily: 'Poppins',
        scaffoldBackgroundColor: const Color(0xFFE3EED4),
      ),
      home: const viewbooking_historysub(),
    );
  }
}

class viewbooking_historysub extends StatefulWidget {
  const viewbooking_historysub({Key? key}) : super(key: key);

  @override
  State<viewbooking_historysub> createState() => _viewbooking_historysubState();
}

class _viewbooking_historysubState extends State<viewbooking_historysub> {
  Future<List<Joke>> _getJokes() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String ip = prefs.getString("ip") ?? "http://localhost";
    String uid = prefs.getString('uid') ?? "";

    var response = await http.post(
      Uri.parse("$ip/user_booking_history"),
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
        "$ip${joke["photo1"].toString()}",
        "$ip${joke["photo2"].toString()}",
        "$ip${joke["photo3"].toString()}",
        joke["amount"].toString(),
        joke["package_details"].toString(),
        joke["travelcompany_name"].toString(),
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
          onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (context)=>UserHomeApp())), // Proper back navigation
        ),
        title: const Text(
          'Booking History',
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
                    Icons.history,
                    size: 80,
                    color: const Color(0xFF0F2A1D).withOpacity(0.3),
                  ),
                  const SizedBox(height: 20),
                  const Text(
                    'No booking history found',
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

                    // Photos section - horizontal scroll of three images
                    Padding(
                      padding: const EdgeInsets.all(16),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'Package Photos',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                              color: Color(0xFF0F2A1D),
                            ),
                          ),
                          const SizedBox(height: 10),
                          SizedBox(
                            height: 120,
                            child: ListView(
                              scrollDirection: Axis.horizontal,
                              children: [
                                _buildPhoto(booking.photo1),
                                const SizedBox(width: 10),
                                _buildPhoto(booking.photo2),
                                const SizedBox(width: 10),
                                _buildPhoto(booking.photo3),
                              ],
                            ),
                          ),
                        ],
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
                                  label: 'Date',
                                  value: _formatDate(booking.date),
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
                                  icon: Icons.currency_rupee,
                                  label: 'Amount',
                                  value: '₹${booking.amount}',
                                  highlight: true,
                                ),
                              ),
                              const SizedBox(width: 10),
                              Expanded(child: Container()), // For symmetry
                            ],
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
    // Return as is – you can add custom formatting if needed
    return dateStr;
  }

  Widget _buildPhoto(String url) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(12),
      child: Image.network(
        url,
        height: 120,
        width: 120,
        fit: BoxFit.cover,
        errorBuilder: (context, error, stackTrace) {
          return Container(
            height: 120,
            width: 120,
            color: Colors.grey[200],
            child: const Icon(
              Icons.image_not_supported,
              color: Colors.grey,
            ),
          );
        },
      ),
    );
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
  final String photo1;
  final String photo2;
  final String photo3;
  final String amount;
  final String package_details;
  final String travelcompany_name;

  Joke(
      this.id,
      this.status,
      this.date,
      this.total_person,
      this.photo1,
      this.photo2,
      this.photo3,
      this.amount,
      this.package_details,
      this.travelcompany_name,
      );
}