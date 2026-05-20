// import 'package:final_destination/view_travel_company.dart';
// import 'package:flutter/material.dart';
// import 'package:http/http.dart' as http;
// import 'package:shared_preferences/shared_preferences.dart';
//
// import 'home.dart';
// void main(){
//   runApp(sendreview());
// }
// class sendreview extends StatelessWidget {
//   const sendreview({Key? key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(home: sendreviewsub(),);
//   }
// }
// class sendreviewsub extends StatefulWidget {
//   const sendreviewsub({Key? key}) : super(key: key);
//
//   @override
//   State<sendreviewsub> createState() => _sendreviewsubState();
// }
//
// class _sendreviewsubState extends State<sendreviewsub> {
//   final review=TextEditingController();
//   final rating=TextEditingController();
//   final formkey=GlobalKey<FormState>();
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(body: Center(child: SingleChildScrollView(child: SizedBox(height: 500,width: 500,child:
//         Form(key: formkey,
//         child: Column(children: [
//       TextFormField(validator: (value){
//         if(value==null || value.isEmpty){
//           return 'enter valid data';
//         }
//         return null;
//       },
//         controller: review,
//         decoration: InputDecoration(
//         border: OutlineInputBorder(),
//         hintText: 'enter review',
//         labelText: 'review',
//         prefixIcon: Icon(Icons.abc)
//       ),),SizedBox(height: 20,),
//           TextFormField(validator: (value){
//             if(value==null || value.isEmpty){
//               return 'enter valid data';
//             }
//             return null;
//           },
//             controller: rating,
//             decoration: InputDecoration(
//                 border: OutlineInputBorder(),
//                 hintText: 'enter rating',
//                 labelText: 'rating',
//                 prefixIcon: Icon(Icons.abc)
//             ),),SizedBox(height: 20,),
//       ElevatedButton(onPressed: () async {
//         if(!formkey.currentState!.validate()) {
//           return;
//         }
//         SharedPreferences sh=await SharedPreferences.getInstance();
//         var data=await http.post(Uri.parse('${sh.getString('ip')}/usersendreview'),
//             body: {
//               'review':review.text,
//               'rating':rating.text,
//               'uid':sh.getString('uid').toString(),
//               'tid':sh.getString('tid').toString()
//             });
//         Navigator.push(context, MaterialPageRoute(builder: (context)=>view_travel_company()));
//
//       }, child: Text('send'))
//     ],),),),),),);
//   }
// }

import 'package:final_destination/view_travel_company.dart';
import 'package:final_destination/home.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  runApp(sendreview());
}

class sendreview extends StatelessWidget {
  const sendreview({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: const Color(0xFF0F2A1D),
        scaffoldBackgroundColor: const Color(0xFFE3EED4),
        fontFamily: 'Poppins',
      ),
      home: const sendreviewsub(),
    );
  }
}

class sendreviewsub extends StatefulWidget {
  const sendreviewsub({Key? key}) : super(key: key);

  @override
  State<sendreviewsub> createState() => _sendreviewsubState();
}

class _sendreviewsubState extends State<sendreviewsub> {
  final review = TextEditingController();
  final rating = TextEditingController();
  final formkey = GlobalKey<FormState>();
  bool _isLoading = false;

  // Rating options
  int _selectedRating = 0;
  final List<int> _ratingOptions = [1, 2, 3, 4, 5];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFE3EED4),
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 2,
        title: const Text(
          'Write a Review',
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
            MaterialPageRoute(builder: (context) => view_travel_company()),
          ),
        ),
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Container(
            constraints: const BoxConstraints(maxWidth: 500),
            padding: const EdgeInsets.all(20),
            child: Column(
              children: [
                // Header Section
                Container(
                  margin: const EdgeInsets.only(bottom: 30),
                  child: Column(
                    children: [
                      Container(
                        width: 90,
                        height: 90,
                        decoration: BoxDecoration(
                          gradient: const LinearGradient(
                            colors: [Color(0xFF0F2A1D), Color(0xFF1A3F2B)],
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight,
                          ),
                          shape: BoxShape.circle,
                          boxShadow: [
                            BoxShadow(
                              color: const Color(0xFF0F2A1D).withOpacity(0.3),
                              blurRadius: 15,
                              offset: const Offset(0, 5),
                            ),
                          ],
                        ),
                        child: const Icon(
                          Icons.rate_review,
                          size: 45,
                          color: Colors.white,
                        ),
                      ),
                      const SizedBox(height: 16),
                      const Text(
                        'Share Your Experience',
                        style: TextStyle(
                          fontSize: 28,
                          fontWeight: FontWeight.w800,
                          color: Color(0xFF0F2A1D),
                          fontFamily: 'Poppins',
                        ),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        'Your feedback helps others make better choices',
                        style: TextStyle(
                          fontSize: 14,
                          color: const Color(0xFF0F2A1D).withOpacity(0.7),
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      const SizedBox(height: 20),
                      Container(
                        width: 80,
                        height: 3,
                        color: const Color(0xFF0F2A1D),
                      ),
                    ],
                  ),
                ),

                // Form Card
                Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20),
                    boxShadow: [
                      BoxShadow(
                        color: const Color(0xFF0F2A1D).withOpacity(0.1),
                        blurRadius: 20,
                        spreadRadius: 5,
                        offset: const Offset(0, 10),
                      ),
                    ],
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(32),
                    child: Form(
                      key: formkey,
                      child: Column(
                        children: [
                          // Rating Selection
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  Text(
                                    'Rating',
                                    style: TextStyle(
                                      fontWeight: FontWeight.w700,
                                      color: const Color(0xFF0F2A1D),
                                      fontSize: 14,
                                      fontFamily: 'Poppins',
                                    ),
                                  ),
                                  const SizedBox(width: 5),
                                  const Text(
                                    '*',
                                    style: TextStyle(
                                      color: Colors.red,
                                      fontSize: 14,
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(height: 12),
                              Container(
                                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 12),
                                decoration: BoxDecoration(
                                  color: const Color(0xFFE3EED4).withOpacity(0.2),
                                  borderRadius: BorderRadius.circular(12),
                                  border: Border.all(
                                    color: const Color(0xFF0F2A1D).withOpacity(0.2),
                                  ),
                                ),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                  children: _ratingOptions.map((star) {
                                    return GestureDetector(
                                      onTap: () {
                                        setState(() {
                                          _selectedRating = star;
                                          rating.text = star.toString();
                                        });
                                      },
                                      child: Container(
                                        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                                        decoration: BoxDecoration(
                                          color: _selectedRating >= star
                                              ? const Color(0xFF0F2A1D).withOpacity(0.1)
                                              : Colors.transparent,
                                          borderRadius: BorderRadius.circular(20),
                                        ),
                                        child: Row(
                                          mainAxisSize: MainAxisSize.min,
                                          children: [
                                            Icon(
                                              _selectedRating >= star
                                                  ? Icons.star
                                                  : Icons.star_border,
                                              color: _selectedRating >= star
                                                  ? Colors.amber
                                                  : const Color(0xFF0F2A1D).withOpacity(0.3),
                                              size: 28,
                                            ),
                                            const SizedBox(width: 4),
                                            Text(
                                              star.toString(),
                                              style: TextStyle(
                                                fontSize: 14,
                                                fontWeight: _selectedRating >= star
                                                    ? FontWeight.w800
                                                    : FontWeight.w500,
                                                color: _selectedRating >= star
                                                    ? const Color(0xFF0F2A1D)
                                                    : const Color(0xFF0F2A1D).withOpacity(0.3),
                                                fontFamily: 'Poppins',
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    );
                                  }).toList(),
                                ),
                              ),
                              // Hidden rating field for validation
                              if (rating.text.isEmpty)
                                Padding(
                                  padding: const EdgeInsets.only(top: 8, left: 12),
                                  child: Text(
                                    'Please select a rating',
                                    style: TextStyle(
                                      fontSize: 12,
                                      color: Colors.red[700],
                                      fontFamily: 'Poppins',
                                    ),
                                  ),
                                ),
                            ],
                          ),

                          const SizedBox(height: 24),

                          // Review Field
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  Text(
                                    'Your Review',
                                    style: TextStyle(
                                      fontWeight: FontWeight.w700,
                                      color: const Color(0xFF0F2A1D),
                                      fontSize: 14,
                                      fontFamily: 'Poppins',
                                    ),
                                  ),
                                  const SizedBox(width: 5),
                                  const Text(
                                    '*',
                                    style: TextStyle(
                                      color: Colors.red,
                                      fontSize: 14,
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(height: 8),
                              TextFormField(
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'Please enter your review';
                                  }
                                  if (value.length < 10) {
                                    return 'Review should be at least 10 characters';
                                  }
                                  return null;
                                },
                                controller: review,
                                maxLines: 5,
                                minLines: 3,
                                decoration: InputDecoration(
                                  hintText: 'Share your experience...',
                                  hintStyle: TextStyle(
                                    color: const Color(0xFF0F2A1D).withOpacity(0.4),
                                    fontFamily: 'Poppins',
                                  ),
                                  prefixIcon: const Padding(
                                    padding: EdgeInsets.only(top: 16, bottom: 16),
                                    child: Icon(
                                      Icons.edit_note,
                                      color: Color(0xFF0F2A1D),
                                    ),
                                  ),
                                  filled: true,
                                  fillColor: const Color(0xFFE3EED4).withOpacity(0.2),
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(12),
                                    borderSide: BorderSide(
                                      color: const Color(0xFF0F2A1D).withOpacity(0.2),
                                    ),
                                  ),
                                  enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(12),
                                    borderSide: BorderSide(
                                      color: const Color(0xFF0F2A1D).withOpacity(0.2),
                                    ),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(12),
                                    borderSide: const BorderSide(
                                      color: Color(0xFF0F2A1D),
                                      width: 2,
                                    ),
                                  ),
                                  errorBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(12),
                                    borderSide: const BorderSide(color: Colors.red),
                                  ),
                                  contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
                                ),
                                style: const TextStyle(
                                  fontSize: 14,
                                  color: Color(0xFF0F2A1D),
                                  fontFamily: 'Poppins',
                                ),
                              ),
                            ],
                          ),

                          const SizedBox(height: 16),

                          // Character Counter
                          Align(
                            alignment: Alignment.centerRight,
                            child: Text(
                              '${review.text.length}/500 characters',
                              style: TextStyle(
                                fontSize: 11,
                                color: const Color(0xFF0F2A1D).withOpacity(0.5),
                                fontFamily: 'Poppins',
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),

                          const SizedBox(height: 24),

                          // Review Tips
                          Container(
                            padding: const EdgeInsets.all(16),
                            decoration: BoxDecoration(
                              color: const Color(0xFFE3EED4).withOpacity(0.3),
                              borderRadius: BorderRadius.circular(12),
                              border: Border.all(
                                color: const Color(0xFF0F2A1D).withOpacity(0.1),
                              ),
                            ),
                            child: Row(
                              children: [
                                const Icon(
                                  Icons.lightbulb_outline,
                                  color: Color(0xFF0F2A1D),
                                  size: 20,
                                ),
                                const SizedBox(width: 12),
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      const Text(
                                        'Tips for a helpful review',
                                        style: TextStyle(
                                          fontSize: 14,
                                          fontWeight: FontWeight.w800,
                                          color: Color(0xFF0F2A1D),
                                          fontFamily: 'Poppins',
                                        ),
                                      ),
                                      const SizedBox(height: 4),
                                      Text(
                                        '• Be specific about your experience\n• Mention what you liked or disliked\n• Keep it honest and respectful',
                                        style: TextStyle(
                                          fontSize: 11,
                                          color: const Color(0xFF0F2A1D).withOpacity(0.7),
                                          fontFamily: 'Poppins',
                                          height: 1.5,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),

                          const SizedBox(height: 30),

                          // Submit Button
                          SizedBox(
                            width: double.infinity,
                            child: ElevatedButton(
                              onPressed: _isLoading
                                  ? null
                                  : () async {
                                // Validate rating
                                if (_selectedRating == 0) {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(
                                      content: const Text(
                                        'Please select a rating',
                                        style: TextStyle(fontFamily: 'Poppins'),
                                      ),
                                      backgroundColor: Colors.orange,
                                      behavior: SnackBarBehavior.floating,
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                    ),
                                  );
                                  return;
                                }

                                if (!formkey.currentState!.validate()) {
                                  return;
                                }

                                setState(() {
                                  _isLoading = true;
                                });

                                try {
                                  SharedPreferences sh = await SharedPreferences.getInstance();
                                  var data = await http.post(
                                    Uri.parse('${sh.getString('ip')}/usersendreview'),
                                    body: {
                                      'review': review.text,
                                      'rating': rating.text,
                                      'uid': sh.getString('uid').toString(),
                                      'tid': sh.getString('tid').toString()
                                    },
                                  );

                                  if (data.statusCode == 200) {
                                    // Show success message
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      SnackBar(
                                        content: Row(
                                          children: const [
                                            Icon(
                                              Icons.check_circle,
                                              color: Colors.white,
                                              size: 20,
                                            ),
                                            SizedBox(width: 10),
                                            Expanded(
                                              child: Text(
                                                'Review submitted successfully!',
                                                style: TextStyle(fontFamily: 'Poppins'),
                                              ),
                                            ),
                                          ],
                                        ),
                                        backgroundColor: const Color(0xFF0F2A1D),
                                        behavior: SnackBarBehavior.floating,
                                        shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(10),
                                        ),
                                        duration: const Duration(seconds: 2),
                                      ),
                                    );

                                    await Future.delayed(const Duration(seconds: 2));
                                  }

                                  if (!mounted) return;
                                  Navigator.pushReplacement(
                                    context,
                                    MaterialPageRoute(builder: (context) => view_travel_company()),
                                  );
                                } catch (e) {
                                  setState(() {
                                    _isLoading = false;
                                  });
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(
                                      content: Row(
                                        children: const [
                                          Icon(
                                            Icons.error_outline,
                                            color: Colors.white,
                                            size: 20,
                                          ),
                                          SizedBox(width: 10),
                                          Expanded(
                                            child: Text(
                                              'Failed to submit review. Please try again.',
                                              style: TextStyle(fontFamily: 'Poppins'),
                                            ),
                                          ),
                                        ],
                                      ),
                                      backgroundColor: Colors.red,
                                      behavior: SnackBarBehavior.floating,
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                      duration: const Duration(seconds: 2),
                                    ),
                                  );
                                }
                              },
                              style: ElevatedButton.styleFrom(
                                backgroundColor: const Color(0xFF0F2A1D),
                                foregroundColor: Colors.white,
                                padding: const EdgeInsets.symmetric(vertical: 18),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(15),
                                ),
                                elevation: 6,
                                shadowColor: const Color(0xFF0F2A1D).withOpacity(0.5),
                              ),
                              child: _isLoading
                                  ? const SizedBox(
                                width: 20,
                                height: 20,
                                child: CircularProgressIndicator(
                                  strokeWidth: 2,
                                  valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                                ),
                              )
                                  : Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: const [
                                  Icon(Icons.send, size: 22),
                                  SizedBox(width: 10),
                                  Text(
                                    'SUBMIT REVIEW',
                                    style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w800,
                                      fontFamily: 'Poppins',
                                      letterSpacing: 1,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),

                          const SizedBox(height: 16),

                          // Cancel Button
                          SizedBox(
                            width: double.infinity,
                            child: OutlinedButton(
                              onPressed: _isLoading
                                  ? null
                                  : () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(builder: (context) => view_travel_company()),
                                );
                              },
                              style: OutlinedButton.styleFrom(
                                side: const BorderSide(color: Color(0xFF0F2A1D), width: 1.5),
                                foregroundColor: const Color(0xFF0F2A1D),
                                padding: const EdgeInsets.symmetric(vertical: 16),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(15),
                                ),
                              ),
                              child: const Text(
                                'CANCEL',
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
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    review.dispose();
    rating.dispose();
    super.dispose();
  }
}