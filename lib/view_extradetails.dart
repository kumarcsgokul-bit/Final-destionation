// import 'dart:convert';
//
// import 'package:final_destination/booking.dart';
// import 'package:flutter/material.dart';
// import 'package:http/http.dart' as http;
// import 'package:shared_preferences/shared_preferences.dart';
//
// void main(){
//   runApp(view_extradetails());
//
// }
// class view_extradetails extends StatelessWidget {
//   const view_extradetails({Key? key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(home: view_extradetailssub(),);
//   }
// }
// class view_extradetailssub extends StatefulWidget {
//   const view_extradetailssub({Key? key}) : super(key: key);
//
//   @override
//   State<view_extradetailssub> createState() => _view_extradetailssubState();
// }
//
// class _view_extradetailssubState extends State<view_extradetailssub> {
//   Future<List<Joke>> _getJokes() async {
//     SharedPreferences prefs = await SharedPreferences.getInstance();
//     String b = prefs.getString("lid").toString();
//     String foodimage="";
//     var data =
//     await http.post(Uri.parse(prefs.getString("ip").toString()+"/userview_extradetails"),
//         body: {"oid":prefs.getString('oid').toString()}
//     );
//
//     var jsonData = json.decode(data.body);
// //    print(jsonData);
//     List<Joke> jokes = [];
//     for (var joke in jsonData["message"]) {
//       print(joke);
//       Joke newJoke = Joke(
//         joke["id"].toString(),
//         joke["stay"].toString(),
//         prefs.getString('ip').toString()+joke["photo1"].toString(),
//         prefs.getString('ip').toString()+joke["photo2"].toString(),
//         prefs.getString('ip').toString()+joke["photo3"].toString(),
//         prefs.getString('ip').toString()+joke["photo4"].toString(),
//         prefs.getString('ip').toString()+joke["menu"].toString(),
//         joke["staydetails"].toString(),
//         joke["maxno"].toString(),
//         joke["minno"].toString(),
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
//                           _buildRow("stay:", i.stay.toString()),
//                           Image.network(i.photo1.toString(),height: 200,width: 200,),
//                           Image.network(i.photo2.toString(),height: 200,width: 200,),
//                           Image.network(i.photo3.toString(),height: 200,width: 200,),
//                           Image.network(i.photo4.toString(),height: 200,width: 200,),
//                           Image.network(i.menu.toString(),height: 200,width: 200,),
//                           _buildRow("staydetails:", i.staydetails.toString()),
//                           _buildRow("maxno:", i.maxno.toString()),
//                           _buildRow("minno:", i.minno.toString()),
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
//   final String stay;
//   final String photo1;
//   final String photo2;
//   final String photo3;
//   final String photo4;
//   final String menu;
//   final String staydetails;
//   final String maxno;
//   final String minno;
//
//
//
//   Joke(this.id,this.stay,this.photo1,this.photo2,this.photo3,this.photo4,this.menu, this.staydetails,this.maxno,this.minno);
// //  print("hiiiii");
// }



//
// import 'dart:async';
// import 'dart:convert';
// import 'package:final_destination/booking.dart';
// import 'package:flutter/material.dart';
// import 'package:http/http.dart' as http;
// import 'package:shared_preferences/shared_preferences.dart';
//
// void main() {
//   runApp(const view_extradetails());
// }
//
// class view_extradetails extends StatelessWidget {
//   const view_extradetails({Key? key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       theme: ThemeData(
//         primaryColor: const Color(0xFF1A237E),
//         fontFamily: 'Poppins',
//       ),
//       home: const view_extradetailssub(),
//     );
//   }
// }
//
// class view_extradetailssub extends StatefulWidget {
//   const view_extradetailssub({Key? key}) : super(key: key);
//
//   @override
//   State<view_extradetailssub> createState() => _view_extradetailssubState();
// }
//
// class _view_extradetailssubState extends State<view_extradetailssub> {
//   List<ExtraDetail> details = [];
//   bool isLoading = true;
//   String errorMessage = '';
//   PageController _pageController = PageController();
//   int _currentPage = 0;
//   Timer? _autoSlideTimer;
//
//   @override
//   void initState() {
//     super.initState();
//     _getExtraDetails();
//   }
//
//   @override
//   void dispose() {
//     _pageController.dispose();
//     _autoSlideTimer?.cancel();
//     super.dispose();
//   }
//
//   void _startAutoSlide(int photoCount) {
//     if (photoCount <= 1) return;
//
//     _autoSlideTimer?.cancel();
//     _autoSlideTimer = Timer.periodic(const Duration(seconds: 2), (timer) {
//       if (_pageController.hasClients) {
//         int nextPage = _currentPage + 1;
//         if (nextPage >= photoCount) {
//           nextPage = 0;
//         }
//         _pageController.animateToPage(
//           nextPage,
//           duration: const Duration(milliseconds: 400),
//           curve: Curves.easeInOut,
//         );
//       }
//     });
//   }
//
//   Future<void> _getExtraDetails() async {
//     try {
//       SharedPreferences prefs = await SharedPreferences.getInstance();
//       String packageId = prefs.getString('oid') ?? "";
//       String ipAddress = prefs.getString("ip") ?? "http://localhost";
//
//       var response = await http.post(
//           Uri.parse("$ipAddress/userview_extradetails"),
//           body: {"oid": packageId}
//       );
//
//       if (response.statusCode == 200) {
//         var jsonData = json.decode(response.body);
//         List<ExtraDetail> fetchedDetails = [];
//
//         for (var detail in jsonData["message"]) {
//           ExtraDetail newDetail = ExtraDetail(
//             id: detail["id"].toString(),
//             stay: detail["stay"]?.toString() ?? "",
//             photo1: "$ipAddress${detail["photo1"] ?? ""}",
//             photo2: "$ipAddress${detail["photo2"] ?? ""}",
//             photo3: "$ipAddress${detail["photo3"] ?? ""}",
//             photo4: "$ipAddress${detail["photo4"] ?? ""}",
//             menu: "$ipAddress${detail["menu"] ?? ""}",
//             staydetails: detail["staydetails"]?.toString() ?? "",
//             maxno: detail["maxno"]?.toString() ?? "",
//             minno: detail["minno"]?.toString() ?? "",
//           );
//           fetchedDetails.add(newDetail);
//         }
//
//         setState(() {
//           details = fetchedDetails;
//           isLoading = false;
//         });
//
//         if (fetchedDetails.isNotEmpty) {
//           int photoCount = _getPhotoList(fetchedDetails.first).length;
//           _startAutoSlide(photoCount);
//         }
//       } else {
//         setState(() {
//           isLoading = false;
//           errorMessage = 'Failed to load extra details: ${response.statusCode}';
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
//   List<String> _getPhotoList(ExtraDetail detail) {
//     List<String> photos = [];
//     if (detail.photo1.isNotEmpty) photos.add(detail.photo1);
//     if (detail.photo2.isNotEmpty) photos.add(detail.photo2);
//     if (detail.photo3.isNotEmpty) photos.add(detail.photo3);
//     if (detail.photo4.isNotEmpty) photos.add(detail.photo4);
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
//           'Package Extra Details',
//           style: TextStyle(
//             fontSize: 20,
//             fontWeight: FontWeight.bold,
//           ),
//         ),
//         centerTitle: true,
//         leading: IconButton(
//           icon: const Icon(Icons.arrow_back),
//           onPressed: () {
//             Navigator.pop(context);
//           },
//         ),
//         actions: [
//           IconButton(
//             icon: const Icon(Icons.refresh),
//             onPressed: _getExtraDetails,
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
//                 'Loading Extra Details...',
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
//                 onPressed: _getExtraDetails,
//                 child: const Text('Retry'),
//               ),
//             ],
//           ),
//         )
//             : details.isEmpty
//             ? Center(
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: [
//               const Icon(
//                 Icons.info_outline,
//                 size: 60,
//                 color: Colors.grey,
//               ),
//               const SizedBox(height: 20),
//               const Text(
//                 'No extra details available',
//                 style: TextStyle(
//                   fontSize: 18,
//                   color: Colors.grey,
//                 ),
//               ),
//               const SizedBox(height: 10),
//               const Text(
//                 'Check back for additional package information',
//                 style: TextStyle(
//                   fontSize: 14,
//                   color: Colors.grey,
//                 ),
//                 textAlign: TextAlign.center,
//               ),
//               const SizedBox(height: 20),
//               ElevatedButton(
//                 onPressed: () => Navigator.pop(context),
//                 child: const Text('Go Back'),
//               ),
//             ],
//           ),
//         )
//             : ListView.builder(
//           padding: const EdgeInsets.all(16),
//           itemCount: details.length,
//           itemBuilder: (context, index) {
//             return _buildExtraDetailCard(details[index]);
//           },
//         ),
//       ),
//     );
//   }
//
//   Widget _buildExtraDetailCard(ExtraDetail detail) {
//     List<String> photos = _getPhotoList(detail);
//
//     return Container(
//       margin: const EdgeInsets.only(bottom: 20),
//       decoration: BoxDecoration(
//         color: Colors.white,
//         borderRadius: BorderRadius.circular(20),
//         boxShadow: [
//           BoxShadow(
//             color: Colors.grey.withOpacity(0.3),
//             spreadRadius: 2,
//             blurRadius: 15,
//             offset: const Offset(0, 5),
//           ),
//         ],
//       ),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           // Stay Information Header
//           Container(
//             padding: const EdgeInsets.all(20),
//             decoration: BoxDecoration(
//               color: const Color(0xFF1A237E),
//               borderRadius: const BorderRadius.only(
//                 topLeft: Radius.circular(20),
//                 topRight: Radius.circular(20),
//               ),
//               boxShadow: [
//                 BoxShadow(
//                   color: Colors.blue.withOpacity(0.2),
//                   blurRadius: 10,
//                   offset: const Offset(0, 3),
//                 ),
//               ],
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
//                     Icons.hotel,
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
//                         'STAY INFORMATION',
//                         style: TextStyle(
//                           fontSize: 12,
//                           color: Colors.white70,
//                           fontWeight: FontWeight.w500,
//                           letterSpacing: 1,
//                         ),
//                       ),
//                       Text(
//                         detail.stay,
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
//           // Stay Details
//           Padding(
//             padding: const EdgeInsets.all(20),
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 // Stay Details Section
//                 const Row(
//                   children: [
//                     Icon(Icons.description, color: Color(0xFF1A237E), size: 20),
//                     SizedBox(width: 8),
//                     Text(
//                       'Stay Details',
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
//                     detail.staydetails,
//                     style: const TextStyle(
//                       color: Colors.grey,
//                       fontSize: 14,
//                       height: 1.5,
//                     ),
//                   ),
//                 ),
//                 const SizedBox(height: 25),
//
//                 // Guest Capacity Section
//                 const Row(
//                   children: [
//                     Icon(Icons.people, color: Color(0xFF1A237E), size: 20),
//                     SizedBox(width: 8),
//                     Text(
//                       'Guest Capacity',
//                       style: TextStyle(
//                         fontSize: 18,
//                         fontWeight: FontWeight.bold,
//                         color: Color(0xFF1A237E),
//                       ),
//                     ),
//                   ],
//                 ),
//                 const SizedBox(height: 12),
//                 Row(
//                   children: [
//                     Expanded(
//                       child: _buildCapacityCard(
//                         title: 'MINIMUM GUESTS',
//                         value: detail.minno,
//                         icon: Icons.person_outline,
//                         color: Colors.blue,
//                       ),
//                     ),
//                     const SizedBox(width: 15),
//                     Expanded(
//                       child: _buildCapacityCard(
//                         title: 'MAXIMUM GUESTS',
//                         value: detail.maxno,
//                         icon: Icons.people_outline,
//                         color: Colors.green,
//                       ),
//                     ),
//                   ],
//                 ),
//                 const SizedBox(height: 25),
//
//                 // Photo Gallery Automatic Slideshow
//                 const Row(
//                   children: [
//                     Icon(Icons.photo_library, color: Color(0xFF1A237E), size: 20),
//                     SizedBox(width: 8),
//                     Text(
//                       'Photo Gallery',
//                       style: TextStyle(
//                         fontSize: 18,
//                         fontWeight: FontWeight.bold,
//                         color: Color(0xFF1A237E),
//                       ),
//                     ),
//                   ],
//                 ),
//                 const SizedBox(height: 12),
//                 Row(
//                   children: [
//                     Text(
//                       '${photos.length} photos available',
//                       style: TextStyle(
//                         color: Colors.grey[600],
//                         fontSize: 14,
//                       ),
//                     ),
//                     const Spacer(),
//                     Container(
//                       padding: const EdgeInsets.symmetric(
//                         horizontal: 10,
//                         vertical: 5,
//                       ),
//                       decoration: BoxDecoration(
//                         color: Colors.blue[50],
//                         borderRadius: BorderRadius.circular(20),
//                       ),
//                       child: const Row(
//                         children: [
//                           Icon(
//                             Icons.speed,
//                             size: 16,
//                             color: Color(0xFF1A237E),
//                           ),
//                           SizedBox(width: 5),
//                           Text(
//                             'Auto-Sliding',
//                             style: TextStyle(
//                               fontSize: 12,
//                               color: Color(0xFF1A237E),
//                               fontWeight: FontWeight.w500,
//                             ),
//                           ),
//                         ],
//                       ),
//                     ),
//                   ],
//                 ),
//                 const SizedBox(height: 15),
//
//                 // Automatic Slideshow Container
//                 if (photos.isNotEmpty)
//                   Container(
//                     height: 300,
//                     decoration: BoxDecoration(
//                       borderRadius: BorderRadius.circular(15),
//                       boxShadow: [
//                         BoxShadow(
//                           color: Colors.grey.withOpacity(0.3),
//                           blurRadius: 15,
//                           spreadRadius: 2,
//                         ),
//                       ],
//                     ),
//                     child: Stack(
//                       children: [
//                         // PageView for automatic slideshow
//                         PageView.builder(
//                           controller: _pageController,
//                           onPageChanged: (int page) {
//                             setState(() {
//                               _currentPage = page;
//                             });
//                           },
//                           itemCount: photos.length,
//                           itemBuilder: (context, index) {
//                             return ClipRRect(
//                               borderRadius: BorderRadius.circular(15),
//                               child: Image.network(
//                                 photos[index],
//                                 fit: BoxFit.cover,
//                                 width: double.infinity,
//                                 loadingBuilder: (context, child, loadingProgress) {
//                                   if (loadingProgress == null) return child;
//                                   return Container(
//                                     color: Colors.grey[200],
//                                     child: Center(
//                                       child: CircularProgressIndicator(
//                                         value: loadingProgress.expectedTotalBytes != null
//                                             ? loadingProgress.cumulativeBytesLoaded /
//                                             loadingProgress.expectedTotalBytes!
//                                             : null,
//                                       ),
//                                     ),
//                                   );
//                                 },
//                                 errorBuilder: (context, error, stackTrace) {
//                                   return Container(
//                                     color: Colors.grey[200],
//                                     child: const Center(
//                                       child: Column(
//                                         mainAxisAlignment: MainAxisAlignment.center,
//                                         children: [
//                                           Icon(
//                                             Icons.broken_image,
//                                             size: 50,
//                                             color: Colors.grey,
//                                           ),
//                                           SizedBox(height: 10),
//                                           Text(
//                                             'Image not available',
//                                             style: TextStyle(
//                                               color: Colors.grey,
//                                             ),
//                                           ),
//                                         ],
//                                       ),
//                                     ),
//                                   );
//                                 },
//                               ),
//                             );
//                           },
//                         ),
//
//                         // Left navigation arrow
//                         if (photos.length > 1)
//                           Positioned(
//                             left: 10,
//                             top: 0,
//                             bottom: 0,
//                             child: Center(
//                               child: GestureDetector(
//                                 onTap: () {
//                                   if (_currentPage > 0) {
//                                     _pageController.previousPage(
//                                       duration: const Duration(milliseconds: 300),
//                                       curve: Curves.easeInOut,
//                                     );
//                                   }
//                                 },
//                                 child: Container(
//                                   width: 40,
//                                   height: 40,
//                                   decoration: BoxDecoration(
//                                     color: Colors.black.withOpacity(0.5),
//                                     shape: BoxShape.circle,
//                                   ),
//                                   child: const Icon(
//                                     Icons.arrow_back_ios,
//                                     color: Colors.white,
//                                     size: 20,
//                                   ),
//                                 ),
//                               ),
//                             ),
//                           ),
//
//                         // Right navigation arrow
//                         if (photos.length > 1)
//                           Positioned(
//                             right: 10,
//                             top: 0,
//                             bottom: 0,
//                             child: Center(
//                               child: GestureDetector(
//                                 onTap: () {
//                                   if (_currentPage < photos.length - 1) {
//                                     _pageController.nextPage(
//                                       duration: const Duration(milliseconds: 300),
//                                       curve: Curves.easeInOut,
//                                     );
//                                   }
//                                 },
//                                 child: Container(
//                                   width: 40,
//                                   height: 40,
//                                   decoration: BoxDecoration(
//                                     color: Colors.black.withOpacity(0.5),
//                                     shape: BoxShape.circle,
//                                   ),
//                                   child: const Icon(
//                                     Icons.arrow_forward_ios,
//                                     color: Colors.white,
//                                     size: 20,
//                                   ),
//                                 ),
//                               ),
//                             ),
//                           ),
//
//                         // Page indicators
//                         if (photos.length > 1)
//                           Positioned(
//                             bottom: 15,
//                             left: 0,
//                             right: 0,
//                             child: Row(
//                               mainAxisAlignment: MainAxisAlignment.center,
//                               children: List.generate(
//                                 photos.length,
//                                     (index) => AnimatedContainer(
//                                   duration: const Duration(milliseconds: 300),
//                                   margin: const EdgeInsets.symmetric(horizontal: 4),
//                                   width: _currentPage == index ? 12 : 8,
//                                   height: _currentPage == index ? 12 : 8,
//                                   decoration: BoxDecoration(
//                                     shape: BoxShape.circle,
//                                     color: _currentPage == index
//                                         ? Colors.white
//                                         : Colors.white.withOpacity(0.5),
//                                     border: Border.all(
//                                       color: Colors.black.withOpacity(0.2),
//                                       width: 1,
//                                     ),
//                                   ),
//                                 ),
//                               ),
//                             ),
//                           ),
//
//                         // Image counter with speed indicator
//                         Positioned(
//                           top: 15,
//                           right: 15,
//                           child: Container(
//                             padding: const EdgeInsets.symmetric(
//                               horizontal: 12,
//                               vertical: 8,
//                             ),
//                             decoration: BoxDecoration(
//                               color: Colors.black.withOpacity(0.7),
//                               borderRadius: BorderRadius.circular(25),
//                               border: Border.all(
//                                 color: Colors.white.withOpacity(0.3),
//                                 width: 1,
//                               ),
//                             ),
//                             child: Row(
//                               children: [
//                                 const Icon(
//                                   Icons.flash_on,
//                                   size: 14,
//                                   color: Colors.white,
//                                 ),
//                                 const SizedBox(width: 8),
//                                 Text(
//                                   '${_currentPage + 1} / ${photos.length}',
//                                   style: const TextStyle(
//                                     color: Colors.white,
//                                     fontSize: 14,
//                                     fontWeight: FontWeight.bold,
//                                   ),
//                                 ),
//                               ],
//                             ),
//                           ),
//                         ),
//                       ],
//                     ),
//                   ),
//                 const SizedBox(height: 25),
//
//                 // Menu Section
//                 const Row(
//                   children: [
//                     Icon(Icons.restaurant_menu, color: Color(0xFF1A237E), size: 20),
//                     SizedBox(width: 8),
//                     Text(
//                       'Menu',
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
//                   'Food and beverage menu available',
//                   style: TextStyle(
//                     color: Colors.grey[600],
//                     fontSize: 14,
//                   ),
//                 ),
//                 const SizedBox(height: 15),
//                 Container(
//                   height: 250,
//                   decoration: BoxDecoration(
//                     borderRadius: BorderRadius.circular(15),
//                     border: Border.all(color: Colors.grey[300]!),
//                     boxShadow: [
//                       BoxShadow(
//                         color: Colors.grey.withOpacity(0.1),
//                         blurRadius: 8,
//                         offset: const Offset(0, 2),
//                       ),
//                     ],
//                   ),
//                   child: ClipRRect(
//                     borderRadius: BorderRadius.circular(15),
//                     child: Image.network(
//                       detail.menu,
//                       fit: BoxFit.cover,
//                       width: double.infinity,
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
//                                 Icons.restaurant_menu,
//                                 size: 50,
//                                 color: Colors.grey,
//                               ),
//                               const SizedBox(height: 10),
//                               const Text(
//                                 'Menu Image',
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
//           // Action Button
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
//                   'Ready to Book This Package?',
//                   style: TextStyle(
//                     fontSize: 16,
//                     fontWeight: FontWeight.w600,
//                     color: Colors.grey,
//                   ),
//                 ),
//                 const SizedBox(height: 15),
//                 SizedBox(
//                   width: double.infinity,
//                   height: 56,
//                   child: ElevatedButton.icon(
//                     onPressed: () async {
//                       SharedPreferences sh = await SharedPreferences.getInstance();
//                       sh.setString('ownid', detail.id);
//                       Navigator.push(
//                         context,
//                         MaterialPageRoute(builder: (context) => const booking()),
//                       );
//                     },
//                     icon: const Icon(Icons.book_online, size: 22),
//                     label: const Text(
//                       'Book This Package Now',
//                       style: TextStyle(
//                         fontSize: 16,
//                         fontWeight: FontWeight.bold,
//                       ),
//                     ),
//                     style: ElevatedButton.styleFrom(
//                       backgroundColor: const Color(0xFF1A237E),
//                       foregroundColor: Colors.white,
//                       padding: const EdgeInsets.symmetric(vertical: 15),
//                       shape: RoundedRectangleBorder(
//                         borderRadius: BorderRadius.circular(12),
//                       ),
//                       elevation: 5,
//                       shadowColor: const Color(0xFF1A237E).withOpacity(0.5),
//                     ),
//                   ),
//                 ),
//                 const SizedBox(height: 10),
//                 const Text(
//                   'Secure your spot with this amazing stay package',
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
//
//   Widget _buildCapacityCard({
//     required String title,
//     required String value,
//     required IconData icon,
//     required Color color,
//   }) {
//     return Container(
//       padding: const EdgeInsets.all(15),
//       decoration: BoxDecoration(
//         color: color.withOpacity(0.1),
//         borderRadius: BorderRadius.circular(12),
//         border: Border.all(color: color.withOpacity(0.3)),
//       ),
//       child: Column(
//         children: [
//           Icon(icon, color: color, size: 28),
//           const SizedBox(height: 10),
//           Text(
//             title,
//             style: TextStyle(
//               fontSize: 12,
//               fontWeight: FontWeight.bold,
//               color: color,
//               letterSpacing: 0.5,
//             ),
//           ),
//           const SizedBox(height: 8),
//           Text(
//             value,
//             style: TextStyle(
//               fontSize: 24,
//               fontWeight: FontWeight.w800,
//               color: color,
//             ),
//           ),
//           const SizedBox(height: 5),
//           Text(
//             title.contains('MINIMUM') ? 'Persons Minimum' : 'Persons Maximum',
//             style: TextStyle(
//               fontSize: 11,
//               color: color.withOpacity(0.8),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
//
// class ExtraDetail {
//   final String id;
//   final String stay;
//   final String photo1;
//   final String photo2;
//   final String photo3;
//   final String photo4;
//   final String menu;
//   final String staydetails;
//   final String maxno;
//   final String minno;
//
//   ExtraDetail({
//     required this.id,
//     required this.stay,
//     required this.photo1,
//     required this.photo2,
//     required this.photo3,
//     required this.photo4,
//     required this.menu,
//     required this.staydetails,
//     required this.maxno,
//     required this.minno,
//   });
// }





// import 'dart:async';
// import 'dart:convert';
// import 'package:final_destination/booking.dart';
// import 'package:final_destination/viewpackage.dart'; // Add this import
// import 'package:flutter/material.dart';
// import 'package:http/http.dart' as http;
// import 'package:shared_preferences/shared_preferences.dart';
//
// void main() {
//   runApp(const view_extradetails());
// }
//
// class view_extradetails extends StatelessWidget {
//   const view_extradetails({Key? key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       theme: ThemeData(
//         primaryColor: const Color(0xFF1A237E),
//         fontFamily: 'Poppins',
//       ),
//       home: const view_extradetailssub(),
//     );
//   }
// }
//
// class view_extradetailssub extends StatefulWidget {
//   const view_extradetailssub({Key? key}) : super(key: key);
//
//   @override
//   State<view_extradetailssub> createState() => _view_extradetailssubState();
// }
//
// class _view_extradetailssubState extends State<view_extradetailssub> {
//   List<ExtraDetail> details = [];
//   bool isLoading = true;
//   String errorMessage = '';
//   PageController _pageController = PageController();
//   int _currentPage = 0;
//   Timer? _autoSlideTimer;
//
//   @override
//   void initState() {
//     super.initState();
//     _getExtraDetails();
//   }
//
//   @override
//   void dispose() {
//     _pageController.dispose();
//     _autoSlideTimer?.cancel();
//     super.dispose();
//   }
//
//   void _startAutoSlide(int photoCount) {
//     if (photoCount <= 1) return;
//
//     _autoSlideTimer?.cancel();
//     _autoSlideTimer = Timer.periodic(const Duration(seconds: 2), (timer) {
//       if (_pageController.hasClients) {
//         int nextPage = _currentPage + 1;
//         if (nextPage >= photoCount) {
//           nextPage = 0;
//         }
//         _pageController.animateToPage(
//           nextPage,
//           duration: const Duration(milliseconds: 400),
//           curve: Curves.easeInOut,
//         );
//       }
//     });
//   }
//
//   Future<void> _getExtraDetails() async {
//     try {
//       SharedPreferences prefs = await SharedPreferences.getInstance();
//       String packageId = prefs.getString('oid') ?? "";
//       String ipAddress = prefs.getString("ip") ?? "http://localhost";
//
//       var response = await http.post(
//           Uri.parse("$ipAddress/userview_extradetails"),
//           body: {"oid": packageId}
//       );
//
//       if (response.statusCode == 200) {
//         var jsonData = json.decode(response.body);
//         List<ExtraDetail> fetchedDetails = [];
//
//         for (var detail in jsonData["message"]) {
//           ExtraDetail newDetail = ExtraDetail(
//             id: detail["id"].toString(),
//             stay: detail["stay"]?.toString() ?? "",
//             photo1: "$ipAddress${detail["photo1"] ?? ""}",
//             photo2: "$ipAddress${detail["photo2"] ?? ""}",
//             photo3: "$ipAddress${detail["photo3"] ?? ""}",
//             photo4: "$ipAddress${detail["photo4"] ?? ""}",
//             menu: "$ipAddress${detail["menu"] ?? ""}",
//             staydetails: detail["staydetails"]?.toString() ?? "",
//             // maxno: detail["maxno"]?.toString() ?? "",
//             // minno: detail["minno"]?.toString() ?? "",
//           );
//           fetchedDetails.add(newDetail);
//         }
//
//         setState(() {
//           details = fetchedDetails;
//           isLoading = false;
//         });
//
//         if (fetchedDetails.isNotEmpty) {
//           int photoCount = _getPhotoList(fetchedDetails.first).length;
//           _startAutoSlide(photoCount);
//         }
//       } else {
//         setState(() {
//           isLoading = false;
//           errorMessage = 'Failed to load extra details: ${response.statusCode}';
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
//   List<String> _getPhotoList(ExtraDetail detail) {
//     List<String> photos = [];
//     if (detail.photo1.isNotEmpty) photos.add(detail.photo1);
//     if (detail.photo2.isNotEmpty) photos.add(detail.photo2);
//     if (detail.photo3.isNotEmpty) photos.add(detail.photo3);
//     if (detail.photo4.isNotEmpty) photos.add(detail.photo4);
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
//           'Package Extra Details',
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
//               MaterialPageRoute(builder: (context) => const viewpackage()),
//             );
//           },
//         ),
//         actions: [
//           IconButton(
//             icon: const Icon(Icons.refresh),
//             onPressed: _getExtraDetails,
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
//                 'Loading Extra Details...',
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
//                 onPressed: _getExtraDetails,
//                 child: const Text('Retry'),
//               ),
//             ],
//           ),
//         )
//             : details.isEmpty
//             ? Center(
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: [
//               const Icon(
//                 Icons.info_outline,
//                 size: 60,
//                 color: Colors.grey,
//               ),
//               const SizedBox(height: 20),
//               const Text(
//                 'No extra details available',
//                 style: TextStyle(
//                   fontSize: 18,
//                   color: Colors.grey,
//                 ),
//               ),
//               const SizedBox(height: 10),
//               const Text(
//                 'Check back for additional package information',
//                 style: TextStyle(
//                   fontSize: 14,
//                   color: Colors.grey,
//                 ),
//                 textAlign: TextAlign.center,
//               ),
//               const SizedBox(height: 20),
//               ElevatedButton(
//                 onPressed: () {
//                   Navigator.pushReplacement(
//                     context,
//                     MaterialPageRoute(builder: (context) => const viewpackage()),
//                   );
//                 },
//                 child: const Text('Go Back'),
//               ),
//             ],
//           ),
//         )
//             : ListView.builder(
//           padding: const EdgeInsets.all(16),
//           itemCount: details.length,
//           itemBuilder: (context, index) {
//             return _buildExtraDetailCard(details[index]);
//           },
//         ),
//       ),
//     );
//   }
//
//   Widget _buildExtraDetailCard(ExtraDetail detail) {
//     List<String> photos = _getPhotoList(detail);
//
//     return Container(
//       margin: const EdgeInsets.only(bottom: 20),
//       decoration: BoxDecoration(
//         color: Colors.white,
//         borderRadius: BorderRadius.circular(20),
//         boxShadow: [
//           BoxShadow(
//             color: Colors.grey.withOpacity(0.3),
//             spreadRadius: 2,
//             blurRadius: 15,
//             offset: const Offset(0, 5),
//           ),
//         ],
//       ),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           // Stay Information Header
//           Container(
//             padding: const EdgeInsets.all(20),
//             decoration: BoxDecoration(
//               color: const Color(0xFF1A237E),
//               borderRadius: const BorderRadius.only(
//                 topLeft: Radius.circular(20),
//                 topRight: Radius.circular(20),
//               ),
//               boxShadow: [
//                 BoxShadow(
//                   color: Colors.blue.withOpacity(0.2),
//                   blurRadius: 10,
//                   offset: const Offset(0, 3),
//                 ),
//               ],
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
//                     Icons.hotel,
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
//                         'STAY INFORMATION',
//                         style: TextStyle(
//                           fontSize: 12,
//                           color: Colors.white70,
//                           fontWeight: FontWeight.w500,
//                           letterSpacing: 1,
//                         ),
//                       ),
//                       Text(
//                         detail.stay,
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
//           // Stay Details
//           Padding(
//             padding: const EdgeInsets.all(20),
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 // Stay Details Section
//                 const Row(
//                   children: [
//                     Icon(Icons.description, color: Color(0xFF1A237E), size: 20),
//                     SizedBox(width: 8),
//                     Text(
//                       'Stay Details',
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
//                     detail.staydetails,
//                     style: const TextStyle(
//                       color: Colors.grey,
//                       fontSize: 14,
//                       height: 1.5,
//                     ),
//                   ),
//                 ),
//                 const SizedBox(height: 25),
//
//                 // Guest Capacity Section
//                 // const Row(
//                 //   children: [
//                 //     Icon(Icons.people, color: Color(0xFF1A237E), size: 20),
//                 //     SizedBox(width: 8),
//                 //     Text(
//                 //       'Guest Capacity',
//                 //       style: TextStyle(
//                 //         fontSize: 18,
//                 //         fontWeight: FontWeight.bold,
//                 //         color: Color(0xFF1A237E),
//                 //       ),
//                 //     ),
//                 //   ],
//                 // ),
//                 // const SizedBox(height: 12),
//                 // Row(
//                 //   children: [
//                 //     Expanded(
//                 //       child: _buildCapacityCard(
//                 //         title: 'MINIMUM GUESTS',
//                 //         value: detail.minno,
//                 //         icon: Icons.person_outline,
//                 //         color: Colors.blue,
//                 //       ),
//                 //     ),
//                 //     const SizedBox(width: 15),
//                 //     Expanded(
//                 //       child: _buildCapacityCard(
//                 //         title: 'MAXIMUM GUESTS',
//                 //         value: detail.maxno,
//                 //         icon: Icons.people_outline,
//                 //         color: Colors.green,
//                 //       ),
//                 //     ),
//                 //   ],
//                 // ),
//                 const SizedBox(height: 25),
//
//                 // Photo Gallery Automatic Slideshow
//                 const Row(
//                   children: [
//                     Icon(Icons.photo_library, color: Color(0xFF1A237E), size: 20),
//                     SizedBox(width: 8),
//                     Text(
//                       'Photo Gallery',
//                       style: TextStyle(
//                         fontSize: 18,
//                         fontWeight: FontWeight.bold,
//                         color: Color(0xFF1A237E),
//                       ),
//                     ),
//                   ],
//                 ),
//                 const SizedBox(height: 12),
//                 Row(
//                   children: [
//                     Text(
//                       '${photos.length} photos available',
//                       style: TextStyle(
//                         color: Colors.grey[600],
//                         fontSize: 14,
//                       ),
//                     ),
//                     const Spacer(),
//                     Container(
//                       padding: const EdgeInsets.symmetric(
//                         horizontal: 10,
//                         vertical: 5,
//                       ),
//                       decoration: BoxDecoration(
//                         color: Colors.blue[50],
//                         borderRadius: BorderRadius.circular(20),
//                       ),
//                       child: const Row(
//                         children: [
//                           Icon(
//                             Icons.speed,
//                             size: 16,
//                             color: Color(0xFF1A237E),
//                           ),
//                           SizedBox(width: 5),
//                           Text(
//                             'Auto-Sliding',
//                             style: TextStyle(
//                               fontSize: 12,
//                               color: Color(0xFF1A237E),
//                               fontWeight: FontWeight.w500,
//                             ),
//                           ),
//                         ],
//                       ),
//                     ),
//                   ],
//                 ),
//                 const SizedBox(height: 15),
//
//                 // Automatic Slideshow Container
//                 if (photos.isNotEmpty)
//                   Container(
//                     height: 300,
//                     decoration: BoxDecoration(
//                       borderRadius: BorderRadius.circular(15),
//                       boxShadow: [
//                         BoxShadow(
//                           color: Colors.grey.withOpacity(0.3),
//                           blurRadius: 15,
//                           spreadRadius: 2,
//                         ),
//                       ],
//                     ),
//                     child: Stack(
//                       children: [
//                         // PageView for automatic slideshow
//                         PageView.builder(
//                           controller: _pageController,
//                           onPageChanged: (int page) {
//                             setState(() {
//                               _currentPage = page;
//                             });
//                           },
//                           itemCount: photos.length,
//                           itemBuilder: (context, index) {
//                             return ClipRRect(
//                               borderRadius: BorderRadius.circular(15),
//                               child: Image.network(
//                                 photos[index],
//                                 fit: BoxFit.cover,
//                                 width: double.infinity,
//                                 loadingBuilder: (context, child, loadingProgress) {
//                                   if (loadingProgress == null) return child;
//                                   return Container(
//                                     color: Colors.grey[200],
//                                     child: Center(
//                                       child: CircularProgressIndicator(
//                                         value: loadingProgress.expectedTotalBytes != null
//                                             ? loadingProgress.cumulativeBytesLoaded /
//                                             loadingProgress.expectedTotalBytes!
//                                             : null,
//                                       ),
//                                     ),
//                                   );
//                                 },
//                                 errorBuilder: (context, error, stackTrace) {
//                                   return Container(
//                                     color: Colors.grey[200],
//                                     child: const Center(
//                                       child: Column(
//                                         mainAxisAlignment: MainAxisAlignment.center,
//                                         children: [
//                                           Icon(
//                                             Icons.broken_image,
//                                             size: 50,
//                                             color: Colors.grey,
//                                           ),
//                                           SizedBox(height: 10),
//                                           Text(
//                                             'Image not available',
//                                             style: TextStyle(
//                                               color: Colors.grey,
//                                             ),
//                                           ),
//                                         ],
//                                       ),
//                                     ),
//                                   );
//                                 },
//                               ),
//                             );
//                           },
//                         ),
//
//                         // Left navigation arrow
//                         if (photos.length > 1)
//                           Positioned(
//                             left: 10,
//                             top: 0,
//                             bottom: 0,
//                             child: Center(
//                               child: GestureDetector(
//                                 onTap: () {
//                                   if (_currentPage > 0) {
//                                     _pageController.previousPage(
//                                       duration: const Duration(milliseconds: 300),
//                                       curve: Curves.easeInOut,
//                                     );
//                                   }
//                                 },
//                                 child: Container(
//                                   width: 40,
//                                   height: 40,
//                                   decoration: BoxDecoration(
//                                     color: Colors.black.withOpacity(0.5),
//                                     shape: BoxShape.circle,
//                                   ),
//                                   child: const Icon(
//                                     Icons.arrow_back_ios,
//                                     color: Colors.white,
//                                     size: 20,
//                                   ),
//                                 ),
//                               ),
//                             ),
//                           ),
//
//                         // Right navigation arrow
//                         if (photos.length > 1)
//                           Positioned(
//                             right: 10,
//                             top: 0,
//                             bottom: 0,
//                             child: Center(
//                               child: GestureDetector(
//                                 onTap: () {
//                                   if (_currentPage < photos.length - 1) {
//                                     _pageController.nextPage(
//                                       duration: const Duration(milliseconds: 300),
//                                       curve: Curves.easeInOut,
//                                     );
//                                   }
//                                 },
//                                 child: Container(
//                                   width: 40,
//                                   height: 40,
//                                   decoration: BoxDecoration(
//                                     color: Colors.black.withOpacity(0.5),
//                                     shape: BoxShape.circle,
//                                   ),
//                                   child: const Icon(
//                                     Icons.arrow_forward_ios,
//                                     color: Colors.white,
//                                     size: 20,
//                                   ),
//                                 ),
//                               ),
//                             ),
//                           ),
//
//                         // Page indicators
//                         if (photos.length > 1)
//                           Positioned(
//                             bottom: 15,
//                             left: 0,
//                             right: 0,
//                             child: Row(
//                               mainAxisAlignment: MainAxisAlignment.center,
//                               children: List.generate(
//                                 photos.length,
//                                     (index) => AnimatedContainer(
//                                   duration: const Duration(milliseconds: 300),
//                                   margin: const EdgeInsets.symmetric(horizontal: 4),
//                                   width: _currentPage == index ? 12 : 8,
//                                   height: _currentPage == index ? 12 : 8,
//                                   decoration: BoxDecoration(
//                                     shape: BoxShape.circle,
//                                     color: _currentPage == index
//                                         ? Colors.white
//                                         : Colors.white.withOpacity(0.5),
//                                     border: Border.all(
//                                       color: Colors.black.withOpacity(0.2),
//                                       width: 1,
//                                     ),
//                                   ),
//                                 ),
//                               ),
//                             ),
//                           ),
//
//                         // Image counter with speed indicator
//                         Positioned(
//                           top: 15,
//                           right: 15,
//                           child: Container(
//                             padding: const EdgeInsets.symmetric(
//                               horizontal: 12,
//                               vertical: 8,
//                             ),
//                             decoration: BoxDecoration(
//                               color: Colors.black.withOpacity(0.7),
//                               borderRadius: BorderRadius.circular(25),
//                               border: Border.all(
//                                 color: Colors.white.withOpacity(0.3),
//                                 width: 1,
//                               ),
//                             ),
//                             child: Row(
//                               children: [
//                                 const Icon(
//                                   Icons.flash_on,
//                                   size: 14,
//                                   color: Colors.white,
//                                 ),
//                                 const SizedBox(width: 8),
//                                 Text(
//                                   '${_currentPage + 1} / ${photos.length}',
//                                   style: const TextStyle(
//                                     color: Colors.white,
//                                     fontSize: 14,
//                                     fontWeight: FontWeight.bold,
//                                   ),
//                                 ),
//                               ],
//                             ),
//                           ),
//                         ),
//                       ],
//                     ),
//                   ),
//                 const SizedBox(height: 25),
//
//                 // Menu Section
//                 const Row(
//                   children: [
//                     Icon(Icons.restaurant_menu, color: Color(0xFF1A237E), size: 20),
//                     SizedBox(width: 8),
//                     Text(
//                       'Menu',
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
//                   'Food and beverage menu available',
//                   style: TextStyle(
//                     color: Colors.grey[600],
//                     fontSize: 14,
//                   ),
//                 ),
//                 const SizedBox(height: 15),
//                 Container(
//                   height: 250,
//                   decoration: BoxDecoration(
//                     borderRadius: BorderRadius.circular(15),
//                     border: Border.all(color: Colors.grey[300]!),
//                     boxShadow: [
//                       BoxShadow(
//                         color: Colors.grey.withOpacity(0.1),
//                         blurRadius: 8,
//                         offset: const Offset(0, 2),
//                       ),
//                     ],
//                   ),
//                   child: ClipRRect(
//                     borderRadius: BorderRadius.circular(15),
//                     child: Image.network(
//                       detail.menu,
//                       fit: BoxFit.cover,
//                       width: double.infinity,
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
//                                 Icons.restaurant_menu,
//                                 size: 50,
//                                 color: Colors.grey,
//                               ),
//                               const SizedBox(height: 10),
//                               const Text(
//                                 'Menu Image',
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
//           // Action Button
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
//                   'Ready to Book This Package?',
//                   style: TextStyle(
//                     fontSize: 16,
//                     fontWeight: FontWeight.w600,
//                     color: Colors.grey,
//                   ),
//                 ),
//                 const SizedBox(height: 15),
//                 SizedBox(
//                   width: double.infinity,
//                   height: 56,
//                   child: ElevatedButton.icon(
//                     onPressed: () async {
//                       SharedPreferences sh = await SharedPreferences.getInstance();
//                       sh.setString('ownid', detail.id);
//                       Navigator.push(
//                         context,
//                         MaterialPageRoute(builder: (context) => const booking()),
//                       );
//                     },
//                     icon: const Icon(Icons.book_online, size: 22),
//                     label: const Text(
//                       'Book This Package Now',
//                       style: TextStyle(
//                         fontSize: 16,
//                         fontWeight: FontWeight.bold,
//                       ),
//                     ),
//                     style: ElevatedButton.styleFrom(
//                       backgroundColor: const Color(0xFF1A237E),
//                       foregroundColor: Colors.white,
//                       padding: const EdgeInsets.symmetric(vertical: 15),
//                       shape: RoundedRectangleBorder(
//                         borderRadius: BorderRadius.circular(12),
//                       ),
//                       elevation: 5,
//                       shadowColor: const Color(0xFF1A237E).withOpacity(0.5),
//                     ),
//                   ),
//                 ),
//                 const SizedBox(height: 10),
//                 const Text(
//                   'Secure your spot with this amazing stay package',
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
//
//   Widget _buildCapacityCard({
//     required String title,
//     required String value,
//     required IconData icon,
//     required Color color,
//   }) {
//     return Container(
//       padding: const EdgeInsets.all(15),
//       decoration: BoxDecoration(
//         color: color.withOpacity(0.1),
//         borderRadius: BorderRadius.circular(12),
//         border: Border.all(color: color.withOpacity(0.3)),
//       ),
//       child: Column(
//         children: [
//           Icon(icon, color: color, size: 28),
//           const SizedBox(height: 10),
//           Text(
//             title,
//             style: TextStyle(
//               fontSize: 12,
//               fontWeight: FontWeight.bold,
//               color: color,
//               letterSpacing: 0.5,
//             ),
//           ),
//           const SizedBox(height: 8),
//           Text(
//             value,
//             style: TextStyle(
//               fontSize: 24,
//               fontWeight: FontWeight.w800,
//               color: color,
//             ),
//           ),
//           const SizedBox(height: 5),
//           // Text(
//           //   title.contains('MINIMUM') ? 'Persons Minimum' : 'Persons Maximum',
//           //   style: TextStyle(
//           //     fontSize: 11,
//           //     color: color.withOpacity(0.8),
//           //   ),
//           // ),
//         ],
//       ),
//     );
//   }
// }
//
// class ExtraDetail {
//   final String id;
//   final String stay;
//   final String photo1;
//   final String photo2;
//   final String photo3;
//   final String photo4;
//   final String menu;
//   final String staydetails;
//   // final String maxno;
//   // final String minno;
//
//   ExtraDetail({
//     required this.id,
//     required this.stay,
//     required this.photo1,
//     required this.photo2,
//     required this.photo3,
//     required this.photo4,
//     required this.menu,
//     required this.staydetails,
//     // required this.maxno,
//     // required this.minno,
//   });
// }


//
// import 'dart:async';
// import 'dart:convert';
// import 'package:final_destination/booking.dart';
// import 'package:final_destination/viewpackage.dart';
// import 'package:flutter/material.dart';
// import 'package:http/http.dart' as http;
// import 'package:shared_preferences/shared_preferences.dart';
//
// void main() {
//   runApp(const view_extradetails());
// }
//
// class view_extradetails extends StatelessWidget {
//   const view_extradetails({Key? key}) : super(key: key);
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
//       home: const view_extradetailssub(),
//     );
//   }
// }
//
// class view_extradetailssub extends StatefulWidget {
//   const view_extradetailssub({Key? key}) : super(key: key);
//
//   @override
//   State<view_extradetailssub> createState() => _view_extradetailssubState();
// }
//
// class _view_extradetailssubState extends State<view_extradetailssub> {
//   List<ExtraDetail> details = [];
//   bool isLoading = true;
//   String errorMessage = '';
//   PageController _pageController = PageController();
//   int _currentPage = 0;
//   Timer? _autoSlideTimer;
//
//   @override
//   void initState() {
//     super.initState();
//     _getExtraDetails();
//   }
//
//   @override
//   void dispose() {
//     _pageController.dispose();
//     _autoSlideTimer?.cancel();
//     super.dispose();
//   }
//
//   void _startAutoSlide(int photoCount) {
//     if (photoCount <= 1) return;
//
//     _autoSlideTimer?.cancel();
//     _autoSlideTimer = Timer.periodic(const Duration(seconds: 2), (timer) {
//       if (_pageController.hasClients) {
//         int nextPage = _currentPage + 1;
//         if (nextPage >= photoCount) {
//           nextPage = 0;
//         }
//         _pageController.animateToPage(
//           nextPage,
//           duration: const Duration(milliseconds: 400),
//           curve: Curves.easeInOut,
//         );
//       }
//     });
//   }
//
//   Future<void> _getExtraDetails() async {
//     try {
//       SharedPreferences prefs = await SharedPreferences.getInstance();
//       String packageId = prefs.getString('oid') ?? "";
//       String ipAddress = prefs.getString("ip") ?? "http://localhost";
//
//       var response = await http.post(
//           Uri.parse("$ipAddress/userview_extradetails"),
//           body: {"oid": packageId}
//       );
//
//       if (response.statusCode == 200) {
//         var jsonData = json.decode(response.body);
//         List<ExtraDetail> fetchedDetails = [];
//
//         for (var detail in jsonData["message"]) {
//           ExtraDetail newDetail = ExtraDetail(
//             id: detail["id"].toString(),
//             stay: detail["stay"]?.toString() ?? "",
//             photo1: "$ipAddress${detail["photo1"] ?? ""}",
//             photo2: "$ipAddress${detail["photo2"] ?? ""}",
//             photo3: "$ipAddress${detail["photo3"] ?? ""}",
//             photo4: "$ipAddress${detail["photo4"] ?? ""}",
//             menu: "$ipAddress${detail["menu"] ?? ""}",
//             staydetails: detail["staydetails"]?.toString() ?? "",
//           );
//           fetchedDetails.add(newDetail);
//         }
//
//         setState(() {
//           details = fetchedDetails;
//           isLoading = false;
//         });
//
//         if (fetchedDetails.isNotEmpty) {
//           int photoCount = _getPhotoList(fetchedDetails.first).length;
//           _startAutoSlide(photoCount);
//         }
//       } else {
//         setState(() {
//           isLoading = false;
//           errorMessage = 'Failed to load extra details: ${response.statusCode}';
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
//   List<String> _getPhotoList(ExtraDetail detail) {
//     List<String> photos = [];
//     if (detail.photo1.isNotEmpty) photos.add(detail.photo1);
//     if (detail.photo2.isNotEmpty) photos.add(detail.photo2);
//     if (detail.photo3.isNotEmpty) photos.add(detail.photo3);
//     if (detail.photo4.isNotEmpty) photos.add(detail.photo4);
//     return photos;
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
//           'Package Extra Details',
//           style: const TextStyle(
//             fontSize: 22,
//             fontWeight: FontWeight.w800,
//             color: Color(0xFF0F2A1D),
//             fontFamily: 'Poppins',
//             letterSpacing: 1,
//           ),
//         ),
//         centerTitle: true,
//         leading: IconButton(
//           icon: const Icon(Icons.arrow_back_ios, color: Color(0xFF0F2A1D), size: 22),
//           onPressed: () {
//             Navigator.pushReplacement(
//               context,
//               MaterialPageRoute(builder: (context) => const viewpackage()),
//             );
//           },
//         ),
//         actions: [
//           Container(
//             margin: const EdgeInsets.only(right: 8),
//             decoration: BoxDecoration(
//               color: const Color(0xFF0F2A1D).withOpacity(0.1),
//               borderRadius: BorderRadius.circular(10),
//             ),
//             child: IconButton(
//               icon: const Icon(Icons.refresh, color: Color(0xFF0F2A1D), size: 22),
//               onPressed: _getExtraDetails,
//               tooltip: 'Refresh',
//             ),
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
//               const Color(0xFF0F2A1D).withOpacity(0.05),
//               const Color(0xFFE3EED4),
//             ],
//           ),
//         ),
//         child: isLoading
//             ? Center(
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: [
//               CircularProgressIndicator(
//                 color: const Color(0xFF0F2A1D),
//               ),
//               const SizedBox(height: 20),
//               Text(
//                 'Loading Extra Details...',
//                 style: TextStyle(
//                   fontSize: 16,
//                   color: const Color(0xFF0F2A1D),
//                   fontFamily: 'Poppins',
//                   fontWeight: FontWeight.w600,
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
//               Container(
//                 padding: const EdgeInsets.all(20),
//                 decoration: BoxDecoration(
//                   color: const Color(0xFF0F2A1D).withOpacity(0.1),
//                   shape: BoxShape.circle,
//                 ),
//                 child: const Icon(
//                   Icons.error_outline,
//                   size: 60,
//                   color: Color(0xFF0F2A1D),
//                 ),
//               ),
//               const SizedBox(height: 20),
//               Text(
//                 errorMessage,
//                 style: const TextStyle(
//                   fontSize: 16,
//                   color: Color(0xFF0F2A1D),
//                   fontFamily: 'Poppins',
//                   fontWeight: FontWeight.w600,
//                 ),
//                 textAlign: TextAlign.center,
//               ),
//               const SizedBox(height: 20),
//               ElevatedButton(
//                 onPressed: _getExtraDetails,
//                 style: ElevatedButton.styleFrom(
//                   backgroundColor: const Color(0xFF0F2A1D),
//                   foregroundColor: Colors.white,
//                   padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 12),
//                   shape: RoundedRectangleBorder(
//                     borderRadius: BorderRadius.circular(10),
//                   ),
//                 ),
//                 child: const Text(
//                   'RETRY',
//                   style: TextStyle(
//                     fontSize: 14,
//                     fontWeight: FontWeight.w800,
//                     fontFamily: 'Poppins',
//                   ),
//                 ),
//               ),
//             ],
//           ),
//         )
//             : details.isEmpty
//             ? Center(
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: [
//               Container(
//                 padding: const EdgeInsets.all(20),
//                 decoration: BoxDecoration(
//                   color: const Color(0xFF0F2A1D).withOpacity(0.1),
//                   shape: BoxShape.circle,
//                 ),
//                 child: const Icon(
//                   Icons.info_outline,
//                   size: 60,
//                   color: Color(0xFF0F2A1D),
//                 ),
//               ),
//               const SizedBox(height: 20),
//               const Text(
//                 'No extra details available',
//                 style: TextStyle(
//                   fontSize: 20,
//                   fontWeight: FontWeight.w800,
//                   color: Color(0xFF0F2A1D),
//                   fontFamily: 'Poppins',
//                 ),
//               ),
//               const SizedBox(height: 10),
//               Text(
//                 'Check back for additional package information',
//                 style: TextStyle(
//                   fontSize: 14,
//                   color: const Color(0xFF0F2A1D).withOpacity(0.6),
//                   fontFamily: 'Poppins',
//                   fontWeight: FontWeight.w600,
//                 ),
//                 textAlign: TextAlign.center,
//               ),
//               const SizedBox(height: 20),
//               ElevatedButton(
//                 onPressed: () {
//                   Navigator.pushReplacement(
//                     context,
//                     MaterialPageRoute(builder: (context) => const viewpackage()),
//                   );
//                 },
//                 style: ElevatedButton.styleFrom(
//                   backgroundColor: const Color(0xFF0F2A1D),
//                   foregroundColor: Colors.white,
//                   padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 12),
//                   shape: RoundedRectangleBorder(
//                     borderRadius: BorderRadius.circular(10),
//                   ),
//                 ),
//                 child: const Text(
//                   'GO BACK',
//                   style: TextStyle(
//                     fontSize: 14,
//                     fontWeight: FontWeight.w800,
//                     fontFamily: 'Poppins',
//                   ),
//                 ),
//               ),
//             ],
//           ),
//         )
//             : ListView.builder(
//           padding: const EdgeInsets.all(16),
//           itemCount: details.length,
//           itemBuilder: (context, index) {
//             return _buildExtraDetailCard(details[index]);
//           },
//         ),
//       ),
//     );
//   }
//
//   Widget _buildExtraDetailCard(ExtraDetail detail) {
//     List<String> photos = _getPhotoList(detail);
//
//     return Container(
//       margin: const EdgeInsets.only(bottom: 20),
//       decoration: BoxDecoration(
//         color: Colors.white,
//         borderRadius: BorderRadius.circular(20),
//         boxShadow: [
//           BoxShadow(
//             color: const Color(0xFF0F2A1D).withOpacity(0.2),
//             spreadRadius: 2,
//             blurRadius: 15,
//             offset: const Offset(0, 5),
//           ),
//         ],
//       ),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           // Stay Information Header with home theme gradient
//           Container(
//             padding: const EdgeInsets.all(20),
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
//             child: Row(
//               children: [
//                 Container(
//                   width: 60,
//                   height: 60,
//                   decoration: BoxDecoration(
//                     color: Colors.white.withOpacity(0.2),
//                     borderRadius: BorderRadius.circular(15),
//                   ),
//                   child: const Icon(
//                     Icons.hotel,
//                     color: Colors.white,
//                     size: 30,
//                   ),
//                 ),
//                 const SizedBox(width: 15),
//                 Expanded(
//                   child: Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       const Text(
//                         'STAY INFORMATION',
//                         style: TextStyle(
//                           fontSize: 12,
//                           color: Colors.white70,
//                           fontWeight: FontWeight.w600,
//                           fontFamily: 'Poppins',
//                           letterSpacing: 1,
//                         ),
//                       ),
//                       const SizedBox(height: 4),
//                       Text(
//                         detail.stay,
//                         style: const TextStyle(
//                           fontSize: 22,
//                           color: Colors.white,
//                           fontWeight: FontWeight.w800,
//                           fontFamily: 'Poppins',
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
//           // Stay Details
//           Padding(
//             padding: const EdgeInsets.all(20),
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 // Stay Details Section
//                 Row(
//                   children: [
//                     Container(
//                       padding: const EdgeInsets.all(8),
//                       decoration: BoxDecoration(
//                         color: const Color(0xFF0F2A1D).withOpacity(0.1),
//                         borderRadius: BorderRadius.circular(10),
//                       ),
//                       child: const Icon(
//                         Icons.description_outlined,
//                         color: Color(0xFF0F2A1D),
//                         size: 20,
//                       ),
//                     ),
//                     const SizedBox(width: 12),
//                     const Text(
//                       'Stay Details',
//                       style: TextStyle(
//                         fontSize: 18,
//                         fontWeight: FontWeight.w900,
//                         color: Color(0xFF0F2A1D),
//                         fontFamily: 'Poppins',
//                       ),
//                     ),
//                   ],
//                 ),
//                 const SizedBox(height: 12),
//                 Container(
//                   padding: const EdgeInsets.all(15),
//                   decoration: BoxDecoration(
//                     color: const Color(0xFF0F2A1D).withOpacity(0.03),
//                     borderRadius: BorderRadius.circular(12),
//                     border: Border.all(
//                       color: const Color(0xFF0F2A1D).withOpacity(0.1),
//                     ),
//                   ),
//                   child: Text(
//                     detail.staydetails,
//                     style: const TextStyle(
//                       color: Color(0xFF0F2A1D),
//                       fontSize: 14,
//                       fontFamily: 'Poppins',
//                       fontWeight: FontWeight.w600,
//                       height: 1.5,
//                     ),
//                   ),
//                 ),
//                 const SizedBox(height: 25),
//
//                 // Photo Gallery Section
//                 Row(
//                   children: [
//                     Container(
//                       padding: const EdgeInsets.all(8),
//                       decoration: BoxDecoration(
//                         color: const Color(0xFF0F2A1D).withOpacity(0.1),
//                         borderRadius: BorderRadius.circular(10),
//                       ),
//                       child: const Icon(
//                         Icons.photo_library_outlined,
//                         color: Color(0xFF0F2A1D),
//                         size: 20,
//                       ),
//                     ),
//                     const SizedBox(width: 12),
//                     const Text(
//                       'Photo Gallery',
//                       style: TextStyle(
//                         fontSize: 18,
//                         fontWeight: FontWeight.w900,
//                         color: Color(0xFF0F2A1D),
//                         fontFamily: 'Poppins',
//                       ),
//                     ),
//                   ],
//                 ),
//                 const SizedBox(height: 12),
//                 Row(
//                   children: [
//                     Container(
//                       padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
//                       decoration: BoxDecoration(
//                         color: const Color(0xFF0F2A1D).withOpacity(0.1),
//                         borderRadius: BorderRadius.circular(20),
//                       ),
//                       child: Text(
//                         '${photos.length} photos available',
//                         style: const TextStyle(
//                           color: Color(0xFF0F2A1D),
//                           fontSize: 12,
//                           fontFamily: 'Poppins',
//                           fontWeight: FontWeight.w600,
//                         ),
//                       ),
//                     ),
//                     const Spacer(),
//                     Container(
//                       padding: const EdgeInsets.symmetric(
//                         horizontal: 10,
//                         vertical: 5,
//                       ),
//                       decoration: BoxDecoration(
//                         color: const Color(0xFF0F2A1D).withOpacity(0.1),
//                         borderRadius: BorderRadius.circular(20),
//                       ),
//                       child: Row(
//                         children: [
//                           Icon(
//                             Icons.speed,
//                             size: 14,
//                             color: const Color(0xFF0F2A1D).withOpacity(0.7),
//                           ),
//                           const SizedBox(width: 4),
//                           Text(
//                             'Auto-Sliding',
//                             style: TextStyle(
//                               fontSize: 11,
//                               color: const Color(0xFF0F2A1D).withOpacity(0.7),
//                               fontFamily: 'Poppins',
//                               fontWeight: FontWeight.w600,
//                             ),
//                           ),
//                         ],
//                       ),
//                     ),
//                   ],
//                 ),
//                 const SizedBox(height: 15),
//
//                 // Automatic Slideshow Container
//                 if (photos.isNotEmpty)
//                   Container(
//                     height: 300,
//                     decoration: BoxDecoration(
//                       borderRadius: BorderRadius.circular(15),
//                       boxShadow: [
//                         BoxShadow(
//                           color: const Color(0xFF0F2A1D).withOpacity(0.3),
//                           blurRadius: 15,
//                           spreadRadius: 2,
//                         ),
//                       ],
//                     ),
//                     child: Stack(
//                       children: [
//                         // PageView for automatic slideshow
//                         PageView.builder(
//                           controller: _pageController,
//                           onPageChanged: (int page) {
//                             setState(() {
//                               _currentPage = page;
//                             });
//                           },
//                           itemCount: photos.length,
//                           itemBuilder: (context, index) {
//                             return ClipRRect(
//                               borderRadius: BorderRadius.circular(15),
//                               child: Image.network(
//                                 photos[index],
//                                 fit: BoxFit.cover,
//                                 width: double.infinity,
//                                 loadingBuilder: (context, child, loadingProgress) {
//                                   if (loadingProgress == null) return child;
//                                   return Container(
//                                     color: const Color(0xFFE3EED4).withOpacity(0.3),
//                                     child: Center(
//                                       child: CircularProgressIndicator(
//                                         value: loadingProgress.expectedTotalBytes != null
//                                             ? loadingProgress.cumulativeBytesLoaded /
//                                             loadingProgress.expectedTotalBytes!
//                                             : null,
//                                         color: const Color(0xFF0F2A1D),
//                                       ),
//                                     ),
//                                   );
//                                 },
//                                 errorBuilder: (context, error, stackTrace) {
//                                   return Container(
//                                     color: const Color(0xFFE3EED4).withOpacity(0.3),
//                                     child: const Center(
//                                       child: Column(
//                                         mainAxisAlignment: MainAxisAlignment.center,
//                                         children: [
//                                           Icon(
//                                             Icons.broken_image,
//                                             size: 50,
//                                             color: Color(0xFF0F2A1D),
//                                           ),
//                                           SizedBox(height: 10),
//                                           Text(
//                                             'Image not available',
//                                             style: TextStyle(
//                                               color: Color(0xFF0F2A1D),
//                                               fontFamily: 'Poppins',
//                                             ),
//                                           ),
//                                         ],
//                                       ),
//                                     ),
//                                   );
//                                 },
//                               ),
//                             );
//                           },
//                         ),
//
//                         // Left navigation arrow
//                         if (photos.length > 1)
//                           Positioned(
//                             left: 10,
//                             top: 0,
//                             bottom: 0,
//                             child: Center(
//                               child: GestureDetector(
//                                 onTap: () {
//                                   if (_currentPage > 0) {
//                                     _pageController.previousPage(
//                                       duration: const Duration(milliseconds: 300),
//                                       curve: Curves.easeInOut,
//                                     );
//                                   }
//                                 },
//                                 child: Container(
//                                   width: 40,
//                                   height: 40,
//                                   decoration: BoxDecoration(
//                                     color: const Color(0xFF0F2A1D).withOpacity(0.7),
//                                     shape: BoxShape.circle,
//                                   ),
//                                   child: const Icon(
//                                     Icons.arrow_back_ios,
//                                     color: Colors.white,
//                                     size: 20,
//                                   ),
//                                 ),
//                               ),
//                             ),
//                           ),
//
//                         // Right navigation arrow
//                         if (photos.length > 1)
//                           Positioned(
//                             right: 10,
//                             top: 0,
//                             bottom: 0,
//                             child: Center(
//                               child: GestureDetector(
//                                 onTap: () {
//                                   if (_currentPage < photos.length - 1) {
//                                     _pageController.nextPage(
//                                       duration: const Duration(milliseconds: 300),
//                                       curve: Curves.easeInOut,
//                                     );
//                                   }
//                                 },
//                                 child: Container(
//                                   width: 40,
//                                   height: 40,
//                                   decoration: BoxDecoration(
//                                     color: const Color(0xFF0F2A1D).withOpacity(0.7),
//                                     shape: BoxShape.circle,
//                                   ),
//                                   child: const Icon(
//                                     Icons.arrow_forward_ios,
//                                     color: Colors.white,
//                                     size: 20,
//                                   ),
//                                 ),
//                               ),
//                             ),
//                           ),
//
//                         // Page indicators
//                         if (photos.length > 1)
//                           Positioned(
//                             bottom: 15,
//                             left: 0,
//                             right: 0,
//                             child: Row(
//                               mainAxisAlignment: MainAxisAlignment.center,
//                               children: List.generate(
//                                 photos.length,
//                                     (index) => AnimatedContainer(
//                                   duration: const Duration(milliseconds: 300),
//                                   margin: const EdgeInsets.symmetric(horizontal: 4),
//                                   width: _currentPage == index ? 12 : 8,
//                                   height: _currentPage == index ? 12 : 8,
//                                   decoration: BoxDecoration(
//                                     shape: BoxShape.circle,
//                                     color: _currentPage == index
//                                         ? const Color(0xFF0F2A1D)
//                                         : const Color(0xFF0F2A1D).withOpacity(0.3),
//                                   ),
//                                 ),
//                               ),
//                             ),
//                           ),
//
//                         // Image counter
//                         Positioned(
//                           top: 15,
//                           right: 15,
//                           child: Container(
//                             padding: const EdgeInsets.symmetric(
//                               horizontal: 12,
//                               vertical: 8,
//                             ),
//                             decoration: BoxDecoration(
//                               color: const Color(0xFF0F2A1D).withOpacity(0.8),
//                               borderRadius: BorderRadius.circular(25),
//                             ),
//                             child: Row(
//                               children: [
//                                 const Icon(
//                                   Icons.photo,
//                                   size: 14,
//                                   color: Colors.white,
//                                 ),
//                                 const SizedBox(width: 8),
//                                 Text(
//                                   '${_currentPage + 1} / ${photos.length}',
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
//                         ),
//                       ],
//                     ),
//                   ),
//                 const SizedBox(height: 25),
//
//                 // Menu Section
//                 Row(
//                   children: [
//                     Container(
//                       padding: const EdgeInsets.all(8),
//                       decoration: BoxDecoration(
//                         color: const Color(0xFF0F2A1D).withOpacity(0.1),
//                         borderRadius: BorderRadius.circular(10),
//                       ),
//                       child: const Icon(
//                         Icons.restaurant_menu_outlined,
//                         color: Color(0xFF0F2A1D),
//                         size: 20,
//                       ),
//                     ),
//                     const SizedBox(width: 12),
//                     const Text(
//                       'Menu',
//                       style: TextStyle(
//                         fontSize: 18,
//                         fontWeight: FontWeight.w900,
//                         color: Color(0xFF0F2A1D),
//                         fontFamily: 'Poppins',
//                       ),
//                     ),
//                   ],
//                 ),
//                 const SizedBox(height: 12),
//                 Container(
//                   padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
//                   decoration: BoxDecoration(
//                     color: const Color(0xFF0F2A1D).withOpacity(0.1),
//                     borderRadius: BorderRadius.circular(20),
//                   ),
//                   child: const Text(
//                     'Food  menu',
//                     style: TextStyle(
//                       fontSize: 12,
//                       color: Color(0xFF0F2A1D),
//                       fontFamily: 'Poppins',
//                       fontWeight: FontWeight.w600,
//                     ),
//                   ),
//                 ),
//                 const SizedBox(height: 15),
//                 Container(
//                   height: 250,
//                   decoration: BoxDecoration(
//                     borderRadius: BorderRadius.circular(15),
//                     border: Border.all(
//                       color: const Color(0xFF0F2A1D).withOpacity(0.2),
//                     ),
//                     boxShadow: [
//                       BoxShadow(
//                         color: const Color(0xFF0F2A1D).withOpacity(0.1),
//                         blurRadius: 8,
//                         offset: const Offset(0, 2),
//                       ),
//                     ],
//                   ),
//                   child: ClipRRect(
//                     borderRadius: BorderRadius.circular(15),
//                     child: Image.network(
//                       detail.menu,
//                       fit: BoxFit.cover,
//                       width: double.infinity,
//                       loadingBuilder: (context, child, loadingProgress) {
//                         if (loadingProgress == null) return child;
//                         return Center(
//                           child: CircularProgressIndicator(
//                             value: loadingProgress.expectedTotalBytes != null
//                                 ? loadingProgress.cumulativeBytesLoaded /
//                                 loadingProgress.expectedTotalBytes!
//                                 : null,
//                             color: const Color(0xFF0F2A1D),
//                           ),
//                         );
//                       },
//                       errorBuilder: (context, error, stackTrace) {
//                         return Container(
//                           color: const Color(0xFFE3EED4).withOpacity(0.3),
//                           child: Center(
//                             child: Column(
//                               mainAxisAlignment: MainAxisAlignment.center,
//                               children: [
//                                 const Icon(
//                                   Icons.restaurant_menu,
//                                   size: 50,
//                                   color: Color(0xFF0F2A1D),
//                                 ),
//                                 const SizedBox(height: 10),
//                                 const Text(
//                                   'Menu Image',
//                                   style: TextStyle(
//                                     color: Color(0xFF0F2A1D),
//                                     fontFamily: 'Poppins',
//                                     fontWeight: FontWeight.w600,
//                                   ),
//                                 ),
//                               ],
//                             ),
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
//           // Action Button
//           Container(
//             padding: const EdgeInsets.all(20),
//             decoration: BoxDecoration(
//               color: const Color(0xFF0F2A1D).withOpacity(0.03),
//               borderRadius: const BorderRadius.only(
//                 bottomLeft: Radius.circular(20),
//                 bottomRight: Radius.circular(20),
//               ),
//               border: Border(
//                 top: BorderSide(
//                   color: const Color(0xFF0F2A1D).withOpacity(0.1),
//                 ),
//               ),
//             ),
//             child: Column(
//               children: [
//                 const Text(
//                   'Ready to Book This Package?',
//                   style: TextStyle(
//                     fontSize: 16,
//                     fontWeight: FontWeight.w800,
//                     color: Color(0xFF0F2A1D),
//                     fontFamily: 'Poppins',
//                   ),
//                 ),
//                 const SizedBox(height: 15),
//                 SizedBox(
//                   width: double.infinity,
//                   height: 56,
//                   child: ElevatedButton.icon(
//                     onPressed: () async {
//                       SharedPreferences sh = await SharedPreferences.getInstance();
//                       sh.setString('ownid', detail.id);
//                       Navigator.push(
//                         context,
//                         MaterialPageRoute(builder: (context) => const booking()),
//                       );
//                     },
//                     icon: const Icon(Icons.book_online, size: 22),
//                     label: const Text(
//                       'BOOK THIS PACKAGE NOW',
//                       style: TextStyle(
//                         fontSize: 16,
//                         fontWeight: FontWeight.w800,
//                         fontFamily: 'Poppins',
//                       ),
//                     ),
//                     style: ElevatedButton.styleFrom(
//                       backgroundColor: const Color(0xFF0F2A1D),
//                       foregroundColor: Colors.white,
//                       padding: const EdgeInsets.symmetric(vertical: 15),
//                       shape: RoundedRectangleBorder(
//                         borderRadius: BorderRadius.circular(12),
//                       ),
//                       elevation: 4,
//                     ),
//                   ),
//                 ),
//                 const SizedBox(height: 10),
//                 Text(
//                   'Secure your spot with this amazing stay package',
//                   textAlign: TextAlign.center,
//                   style: TextStyle(
//                     fontSize: 12,
//                     color: const Color(0xFF0F2A1D).withOpacity(0.6),
//                     fontFamily: 'Poppins',
//                     fontWeight: FontWeight.w600,
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
//   Widget _buildCapacityCard({
//     required String title,
//     required String value,
//     required IconData icon,
//     required Color color,
//   }) {
//     return Container(
//       padding: const EdgeInsets.all(15),
//       decoration: BoxDecoration(
//         color: color.withOpacity(0.1),
//         borderRadius: BorderRadius.circular(12),
//         border: Border.all(color: color.withOpacity(0.3)),
//       ),
//       child: Column(
//         children: [
//           Icon(icon, color: color, size: 28),
//           const SizedBox(height: 10),
//           Text(
//             title,
//             style: TextStyle(
//               fontSize: 12,
//               fontWeight: FontWeight.bold,
//               color: color,
//               fontFamily: 'Poppins',
//               letterSpacing: 0.5,
//             ),
//           ),
//           const SizedBox(height: 8),
//           Text(
//             value,
//             style: TextStyle(
//               fontSize: 24,
//               fontWeight: FontWeight.w800,
//               color: color,
//               fontFamily: 'Poppins',
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
//
// class ExtraDetail {
//   final String id;
//   final String stay;
//   final String photo1;
//   final String photo2;
//   final String photo3;
//   final String photo4;
//   final String menu;
//   final String staydetails;
//
//   ExtraDetail({
//     required this.id,
//     required this.stay,
//     required this.photo1,
//     required this.photo2,
//     required this.photo3,
//     required this.photo4,
//     required this.menu,
//     required this.staydetails,
//   });
// }

import 'dart:async';
import 'dart:convert';
import 'package:final_destination/booking.dart';
import 'package:final_destination/viewpackage.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  runApp(const view_extradetails());
}

class view_extradetails extends StatelessWidget {
  const view_extradetails({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: const Color(0xFF0F2A1D),
        scaffoldBackgroundColor: const Color(0xFFE3EED4),
        fontFamily: 'Poppins',
      ),
      home: const view_extradetailssub(),
    );
  }
}

class view_extradetailssub extends StatefulWidget {
  const view_extradetailssub({Key? key}) : super(key: key);

  @override
  State<view_extradetailssub> createState() => _view_extradetailssubState();
}

class _view_extradetailssubState extends State<view_extradetailssub> {
  List<ExtraDetail> details = [];
  bool isLoading = true;
  String errorMessage = '';
  PageController _pageController = PageController();
  int _currentPage = 0;
  Timer? _autoSlideTimer;

  @override
  void initState() {
    super.initState();
    _getExtraDetails();
  }

  @override
  void dispose() {
    _pageController.dispose();
    _autoSlideTimer?.cancel();
    super.dispose();
  }

  void _startAutoSlide(int photoCount) {
    if (photoCount <= 1) return;

    _autoSlideTimer?.cancel();
    _autoSlideTimer = Timer.periodic(const Duration(seconds: 2), (timer) {
      if (_pageController.hasClients) {
        int nextPage = _currentPage + 1;
        if (nextPage >= photoCount) {
          nextPage = 0;
        }
        _pageController.animateToPage(
          nextPage,
          duration: const Duration(milliseconds: 400),
          curve: Curves.easeInOut,
        );
      }
    });
  }

  Future<void> _getExtraDetails() async {
    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      String packageId = prefs.getString('oid') ?? "";
      String ipAddress = prefs.getString("ip") ?? "http://localhost";

      var response = await http.post(
          Uri.parse("$ipAddress/userview_extradetails"),
          body: {"oid": packageId}
      );

      if (response.statusCode == 200) {
        var jsonData = json.decode(response.body);
        List<ExtraDetail> fetchedDetails = [];

        for (var detail in jsonData["message"]) {
          ExtraDetail newDetail = ExtraDetail(
            id: detail["id"].toString(),
            stay: detail["stay"]?.toString() ?? "",
            photo1: "$ipAddress${detail["photo1"] ?? ""}",
            photo2: "$ipAddress${detail["photo2"] ?? ""}",
            photo3: "$ipAddress${detail["photo3"] ?? ""}",
            photo4: "$ipAddress${detail["photo4"] ?? ""}",
            menu: "$ipAddress${detail["menu"] ?? ""}",
            staydetails: detail["staydetails"]?.toString() ?? "",
          );
          fetchedDetails.add(newDetail);
        }

        setState(() {
          details = fetchedDetails;
          isLoading = false;
        });

        if (fetchedDetails.isNotEmpty) {
          int photoCount = _getPhotoList(fetchedDetails.first).length;
          _startAutoSlide(photoCount);
        }
      } else {
        setState(() {
          isLoading = false;
          errorMessage = 'Failed to load extra details: ${response.statusCode}';
        });
      }
    } catch (e) {
      setState(() {
        isLoading = false;
        errorMessage = 'Error: $e';
      });
    }
  }

  List<String> _getPhotoList(ExtraDetail detail) {
    List<String> photos = [];
    if (detail.photo1.isNotEmpty) photos.add(detail.photo1);
    if (detail.photo2.isNotEmpty) photos.add(detail.photo2);
    if (detail.photo3.isNotEmpty) photos.add(detail.photo3);
    if (detail.photo4.isNotEmpty) photos.add(detail.photo4);
    return photos;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFE3EED4),
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 2,
        title: Text(
          'Package Extra Details',
          style: const TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.w800,
            color: Color(0xFF0F2A1D),
            fontFamily: 'Poppins',
            letterSpacing: 1,
          ),
        ),
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios, color: Color(0xFF0F2A1D), size: 22),
          onPressed: () {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => const viewpackage()),
            );
          },
        ),
        actions: [
          Container(
            margin: const EdgeInsets.only(right: 8),
            decoration: BoxDecoration(
              color: const Color(0xFF0F2A1D).withOpacity(0.1),
              borderRadius: BorderRadius.circular(10),
            ),
            child: IconButton(
              icon: const Icon(Icons.refresh, color: Color(0xFF0F2A1D), size: 22),
              onPressed: _getExtraDetails,
              tooltip: 'Refresh',
            ),
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
              const Color(0xFF0F2A1D).withOpacity(0.05),
              const Color(0xFFE3EED4),
            ],
          ),
        ),
        child: isLoading
            ? Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CircularProgressIndicator(
                color: const Color(0xFF0F2A1D),
              ),
              const SizedBox(height: 20),
              Text(
                'Loading Extra Details...',
                style: TextStyle(
                  fontSize: 16,
                  color: const Color(0xFF0F2A1D),
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.w600,
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
              Container(
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: const Color(0xFF0F2A1D).withOpacity(0.1),
                  shape: BoxShape.circle,
                ),
                child: const Icon(
                  Icons.error_outline,
                  size: 60,
                  color: Color(0xFF0F2A1D),
                ),
              ),
              const SizedBox(height: 20),
              Text(
                errorMessage,
                style: const TextStyle(
                  fontSize: 16,
                  color: Color(0xFF0F2A1D),
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.w600,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: _getExtraDetails,
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF0F2A1D),
                  foregroundColor: Colors.white,
                  padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 12),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                child: const Text(
                  'RETRY',
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w800,
                    fontFamily: 'Poppins',
                  ),
                ),
              ),
            ],
          ),
        )
            : details.isEmpty
            ? Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: const Color(0xFF0F2A1D).withOpacity(0.1),
                  shape: BoxShape.circle,
                ),
                child: const Icon(
                  Icons.info_outline,
                  size: 60,
                  color: Color(0xFF0F2A1D),
                ),
              ),
              const SizedBox(height: 20),
              const Text(
                'No extra details available',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w800,
                  color: Color(0xFF0F2A1D),
                  fontFamily: 'Poppins',
                ),
              ),
              const SizedBox(height: 10),
              Text(
                'Check back for additional package information',
                style: TextStyle(
                  fontSize: 14,
                  color: const Color(0xFF0F2A1D).withOpacity(0.6),
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.w600,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) => const viewpackage()),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF0F2A1D),
                  foregroundColor: Colors.white,
                  padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 12),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                child: const Text(
                  'GO BACK',
                  style: TextStyle(
                    fontSize: 14,
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
          itemCount: details.length,
          itemBuilder: (context, index) {
            return _buildExtraDetailCard(details[index]);
          },
        ),
      ),
    );
  }

  Widget _buildExtraDetailCard(ExtraDetail detail) {
    List<String> photos = _getPhotoList(detail);

    return Container(
      margin: const EdgeInsets.only(bottom: 20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: const Color(0xFF0F2A1D).withOpacity(0.2),
            spreadRadius: 2,
            blurRadius: 15,
            offset: const Offset(0, 5),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Stay Information Header with home theme gradient
          Container(
            padding: const EdgeInsets.all(20),
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
            child: Row(
              children: [
                Container(
                  width: 60,
                  height: 60,
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.2),
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: const Icon(
                    Icons.hotel,
                    color: Colors.white,
                    size: 30,
                  ),
                ),
                const SizedBox(width: 15),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'STAY INFORMATION',
                        style: TextStyle(
                          fontSize: 12,
                          color: Colors.white70,
                          fontWeight: FontWeight.w600,
                          fontFamily: 'Poppins',
                          letterSpacing: 1,
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        detail.stay,
                        style: const TextStyle(
                          fontSize: 22,
                          color: Colors.white,
                          fontWeight: FontWeight.w800,
                          fontFamily: 'Poppins',
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

          // Stay Details
          Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Stay Details Section
                Row(
                  children: [
                    Container(
                      padding: const EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        color: const Color(0xFF0F2A1D).withOpacity(0.1),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: const Icon(
                        Icons.description_outlined,
                        color: Color(0xFF0F2A1D),
                        size: 20,
                      ),
                    ),
                    const SizedBox(width: 12),
                    const Text(
                      'Stay Details',
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
                Container(
                  padding: const EdgeInsets.all(15),
                  decoration: BoxDecoration(
                    color: const Color(0xFF0F2A1D).withOpacity(0.03),
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(
                      color: const Color(0xFF0F2A1D).withOpacity(0.1),
                    ),
                  ),
                  child: Text(
                    detail.staydetails,
                    style: const TextStyle(
                      color: Color(0xFF0F2A1D),
                      fontSize: 14,
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w600,
                      height: 1.5,
                    ),
                  ),
                ),
                const SizedBox(height: 25),

                // Photo Gallery Section
                Row(
                  children: [
                    Container(
                      padding: const EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        color: const Color(0xFF0F2A1D).withOpacity(0.1),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: const Icon(
                        Icons.photo_library_outlined,
                        color: Color(0xFF0F2A1D),
                        size: 20,
                      ),
                    ),
                    const SizedBox(width: 12),
                    const Text(
                      'Photo Gallery',
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
                Row(
                  children: [
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                      decoration: BoxDecoration(
                        color: const Color(0xFF0F2A1D).withOpacity(0.1),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Text(
                        '${photos.length} photos available',
                        style: const TextStyle(
                          color: Color(0xFF0F2A1D),
                          fontSize: 12,
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                    const Spacer(),
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 10,
                        vertical: 5,
                      ),
                      decoration: BoxDecoration(
                        color: const Color(0xFF0F2A1D).withOpacity(0.1),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Row(
                        children: [
                          Icon(
                            Icons.speed,
                            size: 14,
                            color: const Color(0xFF0F2A1D).withOpacity(0.7),
                          ),
                          const SizedBox(width: 4),
                          Text(
                            'Auto-Sliding',
                            style: TextStyle(
                              fontSize: 11,
                              color: const Color(0xFF0F2A1D).withOpacity(0.7),
                              fontFamily: 'Poppins',
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 15),

                // Automatic Slideshow Container
                if (photos.isNotEmpty)
                  Container(
                    height: 300,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      boxShadow: [
                        BoxShadow(
                          color: const Color(0xFF0F2A1D).withOpacity(0.3),
                          blurRadius: 15,
                          spreadRadius: 2,
                        ),
                      ],
                    ),
                    child: Stack(
                      children: [
                        // PageView for automatic slideshow
                        PageView.builder(
                          controller: _pageController,
                          onPageChanged: (int page) {
                            setState(() {
                              _currentPage = page;
                            });
                          },
                          itemCount: photos.length,
                          itemBuilder: (context, index) {
                            return ClipRRect(
                              borderRadius: BorderRadius.circular(15),
                              child: Image.network(
                                photos[index],
                                fit: BoxFit.cover,
                                width: double.infinity,
                                loadingBuilder: (context, child, loadingProgress) {
                                  if (loadingProgress == null) return child;
                                  return Container(
                                    color: const Color(0xFFE3EED4).withOpacity(0.3),
                                    child: Center(
                                      child: CircularProgressIndicator(
                                        value: loadingProgress.expectedTotalBytes != null
                                            ? loadingProgress.cumulativeBytesLoaded /
                                            loadingProgress.expectedTotalBytes!
                                            : null,
                                        color: const Color(0xFF0F2A1D),
                                      ),
                                    ),
                                  );
                                },
                                errorBuilder: (context, error, stackTrace) {
                                  return Container(
                                    color: const Color(0xFFE3EED4).withOpacity(0.3),
                                    child: const Center(
                                      child: Column(
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        children: [
                                          Icon(
                                            Icons.broken_image,
                                            size: 50,
                                            color: Color(0xFF0F2A1D),
                                          ),
                                          SizedBox(height: 10),
                                          Text(
                                            'Image not available',
                                            style: TextStyle(
                                              color: Color(0xFF0F2A1D),
                                              fontFamily: 'Poppins',
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  );
                                },
                              ),
                            );
                          },
                        ),

                        // Left navigation arrow
                        if (photos.length > 1)
                          Positioned(
                            left: 10,
                            top: 0,
                            bottom: 0,
                            child: Center(
                              child: GestureDetector(
                                onTap: () {
                                  if (_currentPage > 0) {
                                    _pageController.previousPage(
                                      duration: const Duration(milliseconds: 300),
                                      curve: Curves.easeInOut,
                                    );
                                  }
                                },
                                child: Container(
                                  width: 40,
                                  height: 40,
                                  decoration: BoxDecoration(
                                    color: const Color(0xFF0F2A1D).withOpacity(0.7),
                                    shape: BoxShape.circle,
                                  ),
                                  child: const Icon(
                                    Icons.arrow_back_ios,
                                    color: Colors.white,
                                    size: 20,
                                  ),
                                ),
                              ),
                            ),
                          ),

                        // Right navigation arrow
                        if (photos.length > 1)
                          Positioned(
                            right: 10,
                            top: 0,
                            bottom: 0,
                            child: Center(
                              child: GestureDetector(
                                onTap: () {
                                  if (_currentPage < photos.length - 1) {
                                    _pageController.nextPage(
                                      duration: const Duration(milliseconds: 300),
                                      curve: Curves.easeInOut,
                                    );
                                  }
                                },
                                child: Container(
                                  width: 40,
                                  height: 40,
                                  decoration: BoxDecoration(
                                    color: const Color(0xFF0F2A1D).withOpacity(0.7),
                                    shape: BoxShape.circle,
                                  ),
                                  child: const Icon(
                                    Icons.arrow_forward_ios,
                                    color: Colors.white,
                                    size: 20,
                                  ),
                                ),
                              ),
                            ),
                          ),

                        // Page indicators
                        if (photos.length > 1)
                          Positioned(
                            bottom: 15,
                            left: 0,
                            right: 0,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: List.generate(
                                photos.length,
                                    (index) => AnimatedContainer(
                                  duration: const Duration(milliseconds: 300),
                                  margin: const EdgeInsets.symmetric(horizontal: 4),
                                  width: _currentPage == index ? 12 : 8,
                                  height: _currentPage == index ? 12 : 8,
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: _currentPage == index
                                        ? const Color(0xFF0F2A1D)
                                        : const Color(0xFF0F2A1D).withOpacity(0.3),
                                  ),
                                ),
                              ),
                            ),
                          ),

                        // Image counter
                        Positioned(
                          top: 15,
                          right: 15,
                          child: Container(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 12,
                              vertical: 8,
                            ),
                            decoration: BoxDecoration(
                              color: const Color(0xFF0F2A1D).withOpacity(0.8),
                              borderRadius: BorderRadius.circular(25),
                            ),
                            child: Row(
                              children: [
                                const Icon(
                                  Icons.photo,
                                  size: 14,
                                  color: Colors.white,
                                ),
                                const SizedBox(width: 8),
                                Text(
                                  '${_currentPage + 1} / ${photos.length}',
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
                        ),
                      ],
                    ),
                  ),
                const SizedBox(height: 25),

                // Menu Section
                Row(
                  children: [
                    Container(
                      padding: const EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        color: const Color(0xFF0F2A1D).withOpacity(0.1),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: const Icon(
                        Icons.restaurant_menu_outlined,
                        color: Color(0xFF0F2A1D),
                        size: 20,
                      ),
                    ),
                    const SizedBox(width: 12),
                    const Text(
                      'Menu',
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
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                  decoration: BoxDecoration(
                    color: const Color(0xFF0F2A1D).withOpacity(0.1),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: const Text(
                    'Food  menu',
                    style: TextStyle(
                      fontSize: 12,
                      color: Color(0xFF0F2A1D),
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
                const SizedBox(height: 15),
                Container(
                  height: 250,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    border: Border.all(
                      color: const Color(0xFF0F2A1D).withOpacity(0.2),
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: const Color(0xFF0F2A1D).withOpacity(0.1),
                        blurRadius: 8,
                        offset: const Offset(0, 2),
                      ),
                    ],
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(15),
                    child: Image.network(
                      detail.menu,
                      fit: BoxFit.cover,
                      width: double.infinity,
                      loadingBuilder: (context, child, loadingProgress) {
                        if (loadingProgress == null) return child;
                        return Center(
                          child: CircularProgressIndicator(
                            value: loadingProgress.expectedTotalBytes != null
                                ? loadingProgress.cumulativeBytesLoaded /
                                loadingProgress.expectedTotalBytes!
                                : null,
                            color: const Color(0xFF0F2A1D),
                          ),
                        );
                      },
                      errorBuilder: (context, error, stackTrace) {
                        return Container(
                          color: const Color(0xFFE3EED4).withOpacity(0.3),
                          child: Center(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                const Icon(
                                  Icons.restaurant_menu,
                                  size: 50,
                                  color: Color(0xFF0F2A1D),
                                ),
                                const SizedBox(height: 10),
                                const Text(
                                  'Menu Image',
                                  style: TextStyle(
                                    color: Color(0xFF0F2A1D),
                                    fontFamily: 'Poppins',
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCapacityCard({
    required String title,
    required String value,
    required IconData icon,
    required Color color,
  }) {
    return Container(
      padding: const EdgeInsets.all(15),
      decoration: BoxDecoration(
        color: color.withOpacity(0.1),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: color.withOpacity(0.3)),
      ),
      child: Column(
        children: [
          Icon(icon, color: color, size: 28),
          const SizedBox(height: 10),
          Text(
            title,
            style: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.bold,
              color: color,
              fontFamily: 'Poppins',
              letterSpacing: 0.5,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            value,
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.w800,
              color: color,
              fontFamily: 'Poppins',
            ),
          ),
        ],
      ),
    );
  }
}

class ExtraDetail {
  final String id;
  final String stay;
  final String photo1;
  final String photo2;
  final String photo3;
  final String photo4;
  final String menu;
  final String staydetails;

  ExtraDetail({
    required this.id,
    required this.stay,
    required this.photo1,
    required this.photo2,
    required this.photo3,
    required this.photo4,
    required this.menu,
    required this.staydetails,
  });
}