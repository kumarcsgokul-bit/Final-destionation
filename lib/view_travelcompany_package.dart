// import 'dart:convert';
//
// import 'package:final_destination/booking.dart';
// import 'package:final_destination/view_extradetails.dart';
// import 'package:flutter/material.dart';
// import 'package:http/http.dart' as http;
// import 'package:shared_preferences/shared_preferences.dart';
//
// void main(){
//   runApp(viewtcpackage());
//
// }
// class viewtcpackage extends StatelessWidget {
//   const viewtcpackage({Key? key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(home: viewtcpackagesub(),);
//   }
// }
// class viewtcpackagesub extends StatefulWidget {
//   const viewtcpackagesub({Key? key}) : super(key: key);
//
//   @override
//   State<viewtcpackagesub> createState() => _viewtcpackagesubState();
// }
//
// class _viewtcpackagesubState extends State<viewtcpackagesub> {
//   Future<List<Joke>> _getJokes() async {
//     SharedPreferences prefs = await SharedPreferences.getInstance();
//     String b = prefs.getString("lid").toString();
//     String foodimage="";
//     var data =
//     await http.post(Uri.parse(prefs.getString("ip").toString()+"/userview_travelcompany_package"),
//         body: {"tid":prefs.getString('tid').toString()}
//     );
//
//     var jsonData = json.decode(data.body);
// //    print(jsonData);
//     List<Joke> jokes = [];
//     for (var joke in jsonData["message"]) {
//       print(joke);
//       Joke newJoke = Joke(
//         joke["id"].toString(),
//         joke["title"].toString(),
//         joke["description"].toString(),
//         prefs.getString('ip').toString()+joke["photo1"].toString(),
//         prefs.getString('ip').toString()+joke["photo2"].toString(),
//         prefs.getString('ip').toString()+joke["photo3"].toString(),
//         joke["amount"].toString(),
//         joke["package_details"],
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
//
//                           _buildRow("title:", i.title.toString()),
//                           _buildRow("description", i.description.toString()),
//                           Image.network(i.photo1.toString(),height: 200,width: 200,),
//                           Image.network(i.photo2.toString(),height: 200,width: 200,),
//                           Image.network(i.photo3.toString(),height: 200,width: 200,),
//                           _buildRow("amount:", i.amount.toString()),
//                           _buildRow("package_details:", i.package_details.toString()),
//
//                           Row(children: [
//                             ElevatedButton(onPressed: () async {
//                               SharedPreferences sh=await SharedPreferences.getInstance();
//                               sh.setString('ownid', i.id.toString());
//                               Navigator.push(context, MaterialPageRoute(builder: (context)=>booking()));
//                             }, child: Text('Book')),
//                             ElevatedButton(onPressed: () async {
//                               SharedPreferences sh=await SharedPreferences.getInstance();
//                               sh.setString('oid', i.id.toString());
//                               Navigator.push(context, MaterialPageRoute(builder: (context)=>view_extradetails()));
//                             }, child: Text('Extra details')),
//                           ],)
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
//   final String title;
//   final String description;
//   final String photo1;
//   final String photo2;
//   final String photo3;
//   final String amount;
//   final String package_details;
//
//
//
//   Joke(this.id,this.title,this.description,this.photo1,this.photo2, this.photo3,this.amount,this.package_details);
// //  print("hiiiii");
// }


//
// import 'dart:convert';
// import 'package:final_destination/booking.dart';
// import 'package:final_destination/view_extradetails.dart';
// import 'package:final_destination/view_travel_company.dart'; // Add this import
// import 'package:flutter/material.dart';
// import 'package:http/http.dart' as http;
// import 'package:shared_preferences/shared_preferences.dart';
//
// void main() {
//   runApp(const viewtcpackage());
// }
//
// class viewtcpackage extends StatelessWidget {
//   const viewtcpackage({Key? key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       theme: ThemeData(
//         primaryColor: const Color(0xFF1A237E),
//         fontFamily: 'Poppins',
//       ),
//       home: const viewtcpackagesub(),
//     );
//   }
// }
//
// class viewtcpackagesub extends StatefulWidget {
//   const viewtcpackagesub({Key? key}) : super(key: key);
//
//   @override
//   State<viewtcpackagesub> createState() => _viewtcpackagesubState();
// }
//
// class _viewtcpackagesubState extends State<viewtcpackagesub> {
//   List<Package> packages = [];
//   bool isLoading = true;
//   String errorMessage = '';
//
//   @override
//   void initState() {
//     super.initState();
//     _getPackages();
//   }
//
//   Future<void> _getPackages() async {
//     try {
//       SharedPreferences prefs = await SharedPreferences.getInstance();
//       String companyId = prefs.getString("tid") ?? "";
//       String ipAddress = prefs.getString("ip") ?? "http://localhost";
//
//       var response = await http.post(
//           Uri.parse("$ipAddress/userview_travelcompany_package"),
//           body: {"tid": companyId}
//       );
//
//       if (response.statusCode == 200) {
//         var jsonData = json.decode(response.body);
//         List<Package> fetchedPackages = [];
//
//         for (var packageData in jsonData["message"]) {
//           Package package = Package(
//             id: packageData["id"].toString(),
//             title: packageData["title"] ?? "",
//             photo1: "$ipAddress${packageData["photo1"] ?? ""}",
//             photo2: "$ipAddress${packageData["photo2"] ?? ""}",
//             photo3: "$ipAddress${packageData["photo3"] ?? ""}",
//             amount: packageData["amount"] ?? "0",
//             packageDetails: packageData["package_details"] ?? "",
//           );
//           fetchedPackages.add(package);
//         }
//
//         setState(() {
//           packages = fetchedPackages;
//           isLoading = false;
//         });
//       } else {
//         setState(() {
//           isLoading = false;
//           errorMessage = 'Failed to load packages: ${response.statusCode}';
//         });
//       }
//     } catch (e) {
//       setState(() {
//         isLoading = false;
//         errorMessage = 'Error: $e';
//       });
//     }
//   }
//
//   List<String> _getPhotoList(Package package) {
//     List<String> photos = [];
//     if (package.photo1.isNotEmpty) photos.add(package.photo1);
//     if (package.photo2.isNotEmpty) photos.add(package.photo2);
//     if (package.photo3.isNotEmpty) photos.add(package.photo3);
//     return photos;
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: const Color(0xFF1A237E),
//         elevation: 0,
//         title: const Text(
//           'Company Packages',
//           style: TextStyle(
//             fontSize: 20,
//             fontWeight: FontWeight.bold,
//           ),
//         ),
//         centerTitle: true,
//         leading: IconButton(
//           icon: const Icon(Icons.arrow_back),
//           onPressed: () {
//             Navigator.pushReplacement(
//               context,
//               MaterialPageRoute(builder: (context) => const view_travel_company()),
//             );
//           },
//         ),
//         actions: [
//           IconButton(
//             icon: const Icon(Icons.refresh),
//             onPressed: _getPackages,
//             tooltip: 'Refresh',
//           ),
//         ],
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
//         child: isLoading
//             ? const Center(
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: [
//               CircularProgressIndicator(
//                 color: Color(0xFF1A237E),
//               ),
//               SizedBox(height: 20),
//               Text(
//                 'Loading Packages...',
//                 style: TextStyle(
//                   fontSize: 16,
//                   color: Color(0xFF1A237E),
//                   fontWeight: FontWeight.w500,
//                 ),
//               ),
//             ],
//           ),
//         )
//             : errorMessage.isNotEmpty
//             ? Center(
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: [
//               const Icon(
//                 Icons.error_outline,
//                 size: 60,
//                 color: Colors.grey,
//               ),
//               const SizedBox(height: 20),
//               Text(
//                 errorMessage,
//                 style: const TextStyle(
//                   fontSize: 18,
//                   color: Colors.grey,
//                 ),
//                 textAlign: TextAlign.center,
//               ),
//               const SizedBox(height: 20),
//               ElevatedButton(
//                 onPressed: _getPackages,
//                 child: const Text('Retry'),
//               ),
//             ],
//           ),
//         )
//             : packages.isEmpty
//             ? Center(
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: [
//               Container(
//                 width: 120,
//                 height: 120,
//                 decoration: BoxDecoration(
//                   color: const Color(0xFF1A237E).withOpacity(0.1),
//                   shape: BoxShape.circle,
//                 ),
//                 child: const Icon(
//                   Icons.card_travel,
//                   size: 60,
//                   color: Color(0xFF1A237E),
//                 ),
//               ),
//               const SizedBox(height: 20),
//               const Text(
//                 'No Packages Available',
//                 style: TextStyle(
//                   fontSize: 22,
//                   color: Color(0xFF1A237E),
//                   fontWeight: FontWeight.bold,
//                 ),
//               ),
//               const SizedBox(height: 10),
//               Text(
//                 'This company has no packages at the moment',
//                 style: TextStyle(
//                   fontSize: 16,
//                   color: Colors.grey[600],
//                 ),
//                 textAlign: TextAlign.center,
//               ),
//               const SizedBox(height: 30),
//               ElevatedButton.icon(
//                 onPressed: () {
//                   Navigator.pushReplacement(
//                     context,
//                     MaterialPageRoute(builder: (context) => const view_travel_company()),
//                   );
//                 },
//                 icon: const Icon(Icons.arrow_back),
//                 label: const Text('Back to Company'),
//                 style: ElevatedButton.styleFrom(
//                   backgroundColor: const Color(0xFF1A237E),
//                   padding: const EdgeInsets.symmetric(
//                     horizontal: 30,
//                     vertical: 15,
//                   ),
//                   shape: RoundedRectangleBorder(
//                     borderRadius: BorderRadius.circular(12),
//                   ),
//                 ),
//               ),
//             ],
//           ),
//         )
//             : ListView.builder(
//           padding: const EdgeInsets.all(16),
//           itemCount: packages.length,
//           itemBuilder: (context, index) {
//             return _buildPackageCard(packages[index]);
//           },
//         ),
//       ),
//     );
//   }
//
//   Widget _buildPackageCard(Package package) {
//     List<String> photos = _getPhotoList(package);
//
//     return Container(
//       margin: const EdgeInsets.only(bottom: 20),
//       decoration: BoxDecoration(
//         color: Colors.white,
//         borderRadius: BorderRadius.circular(20),
//         boxShadow: [
//           BoxShadow(
//             color: Colors.grey.withOpacity(0.2),
//             spreadRadius: 2,
//             blurRadius: 15,
//             offset: const Offset(0, 5),
//           ),
//         ],
//       ),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           // Package Header with Title
//           Container(
//             padding: const EdgeInsets.all(20),
//             decoration: BoxDecoration(
//               gradient: const LinearGradient(
//                 begin: Alignment.topLeft,
//                 end: Alignment.bottomRight,
//                 colors: [Color(0xFF1A237E), Color(0xFF3949AB)],
//               ),
//               borderRadius: const BorderRadius.only(
//                 topLeft: Radius.circular(20),
//                 topRight: Radius.circular(20),
//               ),
//             ),
//             child: Row(
//               children: [
//                 Container(
//                   width: 50,
//                   height: 50,
//                   decoration: BoxDecoration(
//                     color: Colors.white,
//                     borderRadius: BorderRadius.circular(12),
//                   ),
//                   child: const Icon(
//                     Icons.card_travel,
//                     color: Color(0xFF1A237E),
//                     size: 28,
//                   ),
//                 ),
//                 const SizedBox(width: 15),
//                 Expanded(
//                   child: Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       const Text(
//                         'PACKAGE TITLE',
//                         style: TextStyle(
//                           fontSize: 12,
//                           color: Colors.white70,
//                           fontWeight: FontWeight.w500,
//                           letterSpacing: 1,
//                         ),
//                       ),
//                       Text(
//                         package.title,
//                         style: const TextStyle(
//                           fontSize: 22,
//                           color: Colors.white,
//                           fontWeight: FontWeight.bold,
//                         ),
//                         maxLines: 2,
//                         overflow: TextOverflow.ellipsis,
//                       ),
//                     ],
//                   ),
//                 ),
//               ],
//             ),
//           ),
//
//           Padding(
//             padding: const EdgeInsets.all(20),
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 // Package Details Section
//                 const Row(
//                   children: [
//                     Icon(Icons.list_alt, color: Color(0xFF1A237E), size: 20),
//                     SizedBox(width: 8),
//                     Text(
//                       'Package Details',
//                       style: TextStyle(
//                         fontSize: 18,
//                         fontWeight: FontWeight.bold,
//                         color: Color(0xFF1A237E),
//                       ),
//                     ),
//                   ],
//                 ),
//                 const SizedBox(height: 12),
//                 Container(
//                   padding: const EdgeInsets.all(15),
//                   decoration: BoxDecoration(
//                     color: Colors.grey[50],
//                     borderRadius: BorderRadius.circular(12),
//                     border: Border.all(color: Colors.grey[200]!),
//                   ),
//                   child: Text(
//                     package.packageDetails,
//                     style: const TextStyle(
//                       color: Colors.grey,
//                       fontSize: 14,
//                       height: 1.5,
//                     ),
//                   ),
//                 ),
//                 const SizedBox(height: 20),
//
//                 // Description Section
//                 const SizedBox(height: 12),
//                 const SizedBox(height: 20),
//
//                 // Package Photos
//                 const Row(
//                   children: [
//                     Icon(Icons.photo_library, color: Color(0xFF1A237E), size: 20),
//                     SizedBox(width: 8),
//                     Text(
//                       'Package Photos',
//                       style: TextStyle(
//                         fontSize: 18,
//                         fontWeight: FontWeight.bold,
//                         color: Color(0xFF1A237E),
//                       ),
//                     ),
//                   ],
//                 ),
//                 const SizedBox(height: 12),
//                 Text(
//                   '${photos.length} photos available',
//                   style: TextStyle(
//                     color: Colors.grey[600],
//                     fontSize: 14,
//                   ),
//                 ),
//                 const SizedBox(height: 15),
//
//                 // Photo Grid
//                 if (photos.isNotEmpty)
//                   GridView.builder(
//                     shrinkWrap: true,
//                     physics: const NeverScrollableScrollPhysics(),
//                     gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
//                       crossAxisCount: 3,
//                       crossAxisSpacing: 10,
//                       mainAxisSpacing: 10,
//                       childAspectRatio: 1,
//                     ),
//                     itemCount: photos.length,
//                     itemBuilder: (context, index) {
//                       return ClipRRect(
//                         borderRadius: BorderRadius.circular(10),
//                         child: Image.network(
//                           photos[index],
//                           fit: BoxFit.cover,
//                           loadingBuilder: (context, child, loadingProgress) {
//                             if (loadingProgress == null) return child;
//                             return Container(
//                               color: Colors.grey[200],
//                               child: Center(
//                                 child: CircularProgressIndicator(
//                                   value: loadingProgress.expectedTotalBytes != null
//                                       ? loadingProgress.cumulativeBytesLoaded /
//                                       loadingProgress.expectedTotalBytes!
//                                       : null,
//                                 ),
//                               ),
//                             );
//                           },
//                           errorBuilder: (context, error, stackTrace) {
//                             return Container(
//                               color: Colors.grey[200],
//                               child: const Icon(
//                                 Icons.broken_image,
//                                 color: Colors.grey,
//                                 size: 30,
//                               ),
//                             );
//                           },
//                         ),
//                       );
//                     },
//                   ),
//                 const SizedBox(height: 20),
//
//                 // Price Section
//                 Container(
//                   padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
//                   decoration: BoxDecoration(
//                     gradient: LinearGradient(
//                       begin: Alignment.topLeft,
//                       end: Alignment.bottomRight,
//                       colors: [
//                         Colors.amber[700]!,
//                         Colors.orange[700]!,
//                       ],
//                     ),
//                     borderRadius: BorderRadius.circular(12),
//                     boxShadow: [
//                       BoxShadow(
//                         color: Colors.amber.withOpacity(0.3),
//                         blurRadius: 10,
//                         offset: const Offset(0, 5),
//                       ),
//                     ],
//                   ),
//                   child: Row(
//                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                     children: [
//                       Column(
//                         crossAxisAlignment: CrossAxisAlignment.start,
//                         children: [
//                           const Row(
//                             children: [
//                               Icon(
//                                 Icons.price_change,
//                                 color: Colors.white,
//                                 size: 18,
//                               ),
//                               SizedBox(width: 8),
//                               Text(
//                                 'PACKAGE PRICE',
//                                 style: TextStyle(
//                                   fontSize: 12,
//                                   fontWeight: FontWeight.bold,
//                                   color: Colors.white,
//                                   letterSpacing: 1,
//                                 ),
//                               ),
//                             ],
//                           ),
//                           const SizedBox(height: 8),
//                           Row(
//                             crossAxisAlignment: CrossAxisAlignment.end,
//                             children: [
//                               Text(
//                                 '₹${package.amount}',
//                                 style: const TextStyle(
//                                   fontSize: 32,
//                                   fontWeight: FontWeight.bold,
//                                   color: Colors.white,
//                                 ),
//                               ),
//                               const SizedBox(width: 8),
//                               const Text(
//                                 '/ person',
//                                 style: TextStyle(
//                                   fontSize: 14,
//                                   color: Colors.white70,
//                                   fontWeight: FontWeight.w500,
//                                 ),
//                               ),
//                             ],
//                           ),
//                         ],
//                       ),
//                       Container(
//                         padding: const EdgeInsets.symmetric(
//                           horizontal: 16,
//                           vertical: 8,
//                         ),
//                         decoration: BoxDecoration(
//                           color: Colors.white.withOpacity(0.2),
//                           borderRadius: BorderRadius.circular(25),
//                           border: Border.all(
//                             color: Colors.white.withOpacity(0.3),
//                             width: 1.5,
//                           ),
//                         ),
//                         child: const Row(
//                           children: [
//                             Icon(
//                               Icons.star,
//                               color: Colors.white,
//                               size: 16,
//                             ),
//                             SizedBox(width: 4),
//                             Text(
//                               'Best Price',
//                               style: TextStyle(
//                                 color: Colors.white,
//                                 fontWeight: FontWeight.w600,
//                                 fontSize: 12,
//                               ),
//                             ),
//                           ],
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
//
//                 const SizedBox(height: 20),
//
//                 // Special Features
//                 Container(
//                   padding: const EdgeInsets.all(16),
//                   decoration: BoxDecoration(
//                     color: const Color(0xFF1A237E).withOpacity(0.05),
//                     borderRadius: BorderRadius.circular(12),
//                     border: Border.all(
//                       color: const Color(0xFF1A237E).withOpacity(0.1),
//                     ),
//                   ),
//                   child: Row(
//                     children: [
//                       Expanded(
//                         child: Row(
//                           children: [
//                             Container(
//                               padding: const EdgeInsets.all(8),
//                               decoration: BoxDecoration(
//                                 color: Colors.green[50],
//                                 borderRadius: BorderRadius.circular(8),
//                               ),
//                               child: const Icon(
//                                 Icons.verified,
//                                 color: Colors.green,
//                                 size: 20,
//                               ),
//                             ),
//                             const SizedBox(width: 12),
//                             const Expanded(
//                               child: Column(
//                                 crossAxisAlignment: CrossAxisAlignment.start,
//                                 children: [
//                                   Text(
//                                     'Verified Package',
//                                     style: TextStyle(
//                                       fontSize: 14,
//                                       fontWeight: FontWeight.bold,
//                                       color: Color(0xFF1A237E),
//                                     ),
//                                   ),
//                                   SizedBox(height: 2),
//                                   Text(
//                                     'Authentic travel experience',
//                                     style: TextStyle(
//                                       fontSize: 12,
//                                       color: Colors.grey,
//                                     ),
//                                   ),
//                                 ],
//                               ),
//                             ),
//                           ],
//                         ),
//                       ),
//                       Container(
//                         height: 30,
//                         width: 1,
//                         color: Colors.grey[300],
//                       ),
//                       Expanded(
//                         child: Row(
//                           children: [
//                             Container(
//                               padding: const EdgeInsets.all(8),
//                               decoration: BoxDecoration(
//                                 color: Colors.blue[50],
//                                 borderRadius: BorderRadius.circular(8),
//                               ),
//                               child: const Icon(
//                                 Icons.support_agent,
//                                 color: Colors.blue,
//                                 size: 20,
//                               ),
//                             ),
//                             const SizedBox(width: 12),
//                             const Expanded(
//                               child: Column(
//                                 crossAxisAlignment: CrossAxisAlignment.start,
//                                 children: [
//                                   Text(
//                                     '24/7 Support',
//                                     style: TextStyle(
//                                       fontSize: 14,
//                                       fontWeight: FontWeight.bold,
//                                       color: Color(0xFF1A237E),
//                                     ),
//                                   ),
//                                   SizedBox(height: 2),
//                                   Text(
//                                     'Assistance anytime',
//                                     style: TextStyle(
//                                       fontSize: 12,
//                                       color: Colors.grey,
//                                     ),
//                                   ),
//                                 ],
//                               ),
//                             ),
//                           ],
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
//               ],
//             ),
//           ),
//
//           // Action Buttons
//           Container(
//             padding: const EdgeInsets.all(20),
//             decoration: BoxDecoration(
//               color: Colors.grey[50],
//               borderRadius: const BorderRadius.only(
//                 bottomLeft: Radius.circular(20),
//                 bottomRight: Radius.circular(20),
//               ),
//               border: Border(
//                 top: BorderSide(color: Colors.grey[300]!),
//               ),
//             ),
//             child: Column(
//               children: [
//                 const Text(
//                   'Ready to Book?',
//                   style: TextStyle(
//                     fontSize: 16,
//                     fontWeight: FontWeight.w600,
//                     color: Colors.grey,
//                   ),
//                 ),
//                 const SizedBox(height: 15),
//                 Row(
//                   children: [
//                     // Book Button
//                     Expanded(
//                       child: ElevatedButton.icon(
//                         onPressed: () async {
//                           SharedPreferences sh = await SharedPreferences.getInstance();
//                           sh.setString('ownid', package.id);
//                           Navigator.push(
//                             context,
//                             MaterialPageRoute(builder: (context) => const booking()),
//                           );
//                         },
//                         icon: const Icon(Icons.book_online, size: 20),
//                         label: const Text('Book Now'),
//                         style: ElevatedButton.styleFrom(
//                           backgroundColor: const Color(0xFF1A237E),
//                           foregroundColor: Colors.white,
//                           padding: const EdgeInsets.symmetric(vertical: 15),
//                           shape: RoundedRectangleBorder(
//                             borderRadius: BorderRadius.circular(12),
//                           ),
//                           elevation: 5,
//                           shadowColor: const Color(0xFF1A237E).withOpacity(0.5),
//                         ),
//                       ),
//                     ),
//
//                     const SizedBox(width: 10),
//
//                     // Extra Details Button
//                     Expanded(
//                       child: ElevatedButton.icon(
//                         onPressed: () async {
//                           SharedPreferences sh = await SharedPreferences.getInstance();
//                           sh.setString('oid', package.id);
//                           Navigator.push(
//                             context,
//                             MaterialPageRoute(builder: (context) => const view_extradetails()),
//                           );
//                         },
//                         icon: const Icon(Icons.info_outline, size: 20),
//                         label: const Text('Extra Details'),
//                         style: ElevatedButton.styleFrom(
//                           backgroundColor: Colors.white,
//                           foregroundColor: const Color(0xFF1A237E),
//                           padding: const EdgeInsets.symmetric(vertical: 15),
//                           shape: RoundedRectangleBorder(
//                             borderRadius: BorderRadius.circular(12),
//                             side: const BorderSide(color: Color(0xFF1A237E), width: 2),
//                           ),
//                           elevation: 3,
//                           shadowColor: Colors.grey.withOpacity(0.3),
//                         ),
//                       ),
//                     ),
//                   ],
//                 ),
//                 const SizedBox(height: 10),
//                 const Text(
//                   'Book now to secure your spot or view extra details',
//                   textAlign: TextAlign.center,
//                   style: TextStyle(
//                     fontSize: 12,
//                     color: Colors.grey,
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
// class Package {
//   final String id;
//   final String title;
//   final String photo1;
//   final String photo2;
//   final String photo3;
//   final String amount;
//   final String packageDetails;
//
//   Package({
//     required this.id,
//     required this.title,
//     required this.photo1,
//     required this.photo2,
//     required this.photo3,
//     required this.amount,
//     required this.packageDetails,
//   });
// }
//
// class Joke {
//   final String id;
//   final String title;
//   final String description;
//   final String photo1;
//   final String photo2;
//   final String photo3;
//   final String amount;
//   final String package_details;
//
//   Joke(
//       this.id,
//       this.title,
//       this.description,
//       this.photo1,
//       this.photo2,
//       this.photo3,
//       this.amount,
//       this.package_details,
//       );
// }

import 'dart:convert';
import 'package:final_destination/booking.dart';
import 'package:final_destination/view_extradetails.dart';
import 'package:final_destination/view_travel_company.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  runApp(const viewtcpackage());
}

class viewtcpackage extends StatelessWidget {
  const viewtcpackage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: const Color(0xFF0F2A1D),
        fontFamily: 'Poppins',
        scaffoldBackgroundColor: const Color(0xFFE3EED4),
      ),
      home: const viewtcpackagesub(),
    );
  }
}

class viewtcpackagesub extends StatefulWidget {
  const viewtcpackagesub({Key? key}) : super(key: key);

  @override
  State<viewtcpackagesub> createState() => _viewtcpackagesubState();
}

class _viewtcpackagesubState extends State<viewtcpackagesub> {
  List<Package> packages = [];
  bool isLoading = true;
  String errorMessage = '';

  @override
  void initState() {
    super.initState();
    _getPackages();
  }

  Future<void> _getPackages() async {
    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      String companyId = prefs.getString("tid") ?? "";
      String ipAddress = prefs.getString("ip") ?? "http://localhost";

      var response = await http.post(
          Uri.parse("$ipAddress/userview_travelcompany_package"),
          body: {"tid": companyId}
      );

      if (response.statusCode == 200) {
        var jsonData = json.decode(response.body);
        List<Package> fetchedPackages = [];

        for (var packageData in jsonData["message"]) {
          Package package = Package(
            id: packageData["id"].toString(),
            title: packageData["title"] ?? "",
            photo1: "$ipAddress${packageData["photo1"] ?? ""}",
            photo2: "$ipAddress${packageData["photo2"] ?? ""}",
            photo3: "$ipAddress${packageData["photo3"] ?? ""}",
            amount: packageData["amount"] ?? "0",
            packageDetails: packageData["package_details"] ?? "",
          );
          fetchedPackages.add(package);
        }

        setState(() {
          packages = fetchedPackages;
          isLoading = false;
        });
      } else {
        setState(() {
          isLoading = false;
          errorMessage = 'Failed to load packages: ${response.statusCode}';
        });
      }
    } catch (e) {
      setState(() {
        isLoading = false;
        errorMessage = 'Error: $e';
      });
    }
  }

  List<String> _getPhotoList(Package package) {
    List<String> photos = [];
    if (package.photo1.isNotEmpty) photos.add(package.photo1);
    if (package.photo2.isNotEmpty) photos.add(package.photo2);
    if (package.photo3.isNotEmpty) photos.add(package.photo3);
    return photos;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF0F2A1D),
        elevation: 0,
        title: const Text(
          'Company Packages',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => const view_travel_company()),
            );
          },
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.refresh, color: Colors.white),
            onPressed: _getPackages,
            tooltip: 'Refresh',
          ),
        ],
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              const Color(0xFF0F2A1D).withOpacity(0.1),
              const Color(0xFF1A3F2B).withOpacity(0.05),
              const Color(0xFFE3EED4),
            ],
          ),
        ),
        child: isLoading
            ? const Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CircularProgressIndicator(
                color: Color(0xFF0F2A1D),
              ),
              SizedBox(height: 20),
              Text(
                'Loading Packages...',
                style: TextStyle(
                  fontSize: 16,
                  color: Color(0xFF0F2A1D),
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
        )
            : errorMessage.isNotEmpty
            ? Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(
                Icons.error_outline,
                size: 60,
                color: Colors.grey,
              ),
              const SizedBox(height: 20),
              Text(
                errorMessage,
                style: const TextStyle(
                  fontSize: 18,
                  color: Colors.grey,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: _getPackages,
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF0F2A1D),
                ),
                child: const Text('Retry'),
              ),
            ],
          ),
        )
            : packages.isEmpty
            ? Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: 120,
                height: 120,
                decoration: BoxDecoration(
                  color: const Color(0xFF0F2A1D).withOpacity(0.1),
                  shape: BoxShape.circle,
                ),
                child: const Icon(
                  Icons.card_travel,
                  size: 60,
                  color: Color(0xFF0F2A1D),
                ),
              ),
              const SizedBox(height: 20),
              const Text(
                'No Packages Available',
                style: TextStyle(
                  fontSize: 22,
                  color: Color(0xFF0F2A1D),
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 10),
              Text(
                'This company has no packages at the moment',
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.grey[600],
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 30),
              ElevatedButton.icon(
                onPressed: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) => const view_travel_company()),
                  );
                },
                icon: const Icon(Icons.arrow_back),
                label: const Text('Back to Company'),
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF0F2A1D),
                  padding: const EdgeInsets.symmetric(
                    horizontal: 30,
                    vertical: 15,
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
              ),
            ],
          ),
        )
            : ListView.builder(
          padding: const EdgeInsets.all(16),
          itemCount: packages.length,
          itemBuilder: (context, index) {
            return _buildPackageCard(packages[index]);
          },
        ),
      ),
    );
  }

  Widget _buildPackageCard(Package package) {
    List<String> photos = _getPhotoList(package);

    return Container(
      margin: const EdgeInsets.only(bottom: 20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.2),
            spreadRadius: 2,
            blurRadius: 15,
            offset: const Offset(0, 5),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Package Header with Title
          Container(
            padding: const EdgeInsets.all(20),
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [Color(0xFF0F2A1D), Color(0xFF1A3F2B)],
              ),
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20),
                topRight: Radius.circular(20),
              ),
            ),
            child: Row(
              children: [
                Container(
                  width: 50,
                  height: 50,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: const Icon(
                    Icons.card_travel,
                    color: Color(0xFF0F2A1D),
                    size: 28,
                  ),
                ),
                const SizedBox(width: 15),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'PACKAGE TITLE',
                        style: TextStyle(
                          fontSize: 12,
                          color: Colors.white70,
                          fontWeight: FontWeight.w500,
                          letterSpacing: 1,
                        ),
                      ),
                      Text(
                        package.title,
                        style: const TextStyle(
                          fontSize: 22,
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),

          Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Package Details Section
                const Row(
                  children: [
                    Icon(Icons.list_alt, color: Color(0xFF0F2A1D), size: 20),
                    SizedBox(width: 8),
                    Text(
                      'Package Details',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF0F2A1D),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 12),
                Container(
                  padding: const EdgeInsets.all(15),
                  decoration: BoxDecoration(
                    color: const Color(0xFFE3EED4).withOpacity(0.3),
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(color: Colors.grey[200]!),
                  ),
                  child: Text(
                    package.packageDetails,
                    style: const TextStyle(
                      color: Colors.grey,
                      fontSize: 14,
                      height: 1.5,
                    ),
                  ),
                ),
                const SizedBox(height: 20),

                // Package Photos
                const Row(
                  children: [
                    Icon(Icons.photo_library, color: Color(0xFF0F2A1D), size: 20),
                    SizedBox(width: 8),
                    Text(
                      'Package Photos',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF0F2A1D),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 12),
                Text(
                  '${photos.length} photos available',
                  style: TextStyle(
                    color: Colors.grey[600],
                    fontSize: 14,
                  ),
                ),
                const SizedBox(height: 15),

                // Photo Grid
                if (photos.isNotEmpty)
                  GridView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3,
                      crossAxisSpacing: 10,
                      mainAxisSpacing: 10,
                      childAspectRatio: 1,
                    ),
                    itemCount: photos.length,
                    itemBuilder: (context, index) {
                      return ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: Image.network(
                          photos[index],
                          fit: BoxFit.cover,
                          loadingBuilder: (context, child, loadingProgress) {
                            if (loadingProgress == null) return child;
                            return Container(
                              color: Colors.grey[200],
                              child: Center(
                                child: CircularProgressIndicator(
                                  value: loadingProgress.expectedTotalBytes != null
                                      ? loadingProgress.cumulativeBytesLoaded /
                                      loadingProgress.expectedTotalBytes!
                                      : null,
                                ),
                              ),
                            );
                          },
                          errorBuilder: (context, error, stackTrace) {
                            return Container(
                              color: Colors.grey[200],
                              child: const Icon(
                                Icons.broken_image,
                                color: Colors.grey,
                                size: 30,
                              ),
                            );
                          },
                        ),
                      );
                    },
                  ),
                const SizedBox(height: 20),

                // Price Section
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                  decoration: BoxDecoration(
                    gradient: const LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                      colors: [Color(0xFF0F2A1D), Color(0xFF1A3F2B)],
                    ),
                    borderRadius: BorderRadius.circular(12),
                    boxShadow: [
                      BoxShadow(
                        color: const Color(0xFF0F2A1D).withOpacity(0.3),
                        blurRadius: 10,
                        offset: const Offset(0, 5),
                      ),
                    ],
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Row(
                            children: [
                              Icon(
                                Icons.price_change,
                                color: Colors.white,
                                size: 18,
                              ),
                              SizedBox(width: 8),
                              Text(
                                'PACKAGE PRICE',
                                style: TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                  letterSpacing: 1,
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 8),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Text(
                                '₹${package.amount}',
                                style: const TextStyle(
                                  fontSize: 32,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                ),
                              ),
                              const SizedBox(width: 8),
                              const Text(
                                '/ person',
                                style: TextStyle(
                                  fontSize: 14,
                                  color: Colors.white70,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                      Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 16,
                          vertical: 8,
                        ),
                        decoration: BoxDecoration(
                          color: Colors.white.withOpacity(0.2),
                          borderRadius: BorderRadius.circular(25),
                          border: Border.all(
                            color: Colors.white.withOpacity(0.3),
                            width: 1.5,
                          ),
                        ),
                        child: const Row(
                          children: [
                            Icon(
                              Icons.star,
                              color: Colors.white,
                              size: 16,
                            ),
                            SizedBox(width: 4),
                            Text(
                              'Best Price',
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w600,
                                fontSize: 12,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 20),

                // Special Features
                Container(
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: const Color(0xFF0F2A1D).withOpacity(0.05),
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(
                      color: const Color(0xFF0F2A1D).withOpacity(0.1),
                    ),
                  ),
                  child: Row(
                    children: [
                      Expanded(
                        child: Row(
                          children: [
                            Container(
                              padding: const EdgeInsets.all(8),
                              decoration: BoxDecoration(
                                color: Colors.green[50],
                                borderRadius: BorderRadius.circular(8),
                              ),
                              child: const Icon(
                                Icons.verified,
                                color: Colors.green,
                                size: 20,
                              ),
                            ),
                            const SizedBox(width: 12),
                            const Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Verified Package',
                                    style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.bold,
                                      color: Color(0xFF0F2A1D),
                                    ),
                                  ),
                                  SizedBox(height: 2),
                                  Text(
                                    'Authentic travel experience',
                                    style: TextStyle(
                                      fontSize: 12,
                                      color: Colors.grey,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        height: 30,
                        width: 1,
                        color: Colors.grey[300],
                      ),
                      Expanded(
                        child: Row(
                          children: [
                            Container(
                              padding: const EdgeInsets.all(8),
                              decoration: BoxDecoration(
                                color: Colors.blue[50],
                                borderRadius: BorderRadius.circular(8),
                              ),
                              child: const Icon(
                                Icons.support_agent,
                                color: Colors.blue,
                                size: 20,
                              ),
                            ),
                            const SizedBox(width: 12),
                            const Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  // Text(
                                  //   '24/7 Support',
                                  //   style: TextStyle(
                                  //     fontSize: 14,
                                  //     fontWeight: FontWeight.bold,
                                  //     color: Color(0xFF0F2A1D),
                                  //   ),
                                  // ),
                                  SizedBox(height: 2),
                                  Text(
                                    'Assistance anytime',
                                    style: TextStyle(
                                      fontSize: 12,
                                      color: Colors.grey,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),

          // Action Buttons
          Container(
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: const Color(0xFFE3EED4).withOpacity(0.5),
              borderRadius: const BorderRadius.only(
                bottomLeft: Radius.circular(20),
                bottomRight: Radius.circular(20),
              ),
              border: Border(
                top: BorderSide(color: Colors.grey[300]!),
              ),
            ),
            child: Column(
              children: [
                const Text(
                  'Ready to Book?',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    color: Colors.grey,
                  ),
                ),
                const SizedBox(height: 15),
                Row(
                  children: [
                    // Book Button
                    Expanded(
                      child: ElevatedButton.icon(
                        onPressed: () async {
                          SharedPreferences sh = await SharedPreferences.getInstance();
                          sh.setString('ownid', package.id);
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => const booking()),
                          );
                        },
                        icon: const Icon(Icons.book_online, size: 20),
                        label: const Text('Book Now'),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xFF0F2A1D),
                          foregroundColor: Colors.white,
                          padding: const EdgeInsets.symmetric(vertical: 15),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                          elevation: 5,
                          shadowColor: const Color(0xFF0F2A1D).withOpacity(0.5),
                        ),
                      ),
                    ),

                    const SizedBox(width: 10),

                    // Extra Details Button
                    Expanded(
                      child: ElevatedButton.icon(
                        onPressed: () async {
                          SharedPreferences sh = await SharedPreferences.getInstance();
                          sh.setString('oid', package.id);
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => const view_extradetails()),
                          );
                        },
                        icon: const Icon(Icons.info_outline, size: 20),
                        label: const Text('Extra Details'),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.white,
                          foregroundColor: const Color(0xFF0F2A1D),
                          padding: const EdgeInsets.symmetric(vertical: 15),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                            side: const BorderSide(color: Color(0xFF0F2A1D), width: 2),
                          ),
                          elevation: 3,
                          shadowColor: Colors.grey.withOpacity(0.3),
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 10),
                const Text(
                  'Book now to secure your spot or view extra details',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 12,
                    color: Colors.grey,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class Package {
  final String id;
  final String title;
  final String photo1;
  final String photo2;
  final String photo3;
  final String amount;
  final String packageDetails;

  Package({
    required this.id,
    required this.title,
    required this.photo1,
    required this.photo2,
    required this.photo3,
    required this.amount,
    required this.packageDetails,
  });
}

class Joke {
  final String id;
  final String title;
  final String description;
  final String photo1;
  final String photo2;
  final String photo3;
  final String amount;
  final String package_details;

  Joke(
      this.id,
      this.title,
      this.description,
      this.photo1,
      this.photo2,
      this.photo3,
      this.amount,
      this.package_details,
      );
}