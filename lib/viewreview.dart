// import 'dart:convert';
//
// import 'package:flutter/material.dart';
// import 'package:http/http.dart' as http;
// import 'package:shared_preferences/shared_preferences.dart';
//
// void main(){
//   runApp(viewreview());
//
// }
// class viewreview extends StatelessWidget {
//   const viewreview({Key? key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(home: viewreviewsub(),);
//   }
// }
// class viewreviewsub extends StatefulWidget {
//   const viewreviewsub({Key? key}) : super(key: key);
//
//   @override
//   State<viewreviewsub> createState() => _viewreviewsubState();
// }
//
// class _viewreviewsubState extends State<viewreviewsub> {
//   Future<List<Joke>> _getJokes() async {
//     SharedPreferences prefs = await SharedPreferences.getInstance();
//     String b = prefs.getString("lid").toString();
//     String foodimage="";
//     var data =
//     await http.post(Uri.parse(prefs.getString("ip").toString()+"/user_viewreview"),
//         body: {"tid":prefs.getString('tid').toString()}
//     );
//
//     var jsonData = json.decode(data.body);
// //    print(jsonData);
//     List<Joke> jokes = [];
//     for (var joke in jsonData["message"]) {
//       print(joke);
//       Joke newJoke = Joke(
//           joke["id"].toString(),
//           joke["review"],
//           joke["date"].toString(),
//           joke["username"].toString(),
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
//                           _buildRow("review:", i.review.toString()),
//                           _buildRow("date:", i.date.toString()),
//                           _buildRow("user name:", i.username.toString()),
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
//   final String review;
//   final String date;
//   final String username;
//
//
//
//   Joke(this.id,this.review, this.date,this.username);
// //  print("hiiiii");
// }
//


//
// import 'dart:convert';
// import 'package:final_destination/view_travel_company.dart';
// import 'package:flutter/material.dart';
// import 'package:http/http.dart' as http;
// import 'package:shared_preferences/shared_preferences.dart';
//
// void main() {
//   runApp(viewreview());
// }
//
// class viewreview extends StatelessWidget {
//   const viewreview({Key? key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       theme: ThemeData(
//         primaryColor: Color(0xFF1A237E),
//         fontFamily: 'Poppins',
//       ),
//       home: viewreviewsub(),
//     );
//   }
// }
//
// class viewreviewsub extends StatefulWidget {
//   const viewreviewsub({Key? key}) : super(key: key);
//
//   @override
//   State<viewreviewsub> createState() => _viewreviewsubState();
// }
//
// class _viewreviewsubState extends State<viewreviewsub> {
//   List<Joke> _reviews = [];
//   Map<String, bool> _likedReviews = {};
//   Map<String, int> _reviewLikes = {};
//   bool _isLoading = true;
//
//   @override
//   void initState() {
//     super.initState();
//     _loadReviews();
//     _loadLikedReviews();
//   }
//
//   Future<void> _loadLikedReviews() async {
//     SharedPreferences prefs = await SharedPreferences.getInstance();
//     final likedData = prefs.getString('liked_reviews') ?? '{}';
//     final likesCountData = prefs.getString('review_likes') ?? '{}';
//
//     setState(() {
//       _likedReviews = Map<String, bool>.from(json.decode(likedData));
//       _reviewLikes = Map<String, int>.from(json.decode(likesCountData));
//     });
//   }
//
//   Future<void> _saveLikedReviews() async {
//     SharedPreferences prefs = await SharedPreferences.getInstance();
//     await prefs.setString('liked_reviews', json.encode(_likedReviews));
//     await prefs.setString('review_likes', json.encode(_reviewLikes));
//   }
//
//   Future<List<Joke>> _getJokes() async {
//     SharedPreferences prefs = await SharedPreferences.getInstance();
//     var data = await http.post(
//       Uri.parse(prefs.getString("ip").toString() + "/user_viewreview"),
//       body: {"tid": prefs.getString('tid').toString()},
//     );
//
//     var jsonData = json.decode(data.body);
//     List<Joke> jokes = [];
//     for (var joke in jsonData["message"]) {
//       Joke newJoke = Joke(
//         joke["id"].toString(),
//         joke["review"],
//         joke["rating"],
//         joke["date"].toString(),
//         joke["username"].toString(),
//       );
//       jokes.add(newJoke);
//
//       // Initialize like count for new reviews
//       if (!_reviewLikes.containsKey(joke["id"].toString())) {
//         _reviewLikes[joke["id"].toString()] = 0;
//       }
//     }
//     return jokes;
//   }
//
//   Future<void> _loadReviews() async {
//     try {
//       final reviews = await _getJokes();
//       setState(() {
//         _reviews = reviews;
//         _isLoading = false;
//       });
//     } catch (e) {
//       setState(() {
//         _isLoading = false;
//       });
//     }
//   }
//
//   void _toggleLike(String reviewId, String reviewText) {
//     setState(() {
//       if (_likedReviews[reviewId] == true) {
//         // Unlike
//         _likedReviews[reviewId] = false;
//         _reviewLikes[reviewId] = (_reviewLikes[reviewId] ?? 1) - 1;
//
//         // Show snackbar
//         ScaffoldMessenger.of(context).showSnackBar(
//           SnackBar(
//             content: Text('Review unliked'),
//             backgroundColor: Colors.grey[700],
//             duration: Duration(seconds: 1),
//           ),
//         );
//       } else {
//         // Like
//         _likedReviews[reviewId] = true;
//         _reviewLikes[reviewId] = (_reviewLikes[reviewId] ?? 0) + 1;
//
//         // Show snackbar with animation
//         ScaffoldMessenger.of(context).showSnackBar(
//           SnackBar(
//             content: Row(
//               children: [
//                 Icon(Icons.thumb_up, color: Colors.white, size: 20),
//                 SizedBox(width: 8),
//                 Text('Review liked!'),
//               ],
//             ),
//             backgroundColor: Color(0xFF1A237E),
//             duration: Duration(seconds: 2),
//             behavior: SnackBarBehavior.floating,
//           ),
//         );
//
//         // Optional: Add haptic feedback
//         // HapticFeedback.lightImpact();
//       }
//     });
//
//     // Save to persistent storage
//     _saveLikedReviews();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: Colors.white,
//         elevation: 0,
//         title: Text(
//           'Customer Reviews',
//           style: TextStyle(
//             fontSize: 24,
//             fontWeight: FontWeight.bold,
//             color: Color(0xFF1A237E),
//             letterSpacing: 1,
//           ),
//         ),
//         centerTitle: true,
//         leading: IconButton(
//           icon: Icon(Icons.arrow_back, color: Color(0xFF1A237E)),
//           onPressed: () {
//             Navigator.push(context, MaterialPageRoute(builder: (context)=>view_travel_company()));
//           },
//         ),
//         actions: [
//           // Total likes count
//           Container(
//             padding: EdgeInsets.symmetric(horizontal: 16),
//             child: Center(
//               child: Row(
//                 children: [
//                   Icon(Icons.thumb_up, color: Color(0xFF1A237E), size: 18),
//                   SizedBox(width: 4),
//                   Text(
//                     '${_reviewLikes.values.fold(0, (sum, count) => sum + count)}',
//                     style: TextStyle(
//                       color: Color(0xFF1A237E),
//                       fontWeight: FontWeight.bold,
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//           ),
//           IconButton(
//             icon: Icon(Icons.refresh, color: Color(0xFF1A237E)),
//             onPressed: () {
//               setState(() {
//                 _isLoading = true;
//               });
//               _loadReviews();
//             },
//           ),
//         ],
//       ),
//       body: Container(
//         decoration: BoxDecoration(
//           gradient: LinearGradient(
//             begin: Alignment.topCenter,
//             end: Alignment.bottomCenter,
//             colors: [
//               Colors.white,
//               Color(0xFFF5F5F5),
//             ],
//           ),
//         ),
//         child: Column(
//           children: [
//             // Header Section
//             Container(
//               padding: EdgeInsets.symmetric(vertical: 30, horizontal: 20),
//               child: Column(
//                 children: [
//                   Container(
//                     width: 80,
//                     height: 80,
//                     decoration: BoxDecoration(
//                       color: Color(0xFF1A237E).withOpacity(0.1),
//                       shape: BoxShape.circle,
//                     ),
//                     child: Icon(
//                       Icons.reviews,
//                       size: 40,
//                       color: Color(0xFF1A237E),
//                     ),
//                   ),
//                   SizedBox(height: 20),
//                   Text(
//                     'Travel Experiences',
//                     style: TextStyle(
//                       fontSize: 28,
//                       fontWeight: FontWeight.bold,
//                       color: Color(0xFF1A237E),
//                     ),
//                   ),
//                   SizedBox(height: 10),
//                   Text(
//                     'Read what our customers have to say about their journeys',
//                     style: TextStyle(
//                       fontSize: 16,
//                       color: Colors.grey[700],
//                     ),
//                     textAlign: TextAlign.center,
//                   ),
//                   SizedBox(height: 20),
//                   Container(
//                     width: 80,
//                     height: 3,
//                     color: Color(0xFF1A237E),
//                   ),
//                 ],
//               ),
//             ),
//
//             // Reviews List
//             Expanded(
//               child: _isLoading
//                   ? Center(
//                 child: Column(
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   children: [
//                     CircularProgressIndicator(
//                       color: Color(0xFF1A237E),
//                     ),
//                     SizedBox(height: 20),
//                     Text(
//                       'Loading Reviews...',
//                       style: TextStyle(
//                         color: Color(0xFF1A237E),
//                         fontSize: 16,
//                       ),
//                     ),
//                   ],
//                 ),
//               )
//                   : _reviews.isEmpty
//                   ? Center(
//                 child: Column(
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   children: [
//                     Icon(
//                       Icons.reviews_outlined,
//                       size: 60,
//                       color: Colors.grey[400],
//                     ),
//                     SizedBox(height: 20),
//                     Text(
//                       'No Reviews Yet',
//                       style: TextStyle(
//                         fontSize: 20,
//                         color: Colors.grey[600],
//                         fontWeight: FontWeight.bold,
//                       ),
//                     ),
//                     SizedBox(height: 10),
//                     Text(
//                       'Be the first to share your experience!',
//                       style: TextStyle(
//                         color: Colors.grey[500],
//                       ),
//                     ),
//                   ],
//                 ),
//               )
//                   : ListView.builder(
//                 padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
//                 itemCount: _reviews.length,
//                 itemBuilder: (BuildContext context, int index) {
//                   return _buildReviewCard(_reviews[index]);
//                 },
//               ),
//             ),
//           ],
//         ),
//       ),
//       // Floating action button to add a review
//       floatingActionButton: FloatingActionButton.extended(
//         onPressed: () {
//           // Navigate to send review page
//           // Navigator.push(context, MaterialPageRoute(builder: (context) => SendReviewPage()));
//         },
//         backgroundColor: Color(0xFF1A237E),
//         icon: Icon(Icons.add_comment, color: Colors.white),
//         label: Text(
//           'Add Review',
//           style: TextStyle(color: Colors.white),
//         ),
//       ),
//     );
//   }
//
//   Widget _buildReviewCard(Joke review) {
//     final isLiked = _likedReviews[review.id] ?? false;
//     final likeCount = _reviewLikes[review.id] ?? 0;
//
//     return Container(
//       margin: EdgeInsets.only(bottom: 20),
//       child: Card(
//         elevation: 4,
//         shape: RoundedRectangleBorder(
//           borderRadius: BorderRadius.circular(15),
//         ),
//         shadowColor: Colors.grey.withOpacity(0.2),
//         child: Padding(
//           padding: const EdgeInsets.all(20),
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               // User info and date row
//               Row(
//                 children: [
//                   // User avatar
//                   Container(
//                     width: 50,
//                     height: 50,
//                     decoration: BoxDecoration(
//                       color: Color(0xFF1A237E).withOpacity(0.1),
//                       shape: BoxShape.circle,
//                     ),
//                     child: Center(
//                       child: Text(
//                         review.username.substring(0, 1).toUpperCase(),
//                         style: TextStyle(
//                           fontSize: 20,
//                           fontWeight: FontWeight.bold,
//                           color: Color(0xFF1A237E),
//                         ),
//                       ),
//                     ),
//                   ),
//                   SizedBox(width: 15),
//                   Expanded(
//                     child: Column(
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: [
//                         Text(
//                           review.username,
//                           style: TextStyle(
//                             fontSize: 18,
//                             fontWeight: FontWeight.bold,
//                             color: Color(0xFF1A237E),
//                           ),
//                         ),
//                         SizedBox(height: 4),
//                         Row(
//                           children: [
//                             Icon(
//                               Icons.calendar_today,
//                               size: 14,
//                               color: Colors.grey[500],
//                             ),
//                             SizedBox(width: 6),
//                             Text(
//                               review.date,
//                               style: TextStyle(
//                                 fontSize: 14,
//                                 color: Colors.grey[600],
//                               ),
//                             ),
//                           ],
//                         ),
//                       ],
//                     ),
//                   ),
//                   Container(
//                     padding: EdgeInsets.symmetric(horizontal: 12, vertical: 6),
//                     decoration: BoxDecoration(
//                       color: Color(0xFF1A237E).withOpacity(0.1),
//                       borderRadius: BorderRadius.circular(20),
//                     ),
//                     child: Text(
//                       'Review',
//                       style: TextStyle(
//                         color: Color(0xFF1A237E),
//                         fontSize: 12,
//                         fontWeight: FontWeight.bold,
//                       ),
//                     ),
//                   ),
//                 ],
//               ),
//
//               SizedBox(height: 20),
//
//               // Review text
//               Container(
//                 padding: EdgeInsets.all(16),
//                 decoration: BoxDecoration(
//                   color: Colors.grey[50],
//                   borderRadius: BorderRadius.circular(12),
//                   border: Border.all(
//                     color: Colors.grey[200]!,
//                   ),
//                 ),
//                 child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     Text(
//                       'Review Content',
//                       style: TextStyle(
//                         fontSize: 14,
//                         fontWeight: FontWeight.w600,
//                         color: Colors.grey[700],
//                       ),
//                     ),
//                     SizedBox(height: 8),
//                     Text(
//                       review.review,
//                       style: TextStyle(
//                         fontSize: 16,
//                         color: Colors.grey[800],
//                         // lineHeight: 1.6,
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//
//               Container(
//                 padding: EdgeInsets.all(16),
//                 decoration: BoxDecoration(
//                   color: Colors.grey[50],
//                   borderRadius: BorderRadius.circular(12),
//                   border: Border.all(
//                     color: Colors.grey[200]!,
//                   ),
//                 ),
//                 child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     Text(
//                       'Rating',
//                       style: TextStyle(
//                         fontSize: 14,
//                         fontWeight: FontWeight.w600,
//                         color: Colors.grey[700],
//                       ),
//                     ),
//                     SizedBox(height: 8),
//                     Text(
//                       review.rating,
//                       style: TextStyle(
//                         fontSize: 16,
//                         color: Colors.grey[800],
//                         // lineHeight: 1.6,
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//
//
//               SizedBox(height: 15),
//
//               // Bottom row with actions
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.end,
//                 children: [
//                   // Like button with count
//                   Container(
//                     decoration: BoxDecoration(
//                       color: isLiked ? Color(0xFF1A237E).withOpacity(0.1) : Colors.transparent,
//                       borderRadius: BorderRadius.circular(20),
//                       border: Border.all(
//                         color: isLiked ? Color(0xFF1A237E) : Colors.grey[300]!,
//                         width: isLiked ? 1.5 : 1,
//                       ),
//                     ),
//                     child: Row(
//                       children: [
//                         IconButton(
//                           onPressed: () {
//                             _toggleLike(review.id, review.review);
//                           },
//                           icon: Icon(
//                             isLiked ? Icons.thumb_up : Icons.thumb_up_outlined,
//                             color: isLiked ? Color(0xFF1A237E) : Colors.grey[500],
//                             size: 20,
//                           ),
//                         ),
//                         Padding(
//                           padding: const EdgeInsets.only(right: 12),
//                           child: Text(
//                             likeCount.toString(),
//                             style: TextStyle(
//                               color: isLiked ? Color(0xFF1A237E) : Colors.grey[600],
//                               fontWeight: FontWeight.bold,
//                             ),
//                           ),
//                         ),
//                       ],
//                     ),
//                   ),
//                   SizedBox(width: 10),
//
//                   // Share button
//                   // IconButton(
//                   //   onPressed: () {
//                   //     _shareReview(review);
//                   //   },
//                   //   icon: Icon(
//                   //     Icons.share_outlined,
//                   //     color: Colors.grey[500],
//                   //     size: 20,
//                   //   ),
//                   // ),
//                 ],
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
//
//   void _shareReview(Joke review) {
//     // Show share dialog
//     showDialog(
//       context: context,
//       builder: (context) => AlertDialog(
//         title: Text('Share Review'),
//         content: Text('Share this review by ${review.username}?'),
//         actions: [
//           TextButton(
//             onPressed: () => Navigator.pop(context),
//             child: Text('Cancel'),
//           ),
//           ElevatedButton(
//             onPressed: () {
//               Navigator.pop(context);
//               // Show success message
//               ScaffoldMessenger.of(context).showSnackBar(
//                 SnackBar(
//                   content: Text('Review link copied to clipboard'),
//                   backgroundColor: Colors.green,
//                 ),
//               );
//             },
//             style: ElevatedButton.styleFrom(
//               backgroundColor: Color(0xFF1A237E),
//             ),
//             child: Text('Share'),
//           ),
//         ],
//       ),
//     );
//   }
// }
//
// class Joke {
//   final String id;
//   final String review;
//   final String rating;
//   final String date;
//   final String username;
//
//   Joke(this.id, this.review,this.rating, this.date, this.username);
// }


import 'dart:convert';
import 'package:final_destination/home.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  runApp(viewreview());
}

class viewreview extends StatelessWidget {
  const viewreview({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: const Color(0xFF0F2A1D),
        scaffoldBackgroundColor: const Color(0xFFE3EED4),
        fontFamily: 'Poppins',
      ),
      home: const viewreviewsub(),
    );
  }
}

class viewreviewsub extends StatefulWidget {
  const viewreviewsub({Key? key}) : super(key: key);

  @override
  State<viewreviewsub> createState() => _viewreviewsubState();
}

class _viewreviewsubState extends State<viewreviewsub> {
  Future<List<Review>> _getReviews() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var data = await http.post(
        Uri.parse(prefs.getString("ip").toString() + "/user_viewreview"),
        body: {"tid": prefs.getString('tid').toString()}
    );

    var jsonData = json.decode(data.body);
    List<Review> reviews = [];
    if (jsonData["message"] != null) {
      for (var review in jsonData["message"]) {
        Review newReview = Review(
          review["id"].toString(),
          review["review"].toString(),
          review["date"].toString(),
          review["username"].toString(),
        );
        reviews.add(newReview);
      }
    }
    return reviews;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFE3EED4),
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 2,
        title: const Text(
          'Reviews',
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
          icon: const Icon(Icons.arrow_back_ios, color: Color(0xFF0F2A1D), size: 22),
          onPressed: () => Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => UserHomeApp()),
          ),
        ),
      ),
      body: FutureBuilder<List<Review>>(
        future: _getReviews(),
        builder: (BuildContext context, AsyncSnapshot<List<Review>> snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const CircularProgressIndicator(
                    color: Color(0xFF0F2A1D),
                  ),
                  const SizedBox(height: 20),
                  Text(
                    "Loading reviews...",
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
                  const Text(
                    'Error loading reviews',
                    style: TextStyle(
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
                    Icons.reviews_outlined,
                    size: 100,
                    color: const Color(0xFF0F2A1D).withOpacity(0.3),
                  ),
                  const SizedBox(height: 20),
                  const Text(
                    'No reviews found',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w800,
                      color: Color(0xFF0F2A1D),
                      fontFamily: 'Poppins',
                    ),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    'Be the first to leave a review',
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
                final review = snapshot.data![index];

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
                                  Icons.reviews,
                                  color: Colors.white,
                                  size: 20,
                                ),
                              ),
                              const SizedBox(width: 12),
                              Expanded(
                                child: Text(
                                  review.username,
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

                        Padding(
                          padding: const EdgeInsets.all(16),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              // Date Badge
                              Container(
                                padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                                decoration: BoxDecoration(
                                  color: const Color(0xFF0F2A1D).withOpacity(0.1),
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                child: Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    const Icon(
                                      Icons.calendar_today,
                                      size: 12,
                                      color: Color(0xFF0F2A1D),
                                    ),
                                    const SizedBox(width: 4),
                                    Text(
                                      review.date,
                                      style: const TextStyle(
                                        fontSize: 11,
                                        fontWeight: FontWeight.w600,
                                        color: Color(0xFF0F2A1D),
                                        fontFamily: 'Poppins',
                                      ),
                                    ),
                                  ],
                                ),
                              ),

                              const SizedBox(height: 16),

                              // Review Content
                              Container(
                                width: double.infinity,
                                padding: const EdgeInsets.all(16),
                                decoration: BoxDecoration(
                                  color: const Color(0xFFE3EED4).withOpacity(0.3),
                                  borderRadius: BorderRadius.circular(15),
                                  border: Border.all(
                                    color: const Color(0xFF0F2A1D).withOpacity(0.1),
                                  ),
                                ),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    // Review text
                                    Text(
                                      review.review,
                                      style: const TextStyle(
                                        fontSize: 14,
                                        color: Color(0xFF0F2A1D),
                                        fontFamily: 'Poppins',
                                        fontWeight: FontWeight.w600,
                                        height: 1.5,
                                      ),
                                    ),

                                    const SizedBox(height: 12),

                                    // User info
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      children: [
                                        Container(
                                          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                                          decoration: BoxDecoration(
                                            color: const Color(0xFF0F2A1D).withOpacity(0.05),
                                            borderRadius: BorderRadius.circular(12),
                                          ),
                                          child: Row(
                                            mainAxisSize: MainAxisSize.min,
                                            children: [
                                              const Icon(
                                                Icons.person,
                                                size: 12,
                                                color: Color(0xFF0F2A1D),
                                              ),
                                              const SizedBox(width: 4),
                                              Text(
                                                'by ${review.username}',
                                                style: const TextStyle(
                                                  fontSize: 10,
                                                  color: Color(0xFF0F2A1D),
                                                  fontFamily: 'Poppins',
                                                  fontWeight: FontWeight.w500,
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
}

class Review {
  final String id;
  final String review;
  final String date;
  final String username;

  const Review(
      this.id,
      this.review,
      this.date,
      this.username,
      );
}