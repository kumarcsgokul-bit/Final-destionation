// import 'dart:convert';
//
// import 'package:final_destination/home.dart';
// import 'package:flutter/material.dart';
// import 'package:http/http.dart' as http;
// import 'package:shared_preferences/shared_preferences.dart';
//
// void main(){
//   runApp(viewpayment());
//
// }
// class viewpayment extends StatelessWidget {
//   const viewpayment({Key? key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(home: viewpaymentsub(),);
//   }
// }
// class viewpaymentsub extends StatefulWidget {
//   const viewpaymentsub({Key? key}) : super(key: key);
//
//   @override
//   State<viewpaymentsub> createState() => _viewpaymentsubState();
// }
//
// class _viewpaymentsubState extends State<viewpaymentsub> {
//   Future<List<Joke>> _getJokes() async {
//     SharedPreferences prefs = await SharedPreferences.getInstance();
//     String b = prefs.getString("lid").toString();
//     String foodimage="";
//     var data =
//     await http.post(Uri.parse(prefs.getString("ip").toString()+"/user_viewpayment"),
//         body: {"uid":prefs.getString('uid').toString()}
//     );
//
//     var jsonData = json.decode(data.body);
// //    print(jsonData);
//     List<Joke> jokes = [];
//     for (var joke in jsonData["message"]) {
//       print(joke);
//       Joke newJoke = Joke(
//         joke["id"].toString(),
//         joke["amount"],
//         joke["date"].toString(),
//         joke["status"].toString(),
//         joke["totalperson"].toString(),
//         joke["title"].toString(),
//         joke["packagedetails"].toString(),
//         joke["name"].toString(),
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
//                           _buildRow("amount:", i.amount.toString()),
//                           _buildRow("date:", i.date.toString()),
//                           _buildRow("status:", i.status.toString()),
//                           _buildRow("totalperson:", i.totalperson.toString()),
//                           _buildRow("title:", i.title.toString()),
//                           _buildRow("packagedetails:", i.packagedetails.toString()),
//                           _buildRow("travel company:", i.name.toString()),
//                           Row(children: [
//                             ElevatedButton(onPressed: () async {
//                               SharedPreferences sh=await SharedPreferences.getInstance();
//                               var data=await http.post(Uri.parse('${sh.getString('ip')}/cancellation'),
//                               body: {
//                                 'pid':i.id.toString()
//                               });
//                               showDialog(context: context, builder: (context)=>AlertDialog(
//                                 title: Text('Booking cancellation'),
//                                 content: Text('your amount will be credit in 7 days'),
//                                 actions: [
//                                   TextButton(onPressed: (){
//                                     Navigator.push(context, MaterialPageRoute(builder: (context)=>UserHomeApp()));
//                                   }, child: Text('ok'))
//                                 ],
//                               ));
//                             }, child: Text('Cancel booking'))
//                           ],)
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
//   final String amount;
//   final String date;
//   final String status;
//   final String totalperson;
//   final String title;
//   final String packagedetails;
//   final String name;
//
//
//
//   Joke(this.id,this.amount, this.date,this.status,this.totalperson,this.title,this.packagedetails,this.name);
// //  print("hiiiii");
// }
//


import 'dart:convert';
import 'package:final_destination/home.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  runApp(viewpayment());
}

class viewpayment extends StatelessWidget {
  const viewpayment({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: const Color(0xFF0F2A1D),
        scaffoldBackgroundColor: const Color(0xFFE3EED4),
        fontFamily: 'Poppins',
      ),
      home: viewpaymentsub(),
    );
  }
}

class viewpaymentsub extends StatefulWidget {
  const viewpaymentsub({Key? key}) : super(key: key);

  @override
  State<viewpaymentsub> createState() => _viewpaymentsubState();
}

class _viewpaymentsubState extends State<viewpaymentsub> {
  // Map to track expanded state for each payment
  Map<int, bool> _expandedStates = {};

  Future<List<Payment>> _getPayments() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var data = await http.post(
        Uri.parse(prefs.getString("ip").toString() + "/user_viewpayment"),
        body: {"uid": prefs.getString('uid').toString()}
    );

    var jsonData = json.decode(data.body);
    List<Payment> payments = [];
    if (jsonData["message"] != null) {
      for (var payment in jsonData["message"]) {
        Payment newPayment = Payment(
          payment["id"].toString(),
          payment["amount"].toString(),
          payment["date"].toString(),
          payment["status"].toString(),
          payment["totalperson"].toString(),
          payment["title"].toString(),
          payment["packagedetails"].toString(),
          payment["name"].toString(),
        );
        payments.add(newPayment);
      }
    }
    return payments;
  }

  void _toggleExpand(int index) {
    setState(() {
      _expandedStates[index] = !(_expandedStates[index] ?? false);
    });
  }

  Color _getStatusColor(String status) {
    switch(status.toLowerCase()) {
      case 'success':
      case 'completed':
      case 'paid':
        return const Color(0xFF4CAF50);
      case 'pending':
        return Colors.orange;
      case 'failed':
      case 'cancelled':
        return Colors.red;
      default:
        return const Color(0xFF0F2A1D);
    }
  }

  // void _showCancellationDialog(BuildContext context, String paymentId) async {
  //   SharedPreferences sh = await SharedPreferences.getInstance();
  //   var data = await http.post(
  //       Uri.parse('${sh.getString('ip')}/cancellation'),
  //       body: {'pid': paymentId}
  //   );
  //
  //   if (!mounted) return;
  //
  //   showDialog(
  //     context: context,
  //     builder: (context) => Dialog(
  //       shape: RoundedRectangleBorder(
  //         borderRadius: BorderRadius.circular(20),
  //       ),
  //       child: Container(
  //         padding: const EdgeInsets.all(24),
  //         decoration: BoxDecoration(
  //           gradient: const LinearGradient(
  //             colors: [Color(0xFF0F2A1D), Color(0xFF1A3F2B)],
  //             begin: Alignment.topLeft,
  //             end: Alignment.bottomRight,
  //           ),
  //           borderRadius: BorderRadius.circular(20),
  //         ),
  //         child: Column(
  //           mainAxisSize: MainAxisSize.min,
  //           children: [
  //             Container(
  //               padding: const EdgeInsets.all(16),
  //               decoration: BoxDecoration(
  //                 color: Colors.white.withOpacity(0.2),
  //                 shape: BoxShape.circle,
  //               ),
  //               child: const Icon(
  //                 Icons.info_outline,
  //                 color: Colors.white,
  //                 size: 32,
  //               ),
  //             ),
  //             const SizedBox(height: 20),
  //             const Text(
  //               'Booking Cancellation',
  //               style: TextStyle(
  //                 fontSize: 22,
  //                 fontWeight: FontWeight.w800,
  //                 color: Colors.white,
  //                 fontFamily: 'Poppins',
  //               ),
  //             ),
  //             const SizedBox(height: 12),
  //             Container(
  //               padding: const EdgeInsets.all(16),
  //               decoration: BoxDecoration(
  //                 color: Colors.white.withOpacity(0.1),
  //                 borderRadius: BorderRadius.circular(12),
  //               ),
  //               child: const Text(
  //                 'Your amount will be credited within 7 working days',
  //                 textAlign: TextAlign.center,
  //                 style: TextStyle(
  //                   fontSize: 14,
  //                   color: Colors.white,
  //                   fontFamily: 'Poppins',
  //                   height: 1.5,
  //                 ),
  //               ),
  //             ),
  //             const SizedBox(height: 24),
  //             Row(
  //               children: [
  //                 Expanded(
  //                   child: OutlinedButton(
  //                     onPressed: () {
  //                       Navigator.pop(context);
  //                     },
  //                     style: OutlinedButton.styleFrom(
  //                       side: const BorderSide(color: Colors.white),
  //                       foregroundColor: Colors.white,
  //                       padding: const EdgeInsets.symmetric(vertical: 12),
  //                       shape: RoundedRectangleBorder(
  //                         borderRadius: BorderRadius.circular(10),
  //                       ),
  //                     ),
  //                     child: const Text(
  //                       'Cancel',
  //                       style: TextStyle(
  //                         fontSize: 14,
  //                         fontWeight: FontWeight.w600,
  //                         fontFamily: 'Poppins',
  //                       ),
  //                     ),
  //                   ),
  //                 ),
  //                 const SizedBox(width: 12),
  //                 Expanded(
  //                   child: ElevatedButton(
  //                     onPressed: () {
  //                       Navigator.pop(context);
  //                       Navigator.pushReplacement(
  //                         context,
  //                         MaterialPageRoute(builder: (context) => UserHomeApp()),
  //                       );
  //                     },
  //                     style: ElevatedButton.styleFrom(
  //                       backgroundColor: Colors.white,
  //                       foregroundColor: const Color(0xFF0F2A1D),
  //                       padding: const EdgeInsets.symmetric(vertical: 12),
  //                       shape: RoundedRectangleBorder(
  //                         borderRadius: BorderRadius.circular(10),
  //                       ),
  //                     ),
  //                     child: const Text(
  //                       'OK',
  //                       style: TextStyle(
  //                         fontSize: 14,
  //                         fontWeight: FontWeight.w800,
  //                         fontFamily: 'Poppins',
  //                       ),
  //                     ),
  //                   ),
  //                 ),
  //               ],
  //             ),
  //           ],
  //         ),
  //       ),
  //     ),
  //   );
  // }
  void _showCancellationDialog(BuildContext context, String paymentId) {
    showDialog(
      context: context,
      builder: (context) => Dialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        child: Container(
          padding: const EdgeInsets.all(24),
          decoration: BoxDecoration(
            gradient: const LinearGradient(
              colors: [Color(0xFF0F2A1D), Color(0xFF1A3F2B)],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
            borderRadius: BorderRadius.circular(20),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Icon(Icons.warning_amber_rounded,
                  color: Colors.white, size: 40),
              const SizedBox(height: 20),
              const Text(
                'Confirm Cancellation',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              const SizedBox(height: 12),
              const Text(
                'Are you sure you want to cancel this booking?',
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.white),
              ),
              const SizedBox(height: 20),

              Row(
                children: [
                  // ❌ Cancel Button (Close Dialog Only)
                  Expanded(
                    child: OutlinedButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      style: OutlinedButton.styleFrom(
                        side: const BorderSide(color: Colors.white),
                      ),
                      child: const Text(
                        'No',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                  const SizedBox(width: 10),

                  // ✅ OK Button (Call API Here)
                  Expanded(
                    child: ElevatedButton(
                      onPressed: () async {
                        Navigator.pop(context);

                        SharedPreferences sh =
                        await SharedPreferences.getInstance();

                        var response = await http.post(
                          Uri.parse(
                              '${sh.getString('ip')}/cancellation'),
                          body: {'pid': paymentId},
                        );

                        if (response.statusCode == 200) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              content: Text(
                                  "Booking cancelled. Amount will be credited in 7 days."),
                            ),
                          );

                          setState(() {}); // Refresh list
                        }
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.red,
                      ),
                      child: const Text('Yes'),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFE3EED4),
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 2,
        title: Text(
          'Payment History',
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
      body: FutureBuilder<List<Payment>>(
        future: _getPayments(),
        builder: (BuildContext context, AsyncSnapshot<List<Payment>> snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CircularProgressIndicator(
                    color: const Color(0xFF0F2A1D),
                  ),
                  const SizedBox(height: 20),
                  Text(
                    "Loading payment history...",
                    style: TextStyle(
                      color: const Color(0xFF0F2A1D),
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
                  Icon(
                    Icons.error_outline,
                    size: 60,
                    color: Colors.red,
                  ),
                  const SizedBox(height: 16),
                  Text(
                    'Error loading payments',
                    style: const TextStyle(
                      fontSize: 18,
                      color: Colors.red,
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
            );
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.payment_outlined,
                    size: 100,
                    color: const Color(0xFF0F2A1D).withOpacity(0.3),
                  ),
                  const SizedBox(height: 20),
                  Text(
                    'No payments found',
                    style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w800,
                      color: Color(0xFF0F2A1D),
                      fontFamily: 'Poppins',
                    ),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    'Your payment history will appear here',
                    style: TextStyle(
                      fontSize: 14,
                      color: const Color(0xFF0F2A1D).withOpacity(0.6),
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
            );
          } else {
            return ListView.builder(
              padding: const EdgeInsets.all(16),
              itemCount: snapshot.data!.length,
              itemBuilder: (BuildContext context, int index) {
                var payment = snapshot.data![index];
                Color statusColor = _getStatusColor(payment.status);
                bool isExpanded = _expandedStates[index] ?? false;
                bool isLongDescription = payment.packagedetails.length > 150;

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
                        // Header with gradient
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
                                  Icons.payment,
                                  color: Colors.white,
                                  size: 20,
                                ),
                              ),
                              const SizedBox(width: 12),
                              Expanded(
                                child: Text(
                                  payment.title,
                                  style: const TextStyle(
                                    color: Colors.white,
                                    fontSize: 18,
                                    fontWeight: FontWeight.w800,
                                    fontFamily: 'Poppins',
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),

                        // Content
                        Padding(
                          padding: const EdgeInsets.all(16),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              // Travel Company Name Badge
                              Container(
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
                                      payment.name,
                                      style: const TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.w800,
                                        color: Color(0xFF0F2A1D),
                                        fontFamily: 'Poppins',
                                      ),
                                    ),
                                  ],
                                ),
                              ),

                              const SizedBox(height: 16),

                              // Amount with premium styling (like in viewpackage)
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
                                      payment.amount,
                                      style: const TextStyle(
                                        fontSize: 24,
                                        fontWeight: FontWeight.w900,
                                        color: Color(0xFF0F2A1D),
                                        fontFamily: 'Poppins',
                                      ),
                                    ),
                                  ],
                                ),
                              ),

                              const SizedBox(height: 20),

                              // Package Details Section - Matching viewpackage style
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
                                                ? payment.packagedetails
                                                : (isLongDescription
                                                ? '${payment.packagedetails.substring(0, 150)}...'
                                                : payment.packagedetails),
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

                              // Date and Persons Row
                              Row(
                                children: [
                                  Expanded(
                                    child: _buildInfoCard(
                                      Icons.calendar_today,
                                      'Date',
                                      payment.date,
                                    ),
                                  ),
                                  const SizedBox(width: 12),
                                  Expanded(
                                    child: _buildInfoCard(
                                      Icons.people,
                                      'Persons',
                                      payment.totalperson,
                                    ),
                                  ),
                                ],
                              ),

                              const SizedBox(height: 16),

                              // Status and Action Row
                              Row(
                                children: [
                                  // Status Badge
                                  Expanded(
                                    child: Container(
                                      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
                                      decoration: BoxDecoration(
                                        color: statusColor.withOpacity(0.1),
                                        borderRadius: BorderRadius.circular(12),
                                        border: Border.all(
                                          color: statusColor.withOpacity(0.3),
                                        ),
                                      ),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.min,
                                        children: [
                                          Icon(
                                            payment.status.toLowerCase() == 'success' ||
                                                payment.status.toLowerCase() == 'completed' ||
                                                payment.status.toLowerCase() == 'paid'
                                                ? Icons.check_circle
                                                : payment.status.toLowerCase() == 'pending'
                                                ? Icons.hourglass_empty
                                                : Icons.cancel,
                                            color: statusColor,
                                            size: 18,
                                          ),
                                          const SizedBox(width: 8),
                                          Expanded(
                                            child: Text(
                                              payment.status.toUpperCase(),
                                              style: TextStyle(
                                                color: statusColor,
                                                fontWeight: FontWeight.w800,
                                                fontSize: 12,
                                                fontFamily: 'Poppins',
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  const SizedBox(width: 12),

                                  // Cancel Booking Button
                                  Expanded(
                                    child: ElevatedButton(
                                      onPressed: () => _showCancellationDialog(context, payment.id),
                                      style: ElevatedButton.styleFrom(
                                        backgroundColor: Colors.red,
                                        foregroundColor: Colors.white,
                                        padding: const EdgeInsets.symmetric(vertical: 12),
                                        shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(12),
                                        ),
                                        elevation: 4,
                                      ),
                                      child: Row(
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        children: const [
                                          Icon(Icons.cancel, size: 16),
                                          SizedBox(width: 6),
                                          Text(
                                            'Cancel',
                                            style: TextStyle(
                                              fontSize: 12,
                                              fontWeight: FontWeight.w800,
                                              fontFamily: 'Poppins',
                                            ),
                                          ),
                                        ],
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
            );
          }
        },
      ),
    );
  }

  Widget _buildInfoCard(IconData icon, String label, String value) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: const Color(0xFFE3EED4).withOpacity(0.3),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: const Color(0xFF0F2A1D).withOpacity(0.1),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(
                icon,
                size: 14,
                color: const Color(0xFF0F2A1D).withOpacity(0.6),
              ),
              const SizedBox(width: 4),
              Text(
                label,
                style: TextStyle(
                  fontSize: 11,
                  color: const Color(0xFF0F2A1D).withOpacity(0.6),
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
          const SizedBox(height: 4),
          Text(
            value,
            style: const TextStyle(
              fontSize: 14,
              color: Color(0xFF0F2A1D),
              fontWeight: FontWeight.w800,
              fontFamily: 'Poppins',
            ),
          ),
        ],
      ),
    );
  }
}

class Payment {
  final String id;
  final String amount;
  final String date;
  final String status;
  final String totalperson;
  final String title;
  final String packagedetails;
  final String name;

  Payment(
      this.id,
      this.amount,
      this.date,
      this.status,
      this.totalperson,
      this.title,
      this.packagedetails,
      this.name,
      );
}
