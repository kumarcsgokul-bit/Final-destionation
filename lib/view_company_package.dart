// import 'dart:convert';
//
// import 'package:final_destination/sendreview.dart';
// import 'package:final_destination/viewreview.dart';
// import 'package:flutter/material.dart';
// import 'package:http/http.dart' as http;
// import 'package:shared_preferences/shared_preferences.dart';
//
// void main(){
//   runApp(view_company_package());
//
// }
// class view_company_package extends StatelessWidget {
//   const view_company_package({Key? key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(home: view_company_packagesub(),);
//   }
// }
// class view_company_packagesub extends StatefulWidget {
//   const view_company_packagesub({Key? key}) : super(key: key);
//
//   @override
//   State<view_company_packagesub> createState() => _view_company_packagesubState();
// }
//
// class _view_company_packagesubState extends State<view_company_packagesub> {
//   Future<List<Joke>> _getJokes() async {
//     SharedPreferences prefs = await SharedPreferences.getInstance();
//     String b = prefs.getString("lid").toString();
//     String foodimage="";
//     var data =
//     await http.post(Uri.parse(prefs.getString("ip").toString()+"/user_view_company_package"),
//         body: {"id":b}
//     );
//
//     var jsonData = json.decode(data.body);
// //    print(jsonData);
//     List<Joke> jokes = [];
//     for (var joke in jsonData["message"]) {
//       print(joke);
//       Joke newJoke = Joke(
//         joke["id"].toString(),
//         joke["name"],
//         joke["address"].toString(),
//         joke["phone"].toString(),
//         joke["email"].toString(),
//         prefs.getString('ip').toString()+joke["proof"].toString(),
//         prefs.getString('ip').toString()+joke["photo"].toString(),
//         joke["place"].toString(),
//         joke["latitude"].toString(),
//         joke["longitude"].toString(),
//
//
//     );
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
//                           _buildRow("name:", i.name.toString()),
//                           _buildRow("address:", i.address.toString()),
//                           _buildRow("phone:", i.phone.toString()),
//                           _buildRow("email:", i.email.toString()),
//                           Image.network(i.proof.toString(),height: 200,width: 200,),
//                           Image.network(i.photo.toString(),height: 200,width: 200,),
//                           _buildRow("place:", i.place.toString()),
//                           _buildRow("latitude:", i.latitude.toString()),
//                           _buildRow("longitude:", i.longitude.toString()),
//                           Row(children: [
//                             ElevatedButton(onPressed: () async {
//                               SharedPreferences sh=await SharedPreferences.getInstance();
//                               sh.setString('tid', i.id.toString());
//                               Navigator.push(context, MaterialPageRoute(builder: (context)=>sendreview()));
//                             }, child: Text('send review')),
//                             ElevatedButton(onPressed: () async {
//                               SharedPreferences sh=await SharedPreferences.getInstance();
//                               sh.setString('tid', i.id.toString());
//                               Navigator.push(context, MaterialPageRoute(builder: (context)=>viewreview()));
//                             }, child: Text('view review'))
//                           ],)
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
//   final String name;
//   final String address;
//   final String phone;
//   final String email;
//   final String proof ;
//   final String photo;
//   final String place;
//   final String latitude;
//   final String longitude;
//
//
//   Joke(this.id,this.name, this.address,this.phone,this.email,this.proof,this.photo,this.place,this.latitude,this.longitude);
// //  print("hiiiii");
// }


//
// import 'dart:convert';
// import 'package:final_destination/home.dart';
// import 'package:final_destination/sendreview.dart';
// import 'package:final_destination/viewreview.dart';
// import 'package:flutter/material.dart';
// import 'package:http/http.dart' as http;
// import 'package:shared_preferences/shared_preferences.dart';
//
// void main() {
//   runApp(const view_company_package());
// }
//
// class view_company_package extends StatelessWidget {
//   const view_company_package({Key? key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       theme: ThemeData(
//         primaryColor: const Color(0xFF1A237E),
//         fontFamily: 'Poppins',
//       ),
//       home: const view_company_packagesub(),
//     );
//   }
// }
//
// class view_company_packagesub extends StatefulWidget {
//   const view_company_packagesub({Key? key}) : super(key: key);
//
//   @override
//   State<view_company_packagesub> createState() => _view_company_packagesubState();
// }
//
// class _view_company_packagesubState extends State<view_company_packagesub> {
//   Future<List<Joke>> _getJokes() async {
//     SharedPreferences prefs = await SharedPreferences.getInstance();
//     String b = prefs.getString("lid").toString();
//
//     var data = await http.post(
//         Uri.parse(prefs.getString("ip").toString() + "/user_view_company_package"),
//         body: {"id": b}
//     );
//
//     var jsonData = json.decode(data.body);
//     List<Joke> jokes = [];
//
//     for (var joke in jsonData["message"]) {
//       Joke newJoke = Joke(
//         joke["id"].toString(),
//         joke["name"],
//         joke["address"].toString(),
//         joke["phone"].toString(),
//         joke["email"].toString(),
//         prefs.getString('ip').toString() + joke["proof"].toString(),
//         prefs.getString('ip').toString() + joke["photo"].toString(),
//         joke["place"].toString(),
//         joke["latitude"].toString(),
//         joke["longitude"].toString(),
//         joke["rating"].toString(),
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
//         backgroundColor: const Color(0xFF1A237E),
//         elevation: 0,
//         title: const Text(
//           'Travel Companies',
//           style: TextStyle(
//             fontSize: 20,
//             fontWeight: FontWeight.bold,
//           ),
//         ),
//         centerTitle: true,
//         leading: IconButton(
//           icon: const Icon(Icons.arrow_back),
//           onPressed: ()=>Navigator.push(context,MaterialPageRoute(builder: (context)=>user())),
//
//         ),
//       ),
//       body: Container(
//         decoration: BoxDecoration(
//           gradient: LinearGradient(
//             begin: Alignment.topCenter,
//             end: Alignment.bottomCenter,
//             colors: [
//               const Color(0xFF1A237E).withOpacity(0.1),
//               const Color(0xFF3949AB).withOpacity(0.05),
//               Colors.white,
//             ],
//           ),
//         ),
//         child: FutureBuilder(
//           future: _getJokes(),
//           builder: (BuildContext context, AsyncSnapshot snapshot) {
//             if (snapshot.connectionState == ConnectionState.waiting) {
//               return const Center(
//                 child: CircularProgressIndicator(
//                   color: Color(0xFF1A237E),
//                 ),
//               );
//             }
//
//             if (snapshot.hasError || snapshot.data == null) {
//               return Center(
//                 child: Column(
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   children: [
//                     const Icon(
//                       Icons.error_outline,
//                       size: 60,
//                       color: Colors.grey,
//                     ),
//                     const SizedBox(height: 20),
//                     const Text(
//                       'Error Loading Companies',
//                       style: TextStyle(
//                         fontSize: 18,
//                         color: Colors.grey,
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
//                   return _buildCompanyCard(i);
//                 },
//               );
//             }
//           },
//         ),
//       ),
//     );
//   }
//
//   Widget _buildCompanyCard(Joke company) {
//     return Container(
//       margin: const EdgeInsets.all(16),
//       decoration: BoxDecoration(
//         color: Colors.white,
//         borderRadius: BorderRadius.circular(15),
//         boxShadow: [
//           BoxShadow(
//             color: Colors.grey.withOpacity(0.2),
//             spreadRadius: 2,
//             blurRadius: 10,
//             offset: const Offset(0, 3),
//           ),
//         ],
//       ),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           // Company Header
//           Container(
//             height: 200,
//             decoration: BoxDecoration(
//               image: DecorationImage(
//                 image: NetworkImage(company.photo),
//                 fit: BoxFit.cover,
//               ),
//               borderRadius: const BorderRadius.only(
//                 topLeft: Radius.circular(15),
//                 topRight: Radius.circular(15),
//               ),
//             ),
//             child: Container(
//               decoration: BoxDecoration(
//                 borderRadius: const BorderRadius.only(
//                   topLeft: Radius.circular(15),
//                   topRight: Radius.circular(15),
//                 ),
//                 gradient: LinearGradient(
//                   begin: Alignment.bottomCenter,
//                   end: Alignment.topCenter,
//                   colors: [
//                     Colors.black.withOpacity(0.7),
//                     Colors.transparent,
//                   ],
//                 ),
//               ),
//               padding: const EdgeInsets.all(20),
//               alignment: Alignment.bottomLeft,
//               child: Text(
//                 company.name,
//                 style: const TextStyle(
//                   color: Colors.white,
//                   fontSize: 24,
//                   fontWeight: FontWeight.bold,
//                 ),
//               ),
//             ),
//           ),
//
//           // Company Details
//           Padding(
//             padding: const EdgeInsets.all(20),
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 // Contact Information
//                 const Text(
//                   'Contact Information',
//                   style: TextStyle(
//                     fontSize: 18,
//                     fontWeight: FontWeight.bold,
//                     color: Color(0xFF1A237E),
//                   ),
//                 ),
//                 const SizedBox(height: 10),
//
//                 _buildDetailRow(
//                   icon: Icons.location_on,
//                   label: 'Address:',
//                   value: company.address,
//                 ),
//                 const SizedBox(height: 8),
//
//                 _buildDetailRow(
//                   icon: Icons.phone,
//                   label: 'Phone:',
//                   value: company.phone,
//                 ),
//                 const SizedBox(height: 8),
//
//                 _buildDetailRow(
//                   icon: Icons.email,
//                   label: 'Email:',
//                   value: company.email,
//                 ),
//                 const SizedBox(height: 8),
//
//                 _buildDetailRow(
//                   icon: Icons.place,
//                   label: 'Place:',
//                   value: company.place,
//                 ),
//
//                 const SizedBox(height: 20),
//
//                 // Location Coordinates
//                 const Text(
//                   'Location Coordinates',
//                   style: TextStyle(
//                     fontSize: 18,
//                     fontWeight: FontWeight.bold,
//                     color: Color(0xFF1A237E),
//                   ),
//                 ),
//                 const SizedBox(height: 10),
//
//                 Row(
//                   children: [
//                     Expanded(
//                       child: Container(
//                         padding: const EdgeInsets.all(12),
//                         decoration: BoxDecoration(
//                           color: Colors.blue[50],
//                           borderRadius: BorderRadius.circular(10),
//                           border: Border.all(color: Colors.blue[100]!),
//                         ),
//                         child: Column(
//                           children: [
//                             const Icon(
//                               Icons.location_searching,
//                               size: 24,
//                               color: Color(0xFF1A237E),
//                             ),
//                             const SizedBox(height: 5),
//                             const Text(
//                               'LATITUDE',
//                               style: TextStyle(
//                                 fontSize: 12,
//                                 fontWeight: FontWeight.bold,
//                                 color: Color(0xFF1A237E),
//                               ),
//                             ),
//                             Text(
//                               company.latitude,
//                               style: const TextStyle(
//                                 fontSize: 16,
//                                 fontWeight: FontWeight.w600,
//                               ),
//                             ),
//                           ],
//                         ),
//                       ),
//                     ),
//
//                     const SizedBox(width: 10),
//
//                     Expanded(
//                       child: Container(
//                         padding: const EdgeInsets.all(12),
//                         decoration: BoxDecoration(
//                           color: Colors.blue[50],
//                           borderRadius: BorderRadius.circular(10),
//                           border: Border.all(color: Colors.blue[100]!),
//                         ),
//                         child: Column(
//                           children: [
//                             const Icon(
//                               Icons.location_searching,
//                               size: 24,
//                               color: Color(0xFF1A237E),
//                             ),
//                             const SizedBox(height: 5),
//                             const Text(
//                               'LONGITUDE',
//                               style: TextStyle(
//                                 fontSize: 12,
//                                 fontWeight: FontWeight.bold,
//                                 color: Color(0xFF1A237E),
//                               ),
//                             ),
//                             Text(
//                               company.longitude,
//                               style: const TextStyle(
//                                 fontSize: 16,
//                                 fontWeight: FontWeight.w600,
//                               ),
//                             ),
//                           ],
//                         ),
//                       ),
//                     ),
//                     Expanded(
//                       child: Container(
//                         padding: const EdgeInsets.all(12),
//                         decoration: BoxDecoration(
//                           color: Colors.blue[50],
//                           borderRadius: BorderRadius.circular(10),
//                           border: Border.all(color: Colors.blue[100]!),
//                         ),
//                         child: Column(
//                           children: [
//                             const Icon(
//                               Icons.rate_review,
//                               size: 24,
//                               color: Color(0xFF1A237E),
//                             ),
//                             const SizedBox(height: 5),
//                             const Text(
//                               'Rating',
//                               style: TextStyle(
//                                 fontSize: 12,
//                                 fontWeight: FontWeight.bold,
//                                 color: Color(0xFF1A237E),
//                               ),
//                             ),
//                             Text(
//                               company.rating,
//                               style: const TextStyle(
//                                 fontSize: 16,
//                                 fontWeight: FontWeight.w600,
//                               ),
//                             ),
//                           ],
//                         ),
//                       ),
//                     ),
//
//                   ],
//                 ),
//
//                 const SizedBox(height: 20),
//
//                 // Proof Document
//                 const Text(
//                   'Proof Document',
//                   style: TextStyle(
//                     fontSize: 18,
//                     fontWeight: FontWeight.bold,
//                     color: Color(0xFF1A237E),
//                   ),
//                 ),
//                 const SizedBox(height: 10),
//
//                 Container(
//                   height: 200,
//                   decoration: BoxDecoration(
//                     borderRadius: BorderRadius.circular(10),
//                     border: Border.all(color: Colors.grey[300]!),
//                   ),
//                   child: ClipRRect(
//                     borderRadius: BorderRadius.circular(10),
//                     child: Image.network(
//                       company.proof,
//                       fit: BoxFit.cover,
//                       loadingBuilder: (context, child, loadingProgress) {
//                         if (loadingProgress == null) return child;
//                         return Center(
//                           child: CircularProgressIndicator(
//                             value: loadingProgress.expectedTotalBytes != null
//                                 ? loadingProgress.cumulativeBytesLoaded /
//                                 loadingProgress.expectedTotalBytes!
//                                 : null,
//                           ),
//                         );
//                       },
//                       errorBuilder: (context, error, stackTrace) {
//                         return Center(
//                           child: Column(
//                             mainAxisAlignment: MainAxisAlignment.center,
//                             children: [
//                               const Icon(
//                                 Icons.document_scanner,
//                                 size: 50,
//                                 color: Colors.grey,
//                               ),
//                               const SizedBox(height: 10),
//                               const Text(
//                                 'Proof Document',
//                                 style: TextStyle(
//                                   color: Colors.grey,
//                                 ),
//                               ),
//                             ],
//                           ),
//                         );
//                       },
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//           ),
//
//           // Action Buttons
//           Container(
//             padding: const EdgeInsets.all(16),
//             decoration: BoxDecoration(
//               color: Colors.grey[50],
//               borderRadius: const BorderRadius.only(
//                 bottomLeft: Radius.circular(15),
//                 bottomRight: Radius.circular(15),
//               ),
//               border: Border(
//                 top: BorderSide(color: Colors.grey[300]!),
//               ),
//             ),
//             child: Row(
//               children: [
//                 Expanded(
//                   child: ElevatedButton.icon(
//                     onPressed: () async {
//                       SharedPreferences sh = await SharedPreferences.getInstance();
//                       sh.setString('tid', company.id.toString());
//                       Navigator.push(
//                         context,
//                         MaterialPageRoute(builder: (context) => const sendreview()),
//                       );
//                     },
//                     icon: const Icon(Icons.reviews),
//                     label: const Text('Send Review'),
//                     style: ElevatedButton.styleFrom(
//                       backgroundColor: const Color(0xFF1A237E),
//                       foregroundColor: Colors.white,
//                       padding: const EdgeInsets.symmetric(vertical: 15),
//                       shape: RoundedRectangleBorder(
//                         borderRadius: BorderRadius.circular(10),
//                       ),
//                     ),
//                   ),
//                 ),
//
//                 const SizedBox(width: 10),
//
//                 Expanded(
//                   child: ElevatedButton.icon(
//                     onPressed: () async {
//                       SharedPreferences sh = await SharedPreferences.getInstance();
//                       sh.setString('tid', company.id.toString());
//                       Navigator.push(
//                         context,
//                         MaterialPageRoute(builder: (context) => const viewreview()),
//                       );
//                     },
//                     icon: const Icon(Icons.rate_review),
//                     label: const Text('View Review'),
//                     style: ElevatedButton.styleFrom(
//                       backgroundColor: Colors.white,
//                       foregroundColor: const Color(0xFF1A237E),
//                       padding: const EdgeInsets.symmetric(vertical: 15),
//                       shape: RoundedRectangleBorder(
//                         borderRadius: BorderRadius.circular(10),
//                         side: const BorderSide(color: Color(0xFF1A237E)),
//                       ),
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         ],
//       ),
//     );
//   }
//
//   Widget _buildDetailRow({
//     required IconData icon,
//     required String label,
//     required String value,
//   }) {
//     return Row(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         Icon(
//           icon,
//           color: const Color(0xFF1A237E),
//           size: 20,
//         ),
//         const SizedBox(width: 10),
//         Expanded(
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               Text(
//                 label,
//                 style: const TextStyle(
//                   fontWeight: FontWeight.w600,
//                   color: Colors.grey,
//                 ),
//               ),
//               const SizedBox(height: 2),
//               Text(
//                 value,
//                 style: const TextStyle(
//                   color: Colors.grey,
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ],
//     );
//   }
// }
//
// class Joke {
//   final String id;
//   final String name;
//   final String address;
//   final String phone;
//   final String email;
//   final String proof;
//   final String photo;
//   final String place;
//   final String latitude;
//   final String longitude;
//   final String rating;
//
//   Joke(
//       this.id,
//       this.name,
//       this.address,
//       this.phone,
//       this.email,
//       this.proof,
//       this.photo,
//       this.place,
//       this.latitude,
//       this.longitude,
//       this.rating
//       ,
//       );
// }

//
//
// import 'dart:convert';
// import 'package:final_destination/home.dart';
// import 'package:final_destination/sendreview.dart';
// import 'package:final_destination/view_travelcompany_package.dart';
// import 'package:final_destination/viewreview.dart';
// import 'package:flutter/material.dart';
// import 'package:http/http.dart' as http;
// import 'package:shared_preferences/shared_preferences.dart';
//
// void main() {
//   runApp(const view_company_package());
// }
//
// class view_company_package extends StatelessWidget {
//   const view_company_package({Key? key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       theme: ThemeData(
//         primaryColor: const Color(0xFF1A237E),
//         fontFamily: 'Poppins',
//       ),
//       home: const view_company_packagesub(),
//     );
//   }
// }
//
// class view_company_packagesub extends StatefulWidget {
//   const view_company_packagesub({Key? key}) : super(key: key);
//
//   @override
//   State<view_company_packagesub> createState() =>
//       _view_company_packagesubState();
// }
//
// class _view_company_packagesubState extends State<view_company_packagesub> {
//
//   Future<List<Joke>> _getJokes() async {
//     SharedPreferences prefs = await SharedPreferences.getInstance();
//     String lid = prefs.getString("lid") ?? "";
//
//     var response = await http.post(
//       Uri.parse("${prefs.getString("ip")}/user_view_company_package"),
//       body: {"id": lid},
//     );
//
//     var jsonData = json.decode(response.body);
//     List<Joke> list = [];
//
//     if (jsonData["status"] == "ok") {
//       for (var item in jsonData["message"]) {
//         list.add(
//           Joke(
//             item["id"].toString(),
//             item["name"].toString(),
//             item["address"].toString(),
//             item["phone"].toString(),
//             item["email"].toString(),
//             prefs.getString("ip").toString() + item["proof"].toString(),
//             prefs.getString("ip").toString() + item["photo"].toString(),
//             item["place"].toString(),
//             item["latitude"].toString(),
//             item["longitude"].toString(),
//             item["rating"].toString(), // ⭐ average rating
//           ),
//         );
//       }
//     }
//     return list;
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: const Color(0xFF1A237E),
//         title: const Text("Travel Companies"),
//         centerTitle: true,
//         leading: IconButton(
//           icon: const Icon(Icons.arrow_back),
//           onPressed: () {
//             Navigator.push(
//               context,
//               MaterialPageRoute(builder: (context) => UserHomeApp()),
//             );
//           },
//         ),
//       ),
//       body: FutureBuilder<List<Joke>>(
//         future: _getJokes(),
//         builder: (context, snapshot) {
//           if (snapshot.connectionState == ConnectionState.waiting) {
//             return const Center(
//               child: CircularProgressIndicator(),
//             );
//           }
//           if (!snapshot.hasData || snapshot.data!.isEmpty) {
//             return const Center(
//               child: Text("No Travel Companies Found"),
//             );
//           }
//           return ListView.builder(
//             itemCount: snapshot.data!.length,
//             itemBuilder: (context, index) {
//               return _buildCompanyCard(snapshot.data![index]);
//             },
//           );
//         },
//       ),
//     );
//   }
//
//   Widget _buildCompanyCard(Joke company) {
//     return Card(
//       margin: const EdgeInsets.all(12),
//       shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
//       elevation: 5,
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//
//           // IMAGE
//           ClipRRect(
//             borderRadius: const BorderRadius.vertical(top: Radius.circular(15)),
//             child: Image.network(
//               company.photo,
//               height: 200,
//               width: double.infinity,
//               fit: BoxFit.cover,
//             ),
//           ),
//
//           Padding(
//             padding: const EdgeInsets.all(12),
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//
//                 Text(
//                   company.name,
//                   style: const TextStyle(
//                     fontSize: 22,
//                     fontWeight: FontWeight.bold,
//                   ),
//                 ),
//
//                 const SizedBox(height: 8),
//
//                 Row(
//                   children: [
//                     const Icon(Icons.star, color: Colors.amber),
//                     const SizedBox(width: 5),
//                     Text(
//                       company.rating,
//                       style: const TextStyle(
//                         fontSize: 16,
//                         fontWeight: FontWeight.bold,
//                       ),
//                     ),
//                   ],
//                 ),
//
//                 const SizedBox(height: 10),
//
//                 _infoRow(Icons.place, company.place),
//                 _infoRow(Icons.phone, company.phone),
//                 _infoRow(Icons.email, company.email),
//                 _infoRow(Icons.location_on, company.address),
//
//                 const SizedBox(height: 15),
//
//                 Row(
//                   children: [
//                     Expanded(
//                       child: ElevatedButton.icon(
//                         icon: const Icon(Icons.rate_review),
//                         label: const Text("Send Review"),
//                         onPressed: () async {
//                           SharedPreferences sh =
//                           await SharedPreferences.getInstance();
//                           sh.setString("tid", company.id);
//                           Navigator.push(
//                             context,
//                             MaterialPageRoute(
//                                 builder: (context) => const sendreview()),
//                           );
//                         },
//                         style: ElevatedButton.styleFrom(
//                           backgroundColor: const Color(0xFF1A237E),
//                         ),
//                       ),
//                     ),
//                     const SizedBox(width: 10),
//                     Expanded(
//                       child: OutlinedButton.icon(
//                         icon: const Icon(Icons.reviews),
//                         label: const Text("View Review"),
//                         onPressed: () async {
//                           SharedPreferences sh =
//                           await SharedPreferences.getInstance();
//                           sh.setString("tid", company.id);
//                           Navigator.push(
//                             context,
//                             MaterialPageRoute(
//                                 builder: (context) => const viewreview()),
//                           );
//                         },
//                       ),
//                     ),
//                     Expanded(
//                       child: OutlinedButton.icon(
//                         icon: const Icon(Icons.reviews),
//                         label: const Text("View Package"),
//                         onPressed: () async {
//                           SharedPreferences sh =
//                           await SharedPreferences.getInstance();
//                           sh.setString("tid", company.id);
//                           Navigator.push(
//                             context,
//                             MaterialPageRoute(
//                                 builder: (context) => const viewtcpackage()),
//                           );
//                         },
//                       ),
//                     ),
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
//   Widget _infoRow(IconData icon, String value) {
//     return Padding(
//       padding: const EdgeInsets.symmetric(vertical: 3),
//       child: Row(
//         children: [
//           Icon(icon, size: 18, color: Colors.grey),
//           const SizedBox(width: 8),
//           Expanded(child: Text(value)),
//         ],
//       ),
//     );
//   }
// }
//
// class Joke {
//   final String id;
//   final String name;
//   final String address;
//   final String phone;
//   final String email;
//   final String proof;
//   final String photo;
//   final String place;
//   final String latitude;
//   final String longitude;
//   final String rating;
//
//   Joke(
//       this.id,
//       this.name,
//       this.address,
//       this.phone,
//       this.email,
//       this.proof,
//       this.photo,
//       this.place,
//       this.latitude,
//       this.longitude,
//       this.rating,
//       );
// }
//


// import 'dart:convert';
// import 'package:final_destination/home.dart';
// import 'package:final_destination/sendreview.dart';
// import 'package:final_destination/view_travelcompany_package.dart';
// import 'package:final_destination/viewreview.dart';
// import 'package:flutter/material.dart';
// import 'package:http/http.dart' as http;
// import 'package:shared_preferences/shared_preferences.dart';
//
// void main() {
//   runApp(const view_company_package());
// }
//
// class view_company_package extends StatelessWidget {
//   const view_company_package({Key? key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       theme: ThemeData(
//         primaryColor: const Color(0xFF2E7D32),
//         scaffoldBackgroundColor: const Color(0xFFF7F9FC),
//         fontFamily: 'Poppins',
//       ),
//       home: const view_company_packagesub(),
//     );
//   }
// }
//
// class view_company_packagesub extends StatefulWidget {
//   const view_company_packagesub({Key? key}) : super(key: key);
//
//   @override
//   State<view_company_packagesub> createState() => _view_company_packagesubState();
// }
//
// class _view_company_packagesubState extends State<view_company_packagesub> {
//   // Map to track expanded state for location details
//   final Map<int, bool> _expandedStates = {};
//
//   Future<List<Joke>> _getJokes() async {
//     SharedPreferences prefs = await SharedPreferences.getInstance();
//     // String lid = prefs.getString("tid").toString();
//
//     var response = await http.post(
//       Uri.parse("${prefs.getString("ip")}/user_view_company_package"),
//       // body: {"id": lid},
//     );
//
//     var jsonData = json.decode(response.body);
//     List<Joke> list = [];
//
//     if (jsonData["status"] == "ok") {
//       for (var item in jsonData["message"]) {
//         list.add(
//           Joke(
//             item["id"].toString(),
//             item["name"].toString(),
//             item["address"].toString(),
//             item["phone"].toString(),
//             item["email"].toString(),
//             prefs.getString("ip").toString() + item["proof"].toString(),
//             prefs.getString("ip").toString() + item["photo"].toString(),
//             item["place"].toString(),
//             item["latitude"].toString(),
//             item["longitude"].toString(),
//             item["rating"].toString(),
//           ),
//         );
//       }
//     }
//     return list;
//   }
//
//   void _toggleExpand(int index) {
//     setState(() {
//       _expandedStates[index] = !(_expandedStates[index] ?? false);
//     });
//   }
//
//   void _showEnlargedImage(BuildContext context, String imageUrl, String label) {
//     showDialog(
//       context: context,
//       builder: (BuildContext context) {
//         return Dialog(
//           backgroundColor: Colors.transparent,
//           insetPadding: const EdgeInsets.all(20),
//           child: Stack(
//             children: [
//               Container(
//                 decoration: BoxDecoration(
//                   color: Colors.white,
//                   borderRadius: BorderRadius.circular(20),
//                   boxShadow: [
//                     BoxShadow(
//                       color: Colors.black.withOpacity(0.1),
//                       blurRadius: 20,
//                       offset: const Offset(0, 10),
//                     ),
//                   ],
//                 ),
//                 child: Column(
//                   mainAxisSize: MainAxisSize.min,
//                   children: [
//                     Container(
//                       padding: const EdgeInsets.all(16),
//                       decoration: const BoxDecoration(
//                         gradient: LinearGradient(
//                           colors: [Color(0xFF2E7D32), Color(0xFF1B5E20)],
//                           begin: Alignment.topLeft,
//                           end: Alignment.bottomRight,
//                         ),
//                         borderRadius: BorderRadius.only(
//                           topLeft: Radius.circular(20),
//                           topRight: Radius.circular(20),
//                         ),
//                       ),
//                       child: Row(
//                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                         children: [
//                           Text(
//                             label,
//                             style: const TextStyle(
//                               color: Colors.white,
//                               fontSize: 18,
//                               fontWeight: FontWeight.w600,
//                               fontFamily: 'Poppins',
//                             ),
//                           ),
//                           GestureDetector(
//                             onTap: () => Navigator.pop(context),
//                             child: Container(
//                               padding: const EdgeInsets.all(4),
//                               decoration: BoxDecoration(
//                                 color: Colors.white.withOpacity(0.2),
//                                 borderRadius: BorderRadius.circular(20),
//                               ),
//                               child: const Icon(
//                                 Icons.close,
//                                 color: Colors.white,
//                                 size: 20,
//                               ),
//                             ),
//                           ),
//                         ],
//                       ),
//                     ),
//                     ClipRRect(
//                       borderRadius: const BorderRadius.only(
//                         bottomLeft: Radius.circular(20),
//                         bottomRight: Radius.circular(20),
//                       ),
//                       child: Image.network(
//                         imageUrl,
//                         fit: BoxFit.contain,
//                         height: 400,
//                         width: double.infinity,
//                         errorBuilder: (context, error, stackTrace) {
//                           return Container(
//                             height: 400,
//                             color: const Color(0xFFF3F4F6),
//                             child: const Center(
//                               child: Icon(
//                                 Icons.broken_image,
//                                 size: 50,
//                                 color: Color(0xFF6B7280),
//                               ),
//                             ),
//                           );
//                         },
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//             ],
//           ),
//         );
//       },
//     );
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: const Color(0xFFF7F9FC),
//       appBar: AppBar(
//         backgroundColor: Colors.white,
//         elevation: 0,
//         title: const Text(
//           "Travel Companies",
//           style: TextStyle(
//             fontSize: 22,
//             fontWeight: FontWeight.w600,
//             color: Color(0xFF1F2937),
//             fontFamily: 'Poppins',
//           ),
//         ),
//         centerTitle: false,
//         leading: IconButton(
//           icon: const Icon(Icons.arrow_back_ios, color: Color(0xFF1F2937), size: 20),
//           onPressed: () {
//             Navigator.push(
//               context,
//               MaterialPageRoute(builder: (context) => UserHomeApp()),
//             );
//           },
//         ),
//       ),
//       body: FutureBuilder<List<Joke>>(
//         future: _getJokes(),
//         builder: (context, snapshot) {
//           if (snapshot.connectionState == ConnectionState.waiting) {
//             return Center(
//               child: Column(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: [
//                   const CircularProgressIndicator(
//                     color: Color(0xFF2E7D32),
//                   ),
//                   const SizedBox(height: 20),
//                   Text(
//                     "Loading companies...",
//                     style: TextStyle(
//                       color: const Color(0xFF1F2937),
//                       fontSize: 14,
//                       fontFamily: 'Poppins',
//                     ),
//                   ),
//                 ],
//               ),
//             );
//           }
//           if (!snapshot.hasData || snapshot.data!.isEmpty) {
//             return Center(
//               child: Column(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: [
//                   Icon(
//                     Icons.business_outlined,
//                     size: 80,
//                     color: const Color(0xFF2E7D32).withOpacity(0.3),
//                   ),
//                   const SizedBox(height: 20),
//                   const Text(
//                     "No Travel Companies Found",
//                     style: TextStyle(
//                       fontSize: 18,
//                       fontWeight: FontWeight.w600,
//                       color: Color(0xFF1F2937),
//                       fontFamily: 'Poppins',
//                     ),
//                   ),
//                 ],
//               ),
//             );
//           }
//           return ListView.builder(
//             padding: const EdgeInsets.all(16),
//             itemCount: snapshot.data!.length,
//             itemBuilder: (context, index) {
//               return _buildCompanyCard(snapshot.data![index], index);
//             },
//           );
//         },
//       ),
//     );
//   }
//
//   Widget _buildCompanyCard(Joke company, int index) {
//     final isExpanded = _expandedStates[index] ?? false;
//
//     return Container(
//       margin: const EdgeInsets.only(bottom: 16),
//       child: Card(
//         elevation: 2,
//         shape: RoundedRectangleBorder(
//           borderRadius: BorderRadius.circular(20),
//         ),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             // Hero Header with Company Image
//             Stack(
//               children: [
//                 ClipRRect(
//                   borderRadius: const BorderRadius.only(
//                     topLeft: Radius.circular(20),
//                     topRight: Radius.circular(20),
//                   ),
//                   child: Image.network(
//                     company.photo,
//                     height: 200,
//                     width: double.infinity,
//                     fit: BoxFit.cover,
//                     errorBuilder: (context, error, stackTrace) {
//                       return Container(
//                         height: 200,
//                         color: const Color(0xFF2E7D32).withOpacity(0.1),
//                         child: const Center(
//                           child: Icon(
//                             Icons.business,
//                             size: 50,
//                             color: Color(0xFF2E7D32),
//                           ),
//                         ),
//                       );
//                     },
//                   ),
//                 ),
//                 // Gradient overlay
//                 Positioned.fill(
//                   child: Container(
//                     decoration: BoxDecoration(
//                       borderRadius: const BorderRadius.only(
//                         topLeft: Radius.circular(20),
//                         topRight: Radius.circular(20),
//                       ),
//                       gradient: LinearGradient(
//                         begin: Alignment.topCenter,
//                         end: Alignment.bottomCenter,
//                         colors: [
//                           Colors.transparent,
//                           Colors.black.withOpacity(0.7),
//                         ],
//                       ),
//                     ),
//                   ),
//                 ),
//                 // Company name and rating overlay
//                 Positioned(
//                   bottom: 16,
//                   left: 16,
//                   right: 16,
//                   child: Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       Text(
//                         company.name,
//                         style: const TextStyle(
//                           color: Colors.white,
//                           fontSize: 24,
//                           fontWeight: FontWeight.w700,
//                           fontFamily: 'Poppins',
//                         ),
//                       ),
//                       const SizedBox(height: 4),
//                       Row(
//                         children: [
//                           Container(
//                             padding: const EdgeInsets.symmetric(
//                               horizontal: 8,
//                               vertical: 4,
//                             ),
//                             decoration: BoxDecoration(
//                               color: Colors.amber,
//                               borderRadius: BorderRadius.circular(12),
//                             ),
//                             child: Row(
//                               mainAxisSize: MainAxisSize.min,
//                               children: [
//                                 const Icon(
//                                   Icons.star,
//                                   color: Colors.white,
//                                   size: 14,
//                                 ),
//                                 const SizedBox(width: 4),
//                                 Text(
//                                   company.rating,
//                                   style: const TextStyle(
//                                     color: Colors.white,
//                                     fontSize: 12,
//                                     fontWeight: FontWeight.w600,
//                                     fontFamily: 'Poppins',
//                                   ),
//                                 ),
//                               ],
//                             ),
//                           ),
//                         ],
//                       ),
//                     ],
//                   ),
//                 ),
//               ],
//             ),
//
//             Padding(
//               padding: const EdgeInsets.all(16),
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   // Quick Info Chips
//                   Row(
//                     children: [
//                       Expanded(
//                         child: _buildInfoChip(
//                           icon: Icons.place,
//                           label: 'Location',
//                           value: company.place,
//                         ),
//                       ),
//                       const SizedBox(width: 8),
//                       Expanded(
//                         child: _buildInfoChip(
//                           icon: Icons.phone,
//                           label: 'Phone',
//                           value: company.phone,
//                         ),
//                       ),
//                     ],
//                   ),
//
//                   const SizedBox(height: 12),
//
//                   // Email Chip
//                   Container(
//                     width: double.infinity,
//                     padding: const EdgeInsets.all(12),
//                     decoration: BoxDecoration(
//                       color: const Color(0xFFF3F4F6),
//                       borderRadius: BorderRadius.circular(12),
//                     ),
//                     child: Row(
//                       children: [
//                         Container(
//                           padding: const EdgeInsets.all(8),
//                           decoration: BoxDecoration(
//                             color: Colors.white,
//                             borderRadius: BorderRadius.circular(10),
//                           ),
//                           child: const Icon(
//                             Icons.email,
//                             color: Color(0xFF2E7D32),
//                             size: 18,
//                           ),
//                         ),
//                         const SizedBox(width: 12),
//                         Expanded(
//                           child: Column(
//                             crossAxisAlignment: CrossAxisAlignment.start,
//                             children: [
//                               const Text(
//                                 'Email',
//                                 style: TextStyle(
//                                   fontSize: 11,
//                                   color: Color(0xFF6B7280),
//                                   fontFamily: 'Poppins',
//                                 ),
//                               ),
//                               Text(
//                                 company.email,
//                                 style: const TextStyle(
//                                   fontSize: 13,
//                                   fontWeight: FontWeight.w500,
//                                   color: Color(0xFF1F2937),
//                                   fontFamily: 'Poppins',
//                                 ),
//                                 maxLines: 1,
//                                 overflow: TextOverflow.ellipsis,
//                               ),
//                             ],
//                           ),
//                         ),
//                       ],
//                     ),
//                   ),
//
//                   const SizedBox(height: 12),
//
//                   // Address Card
//                   Container(
//                     width: double.infinity,
//                     padding: const EdgeInsets.all(12),
//                     decoration: BoxDecoration(
//                       color: const Color(0xFFF3F4F6),
//                       borderRadius: BorderRadius.circular(12),
//                     ),
//                     child: Row(
//                       children: [
//                         Container(
//                           padding: const EdgeInsets.all(8),
//                           decoration: BoxDecoration(
//                             color: Colors.white,
//                             borderRadius: BorderRadius.circular(10),
//                           ),
//                           child: const Icon(
//                             Icons.location_on,
//                             color: Color(0xFF2E7D32),
//                             size: 18,
//                           ),
//                         ),
//                         const SizedBox(width: 12),
//                         Expanded(
//                           child: Column(
//                             crossAxisAlignment: CrossAxisAlignment.start,
//                             children: [
//                               const Text(
//                                 'Address',
//                                 style: TextStyle(
//                                   fontSize: 11,
//                                   color: Color(0xFF6B7280),
//                                   fontFamily: 'Poppins',
//                                 ),
//                               ),
//                               Text(
//                                 company.address,
//                                 style: const TextStyle(
//                                   fontSize: 13,
//                                   fontWeight: FontWeight.w500,
//                                   color: Color(0xFF1F2937),
//                                   fontFamily: 'Poppins',
//                                 ),
//                               ),
//                             ],
//                           ),
//                         ),
//                       ],
//                     ),
//                   ),
//
//                   const SizedBox(height: 12),
//
//                   // Expandable Location Details
//                   GestureDetector(
//                     onTap: () => _toggleExpand(index),
//                     child: Container(
//                       width: double.infinity,
//                       padding: const EdgeInsets.all(12),
//                       decoration: BoxDecoration(
//                         color: Colors.white,
//                         borderRadius: BorderRadius.circular(12),
//                         border: Border.all(
//                           color: const Color(0xFFE5E7EB),
//                         ),
//                       ),
//                       child: Column(
//                         children: [
//                           Row(
//                             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                             children: [
//                               Row(
//                                 children: [
//                                   const Icon(
//                                     Icons.pin_drop,
//                                     color: Color(0xFF2E7D32),
//                                     size: 18,
//                                   ),
//                                   const SizedBox(width: 8),
//                                   const Text(
//                                     'Location Details',
//                                     style: TextStyle(
//                                       fontSize: 14,
//                                       fontWeight: FontWeight.w600,
//                                       color: Color(0xFF1F2937),
//                                       fontFamily: 'Poppins',
//                                     ),
//                                   ),
//                                 ],
//                               ),
//                               Icon(
//                                 isExpanded ? Icons.expand_less : Icons.expand_more,
//                                 color: const Color(0xFF2E7D32),
//                                 size: 20,
//                               ),
//                             ],
//                           ),
//                           if (isExpanded) ...[
//                             const SizedBox(height: 12),
//                             const Divider(height: 1),
//                             const SizedBox(height: 12),
//                             _buildLocationRow('Latitude', company.latitude),
//                             const SizedBox(height: 8),
//                             _buildLocationRow('Longitude', company.longitude),
//                           ],
//                         ],
//                       ),
//                     ),
//                   ),
//
//                   const SizedBox(height: 20),
//
//                   // Documents Section
//                   const Text(
//                     'Documents',
//                     style: TextStyle(
//                       fontSize: 16,
//                       fontWeight: FontWeight.w600,
//                       color: Color(0xFF1F2937),
//                       fontFamily: 'Poppins',
//                     ),
//                   ),
//
//                   const SizedBox(height: 12),
//
//                   // Two Photos Side by Side
//                   Row(
//                     children: [
//                       Expanded(
//                         child: _buildDocumentImage(
//                           company.proof,
//                           'Proof',
//                           context,
//                         ),
//                       ),
//                       const SizedBox(width: 12),
//                       Expanded(
//                         child: _buildDocumentImage(
//                           company.photo,
//                           'Photo',
//                           context,
//                         ),
//                       ),
//                     ],
//                   ),
//
//                   const SizedBox(height: 20),
//
//                   // Action Buttons - Three in a Row
//                   Row(
//                     children: [
//                       Expanded(
//                         child: ElevatedButton.icon(
//                           icon: const Icon(Icons.rate_review, size: 16),
//                           label: const Text(
//                             "Send",
//                             style: TextStyle(
//                               fontSize: 11,
//                               fontWeight: FontWeight.w600,
//                               fontFamily: 'Poppins',
//                             ),
//                           ),
//                           onPressed: () async {
//                             SharedPreferences sh =
//                             await SharedPreferences.getInstance();
//                             sh.setString("tid", company.id);
//                             if (!mounted) return;
//                             Navigator.push(
//                               context,
//                               MaterialPageRoute(
//                                   builder: (context) => const sendreview()),
//                             );
//                           },
//                           style: ElevatedButton.styleFrom(
//                             backgroundColor: const Color(0xFF2E7D32),
//                             foregroundColor: Colors.white,
//                             padding: const EdgeInsets.symmetric(vertical: 12),
//                             shape: RoundedRectangleBorder(
//                               borderRadius: BorderRadius.circular(10),
//                             ),
//                           ),
//                         ),
//                       ),
//                       const SizedBox(width: 6),
//                       Expanded(
//                         child: OutlinedButton.icon(
//                           icon: const Icon(Icons.reviews, size: 16),
//                           label: const Text(
//                             "Reviews",
//                             style: TextStyle(
//                               fontSize: 11,
//                               fontWeight: FontWeight.w600,
//                               fontFamily: 'Poppins',
//                             ),
//                           ),
//                           onPressed: () async {
//                             SharedPreferences sh =
//                             await SharedPreferences.getInstance();
//                             sh.setString("tid", company.id);
//                             if (!mounted) return;
//                             Navigator.push(
//                               context,
//                               MaterialPageRoute(
//                                   builder: (context) => const viewreview()),
//                             );
//                           },
//                           style: OutlinedButton.styleFrom(
//                             side: const BorderSide(color: Color(0xFF2E7D32), width: 1.5),
//                             foregroundColor: const Color(0xFF2E7D32),
//                             padding: const EdgeInsets.symmetric(vertical: 12),
//                             shape: RoundedRectangleBorder(
//                               borderRadius: BorderRadius.circular(10),
//                             ),
//                           ),
//                         ),
//                       ),
//                       const SizedBox(width: 6),
//                       Expanded(
//                         child: OutlinedButton.icon(
//                           icon: const Icon(Icons.card_travel, size: 16),
//                           label: const Text(
//                             "Packages",
//                             style: TextStyle(
//                               fontSize: 11,
//                               fontWeight: FontWeight.w600,
//                               fontFamily: 'Poppins',
//                             ),
//                           ),
//                           onPressed: () async {
//                             SharedPreferences sh =
//                             await SharedPreferences.getInstance();
//                             sh.setString("tid", company.id);
//                             if (!mounted) return;
//                             Navigator.push(
//                               context,
//                               MaterialPageRoute(
//                                   builder: (context) => const viewtcpackage()),
//                             );
//                           },
//                           style: OutlinedButton.styleFrom(
//                             side: const BorderSide(color: Color(0xFF2E7D32), width: 1.5),
//                             foregroundColor: const Color(0xFF2E7D32),
//                             padding: const EdgeInsets.symmetric(vertical: 12),
//                             shape: RoundedRectangleBorder(
//                               borderRadius: BorderRadius.circular(10),
//                             ),
//                           ),
//                         ),
//                       ),
//                     ],
//                   ),
//                 ],
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
//
//   Widget _buildInfoChip({required IconData icon, required String label, required String value}) {
//     return Container(
//       padding: const EdgeInsets.all(10),
//       decoration: BoxDecoration(
//         color: const Color(0xFFF3F4F6),
//         borderRadius: BorderRadius.circular(10),
//       ),
//       child: Row(
//         children: [
//           Icon(
//             icon,
//             size: 16,
//             color: const Color(0xFF2E7D32),
//           ),
//           const SizedBox(width: 6),
//           Expanded(
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 Text(
//                   label,
//                   style: const TextStyle(
//                     fontSize: 10,
//                     color: Color(0xFF6B7280),
//                     fontFamily: 'Poppins',
//                   ),
//                 ),
//                 Text(
//                   value,
//                   style: const TextStyle(
//                     fontSize: 12,
//                     fontWeight: FontWeight.w600,
//                     color: Color(0xFF1F2937),
//                     fontFamily: 'Poppins',
//                   ),
//                   maxLines: 1,
//                   overflow: TextOverflow.ellipsis,
//                 ),
//               ],
//             ),
//           ),
//         ],
//       ),
//     );
//   }
//
//   Widget _buildLocationRow(String label, String value) {
//     return Row(
//       children: [
//         SizedBox(
//           width: 70,
//           child: Text(
//             label,
//             style: const TextStyle(
//               fontSize: 12,
//               color: Color(0xFF6B7280),
//               fontFamily: 'Poppins',
//             ),
//           ),
//         ),
//         const Text(
//           ':',
//           style: TextStyle(
//             color: Color(0xFF6B7280),
//             fontSize: 12,
//           ),
//         ),
//         const SizedBox(width: 8),
//         Expanded(
//           child: Text(
//             value,
//             style: const TextStyle(
//               fontSize: 12,
//               fontWeight: FontWeight.w500,
//               color: Color(0xFF1F2937),
//               fontFamily: 'Poppins',
//             ),
//           ),
//         ),
//       ],
//     );
//   }
//
//   Widget _buildDocumentImage(String imageUrl, String label, BuildContext context) {
//     return GestureDetector(
//       onTap: () => _showEnlargedImage(context, imageUrl, label),
//       child: Container(
//         height: 100,
//         decoration: BoxDecoration(
//           borderRadius: BorderRadius.circular(12),
//           boxShadow: [
//             BoxShadow(
//               color: Colors.black.withOpacity(0.05),
//               blurRadius: 8,
//               offset: const Offset(0, 2),
//             ),
//           ],
//         ),
//         child: Stack(
//           children: [
//             ClipRRect(
//               borderRadius: BorderRadius.circular(12),
//               child: Image.network(
//                 imageUrl,
//                 fit: BoxFit.cover,
//                 width: double.infinity,
//                 height: double.infinity,
//                 loadingBuilder: (BuildContext context, Widget child, ImageChunkEvent? loadingProgress) {
//                   if (loadingProgress == null) return child;
//                   return Container(
//                     color: const Color(0xFFF3F4F6),
//                     child: const Center(
//                       child: CircularProgressIndicator(
//                         color: Color(0xFF2E7D32),
//                       ),
//                     ),
//                   );
//                 },
//                 errorBuilder: (BuildContext context, Object error, StackTrace? stackTrace) {
//                   return Container(
//                     color: const Color(0xFFF3F4F6),
//                     child: Center(
//                       child: Column(
//                         mainAxisAlignment: MainAxisAlignment.center,
//                         children: [
//                           Icon(
//                             Icons.broken_image,
//                             size: 30,
//                             color: const Color(0xFF6B7280).withOpacity(0.5),
//                           ),
//                           const SizedBox(height: 4),
//                           Text(
//                             label,
//                             style: const TextStyle(
//                               fontSize: 10,
//                               color: Color(0xFF6B7280),
//                               fontFamily: 'Poppins',
//                             ),
//                           ),
//                         ],
//                       ),
//                     ),
//                   );
//                 },
//               ),
//             ),
//             // Zoom icon overlay
//             Positioned(
//               bottom: 6,
//               right: 6,
//               child: Container(
//                 padding: const EdgeInsets.all(4),
//                 decoration: BoxDecoration(
//                   color: const Color(0xFF2E7D32).withOpacity(0.8),
//                   borderRadius: BorderRadius.circular(8),
//                 ),
//                 child: const Icon(
//                   Icons.zoom_in,
//                   color: Colors.white,
//                   size: 14,
//                 ),
//               ),
//             ),
//             // Label overlay
//             Positioned(
//               top: 6,
//               left: 6,
//               child: Container(
//                 padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
//                 decoration: BoxDecoration(
//                   color: Colors.black.withOpacity(0.6),
//                   borderRadius: BorderRadius.circular(4),
//                 ),
//                 child: Text(
//                   label,
//                   style: const TextStyle(
//                     color: Colors.white,
//                     fontSize: 8,
//                     fontWeight: FontWeight.w500,
//                     fontFamily: 'Poppins',
//                   ),
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
//   final String name;
//   final String address;
//   final String phone;
//   final String email;
//   final String proof;
//   final String photo;
//   final String place;
//   final String latitude;
//   final String longitude;
//   final String rating;
//
//   const Joke(
//       this.id,
//       this.name,
//       this.address,
//       this.phone,
//       this.email,
//       this.proof,
//       this.photo,
//       this.place,
//       this.latitude,
//       this.longitude,
//       this.rating,
//       );
// }

import 'dart:convert';
import 'package:final_destination/home.dart';
import 'package:final_destination/sendreview.dart';
import 'package:final_destination/view_travelcompany_package.dart';
import 'package:final_destination/viewreview.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:url_launcher/url_launcher.dart';

void main() {
  runApp(const view_company_package());
}

class view_company_package extends StatelessWidget {
  const view_company_package({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: const Color(0xFF2E7D32),
        scaffoldBackgroundColor: const Color(0xFFF7F9FC),
        fontFamily: 'Poppins',
      ),
      home: const view_company_packagesub(),
    );
  }
}

class view_company_packagesub extends StatefulWidget {
  const view_company_packagesub({Key? key}) : super(key: key);

  @override
  State<view_company_packagesub> createState() => _view_company_packagesubState();
}

class _view_company_packagesubState extends State<view_company_packagesub> {
  final Map<int, bool> _expandedStates = {};

  Future<List<Joke>> _getJokes() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    var response = await http.post(
      Uri.parse("${prefs.getString("ip")}/user_view_company_package"),
      body: {
        'tid':prefs.getString('tid').toString()
    }
    );

    var jsonData = json.decode(response.body);
    List<Joke> list = [];

    if (jsonData["status"] == "ok") {
      for (var item in jsonData["message"]) {
        list.add(
          Joke(
            item["id"].toString(),
            item["name"].toString(),
            item["address"].toString(),
            item["phone"].toString(),
            item["email"].toString(),
            prefs.getString("ip").toString() + item["proof"].toString(),
            prefs.getString("ip").toString() + item["photo"].toString(),
            item["place"].toString(),
            item["latitude"].toString(),
            item["longitude"].toString(),
            item["rating"].toString(),
          ),
        );
      }
    }
    return list;
  }

  void _toggleExpand(int index) {
    setState(() {
      _expandedStates[index] = !(_expandedStates[index] ?? false);
    });
  }

  // Opens Google Maps app/browser at the given coordinates
  Future<void> _openInMaps(String latitude, String longitude) async {
    final Uri uri = Uri.parse(
      'https://www.google.com/maps/search/?api=1&query=$latitude,$longitude',
    );
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri, mode: LaunchMode.externalApplication);
    }
  }

  // Shows a stylised map-preview dialog (no extra packages needed)
  void _showMapDialog(
      BuildContext context,
      String latitude,
      String longitude,
      String companyName,
      ) {
    final double? lat = double.tryParse(latitude);
    final double? lng = double.tryParse(longitude);
    if (lat == null || lng == null) return;

    showDialog(
      context: context,
      builder: (BuildContext ctx) {
        return Dialog(
          backgroundColor: Colors.transparent,
          insetPadding: const EdgeInsets.all(16),
          child: Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(20),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.15),
                  blurRadius: 24,
                  offset: const Offset(0, 8),
                ),
              ],
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                // ── Header ──────────────────────────────────────────────
                Container(
                  padding:
                  const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
                  decoration: const BoxDecoration(
                    gradient: LinearGradient(
                      colors: [Color(0xFF2E7D32), Color(0xFF1B5E20)],
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                    ),
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(20),
                      topRight: Radius.circular(20),
                    ),
                  ),
                  child: Row(
                    children: [
                      const Icon(Icons.map_outlined,
                          color: Colors.white, size: 20),
                      const SizedBox(width: 10),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              companyName,
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                                fontFamily: 'Poppins',
                              ),
                            ),
                            Text(
                              '${lat.toStringAsFixed(6)},  ${lng.toStringAsFixed(6)}',
                              style: TextStyle(
                                color: Colors.white.withOpacity(0.8),
                                fontSize: 11,
                                fontFamily: 'Poppins',
                              ),
                            ),
                          ],
                        ),
                      ),
                      GestureDetector(
                        onTap: () => Navigator.pop(ctx),
                        child: Container(
                          padding: const EdgeInsets.all(6),
                          decoration: BoxDecoration(
                            color: Colors.white.withOpacity(0.2),
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: const Icon(Icons.close,
                              color: Colors.white, size: 18),
                        ),
                      ),
                    ],
                  ),
                ),

                // ── Map preview (CustomPaint — zero dependencies) ────────
                Container(
                  height: 220,
                  width: double.infinity,
                  decoration: const BoxDecoration(
                    color: Color(0xFFE8F5E9),
                  ),
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      // Grid / road background
                      ClipRect(
                        child: CustomPaint(
                          size: const Size(double.infinity, 220),
                          painter: _MapGridPainter(),
                        ),
                      ),

                      // Centre pin
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            width: 52,
                            height: 52,
                            decoration: BoxDecoration(
                              color: const Color(0xFF2E7D32),
                              shape: BoxShape.circle,
                              border:
                              Border.all(color: Colors.white, width: 3),
                              boxShadow: [
                                BoxShadow(
                                  color: const Color(0xFF2E7D32)
                                      .withOpacity(0.4),
                                  blurRadius: 12,
                                  offset: const Offset(0, 4),
                                ),
                              ],
                            ),
                            child: const Icon(
                              Icons.business,
                              color: Colors.white,
                              size: 26,
                            ),
                          ),
                          CustomPaint(
                            size: const Size(14, 10),
                            painter: _PinTailPainter(
                                color: const Color(0xFF2E7D32)),
                          ),
                          const SizedBox(height: 6),
                          Container(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 10, vertical: 4),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(8),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black.withOpacity(0.1),
                                  blurRadius: 6,
                                ),
                              ],
                            ),
                            child: Text(
                              companyName,
                              style: const TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.w600,
                                color: Color(0xFF1F2937),
                                fontFamily: 'Poppins',
                              ),
                            ),
                          ),
                        ],
                      ),

                      // Coordinates pill — bottom left
                      Positioned(
                        bottom: 10,
                        left: 10,
                        child: Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 8, vertical: 4),
                          decoration: BoxDecoration(
                            color: Colors.white.withOpacity(0.95),
                            borderRadius: BorderRadius.circular(8),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withOpacity(0.08),
                                blurRadius: 4,
                              ),
                            ],
                          ),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              const Icon(Icons.pin_drop,
                                  size: 12, color: Color(0xFF2E7D32)),
                              const SizedBox(width: 4),
                              Text(
                                '${lat.toStringAsFixed(5)}, '
                                    '${lng.toStringAsFixed(5)}',
                                style: const TextStyle(
                                  fontSize: 10,
                                  fontFamily: 'Poppins',
                                  fontWeight: FontWeight.w500,
                                  color: Color(0xFF374151),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),

                      // Hint badge — top right
                      Positioned(
                        top: 10,
                        right: 10,
                        child: Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 8, vertical: 4),
                          decoration: BoxDecoration(
                            color: Colors.white.withOpacity(0.95),
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: const Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Icon(Icons.touch_app,
                                  size: 12, color: Color(0xFF6B7280)),
                              SizedBox(width: 4),
                              Text(
                                'Tap below to open',
                                style: TextStyle(
                                  fontSize: 10,
                                  color: Color(0xFF6B7280),
                                  fontFamily: 'Poppins',
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),

                // ── Footer — Open in Google Maps button ──────────────────
                Container(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 16, vertical: 12),
                  decoration: const BoxDecoration(
                    color: Color(0xFFF9FAFB),
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(20),
                      bottomRight: Radius.circular(20),
                    ),
                    border:
                    Border(top: BorderSide(color: Color(0xFFE5E7EB))),
                  ),
                  child: GestureDetector(
                    onTap: () {
                      Navigator.pop(ctx);
                      _openInMaps(latitude, longitude);
                    },
                    child: Container(
                      width: double.infinity,
                      padding: const EdgeInsets.symmetric(vertical: 12),
                      decoration: BoxDecoration(
                        gradient: const LinearGradient(
                          colors: [Color(0xFF2E7D32), Color(0xFF1B5E20)],
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                        ),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: const Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(Icons.open_in_new,
                              size: 16, color: Colors.white),
                          SizedBox(width: 8),
                          Text(
                            'Open in Google Maps',
                            style: TextStyle(
                              fontSize: 13,
                              color: Colors.white,
                              fontWeight: FontWeight.w600,
                              fontFamily: 'Poppins',
                            ),
                          ),
                        ],
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
  }

  void _showEnlargedImage(
      BuildContext context, String imageUrl, String label) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return Dialog(
          backgroundColor: Colors.transparent,
          insetPadding: const EdgeInsets.all(20),
          child: Stack(
            children: [
              Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.1),
                      blurRadius: 20,
                      offset: const Offset(0, 10),
                    ),
                  ],
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Container(
                      padding: const EdgeInsets.all(16),
                      decoration: const BoxDecoration(
                        gradient: LinearGradient(
                          colors: [Color(0xFF2E7D32), Color(0xFF1B5E20)],
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                        ),
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(20),
                          topRight: Radius.circular(20),
                        ),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            label,
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 18,
                              fontWeight: FontWeight.w600,
                              fontFamily: 'Poppins',
                            ),
                          ),
                          GestureDetector(
                            onTap: () => Navigator.pop(context),
                            child: Container(
                              padding: const EdgeInsets.all(4),
                              decoration: BoxDecoration(
                                color: Colors.white.withOpacity(0.2),
                                borderRadius: BorderRadius.circular(20),
                              ),
                              child: const Icon(
                                Icons.close,
                                color: Colors.white,
                                size: 20,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    ClipRRect(
                      borderRadius: const BorderRadius.only(
                        bottomLeft: Radius.circular(20),
                        bottomRight: Radius.circular(20),
                      ),
                      child: Image.network(
                        imageUrl,
                        fit: BoxFit.contain,
                        height: 400,
                        width: double.infinity,
                        errorBuilder: (context, error, stackTrace) {
                          return Container(
                            height: 400,
                            color: const Color(0xFFF3F4F6),
                            child: const Center(
                              child: Icon(
                                Icons.broken_image,
                                size: 50,
                                color: Color(0xFF6B7280),
                              ),
                            ),
                          );
                        },
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
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF7F9FC),
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: const Text(
          "Travel Companies",
          style: TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.w600,
            color: Color(0xFF1F2937),
            fontFamily: 'Poppins',
          ),
        ),
        centerTitle: false,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios,
              color: Color(0xFF1F2937), size: 20),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => UserHomeApp()),
            );
          },
        ),
      ),
      body: FutureBuilder<List<Joke>>(
        future: _getJokes(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const CircularProgressIndicator(
                    color: Color(0xFF2E7D32),
                  ),
                  const SizedBox(height: 20),
                  Text(
                    "Loading companies...",
                    style: TextStyle(
                      color: const Color(0xFF1F2937),
                      fontSize: 14,
                      fontFamily: 'Poppins',
                    ),
                  ),
                ],
              ),
            );
          }
          if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.business_outlined,
                    size: 80,
                    color: const Color(0xFF2E7D32).withOpacity(0.3),
                  ),
                  const SizedBox(height: 20),
                  const Text(
                    "No Travel Companies Found",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                      color: Color(0xFF1F2937),
                      fontFamily: 'Poppins',
                    ),
                  ),
                ],
              ),
            );
          }
          return ListView.builder(
            padding: const EdgeInsets.all(16),
            itemCount: snapshot.data!.length,
            itemBuilder: (context, index) {
              return _buildCompanyCard(snapshot.data![index], index);
            },
          );
        },
      ),
    );
  }

  Widget _buildCompanyCard(Joke company, int index) {
    final isExpanded = _expandedStates[index] ?? false;
    final double? lat = double.tryParse(company.latitude);
    final double? lng = double.tryParse(company.longitude);
    final bool hasLocation = lat != null && lng != null;

    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      child: Card(
        elevation: 2,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Hero Header with Company Image
            Stack(
              children: [
                ClipRRect(
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20),
                  ),
                  child: Image.network(
                    company.photo,
                    height: 200,
                    width: double.infinity,
                    fit: BoxFit.cover,
                    errorBuilder: (context, error, stackTrace) {
                      return Container(
                        height: 200,
                        color: const Color(0xFF2E7D32).withOpacity(0.1),
                        child: const Center(
                          child: Icon(
                            Icons.business,
                            size: 50,
                            color: Color(0xFF2E7D32),
                          ),
                        ),
                      );
                    },
                  ),
                ),
                // Gradient overlay
                Positioned.fill(
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(20),
                        topRight: Radius.circular(20),
                      ),
                      gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [
                          Colors.transparent,
                          Colors.black.withOpacity(0.7),
                        ],
                      ),
                    ),
                  ),
                ),
                // Company name and rating overlay
                Positioned(
                  bottom: 16,
                  left: 16,
                  right: 16,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        company.name,
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 24,
                          fontWeight: FontWeight.w700,
                          fontFamily: 'Poppins',
                        ),
                      ),
                      const SizedBox(height: 4),
                      Row(
                        children: [
                          Container(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 8,
                              vertical: 4,
                            ),
                            decoration: BoxDecoration(
                              color: Colors.amber,
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                const Icon(
                                  Icons.star,
                                  color: Colors.white,
                                  size: 14,
                                ),
                                const SizedBox(width: 4),
                                Text(
                                  company.rating,
                                  style: const TextStyle(
                                    color: Colors.white,
                                    fontSize: 12,
                                    fontWeight: FontWeight.w600,
                                    fontFamily: 'Poppins',
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),

            Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Quick Info Chips
                  Row(
                    children: [
                      Expanded(
                        child: _buildInfoChip(
                          icon: Icons.place,
                          label: 'Location',
                          value: company.place,
                        ),
                      ),
                      const SizedBox(width: 8),
                      Expanded(
                        child: _buildInfoChip(
                          icon: Icons.phone,
                          label: 'Phone',
                          value: company.phone,
                        ),
                      ),
                    ],
                  ),

                  const SizedBox(height: 12),

                  // Email Chip
                  Container(
                    width: double.infinity,
                    padding: const EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      color: const Color(0xFFF3F4F6),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Row(
                      children: [
                        Container(
                          padding: const EdgeInsets.all(8),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: const Icon(
                            Icons.email,
                            color: Color(0xFF2E7D32),
                            size: 18,
                          ),
                        ),
                        const SizedBox(width: 12),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text(
                                'Email',
                                style: TextStyle(
                                  fontSize: 11,
                                  color: Color(0xFF6B7280),
                                  fontFamily: 'Poppins',
                                ),
                              ),
                              Text(
                                company.email,
                                style: const TextStyle(
                                  fontSize: 13,
                                  fontWeight: FontWeight.w500,
                                  color: Color(0xFF1F2937),
                                  fontFamily: 'Poppins',
                                ),
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),

                  const SizedBox(height: 12),

                  // Address Card
                  Container(
                    width: double.infinity,
                    padding: const EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      color: const Color(0xFFF3F4F6),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Row(
                      children: [
                        Container(
                          padding: const EdgeInsets.all(8),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: const Icon(
                            Icons.location_on,
                            color: Color(0xFF2E7D32),
                            size: 18,
                          ),
                        ),
                        const SizedBox(width: 12),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text(
                                'Address',
                                style: TextStyle(
                                  fontSize: 11,
                                  color: Color(0xFF6B7280),
                                  fontFamily: 'Poppins',
                                ),
                              ),
                              Text(
                                company.address,
                                style: const TextStyle(
                                  fontSize: 13,
                                  fontWeight: FontWeight.w500,
                                  color: Color(0xFF1F2937),
                                  fontFamily: 'Poppins',
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),

                  const SizedBox(height: 12),

                  // ── LOCATION DETAILS (expandable) ──────────────────────
                  GestureDetector(
                    onTap: () => _toggleExpand(index),
                    child: Container(
                      width: double.infinity,
                      padding: const EdgeInsets.all(12),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(12),
                        border: Border.all(
                          color: const Color(0xFFE5E7EB),
                        ),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // Header row — same as original
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  const Icon(
                                    Icons.pin_drop,
                                    color: Color(0xFF2E7D32),
                                    size: 18,
                                  ),
                                  const SizedBox(width: 8),
                                  const Text(
                                    'Location Details',
                                    style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w600,
                                      color: Color(0xFF1F2937),
                                      fontFamily: 'Poppins',
                                    ),
                                  ),
                                ],
                              ),
                              Icon(
                                isExpanded
                                    ? Icons.expand_less
                                    : Icons.expand_more,
                                color: const Color(0xFF2E7D32),
                                size: 20,
                              ),
                            ],
                          ),

                          // ── Expanded body ──────────────────────────────
                          if (isExpanded) ...[
                            const SizedBox(height: 12),
                            const Divider(height: 1),
                            const SizedBox(height: 12),

                            if (hasLocation) ...[
                              // Map preview card — tapping opens the full dialog
                              GestureDetector(
                                onTap: () => _showMapDialog(
                                  context,
                                  company.latitude,
                                  company.longitude,
                                  company.name,
                                ),
                                child: Container(
                                  width: double.infinity,
                                  height: 160,
                                  decoration: BoxDecoration(
                                    color: const Color(0xFFE8F5E9),
                                    borderRadius: BorderRadius.circular(12),
                                    border: Border.all(
                                        color: const Color(0xFFC8E6C9)),
                                  ),
                                  child: Stack(
                                    alignment: Alignment.center,
                                    children: [
                                      // Grid background
                                      ClipRRect(
                                        borderRadius:
                                        BorderRadius.circular(12),
                                        child: CustomPaint(
                                          size:
                                          const Size(double.infinity, 160),
                                          painter: _MapGridPainter(),
                                        ),
                                      ),

                                      // Pin
                                      Column(
                                        mainAxisAlignment:
                                        MainAxisAlignment.center,
                                        children: [
                                          Container(
                                            width: 44,
                                            height: 44,
                                            decoration: BoxDecoration(
                                              color: const Color(0xFF2E7D32),
                                              shape: BoxShape.circle,
                                              border: Border.all(
                                                  color: Colors.white,
                                                  width: 3),
                                              boxShadow: [
                                                BoxShadow(
                                                  color: const Color(0xFF2E7D32)
                                                      .withOpacity(0.35),
                                                  blurRadius: 10,
                                                  offset: const Offset(0, 4),
                                                ),
                                              ],
                                            ),
                                            child: const Icon(
                                              Icons.business,
                                              color: Colors.white,
                                              size: 22,
                                            ),
                                          ),
                                          CustomPaint(
                                            size: const Size(12, 9),
                                            painter: _PinTailPainter(
                                                color:
                                                const Color(0xFF2E7D32)),
                                          ),
                                        ],
                                      ),

                                      // Coordinates pill — bottom left
                                      Positioned(
                                        bottom: 8,
                                        left: 8,
                                        child: Container(
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 8, vertical: 4),
                                          decoration: BoxDecoration(
                                            color:
                                            Colors.white.withOpacity(0.95),
                                            borderRadius:
                                            BorderRadius.circular(8),
                                            boxShadow: [
                                              BoxShadow(
                                                color: Colors.black
                                                    .withOpacity(0.08),
                                                blurRadius: 4,
                                              ),
                                            ],
                                          ),
                                          child: Row(
                                            mainAxisSize: MainAxisSize.min,
                                            children: [
                                              const Icon(Icons.pin_drop,
                                                  size: 11,
                                                  color: Color(0xFF2E7D32)),
                                              const SizedBox(width: 4),
                                              Text(
                                                '${lat.toStringAsFixed(5)}, '
                                                    '${lng.toStringAsFixed(5)}',
                                                style: const TextStyle(
                                                  fontSize: 10,
                                                  fontFamily: 'Poppins',
                                                  fontWeight: FontWeight.w500,
                                                  color: Color(0xFF374151),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),

                                      // "View Map" badge — top right
                                      Positioned(
                                        top: 8,
                                        right: 8,
                                        child: Container(
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 8, vertical: 4),
                                          decoration: BoxDecoration(
                                            color: const Color(0xFF2E7D32),
                                            borderRadius:
                                            BorderRadius.circular(8),
                                          ),
                                          child: const Row(
                                            mainAxisSize: MainAxisSize.min,
                                            children: [
                                              Icon(Icons.map,
                                                  size: 11,
                                                  color: Colors.white),
                                              SizedBox(width: 4),
                                              Text(
                                                'View Map',
                                                style: TextStyle(
                                                  fontSize: 10,
                                                  color: Colors.white,
                                                  fontWeight: FontWeight.w600,
                                                  fontFamily: 'Poppins',
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),

                              const SizedBox(height: 10),

                              // Open in Google Maps text link
                              GestureDetector(
                                onTap: () => _openInMaps(
                                    company.latitude, company.longitude),
                                child: Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: const [
                                    Icon(Icons.open_in_new,
                                        size: 13,
                                        color: Color(0xFF2E7D32)),
                                    SizedBox(width: 5),
                                    Text(
                                      'Open in Google Maps',
                                      style: TextStyle(
                                        fontSize: 12,
                                        color: Color(0xFF2E7D32),
                                        fontWeight: FontWeight.w500,
                                        fontFamily: 'Poppins',
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ] else ...[
                              const Text(
                                'No location data available',
                                style: TextStyle(
                                  fontSize: 13,
                                  color: Color(0xFF6B7280),
                                  fontFamily: 'Poppins',
                                ),
                              ),
                            ],
                          ],
                        ],
                      ),
                    ),
                  ),
                  // ── END LOCATION DETAILS ───────────────────────────────

                  const SizedBox(height: 20),

                  // Documents Section
                  const Text(
                    'Documents',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: Color(0xFF1F2937),
                      fontFamily: 'Poppins',
                    ),
                  ),

                  const SizedBox(height: 12),

                  // Two Photos Side by Side
                  Row(
                    children: [
                      Expanded(
                        child: _buildDocumentImage(
                          company.proof,
                          'Proof',
                          context,
                        ),
                      ),
                      const SizedBox(width: 12),
                      Expanded(
                        child: _buildDocumentImage(
                          company.photo,
                          'Photo',
                          context,
                        ),
                      ),
                    ],
                  ),

                  const SizedBox(height: 20),

                  // Action Buttons - Three in a Row
                  Row(
                    children: [
                      Expanded(
                        child: ElevatedButton.icon(
                          icon: const Icon(Icons.rate_review, size: 16),
                          label: const Text(
                            "Send",
                            style: TextStyle(
                              fontSize: 11,
                              fontWeight: FontWeight.w600,
                              fontFamily: 'Poppins',
                            ),
                          ),
                          onPressed: () async {
                            SharedPreferences sh =
                            await SharedPreferences.getInstance();
                            sh.setString("tid", company.id);
                            if (!mounted) return;
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const sendreview()),
                            );
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: const Color(0xFF2E7D32),
                            foregroundColor: Colors.white,
                            padding:
                            const EdgeInsets.symmetric(vertical: 12),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(width: 6),
                      Expanded(
                        child: OutlinedButton.icon(
                          icon: const Icon(Icons.reviews, size: 16),
                          label: const Text(
                            "Reviews",
                            style: TextStyle(
                              fontSize: 11,
                              fontWeight: FontWeight.w600,
                              fontFamily: 'Poppins',
                            ),
                          ),
                          onPressed: () async {
                            SharedPreferences sh =
                            await SharedPreferences.getInstance();
                            sh.setString("tid", company.id);
                            if (!mounted) return;
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const viewreview()),
                            );
                          },
                          style: OutlinedButton.styleFrom(
                            side: const BorderSide(
                                color: Color(0xFF2E7D32), width: 1.5),
                            foregroundColor: const Color(0xFF2E7D32),
                            padding:
                            const EdgeInsets.symmetric(vertical: 12),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(width: 6),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildInfoChip({
    required IconData icon,
    required String label,
    required String value,
  }) {
    return Container(
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: const Color(0xFFF3F4F6),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        children: [
          Icon(icon, size: 16, color: const Color(0xFF2E7D32)),
          const SizedBox(width: 6),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  label,
                  style: const TextStyle(
                    fontSize: 10,
                    color: Color(0xFF6B7280),
                    fontFamily: 'Poppins',
                  ),
                ),
                Text(
                  value,
                  style: const TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w600,
                    color: Color(0xFF1F2937),
                    fontFamily: 'Poppins',
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildDocumentImage(
      String imageUrl, String label, BuildContext context) {
    return GestureDetector(
      onTap: () => _showEnlargedImage(context, imageUrl, label),
      child: Container(
        height: 100,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.05),
              blurRadius: 8,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: Stack(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: Image.network(
                imageUrl,
                fit: BoxFit.cover,
                width: double.infinity,
                height: double.infinity,
                loadingBuilder: (BuildContext context, Widget child,
                    ImageChunkEvent? loadingProgress) {
                  if (loadingProgress == null) return child;
                  return Container(
                    color: const Color(0xFFF3F4F6),
                    child: const Center(
                      child: CircularProgressIndicator(
                        color: Color(0xFF2E7D32),
                      ),
                    ),
                  );
                },
                errorBuilder: (BuildContext context, Object error,
                    StackTrace? stackTrace) {
                  return Container(
                    color: const Color(0xFFF3F4F6),
                    child: Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.broken_image,
                            size: 30,
                            color: const Color(0xFF6B7280).withOpacity(0.5),
                          ),
                          const SizedBox(height: 4),
                          Text(
                            label,
                            style: const TextStyle(
                              fontSize: 10,
                              color: Color(0xFF6B7280),
                              fontFamily: 'Poppins',
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
            // Zoom icon overlay
            Positioned(
              bottom: 6,
              right: 6,
              child: Container(
                padding: const EdgeInsets.all(4),
                decoration: BoxDecoration(
                  color: const Color(0xFF2E7D32).withOpacity(0.8),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: const Icon(
                  Icons.zoom_in,
                  color: Colors.white,
                  size: 14,
                ),
              ),
            ),
            // Label overlay
            Positioned(
              top: 6,
              left: 6,
              child: Container(
                padding:
                const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                decoration: BoxDecoration(
                  color: Colors.black.withOpacity(0.6),
                  borderRadius: BorderRadius.circular(4),
                ),
                child: Text(
                  label,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 8,
                    fontWeight: FontWeight.w500,
                    fontFamily: 'Poppins',
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// ── Map grid / road background painter ────────────────────────────────────────
class _MapGridPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final gridPaint = Paint()
      ..color = const Color(0xFFA5D6A7).withOpacity(0.45)
      ..strokeWidth = 0.8;

    for (double y = 0; y < size.height; y += 26) {
      canvas.drawLine(Offset(0, y), Offset(size.width, y), gridPaint);
    }
    for (double x = 0; x < size.width; x += 26) {
      canvas.drawLine(Offset(x, 0), Offset(x, size.height), gridPaint);
    }

    final roadPaint = Paint()
      ..color = Colors.white.withOpacity(0.65)
      ..strokeWidth = 3
      ..strokeCap = StrokeCap.round;

    canvas.drawLine(Offset(0, size.height * 0.38),
        Offset(size.width, size.height * 0.54), roadPaint);
    canvas.drawLine(Offset(size.width * 0.28, 0),
        Offset(size.width * 0.42, size.height), roadPaint);
    canvas.drawLine(Offset(0, size.height * 0.72),
        Offset(size.width, size.height * 0.68), roadPaint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}

// ── Pin tail triangle ─────────────────────────────────────────────────────────
class _PinTailPainter extends CustomPainter {
  final Color color;
  const _PinTailPainter({required this.color});

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()..color = color;
    final path = Path()
      ..moveTo(0, 0)
      ..lineTo(size.width, 0)
      ..lineTo(size.width / 2, size.height)
      ..close();
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}

// ── Data model (unchanged) ────────────────────────────────────────────────────
class Joke {
  final String id;
  final String name;
  final String address;
  final String phone;
  final String email;
  final String proof;
  final String photo;
  final String place;
  final String latitude;
  final String longitude;
  final String rating;

  const Joke(
      this.id,
      this.name,
      this.address,
      this.phone,
      this.email,
      this.proof,
      this.photo,
      this.place,
      this.latitude,
      this.longitude,
      this.rating,
      );
}