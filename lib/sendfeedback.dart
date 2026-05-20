// // import 'package:final_destination/home.dart';
// // import 'package:flutter/material.dart';
// // import 'package:http/http.dart' as http;
// // import 'package:shared_preferences/shared_preferences.dart';
// //
// // void main(){
// //   runApp(sendfeedback());
// // }
// // class sendfeedback extends StatelessWidget {
// //   const sendfeedback({Key? key}) : super(key: key);
// //
// //   @override
// //   Widget build(BuildContext context) {
// //     return MaterialApp(home: sendfeedbacksub(),);
// //   }
// // }
// // class sendfeedbacksub extends StatefulWidget {
// //   const sendfeedbacksub({Key? key}) : super(key: key);
// //
// //   @override
// //   State<sendfeedbacksub> createState() => _sendfeedbacksubState();
// // }
// //
// // class _sendfeedbacksubState extends State<sendfeedbacksub> {
// //   final feedback=TextEditingController();
// //   final formkey=GlobalKey<FormState>();
// //
// //   @override
// //   Widget build(BuildContext context) {
// //     return Scaffold(body: Center(child: SingleChildScrollView(child: SizedBox(height: 500,width: 500,child:
// //     Form(key: formkey,
// //     child: Column(children: [
// //       TextFormField( validator: (value){
// //           if(value==null || value.isEmpty){
// //             return 'enter valid data';
// //           }
// //           return null;
// //         },
// //         controller: feedback,
// //         decoration: InputDecoration(
// //           border: OutlineInputBorder(),
// //           hintText: 'enter feedback',
// //           labelText: 'feedback',
// //           prefixIcon: Icon(Icons.abc)
// //       ),),SizedBox(height: 20,),
// //       ElevatedButton(onPressed: () async {
// //         if(!formkey.currentState!.validate()) {
// //           return;
// //         }
// //         SharedPreferences sh=await SharedPreferences.getInstance();
// //         var data=await http.post(Uri.parse('${sh.getString('ip')}/usersendfeedback'),
// //             body: {
// //               'feedback':feedback.text,
// //               'uid':sh.getString('uid').toString()
// //             });
// //         Navigator.push(context, MaterialPageRoute(builder: (context)=>user()));
// //       }, child: Text('send'))
// //     ],),),),),),);
// //   }
// // }
// //
// //
// import 'package:final_destination/home.dart';
// import 'package:flutter/material.dart';
// import 'package:http/http.dart' as http;
// import 'package:shared_preferences/shared_preferences.dart';
//
// void main() {
//   runApp(sendfeedback());
// }
//
// class sendfeedback extends StatelessWidget {
//   const sendfeedback({Key? key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       theme: ThemeData(
//         primaryColor: Colors.blue,
//         scaffoldBackgroundColor: Colors.grey[50],
//       ),
//       home: sendfeedbacksub(),
//     );
//   }
// }
//
// class sendfeedbacksub extends StatefulWidget {
//   const sendfeedbacksub({Key? key}) : super(key: key);
//
//   @override
//   State<sendfeedbacksub> createState() => _sendfeedbacksubState();
// }
//
// class _sendfeedbacksubState extends State<sendfeedbacksub> {
//   final feedback = TextEditingController();
//   final formkey = GlobalKey<FormState>();
//   bool _isLoading = false;
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text(
//           'Send Feedback',
//           style: TextStyle(
//             fontSize: 22,
//             fontWeight: FontWeight.w600,
//           ),
//         ),
//         centerTitle: true,
//         backgroundColor: Colors.blue,
//         elevation: 4,
//         leading: IconButton(
//           icon: Icon(Icons.arrow_back),
//           onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (context)=>UserHomeApp())),
//         ),
//       ),
//       body: Center(
//         child: Container(
//           constraints: BoxConstraints(maxWidth: 500),
//           padding: EdgeInsets.all(20),
//           child: SingleChildScrollView(
//             child: Column(
//               children: [
//                 // Header Card
//                 Card(
//                   elevation: 4,
//                   shape: RoundedRectangleBorder(
//                     borderRadius: BorderRadius.circular(16),
//                   ),
//                   child: Padding(
//                     padding: EdgeInsets.all(24),
//                     child: Column(
//                       children: [
//                         Container(
//                           width: 80,
//                           height: 80,
//                           decoration: BoxDecoration(
//                             color: Colors.blue[50],
//                             shape: BoxShape.circle,
//                           ),
//                           child: Icon(
//                             Icons.feedback_outlined,
//                             size: 40,
//                             color: Colors.blue,
//                           ),
//                         ),
//                         SizedBox(height: 16),
//                         Text(
//                           'Share Your Feedback',
//                           style: TextStyle(
//                             fontSize: 26,
//                             fontWeight: FontWeight.w700,
//                             color: Colors.blue[800],
//                           ),
//                           textAlign: TextAlign.center,
//                         ),
//                         SizedBox(height: 8),
//                         Text(
//                           'Your opinion helps us improve our service',
//                           style: TextStyle(
//                             fontSize: 16,
//                             color: Colors.grey[600],
//                           ),
//                           textAlign: TextAlign.center,
//                         ),
//                       ],
//                     ),
//                   ),
//                 ),
//                 SizedBox(height: 24),
//
//                 // Form Card
//                 Card(
//                   elevation: 8,
//                   shape: RoundedRectangleBorder(
//                     borderRadius: BorderRadius.circular(16),
//                   ),
//                   child: Padding(
//                     padding: EdgeInsets.all(32),
//                     child: Form(
//                       key: formkey,
//                       child: Column(
//                         crossAxisAlignment: CrossAxisAlignment.stretch,
//                         children: [
//                           // Feedback Input
//                           Text(
//                             'Your Feedback',
//                             style: TextStyle(
//                               fontSize: 20,
//                               fontWeight: FontWeight.w600,
//                               color: Colors.blue[700],
//                             ),
//                           ),
//                           SizedBox(height: 12),
//                           Container(
//                             decoration: BoxDecoration(
//                               borderRadius: BorderRadius.circular(12),
//                               color: Colors.blue[50],
//                             ),
//                             child: TextFormField(
//                               controller: feedback,
//                               maxLines: 6,
//                               minLines: 4,
//                               validator: (value) {
//                                 if (value == null || value.isEmpty) {
//                                   return 'Please enter your feedback';
//                                 }
//                                 if (value.length < 15) {
//                                   return 'Feedback should be at least 15 characters';
//                                 }
//                                 return null;
//                               },
//                               decoration: InputDecoration(
//                                 border: OutlineInputBorder(
//                                   borderRadius: BorderRadius.circular(12),
//                                   borderSide: BorderSide.none,
//                                 ),
//                                 hintText: 'Type your feedback here...\nWhat did you like? How can we improve?',
//                                 hintStyle: TextStyle(color: Colors.grey[500]),
//                                 filled: true,
//                                 fillColor: Colors.white,
//                                 contentPadding: EdgeInsets.all(16),
//                                 prefixIcon: Padding(
//                                   padding: EdgeInsets.only(top: 16, bottom: 16),
//                                   child: Icon(
//                                     Icons.edit_note,
//                                     color: Colors.blue,
//                                   ),
//                                 ),
//                               ),
//                               style: TextStyle(fontSize: 16),
//                             ),
//                           ),
//                           SizedBox(height: 8),
//
//                           // Character Counter with Progress
//                           Column(
//                             children: [
//                               Container(
//                                 height: 4,
//                                 child: LinearProgressIndicator(
//                                   value: feedback.text.length / 500,
//                                   backgroundColor: Colors.grey[200],
//                                   valueColor: AlwaysStoppedAnimation<Color>(
//                                     feedback.text.length >= 15
//                                         ? Colors.green
//                                         : Colors.blue,
//                                   ),
//                                 ),
//                               ),
//                               SizedBox(height: 4),
//                               Align(
//                                 alignment: Alignment.centerRight,
//                                 child: Text(
//                                   '${feedback.text.length}/500 characters',
//                                   style: TextStyle(
//                                     fontSize: 12,
//                                     color: Colors.grey[600],
//                                     fontWeight: FontWeight.w500,
//                                   ),
//                                 ),
//                               ),
//                             ],
//                           ),
//                           SizedBox(height: 32),
//
//                           // Submit Button
//                           ElevatedButton(
//                             onPressed: _isLoading
//                                 ? null
//                                 : () async {
//                               if (!formkey.currentState!.validate()) {
//                                 return;
//                               }
//                               setState(() {
//                                 _isLoading = true;
//                               });
//                               try {
//                                 SharedPreferences sh =
//                                 await SharedPreferences.getInstance();
//                                 var response = await http.post(
//                                   Uri.parse(
//                                       '${sh.getString('ip')}/usersendfeedback'),
//                                   body: {
//                                     'feedback': feedback.text,
//                                     'uid': sh.getString('uid').toString()
//                                   },
//                                 );
//
//                                 // Show success message
//                                 ScaffoldMessenger.of(context).showSnackBar(
//                                   SnackBar(
//                                     content: Text(
//                                       'Feedback submitted successfully!',
//                                       style: TextStyle(fontSize: 16),
//                                     ),
//                                     backgroundColor: Colors.green,
//                                     behavior: SnackBarBehavior.floating,
//                                     shape: RoundedRectangleBorder(
//                                       borderRadius:
//                                       BorderRadius.circular(10),
//                                     ),
//                                     duration: Duration(seconds: 2),
//                                   ),
//                                 );
//
//                                 // Navigate after delay
//                                 await Future.delayed(
//                                     Duration(milliseconds: 1500));
//                                 Navigator.pushReplacement(
//                                   context,
//                                   MaterialPageRoute(
//                                       builder: (context) => UserHomeApp()),
//                                 );
//                               } catch (e) {
//                                 setState(() {
//                                   _isLoading = false;
//                                 });
//                                 ScaffoldMessenger.of(context).showSnackBar(
//                                   SnackBar(
//                                     content: Text(
//                                       'Failed to send feedback. Please try again.',
//                                     ),
//                                     backgroundColor: Colors.red,
//                                     duration: Duration(seconds: 2),
//                                   ),
//                                 );
//                               }
//                             },
//                             style: ElevatedButton.styleFrom(
//                               backgroundColor: Colors.blue,
//                               foregroundColor: Colors.white,
//                               padding: EdgeInsets.symmetric(vertical: 16),
//                               shape: RoundedRectangleBorder(
//                                 borderRadius: BorderRadius.circular(12),
//                               ),
//                               elevation: 4,
//                               textStyle: TextStyle(
//                                 fontSize: 18,
//                                 fontWeight: FontWeight.w600,
//                               ),
//                             ),
//                             child: _isLoading
//                                 ? Row(
//                               mainAxisAlignment: MainAxisAlignment.center,
//                               children: [
//                                 SizedBox(
//                                   width: 24,
//                                   height: 24,
//                                   child: CircularProgressIndicator(
//                                     strokeWidth: 2,
//                                     color: Colors.white,
//                                   ),
//                                 ),
//                                 SizedBox(width: 12),
//                                 Text('Sending...'),
//                               ],
//                             )
//                                 : Row(
//                               mainAxisAlignment: MainAxisAlignment.center,
//                               children: [
//                                 Icon(Icons.send, size: 22),
//                                 SizedBox(width: 12),
//                                 Text('Send Feedback'),
//                               ],
//                             ),
//                           ),
//                           SizedBox(height: 16),
//
//                           // Cancel Button
//                           TextButton(
//                             onPressed: _isLoading
//                                 ? null
//                                 : () {
//                               Navigator.push(
//                                 context,
//                                 MaterialPageRoute(
//                                     builder: (context) => UserHomeApp()),
//                               );
//                             },
//                             style: TextButton.styleFrom(
//                               foregroundColor: Colors.grey[700],
//                               padding: EdgeInsets.symmetric(vertical: 14),
//                             ),
//                             child: Text(
//                               'Cancel',
//                               style: TextStyle(fontSize: 16),
//                             ),
//                           ),
//                         ],
//                       ),
//                     ),
//                   ),
//                 ),
//
//                 // Tips Section
//                 SizedBox(height: 24),
//                 Container(
//                   padding: EdgeInsets.all(20),
//                   decoration: BoxDecoration(
//                     color: Colors.blue[50],
//                     borderRadius: BorderRadius.circular(16),
//                     border: Border.all(color: Colors.blue[100]!),
//                   ),
//                   child: Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       Row(
//                         children: [
//                           Icon(
//                             Icons.lightbulb_outline,
//                             color: Colors.blue[700],
//                           ),
//                           SizedBox(width: 8),
//                           Text(
//                             'Tips for effective feedback:',
//                             style: TextStyle(
//                               fontSize: 18,
//                               fontWeight: FontWeight.w600,
//                               color: Colors.blue[800],
//                             ),
//                           ),
//                         ],
//                       ),
//                       SizedBox(height: 12),
//                       Padding(
//                         padding: EdgeInsets.only(left: 8),
//                         child: Column(
//                           crossAxisAlignment: CrossAxisAlignment.start,
//                           children: [
//                             _buildTip('Be specific and mention particular features'),
//                             _buildTip('Focus on both positive aspects and areas for improvement'),
//                             _buildTip('Provide constructive suggestions'),
//                             _buildTip('Keep it clear and concise'),
//                           ],
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
//
//   Widget _buildTip(String text) {
//     return Padding(
//       padding: EdgeInsets.symmetric(vertical: 4),
//       child: Row(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           Icon(
//             Icons.circle,
//             size: 8,
//             color: Colors.blue,
//           ),
//           SizedBox(width: 8),
//           Expanded(
//             child: Text(
//               text,
//               style: TextStyle(
//                 color: Colors.grey[700],
//                 fontSize: 14,
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
//
//   @override
//   void dispose() {
//     feedback.dispose();
//     super.dispose();
//   }
// }

// main style
import 'package:final_destination/home.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  runApp(sendfeedback());
}

class sendfeedback extends StatelessWidget {
  const sendfeedback({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: const Color(0xFF0F2A1D),
        scaffoldBackgroundColor: const Color(0xFFE3EED4),
        fontFamily: 'Poppins',
      ),
      home: sendfeedbacksub(),
    );
  }
}

class sendfeedbacksub extends StatefulWidget {
  const sendfeedbacksub({Key? key}) : super(key: key);

  @override
  State<sendfeedbacksub> createState() => _sendfeedbacksubState();
}

class _sendfeedbacksubState extends State<sendfeedbacksub> {
  final feedback = TextEditingController();
  final formkey = GlobalKey<FormState>();
  bool _isLoading = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFE3EED4),
      appBar: AppBar(
        title: Text(
          'Send Feedback',
          style: TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.w600,
            color: const Color(0xFF0F2A1D),
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 2,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: const Color(0xFF0F2A1D)),
          onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (context)=>UserHomeApp())),
        ),
      ),
      body: Center(
        child: Container(
          constraints: BoxConstraints(maxWidth: 500),
          padding: EdgeInsets.all(20),
          child: SingleChildScrollView(
            child: Column(
              children: [
                // Header Card
                Container(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [const Color(0xFF0F2A1D), const Color(0xFF1A3F2B)],
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                    ),
                    borderRadius: BorderRadius.circular(20),
                    boxShadow: [
                      BoxShadow(
                        color: const Color(0xFF0F2A1D).withOpacity(0.3),
                        blurRadius: 15,
                        offset: const Offset(0, 5),
                      ),
                    ],
                  ),
                  child: Padding(
                    padding: EdgeInsets.all(24),
                    child: Column(
                      children: [
                        Container(
                          width: 80,
                          height: 80,
                          decoration: BoxDecoration(
                            color: Colors.white.withOpacity(0.2),
                            shape: BoxShape.circle,
                          ),
                          child: Icon(
                            Icons.feedback_outlined,
                            size: 40,
                            color: Colors.white,
                          ),
                        ),
                        SizedBox(height: 16),
                        Text(
                          'Share Your Feedback',
                          style: TextStyle(
                            fontSize: 26,
                            fontWeight: FontWeight.w700,
                            color: Colors.white,
                          ),
                          textAlign: TextAlign.center,
                        ),
                        SizedBox(height: 8),
                        Text(
                          'Your opinion helps us improve our service',
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.white70,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 24),

                // Form Card
                Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20),
                    boxShadow: [
                      BoxShadow(
                        color: const Color(0xFF0F2A1D).withOpacity(0.1),
                        blurRadius: 15,
                        offset: const Offset(0, 5),
                      ),
                    ],
                  ),
                  child: Padding(
                    padding: EdgeInsets.all(32),
                    child: Form(
                      key: formkey,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          // Feedback Input
                          Text(
                            'Your Feedback',
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.w600,
                              color: const Color(0xFF0F2A1D),
                            ),
                          ),
                          SizedBox(height: 12),
                          Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(12),
                              color: const Color(0xFFE3EED4).withOpacity(0.3),
                              border: Border.all(
                                color: const Color(0xFF0F2A1D).withOpacity(0.2),
                              ),
                            ),
                            child: TextFormField(
                              controller: feedback,
                              maxLines: 6,
                              minLines: 4,
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Please enter your feedback';
                                }
                                if (value.length < 15) {
                                  return 'Feedback should be at least 15 characters';
                                }
                                return null;
                              },
                              decoration: InputDecoration(
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(12),
                                  borderSide: BorderSide.none,
                                ),
                                hintText: 'Type your feedback here...\nWhat did you like? How can we improve?',
                                hintStyle: TextStyle(color: const Color(0xFF0F2A1D).withOpacity(0.4)),
                                filled: true,
                                fillColor: Colors.transparent,
                                contentPadding: EdgeInsets.all(16),
                                prefixIcon: Padding(
                                  padding: EdgeInsets.only(top: 16, bottom: 16),
                                  child: Icon(
                                    Icons.edit_note,
                                    color: const Color(0xFF0F2A1D),
                                  ),
                                ),
                              ),
                              style: TextStyle(
                                fontSize: 16,
                                color: const Color(0xFF0F2A1D),
                              ),
                            ),
                          ),
                          SizedBox(height: 8),

                          // Character Counter
                          Align(
                            alignment: Alignment.centerRight,
                            child: Text(
                              '${feedback.text.length}/500 characters',
                              style: TextStyle(
                                fontSize: 12,
                                color: const Color(0xFF0F2A1D).withOpacity(0.6),
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                          SizedBox(height: 32),

                          // Submit Button
                          ElevatedButton(
                            onPressed: _isLoading
                                ? null
                                : () async {
                              if (!formkey.currentState!.validate()) {
                                return;
                              }
                              setState(() {
                                _isLoading = true;
                              });
                              try {
                                SharedPreferences sh =
                                await SharedPreferences.getInstance();
                                var response = await http.post(
                                  Uri.parse(
                                      '${sh.getString('ip')}/usersendfeedback'),
                                  body: {
                                    'feedback': feedback.text,
                                    'uid': sh.getString('uid').toString()
                                  },
                                );

                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                    content: Text(
                                      'Feedback submitted successfully!',
                                      style: TextStyle(fontSize: 16),
                                    ),
                                    backgroundColor: const Color(0xFF0F2A1D),
                                    behavior: SnackBarBehavior.floating,
                                    shape: RoundedRectangleBorder(
                                      borderRadius:
                                      BorderRadius.circular(10),
                                    ),
                                    duration: Duration(seconds: 2),
                                  ),
                                );

                                await Future.delayed(
                                    Duration(milliseconds: 1500));
                                Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => UserHomeApp()),
                                );
                              } catch (e) {
                                setState(() {
                                  _isLoading = false;
                                });
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                    content: Text(
                                      'Failed to send feedback. Please try again.',
                                    ),
                                    backgroundColor: Colors.red,
                                    duration: Duration(seconds: 2),
                                  ),
                                );
                              }
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: const Color(0xFF0F2A1D),
                              foregroundColor: Colors.white,
                              padding: EdgeInsets.symmetric(vertical: 16),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12),
                              ),
                              elevation: 4,
                            ),
                            child: _isLoading
                                ? Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                SizedBox(
                                  width: 24,
                                  height: 24,
                                  child: CircularProgressIndicator(
                                    strokeWidth: 2,
                                    color: Colors.white,
                                  ),
                                ),
                                SizedBox(width: 12),
                                Text('Sending...'),
                              ],
                            )
                                : Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(Icons.send, size: 22),
                                SizedBox(width: 12),
                                Text('Send Feedback'),
                              ],
                            ),
                          ),
                          SizedBox(height: 16),

                          // Cancel Button
                          TextButton(
                            onPressed: _isLoading
                                ? null
                                : () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => UserHomeApp()),
                              );
                            },
                            style: TextButton.styleFrom(
                              foregroundColor: const Color(0xFF0F2A1D).withOpacity(0.7),
                              padding: EdgeInsets.symmetric(vertical: 14),
                            ),
                            child: Text(
                              'Cancel',
                              style: TextStyle(fontSize: 16),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),

                // Tips Section
                SizedBox(height: 24),
                Container(
                  padding: EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(16),
                    border: Border.all(
                      color: const Color(0xFF0F2A1D).withOpacity(0.2),
                    ),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Icon(
                            Icons.lightbulb_outline,
                            color: const Color(0xFF0F2A1D),
                          ),
                          SizedBox(width: 8),
                          Text(
                            'Tips for effective feedback:',
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w600,
                              color: const Color(0xFF0F2A1D),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 12),
                      Padding(
                        padding: EdgeInsets.only(left: 8),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            _buildTip('Be specific and mention particular features'),
                            _buildTip('Focus on both positive aspects and areas for improvement'),
                            _buildTip('Provide constructive suggestions'),
                            _buildTip('Keep it clear and concise'),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildTip(String text) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 4),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(
            Icons.circle,
            size: 8,
            color: const Color(0xFF0F2A1D),
          ),
          SizedBox(width: 8),
          Expanded(
            child: Text(
              text,
              style: TextStyle(
                color: const Color(0xFF0F2A1D).withOpacity(0.7),
                fontSize: 14,
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    feedback.dispose();
    super.dispose();
  }
}