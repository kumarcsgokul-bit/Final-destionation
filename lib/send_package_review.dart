// import 'package:final_destination/view_travel_company.dart';
// import 'package:final_destination/viewpackage.dart';
// import 'package:flutter/material.dart';
// import 'package:http/http.dart' as http;
// import 'package:shared_preferences/shared_preferences.dart';
//
// import 'home.dart';
// void main(){
//   runApp(sendpackagereview());
// }
// class sendpackagereview extends StatelessWidget {
//   const sendpackagereview({Key? key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(home: sendpackagereviewsub(),);
//   }
// }
// class sendpackagereviewsub extends StatefulWidget {
//   const sendpackagereviewsub({Key? key}) : super(key: key);
//
//   @override
//   State<sendpackagereviewsub> createState() => _sendpackagereviewsubState();
// }
//
// class _sendpackagereviewsubState extends State<sendpackagereviewsub> {
//   final review=TextEditingController();
//   final rating=TextEditingController();
//   final formkey=GlobalKey<FormState>();
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(body: Center(child: SingleChildScrollView(child: SizedBox(height: 500,width: 500,child:
//     Form(key: formkey,
//       child: Column(children: [
//         TextFormField(validator: (value){
//           if(value==null || value.isEmpty){
//             return 'enter valid data';
//           }
//           return null;
//         },
//           controller: review,
//           decoration: InputDecoration(
//               border: OutlineInputBorder(),
//               hintText: 'enter review',
//               labelText: 'review',
//               prefixIcon: Icon(Icons.abc)
//           ),),SizedBox(height: 20,),
//         TextFormField(validator: (value){
//           if(value==null || value.isEmpty){
//             return 'enter valid data';
//           }
//           return null;
//         },
//           controller: rating,
//           decoration: InputDecoration(
//               border: OutlineInputBorder(),
//               hintText: 'enter rating',
//               labelText: 'rating',
//               prefixIcon: Icon(Icons.abc)
//           ),),SizedBox(height: 20,),
//         ElevatedButton(onPressed: () async {
//           if(!formkey.currentState!.validate()) {
//             return;
//           }
//           SharedPreferences sh=await SharedPreferences.getInstance();
//           var data=await http.post(Uri.parse('${sh.getString('ip')}/usersendpackagereview'),
//               body: {
//                 'review':review.text,
//                 'rating':rating.text,
//                 'uid':sh.getString('uid').toString(),
//                 'pid':sh.getString('pid').toString()
//               });
//           Navigator.push(context, MaterialPageRoute(builder: (context)=>viewpackage()));
//
//         }, child: Text('send'))
//       ],),),),),),);
//   }
// }


// import 'dart:convert';
// import 'package:flutter/material.dart';
// import 'package:http/http.dart' as http;
// import 'package:shared_preferences/shared_preferences.dart';
//
// void main() {
//   runApp(MaterialApp(home: PackageReviewPage()));
// }
//
// class PackageReviewPage extends StatefulWidget {
//   const PackageReviewPage({Key? key}) : super(key: key);
//
//   @override
//   State<PackageReviewPage> createState() => _PackageReviewPageState();
// }
//
// class _PackageReviewPageState extends State<PackageReviewPage> {
//   final review = TextEditingController();
//   final rating = TextEditingController();
//   final formkey = GlobalKey<FormState>();
//   List<Review> reviewList = [];
//   bool loading = true;
//
//   @override
//   void initState() {
//     super.initState();
//     _getReviews();
//   }
//
//   // Fetch reviews from backend
//   Future<void> _getReviews() async {
//     setState(() => loading = true);
//     SharedPreferences sh = await SharedPreferences.getInstance();
//     var pid = sh.getString('pid').toString();
//     var ip = sh.getString('ip').toString();
//
//     var data = await http.post(
//       Uri.parse('$ip/user_viewpackagereview'),
//       body: {'pid': pid},
//     );
//
//     var jsonData = json.decode(data.body);
//     List<Review> tempList = [];
//     for (var i in jsonData['message']) {
//       tempList.add(Review(
//         id: i['id'].toString(),
//         reviewText: i['review'],
//         ratingText: i['rating'].toString(),
//         username: i['username'],
//         date: i['date'].toString(),
//       ));
//     }
//
//     setState(() {
//       reviewList = tempList;
//       loading = false;
//     });
//   }
//
//   // Send review to backend
//   Future<void> _sendReview() async {
//     if (!formkey.currentState!.validate()) return;
//
//     SharedPreferences sh = await SharedPreferences.getInstance();
//     var uid = sh.getString('uid').toString();
//     var pid = sh.getString('pid').toString();
//     var ip = sh.getString('ip').toString();
//
//     await http.post(Uri.parse('$ip/usersendpackagereview'), body: {
//       'uid': uid,
//       'review': review.text,
//       'rating': rating.text,
//       'pid': pid,
//     });
//
//     review.clear();
//     rating.clear();
//
//     // Refresh the review list
//     _getReviews();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: Text("Package Reviews")),
//       body: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: Column(
//           children: [
//             // Send Review Form
//             Form(
//               key: formkey,
//               child: Column(
//                 children: [
//                   TextFormField(
//                     controller: review,
//                     validator: (value) =>
//                     value == null || value.isEmpty ? 'Enter review' : null,
//                     decoration: InputDecoration(
//                       border: OutlineInputBorder(),
//                       labelText: 'review',
//                     ),
//                   ),
//                   SizedBox(height: 10),
//                   TextFormField(
//                     controller: rating,
//                     validator: (value) =>
//                     value == null || value.isEmpty ? 'Enter rating' : null,
//                     decoration: InputDecoration(
//                       border: OutlineInputBorder(),
//                       labelText: 'rating',
//                     ),
//                   ),
//                   SizedBox(height: 10),
//                   ElevatedButton(
//                     onPressed: _sendReview,
//                     child: Text('send'),
//                   ),
//                 ],
//               ),
//             ),
//             SizedBox(height: 20),
//             Divider(),
//             SizedBox(height: 10),
//
//             // View Reviews Section
//             loading
//                 ? Center(child: CircularProgressIndicator())
//                 : Expanded(
//               child: reviewList.isEmpty
//                   ? Center(child: Text("No reviews yet"))
//                   : ListView.builder(
//                 itemCount: reviewList.length,
//                 itemBuilder: (context, index) {
//                   var r = reviewList[index];
//                   return Card(
//                     elevation: 3,
//                     margin: EdgeInsets.symmetric(vertical: 5),
//                     child: Padding(
//                       padding: const EdgeInsets.all(16.0),
//                       child: Column(
//                         crossAxisAlignment:
//                         CrossAxisAlignment.start,
//                         children: [
//                           _buildRow("review:", r.reviewText),
//                           _buildRow("rating:", r.ratingText),
//                           _buildRow("user name:", r.username),
//                           _buildRow("date:", r.date),
//                         ],
//                       ),
//                     ),
//                   );
//                 },
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
//
//   Widget _buildRow(String label, String value) {
//     return Padding(
//       padding: const EdgeInsets.symmetric(vertical: 4),
//       child: Row(
//         children: [
//           SizedBox(
//             width: 100,
//             child: Text(
//               label,
//               style: TextStyle(fontWeight: FontWeight.bold),
//             ),
//           ),
//           SizedBox(width: 5),
//           Flexible(
//             child: Text(
//               value,
//               style: TextStyle(color: Colors.grey.shade800),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
//
// // Review model keeping backend names
// class Review {
//   final String id;
//   final String reviewText;
//   final String ratingText;
//   final String username;
//   final String date;
//
//   Review(
//       {required this.id,
//         required this.reviewText,
//         required this.ratingText,
//         required this.username,
//         required this.date});
// }



import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: const Color(0xFF0F2A1D),
        scaffoldBackgroundColor: const Color(0xFFE3EED4),
        fontFamily: 'Poppins',
      ),
      home: PackageReviewPage(),
    ),
  );
}

class PackageReviewPage extends StatefulWidget {
  const PackageReviewPage({Key? key}) : super(key: key);

  @override
  State<PackageReviewPage> createState() => _PackageReviewPageState();
}

class _PackageReviewPageState extends State<PackageReviewPage> {
  final review = TextEditingController();
  final rating = TextEditingController();
  final formkey = GlobalKey<FormState>();
  List<Review> reviewList = [];
  bool loading = true;

  // Map to track expanded state for long reviews
  Map<int, bool> _expandedStates = {};

  // Selected rating for star picker
  double _selectedRating = 0.0;

  @override
  void initState() {
    super.initState();
    _getReviews();
  }

  // Fetch reviews from backend
  Future<void> _getReviews() async {
    setState(() => loading = true);
    SharedPreferences sh = await SharedPreferences.getInstance();
    var pid = sh.getString('pid').toString();
    var ip = sh.getString('ip').toString();

    var data = await http.post(
      Uri.parse('$ip/user_viewpackagereview'),
      body: {'pid': pid},
    );

    var jsonData = json.decode(data.body);
    List<Review> tempList = [];
    for (var i in jsonData['message']) {
      tempList.add(Review(
        id: i['id'].toString(),
        reviewText: i['review'],
        ratingText: i['rating'].toString(),
        username: i['username'],
        date: i['date'].toString(),
      ));
    }

    setState(() {
      reviewList = tempList;
      loading = false;
      _expandedStates.clear();
    });
  }

  // Send review to backend
  Future<void> _sendReview() async {
    if (!formkey.currentState!.validate()) return;

    // Check if rating is selected
    if (_selectedRating == 0) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: const Text('Please select a rating'),
          backgroundColor: Colors.red,
          behavior: SnackBarBehavior.floating,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
      );
      return;
    }

    // Set rating value in controller
    rating.text = _selectedRating.toString();

    SharedPreferences sh = await SharedPreferences.getInstance();
    var uid = sh.getString('uid').toString();
    var pid = sh.getString('pid').toString();
    var ip = sh.getString('ip').toString();

    await http.post(Uri.parse('$ip/usersendpackagereview'), body: {
      'uid': uid,
      'review': review.text,
      'rating': rating.text,
      'pid': pid,
    });

    // Show success message
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: const Text('Review submitted successfully!'),
        backgroundColor: Colors.green,
        behavior: SnackBarBehavior.floating,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
    );

    review.clear();
    rating.clear();
    setState(() {
      _selectedRating = 0;
    });

    // Refresh the review list
    _getReviews();
  }

  void _toggleExpand(int index) {
    setState(() {
      _expandedStates[index] = !(_expandedStates[index] ?? false);
    });
  }

  // Premium star rating display widget
  Widget _buildRatingStars(String ratingValue) {
    double rating = double.tryParse(ratingValue) ?? 0.0;
    int fullStars = rating.floor();
    bool hasHalfStar = (rating - fullStars) >= 0.5;

    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        ...List.generate(5, (index) {
          if (index < fullStars) {
            return const Icon(
              Icons.star,
              color: Color(0xFFFFD700),
              size: 16,
            );
          } else if (index == fullStars && hasHalfStar) {
            return const Icon(
              Icons.star_half,
              color: Color(0xFFFFD700),
              size: 16,
            );
          } else {
            return Icon(
              Icons.star_border,
              color: const Color(0xFFFFD700).withOpacity(0.3),
              size: 16,
            );
          }
        }),
        const SizedBox(width: 4),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
          decoration: BoxDecoration(
            color: const Color(0xFFFFD700).withOpacity(0.2),
            borderRadius: BorderRadius.circular(12),
          ),
          child: Text(
            rating.toStringAsFixed(1),
            style: const TextStyle(
              fontSize: 10,
              fontWeight: FontWeight.w900,
              color: Color(0xFF0F2A1D),
              fontFamily: 'Poppins',
            ),
          ),
        ),
      ],
    );
  }

  // Interactive star picker for submitting reviews
  Widget _buildStarPicker() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Your Rating',
          style: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w800,
            color: Color(0xFF0F2A1D),
            fontFamily: 'Poppins',
          ),
        ),
        const SizedBox(height: 8),
        Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: const Color(0xFF0F2A1D).withOpacity(0.03),
            borderRadius: BorderRadius.circular(15),
            border: Border.all(
              color: const Color(0xFF0F2A1D).withOpacity(0.1),
            ),
          ),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: List.generate(5, (index) {
                  return GestureDetector(
                    onTap: () {
                      setState(() {
                        _selectedRating = index + 1.0;
                      });
                    },
                    child: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 8),
                      child: Icon(
                        index < _selectedRating
                            ? Icons.star
                            : Icons.star_border,
                        color: index < _selectedRating
                            ? const Color(0xFFFFD700)
                            : const Color(0xFFFFD700).withOpacity(0.3),
                        size: 32,
                      ),
                    ),
                  );
                }),
              ),
              const SizedBox(height: 8),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      const Color(0xFFFFD700).withOpacity(0.2),
                      const Color(0xFFFFA500).withOpacity(0.1),
                    ],
                  ),
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(
                    color: const Color(0xFFFFD700).withOpacity(0.3),
                  ),
                ),
                child: Text(
                  _selectedRating > 0
                      ? '${_selectedRating.toStringAsFixed(1)} out of 5'
                      : 'Tap a star to rate',
                  style: TextStyle(
                    fontSize: 12,
                    fontWeight: _selectedRating > 0
                        ? FontWeight.w900
                        : FontWeight.w600,
                    color: const Color(0xFF0F2A1D),
                    fontFamily: 'Poppins',
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
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
          'Package Reviews',
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
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            // Send Review Form - Premium Styling
            Container(
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
                boxShadow: [
                  BoxShadow(
                    color: const Color(0xFF0F2A1D).withOpacity(0.1),
                    blurRadius: 10,
                    offset: const Offset(0, 5),
                  ),
                ],
              ),
              child: Form(
                key: formkey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Container(
                          padding: const EdgeInsets.all(8),
                          decoration: BoxDecoration(
                            color: const Color(0xFF0F2A1D).withOpacity(0.1),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: const Icon(
                            Icons.edit_note,
                            color: Color(0xFF0F2A1D),
                            size: 20,
                          ),
                        ),
                        const SizedBox(width: 10),
                        const Text(
                          'Write a Review',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w900,
                            color: Color(0xFF0F2A1D),
                            fontFamily: 'Poppins',
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 20),

                    // Star Picker
                    _buildStarPicker(),
                    const SizedBox(height: 20),

                    // Review TextField
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'Your Review',
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w800,
                            color: Color(0xFF0F2A1D),
                            fontFamily: 'Poppins',
                          ),
                        ),
                        const SizedBox(height: 8),
                        TextFormField(
                          controller: review,
                          validator: (value) =>
                          value == null || value.isEmpty ? 'Enter your review' : null,
                          maxLines: 3,
                          decoration: InputDecoration(
                            hintText: 'Share your experience with this package...',
                            hintStyle: TextStyle(
                              fontSize: 14,
                              color: const Color(0xFF0F2A1D).withOpacity(0.5),
                              fontFamily: 'Poppins',
                            ),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12),
                              borderSide: BorderSide.none,
                            ),
                            filled: true,
                            fillColor: const Color(0xFF0F2A1D).withOpacity(0.05),
                            contentPadding: const EdgeInsets.all(16),
                          ),
                          style: const TextStyle(
                            fontSize: 14,
                            color: Color(0xFF0F2A1D),
                            fontFamily: 'Poppins',
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ),

                    // Hidden rating field (for form validation)
                    const SizedBox(height: 16),

                    // Submit Button
                    SizedBox(
                      width: double.infinity,
                      height: 45,
                      child: ElevatedButton(
                        onPressed: _sendReview,
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xFF0F2A1D),
                          foregroundColor: Colors.white,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                          elevation: 2,
                        ),
                        child: const Text(
                          'SUBMIT REVIEW',
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w800,
                            fontFamily: 'Poppins',
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),

            const SizedBox(height: 20),

            // View Reviews Section
            loading
                ? Expanded(
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CircularProgressIndicator(
                      color: const Color(0xFF0F2A1D),
                    ),
                    const SizedBox(height: 20),
                    Text(
                      "Loading reviews...",
                      style: TextStyle(
                        color: const Color(0xFF0F2A1D),
                        fontSize: 14,
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
              ),
            )
                : Expanded(
              child: reviewList.isEmpty
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
                        Icons.rate_review_outlined,
                        size: 50,
                        color: Color(0xFF0F2A1D),
                      ),
                    ),
                    const SizedBox(height: 20),
                    const Text(
                      'No reviews yet',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w900,
                        color: Color(0xFF0F2A1D),
                        fontFamily: 'Poppins',
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      'Be the first to review this package',
                      style: TextStyle(
                        fontSize: 12,
                        color: const Color(0xFF0F2A1D).withOpacity(0.6),
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
              )
                  : ListView.builder(
                itemCount: reviewList.length,
                itemBuilder: (context, index) {
                  var r = reviewList[index];
                  bool isExpanded = _expandedStates[index] ?? false;
                  bool isLongReview = r.reviewText.length > 100;

                  return Padding(
                    padding: const EdgeInsets.only(bottom: 12),
                    child: Card(
                      elevation: 2,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // Header with user info
                          Container(
                            decoration: const BoxDecoration(
                              gradient: LinearGradient(
                                colors: [Color(0xFF0F2A1D), Color(0xFF1A3F2B)],
                                begin: Alignment.topLeft,
                                end: Alignment.bottomRight,
                              ),
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(15),
                                topRight: Radius.circular(15),
                              ),
                            ),
                            padding: const EdgeInsets.all(12),
                            child: Row(
                              children: [
                                Container(
                                  width: 36,
                                  height: 36,
                                  decoration: BoxDecoration(
                                    color: Colors.white.withOpacity(0.2),
                                    shape: BoxShape.circle,
                                  ),
                                  child: Center(
                                    child: Text(
                                      r.username.isNotEmpty
                                          ? r.username[0].toUpperCase()
                                          : 'U',
                                      style: const TextStyle(
                                        color: Colors.white,
                                        fontSize: 16,
                                        fontWeight: FontWeight.w800,
                                        fontFamily: 'Poppins',
                                      ),
                                    ),
                                  ),
                                ),
                                const SizedBox(width: 10),
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        r.username,
                                        style: const TextStyle(
                                          color: Colors.white,
                                          fontSize: 14,
                                          fontWeight: FontWeight.w800,
                                          fontFamily: 'Poppins',
                                        ),
                                      ),
                                      const SizedBox(height: 2),
                                      Row(
                                        children: [
                                          const Icon(
                                            Icons.calendar_today,
                                            color: Colors.white70,
                                            size: 10,
                                          ),
                                          const SizedBox(width: 4),
                                          Text(
                                            _formatDate(r.date),
                                            style: const TextStyle(
                                              color: Colors.white70,
                                              fontSize: 10,
                                              fontFamily: 'Poppins',
                                              fontWeight: FontWeight.w600,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                                // Rating badge
                                Container(
                                  padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(15),
                                  ),
                                  child: _buildRatingStars(r.ratingText),
                                ),
                              ],
                            ),
                          ),

                          // Review content
                          Padding(
                            padding: const EdgeInsets.all(12),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  isExpanded
                                      ? r.reviewText
                                      : (isLongReview
                                      ? '${r.reviewText.substring(0, 100)}...'
                                      : r.reviewText),
                                  style: const TextStyle(
                                    fontSize: 13,
                                    color: Color(0xFF0F2A1D),
                                    fontFamily: 'Poppins',
                                    fontWeight: FontWeight.w600,
                                    height: 1.4,
                                  ),
                                ),

                                if (isLongReview)
                                  Padding(
                                    padding: const EdgeInsets.only(top: 8),
                                    child: GestureDetector(
                                      onTap: () => _toggleExpand(index),
                                      child: Container(
                                        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                                        decoration: BoxDecoration(
                                          color: const Color(0xFF0F2A1D).withOpacity(0.1),
                                          borderRadius: BorderRadius.circular(15),
                                        ),
                                        child: Row(
                                          mainAxisSize: MainAxisSize.min,
                                          children: [
                                            Text(
                                              isExpanded ? 'Show Less' : 'Read More',
                                              style: const TextStyle(
                                                color: Color(0xFF0F2A1D),
                                                fontSize: 10,
                                                fontWeight: FontWeight.w800,
                                                fontFamily: 'Poppins',
                                              ),
                                            ),
                                            const SizedBox(width: 4),
                                            Icon(
                                              isExpanded ? Icons.expand_less : Icons.expand_more,
                                              size: 12,
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
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Helper function to format date
  String _formatDate(String date) {
    try {
      // If date is in format "2024-01-15" or similar
      if (date.contains('-')) {
        return date;
      }
      return date;
    } catch (e) {
      return date;
    }
  }

  // Keep original _buildRow method for backward compatibility (though not used in new design)
  Widget _buildRow(String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        children: [
          SizedBox(
            width: 100,
            child: Text(
              label,
              style: const TextStyle(
                fontWeight: FontWeight.w800,
                color: Color(0xFF0F2A1D),
                fontSize: 13,
                fontFamily: 'Poppins',
              ),
            ),
          ),
          const SizedBox(width: 5),
          const Text(
            ':',
            style: TextStyle(
              color: Color(0xFF0F2A1D),
              fontWeight: FontWeight.w800,
            ),
          ),
          const SizedBox(width: 8),
          Flexible(
            child: Text(
              value,
              style: TextStyle(
                fontSize: 13,
                color: const Color(0xFF0F2A1D).withOpacity(0.8),
                fontFamily: 'Poppins',
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// Review model keeping backend names
class Review {
  final String id;
  final String reviewText;
  final String ratingText;
  final String username;
  final String date;

  Review({
    required this.id,
    required this.reviewText,
    required this.ratingText,
    required this.username,
    required this.date,
  });
}