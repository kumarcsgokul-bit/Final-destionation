// import 'package:final_destination/login.dart';
// import 'package:flutter/material.dart';
// import 'package:http/http.dart' as http;
// import 'package:shared_preferences/shared_preferences.dart';
//
// void main(){
//   runApp(changepassword());
// }
// class changepassword extends StatelessWidget {
//   const changepassword({Key? key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(home: changepasswordsub(),);
//   }
// }
// class changepasswordsub extends StatefulWidget {
//   const changepasswordsub({Key? key}) : super(key: key);
//
//   @override
//   State<changepasswordsub> createState() => _changepasswordsubState();
// }
//
// class _changepasswordsubState extends State<changepasswordsub> {
//   final old = TextEditingController();
//   final neww = TextEditingController();
//   final confirm = TextEditingController();
//   final formkey=GlobalKey<FormState>();
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(body: Center(child: SingleChildScrollView(child: SizedBox(height: 500,width: 500,child:
//     Form(key: formkey,
//     child: Column(children: [
//       TextFormField(validator: (value){
//           if(value==null || value.isEmpty){
//             return 'enter valid data';
//           }
//           return null;
//         },
//         controller:old,decoration: InputDecoration(
//           border: OutlineInputBorder(),
//           hintText: 'enter old password',
//           labelText: 'old password',
//           prefixIcon: Icon(Icons.abc)
//       ),),SizedBox(height: 20,),
//
//       TextFormField(validator: (value){
//         if(value==null || value.isEmpty){
//           return 'enter valid data';
//         }
//         if(!RegExp(
//             r'^(?=.*[A-Z])(?=.*[a-z])(?=.*\d)(?=.*[@$!%*?&])[A-Za-z\d@$!%*?&]{8,}$'
//         ).hasMatch(value))
//         {
//           return ' Min 8 chars, at least 1 number, 1 lowercase, 1 uppercase,1 special character';
//         }
//         return null;
//       },
//         controller:neww,decoration: InputDecoration(
//           border: OutlineInputBorder(),
//           hintText: 'enter new password',
//           labelText: 'new password',
//           prefixIcon: Icon(Icons.abc)
//       ),),SizedBox(height: 20,),
//
//
//       TextFormField(validator: (value){
//         if(value==null || value.isEmpty){
//           return 'enter valid data';
//         }
//         if(!RegExp(
//             r'^(?=.*[A-Z])(?=.*[a-z])(?=.*\d)(?=.*[@$!%*?&])[A-Za-z\d@$!%*?&]{8,}$'
//         ).hasMatch(value))
//         {
//           return ' Min 8 chars, at least 1 number, 1 lowercase, 1 uppercase,1 special character';
//         }
//         return null;
//       },
//         controller:confirm,decoration: InputDecoration(
//           border: OutlineInputBorder(),
//           hintText: 'confirm password',
//           labelText: 'confirm password',
//           prefixIcon: Icon(Icons.abc)
//       ),),SizedBox(height: 20,),
//
//
//       ElevatedButton(onPressed: () async {
//         if(!formkey.currentState!.validate()) {
//           return;
//         }
//         SharedPreferences sh=await SharedPreferences.getInstance();
//         if(confirm.text!=neww.text){
//           showDialog(context: context, builder: (context)=>AlertDialog(
//             title: Text('password'),
//             content: Text('password mismatch'),
//             actions: [
//               TextButton(onPressed: (){
//                 Navigator.pop(context);
//               }, child: Text('ok'))
//             ],
//           ));
//           Navigator.push(context, MaterialPageRoute(builder: (context)=>changepassword()));
//         }
//         if(old.text!=sh.getString('password')){
//           showDialog(context: context, builder: (context)=>AlertDialog(
//             title: Text('password'),
//             content: Text('invalid password'),
//             actions: [
//               TextButton(onPressed: (){
//                 Navigator.pop(context);
//               }, child: Text('ok'))
//             ],
//           ));
//           Navigator.push(context, MaterialPageRoute(builder: (context)=>changepassword()));
//         }
//
//         var data=await http.post(Uri.parse('${sh.getString('ip')}/userchangepassword'),
//             body: {
//               'new':neww.text,
//               'uid':sh.getString('uid').toString()
//             });
//         Navigator.push(context, MaterialPageRoute(builder: (context)=>login()));
//       }, child: Text('update'))
//     ],),),),),),);
//   }
// }
// import 'package:final_destination/login.dart';
// import 'package:flutter/material.dart';
// import 'package:http/http.dart' as http;
// import 'package:shared_preferences/shared_preferences.dart';
//
// void main() {
//   runApp(changepassword());
// }
//
// class changepassword extends StatelessWidget {
//   const changepassword({Key? key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       theme: ThemeData(
//         primaryColor: Color(0xFF1A237E),
//         fontFamily: 'Poppins',
//         inputDecorationTheme: InputDecorationTheme(
//           border: OutlineInputBorder(
//             borderRadius: BorderRadius.circular(10),
//             borderSide: BorderSide(color: Colors.grey[400]!),
//           ),
//           focusedBorder: OutlineInputBorder(
//             borderRadius: BorderRadius.circular(10),
//             borderSide: BorderSide(color: Color(0xFF1A237E), width: 2),
//           ),
//           errorBorder: OutlineInputBorder(
//             borderRadius: BorderRadius.circular(10),
//             borderSide: BorderSide(color: Colors.red),
//           ),
//           contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 16),
//         ),
//       ),
//       home: changepasswordsub(),
//     );
//   }
// }
//
// class changepasswordsub extends StatefulWidget {
//   const changepasswordsub({Key? key}) : super(key: key);
//
//   @override
//   State<changepasswordsub> createState() => _changepasswordsubState();
// }
//
// class _changepasswordsubState extends State<changepasswordsub> {
//   final old = TextEditingController();
//   final neww = TextEditingController();
//   final confirm = TextEditingController();
//   final formkey = GlobalKey<FormState>();
//   bool _isLoading = false;
//   bool _showOldPassword = false;
//   bool _showNewPassword = false;
//   bool _showConfirmPassword = false;
//
//   @override
//   void dispose() {
//     old.dispose();
//     neww.dispose();
//     confirm.dispose();
//     super.dispose();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: Colors.white,
//         elevation: 0,
//         title: Text(
//           'Change Password',
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
//             Navigator.pop(context);
//           },
//         ),
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
//         child: Center(
//           child: SingleChildScrollView(
//             child: Padding(
//               padding: const EdgeInsets.all(20.0),
//               child: Column(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: [
//                   // Header Section
//                   Container(
//                     margin: EdgeInsets.only(bottom: 40),
//                     child: Column(
//                       children: [
//                         Container(
//                           width: 80,
//                           height: 80,
//                           decoration: BoxDecoration(
//                             color: Color(0xFF1A237E).withOpacity(0.1),
//                             shape: BoxShape.circle,
//                           ),
//                           child: Icon(
//                             Icons.lock_reset,
//                             size: 40,
//                             color: Color(0xFF1A237E),
//                           ),
//                         ),
//                         SizedBox(height: 20),
//                         Text(
//                           'Update Your Password',
//                           style: TextStyle(
//                             fontSize: 32,
//                             fontWeight: FontWeight.bold,
//                             color: Color(0xFF1A237E),
//                           ),
//                         ),
//                         SizedBox(height: 10),
//                         Text(
//                           'Enter your current password and set a new one',
//                           style: TextStyle(
//                             fontSize: 16,
//                             color: Colors.grey[700],
//                           ),
//                           textAlign: TextAlign.center,
//                         ),
//                         SizedBox(height: 20),
//                         Container(
//                           width: 80,
//                           height: 3,
//                           color: Color(0xFF1A237E),
//                         ),
//                       ],
//                     ),
//                   ),
//
//                   // Password Form Card
//                   Container(
//                     width: double.infinity,
//                     constraints: BoxConstraints(maxWidth: 500),
//                     decoration: BoxDecoration(
//                       color: Colors.white,
//                       borderRadius: BorderRadius.circular(20),
//                       boxShadow: [
//                         BoxShadow(
//                           color: Colors.grey.withOpacity(0.1),
//                           spreadRadius: 5,
//                           blurRadius: 20,
//                           offset: Offset(0, 5),
//                         ),
//                       ],
//                     ),
//                     child: Padding(
//                       padding: const EdgeInsets.all(40),
//                       child: Form(
//                         key: formkey,
//                         child: Column(
//                           crossAxisAlignment: CrossAxisAlignment.start,
//                           children: [
//                             // Title
//                             Text(
//                               'Security Settings',
//                               style: TextStyle(
//                                 fontSize: 24,
//                                 fontWeight: FontWeight.bold,
//                                 color: Color(0xFF1A237E),
//                               ),
//                             ),
//                             SizedBox(height: 8),
//                             Text(
//                               'For security, please enter your current password',
//                               style: TextStyle(
//                                 color: Colors.grey[600],
//                               ),
//                             ),
//                             SizedBox(height: 30),
//
//                             // Current Password
//                             Column(
//                               crossAxisAlignment: CrossAxisAlignment.start,
//                               children: [
//                                 Row(
//                                   children: [
//                                     Text(
//                                       'Current Password',
//                                       style: TextStyle(
//                                         fontWeight: FontWeight.w500,
//                                         color: Colors.grey[700],
//                                         fontSize: 14,
//                                       ),
//                                     ),
//                                     SizedBox(width: 5),
//                                     Text(
//                                       '*',
//                                       style: TextStyle(
//                                         color: Colors.red,
//                                         fontSize: 14,
//                                       ),
//                                     ),
//                                   ],
//                                 ),
//                                 SizedBox(height: 8),
//                                 TextFormField(
//                                   validator: (value) {
//                                     if (value == null || value.isEmpty) {
//                                       return 'Please enter your current password';
//                                     }
//                                     return null;
//                                   },
//                                   controller: old,
//                                   obscureText: !_showOldPassword,
//                                   decoration: InputDecoration(
//                                     hintText: 'Enter your current password',
//                                     prefixIcon: Icon(
//                                       Icons.lock_outline,
//                                       color: Color(0xFF1A237E),
//                                     ),
//                                     suffixIcon: IconButton(
//                                       icon: Icon(
//                                         _showOldPassword
//                                             ? Icons.visibility
//                                             : Icons.visibility_off,
//                                         color: Colors.grey[500],
//                                       ),
//                                       onPressed: () {
//                                         setState(() {
//                                           _showOldPassword = !_showOldPassword;
//                                         });
//                                       },
//                                     ),
//                                     filled: true,
//                                     fillColor: Colors.grey[50],
//                                   ),
//                                   style: TextStyle(
//                                     fontSize: 16,
//                                   ),
//                                 ),
//                               ],
//                             ),
//
//                             SizedBox(height: 20),
//
//                             // New Password
//                             Column(
//                               crossAxisAlignment: CrossAxisAlignment.start,
//                               children: [
//                                 Row(
//                                   children: [
//                                     Text(
//                                       'New Password',
//                                       style: TextStyle(
//                                         fontWeight: FontWeight.w500,
//                                         color: Colors.grey[700],
//                                         fontSize: 14,
//                                       ),
//                                     ),
//                                     SizedBox(width: 5),
//                                     Text(
//                                       '*',
//                                       style: TextStyle(
//                                         color: Colors.red,
//                                         fontSize: 14,
//                                       ),
//                                     ),
//                                   ],
//                                 ),
//                                 SizedBox(height: 8),
//                                 TextFormField(
//                                   validator: (value) {
//                                     if (value == null || value.isEmpty) {
//                                       return 'Please enter new password';
//                                     }
//                                     if (!RegExp(
//                                         r'^(?=.*[A-Z])(?=.*[a-z])(?=.*\d)(?=.*[@$!%*?&])[A-Za-z\d@$!%*?&]{8,}$')
//                                         .hasMatch(value)) {
//                                       return 'Password must contain:\n• 8+ characters\n• 1 uppercase letter\n• 1 lowercase letter\n• 1 number\n• 1 special character';
//                                     }
//                                     return null;
//                                   },
//                                   controller: neww,
//                                   obscureText: !_showNewPassword,
//                                   decoration: InputDecoration(
//                                     hintText: 'Enter your new password',
//                                     prefixIcon: Icon(
//                                       Icons.lock_person,
//                                       color: Color(0xFF1A237E),
//                                     ),
//                                     suffixIcon: IconButton(
//                                       icon: Icon(
//                                         _showNewPassword
//                                             ? Icons.visibility
//                                             : Icons.visibility_off,
//                                         color: Colors.grey[500],
//                                       ),
//                                       onPressed: () {
//                                         setState(() {
//                                           _showNewPassword = !_showNewPassword;
//                                         });
//                                       },
//                                     ),
//                                     filled: true,
//                                     fillColor: Colors.grey[50],
//                                   ),
//                                   style: TextStyle(
//                                     fontSize: 16,
//                                   ),
//                                 ),
//                               ],
//                             ),
//
//                             SizedBox(height: 20),
//
//                             // Confirm Password
//                             Column(
//                               crossAxisAlignment: CrossAxisAlignment.start,
//                               children: [
//                                 Row(
//                                   children: [
//                                     Text(
//                                       'Confirm New Password',
//                                       style: TextStyle(
//                                         fontWeight: FontWeight.w500,
//                                         color: Colors.grey[700],
//                                         fontSize: 14,
//                                       ),
//                                     ),
//                                     SizedBox(width: 5),
//                                     Text(
//                                       '*',
//                                       style: TextStyle(
//                                         color: Colors.red,
//                                         fontSize: 14,
//                                       ),
//                                     ),
//                                   ],
//                                 ),
//                                 SizedBox(height: 8),
//                                 TextFormField(
//                                   validator: (value) {
//                                     if (value == null || value.isEmpty) {
//                                       return 'Please confirm your password';
//                                     }
//                                     if (value != neww.text) {
//                                       return 'Passwords do not match';
//                                     }
//                                     return null;
//                                   },
//                                   controller: confirm,
//                                   obscureText: !_showConfirmPassword,
//                                   decoration: InputDecoration(
//                                     hintText: 'Re-enter your new password',
//                                     prefixIcon: Icon(
//                                       Icons.lock_reset,
//                                       color: Color(0xFF1A237E),
//                                     ),
//                                     suffixIcon: IconButton(
//                                       icon: Icon(
//                                         _showConfirmPassword
//                                             ? Icons.visibility
//                                             : Icons.visibility_off,
//                                         color: Colors.grey[500],
//                                       ),
//                                       onPressed: () {
//                                         setState(() {
//                                           _showConfirmPassword =
//                                           !_showConfirmPassword;
//                                         });
//                                       },
//                                     ),
//                                     filled: true,
//                                     fillColor: Colors.grey[50],
//                                   ),
//                                   style: TextStyle(
//                                     fontSize: 16,
//                                   ),
//                                 ),
//                               ],
//                             ),
//
//                             // Password Requirements
//                             SizedBox(height: 30),
//                             Container(
//                               padding: EdgeInsets.all(16),
//                               decoration: BoxDecoration(
//                                 color: Color(0xFFF8F9FA),
//                                 borderRadius: BorderRadius.circular(12),
//                                 border: Border.all(
//                                   color: Colors.grey[200]!,
//                                 ),
//                               ),
//                               child: Column(
//                                 crossAxisAlignment: CrossAxisAlignment.start,
//                                 children: [
//                                   Row(
//                                     children: [
//                                       Icon(
//                                         Icons.security,
//                                         size: 18,
//                                         color: Color(0xFF1A237E),
//                                       ),
//                                       SizedBox(width: 8),
//                                       Text(
//                                         'Password Requirements',
//                                         style: TextStyle(
//                                           fontWeight: FontWeight.w600,
//                                           fontSize: 14,
//                                           color: Color(0xFF1A237E),
//                                         ),
//                                       ),
//                                     ],
//                                   ),
//                                   SizedBox(height: 12),
//                                   _buildRequirement(
//                                     icon: Icons.check_circle,
//                                     color: Colors.green,
//                                     text: 'Minimum 8 characters',
//                                   ),
//                                   _buildRequirement(
//                                     icon: Icons.check_circle,
//                                     color: Colors.green,
//                                     text: 'At least one uppercase letter (A-Z)',
//                                   ),
//                                   _buildRequirement(
//                                     icon: Icons.check_circle,
//                                     color: Colors.green,
//                                     text: 'At least one lowercase letter (a-z)',
//                                   ),
//                                   _buildRequirement(
//                                     icon: Icons.check_circle,
//                                     color: Colors.green,
//                                     text: 'At least one number (0-9)',
//                                   ),
//                                   _buildRequirement(
//                                     icon: Icons.check_circle,
//                                     color: Colors.green,
//                                     text:
//                                     'At least one special character (@\$!%*?&)',
//                                   ),
//                                 ],
//                               ),
//                             ),
//
//                             SizedBox(height: 30),
//
//                             // Update Button
//                             SizedBox(
//                               width: double.infinity,
//                               child: ElevatedButton(
//                                 onPressed: _isLoading
//                                     ? null
//                                     : () async {
//                                   if (!formkey.currentState!.validate()) {
//                                     return;
//                                   }
//
//                                   setState(() {
//                                     _isLoading = true;
//                                   });
//
//                                   try {
//                                     SharedPreferences sh =
//                                     await SharedPreferences
//                                         .getInstance();
//
//                                     // Check if new and confirm passwords match
//                                     if (confirm.text != neww.text) {
//                                       showDialog(
//                                         context: context,
//                                         builder: (context) => AlertDialog(
//                                           title: Row(
//                                             children: [
//                                               Icon(
//                                                 Icons.error_outline,
//                                                 color: Colors.red,
//                                               ),
//                                               SizedBox(width: 10),
//                                               Text(
//                                                 'Password Mismatch',
//                                                 style: TextStyle(
//                                                   color: Colors.red,
//                                                   fontWeight:
//                                                   FontWeight.bold,
//                                                 ),
//                                               ),
//                                             ],
//                                           ),
//                                           content: Text(
//                                             'New password and confirm password do not match. Please enter the same password in both fields.',
//                                           ),
//                                           actions: [
//                                             TextButton(
//                                               onPressed: () {
//                                                 Navigator.pop(context);
//                                               },
//                                               child: Text(
//                                                 'OK',
//                                                 style: TextStyle(
//                                                   color: Color(0xFF1A237E),
//                                                   fontWeight:
//                                                   FontWeight.bold,
//                                                 ),
//                                               ),
//                                             ),
//                                           ],
//                                         ),
//                                       );
//                                       setState(() {
//                                         _isLoading = false;
//                                       });
//                                       return;
//                                     }
//
//                                     // Check if old password matches stored password
//                                     if (old.text !=
//                                         sh.getString('password')) {
//                                       showDialog(
//                                         context: context,
//                                         builder: (context) => AlertDialog(
//                                           title: Row(
//                                             children: [
//                                               Icon(
//                                                 Icons.warning,
//                                                 color: Colors.orange,
//                                               ),
//                                               SizedBox(width: 10),
//                                               Text(
//                                                 'Invalid Password',
//                                                 style: TextStyle(
//                                                   color: Colors.orange,
//                                                   fontWeight:
//                                                   FontWeight.bold,
//                                                 ),
//                                               ),
//                                             ],
//                                           ),
//                                           content: Text(
//                                             'The current password you entered is incorrect. Please try again.',
//                                           ),
//                                           actions: [
//                                             TextButton(
//                                               onPressed: () {
//                                                 Navigator.pop(context);
//                                               },
//                                               child: Text(
//                                                 'OK',
//                                                 style: TextStyle(
//                                                   color: Color(0xFF1A237E),
//                                                   fontWeight:
//                                                   FontWeight.bold,
//                                                 ),
//                                               ),
//                                             ),
//                                           ],
//                                         ),
//                                       );
//                                       setState(() {
//                                         _isLoading = false;
//                                       });
//                                       return;
//                                     }
//
//                                     // If all validations pass, submit to server
//                                     var data = await http.post(
//                                       Uri.parse(
//                                           '${sh.getString('ip')}/userchangepassword'),
//                                       body: {
//                                         'new': neww.text,
//                                         'uid': sh.getString('uid').toString()
//                                       },
//                                     );
//
//                                     // Check response status
//                                     if (data.statusCode == 200) {
//                                       // Show success message
//                                       ScaffoldMessenger.of(context)
//                                           .showSnackBar(
//                                         SnackBar(
//                                           content: Row(
//                                             children: [
//                                               Icon(
//                                                 Icons.check_circle,
//                                                 color: Colors.white,
//                                                 size: 20,
//                                               ),
//                                               SizedBox(width: 10),
//                                               Expanded(
//                                                 child: Text(
//                                                   'Password updated successfully! Please login again with your new password.',
//                                                 ),
//                                               ),
//                                             ],
//                                           ),
//                                           backgroundColor: Colors.green,
//                                           duration: Duration(seconds: 3),
//                                           behavior:
//                                           SnackBarBehavior.floating,
//                                         ),
//                                       );
//
//                                       // Navigate to login after success
//                                       Future.delayed(Duration(seconds: 2),
//                                               () {
//                                             Navigator.pushReplacement(
//                                               context,
//                                               MaterialPageRoute(
//                                                   builder: (context) =>
//                                                       login()),
//                                             );
//                                           });
//                                     } else {
//                                       throw Exception(
//                                           'Failed to update password');
//                                     }
//                                   } catch (e) {
//                                     // Show error message
//                                     ScaffoldMessenger.of(context)
//                                         .showSnackBar(
//                                       SnackBar(
//                                         content: Row(
//                                           children: [
//                                             Icon(
//                                               Icons.error_outline,
//                                               color: Colors.white,
//                                               size: 20,
//                                             ),
//                                             SizedBox(width: 10),
//                                             Expanded(
//                                               child: Text(
//                                                 'Error updating password. Please check your connection and try again.',
//                                               ),
//                                             ),
//                                           ],
//                                         ),
//                                         backgroundColor: Colors.red,
//                                         duration: Duration(seconds: 3),
//                                       ),
//                                     );
//                                   } finally {
//                                     setState(() {
//                                       _isLoading = false;
//                                     });
//                                   }
//                                 },
//                                 style: ElevatedButton.styleFrom(
//                                   backgroundColor: Color(0xFF1A237E),
//                                   padding: EdgeInsets.symmetric(
//                                       vertical: 18, horizontal: 30),
//                                   shape: RoundedRectangleBorder(
//                                     borderRadius: BorderRadius.circular(12),
//                                   ),
//                                   elevation: 2,
//                                   shadowColor:
//                                   Color(0xFF1A237E).withOpacity(0.3),
//                                 ),
//                                 child: _isLoading
//                                     ? SizedBox(
//                                   width: 20,
//                                   height: 20,
//                                   child: CircularProgressIndicator(
//                                     strokeWidth: 2,
//                                     valueColor:
//                                     AlwaysStoppedAnimation<Color>(
//                                         Colors.white),
//                                   ),
//                                 )
//                                     : Row(
//                                   mainAxisAlignment:
//                                   MainAxisAlignment.center,
//                                   children: [
//                                     Icon(
//                                       Icons.lock_open,
//                                       color: Colors.white,
//                                     ),
//                                     SizedBox(width: 10),
//                                     Text(
//                                       'UPDATE PASSWORD',
//                                       style: TextStyle(
//                                         fontSize: 16,
//                                         fontWeight: FontWeight.bold,
//                                         letterSpacing: 1,
//                                       ),
//                                     ),
//                                   ],
//                                 ),
//                               ),
//                             ),
//
//                             SizedBox(height: 20),
//
//                             // Cancel Button
//                             SizedBox(
//                               width: double.infinity,
//                               child: OutlinedButton(
//                                 onPressed: () {
//                                   Navigator.pop(context);
//                                 },
//                                 style: OutlinedButton.styleFrom(
//                                   side: BorderSide(color: Colors.grey[400]!),
//                                   padding: EdgeInsets.symmetric(
//                                       vertical: 16, horizontal: 30),
//                                   shape: RoundedRectangleBorder(
//                                     borderRadius: BorderRadius.circular(12),
//                                   ),
//                                 ),
//                                 child: Text(
//                                   'CANCEL',
//                                   style: TextStyle(
//                                     fontSize: 14,
//                                     fontWeight: FontWeight.bold,
//                                     color: Colors.grey[600],
//                                   ),
//                                 ),
//                               ),
//                             ),
//                           ],
//                         ),
//                       ),
//                     ),
//                   ),
//
//                   // Bottom Info
//                   SizedBox(height: 40),
//                   Container(
//                     padding: EdgeInsets.all(16),
//                     decoration: BoxDecoration(
//                       color: Color(0xFF1A237E).withOpacity(0.05),
//                       borderRadius: BorderRadius.circular(12),
//                       border: Border.all(
//                         color: Color(0xFF1A237E).withOpacity(0.1),
//                       ),
//                     ),
//                     child: Row(
//                       children: [
//                         Icon(
//                           Icons.security_outlined,
//                           color: Color(0xFF1A237E),
//                           size: 20,
//                         ),
//                         SizedBox(width: 12),
//                         Expanded(
//                           child: Text(
//                             'For security reasons, you will be logged out after changing your password. Please login again with your new credentials.',
//                             style: TextStyle(
//                               fontSize: 13,
//                               color: Colors.grey[700],
//                             ),
//                           ),
//                         ),
//                       ],
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//           ),
//         ),
//       ),
//     );
//   }
//
//   Widget _buildRequirement({
//     required IconData icon,
//     required Color color,
//     required String text,
//   }) {
//     return Padding(
//         padding: const EdgeInsets.only(bottom: 8),
//     child: Row(
//     crossAxisAlignment: CrossAxisAlignment.start,
//     children: [
//     Icon(
//     icon,
//     size: 16,
//     color: color,
//     ),
//     SizedBox(width: 8),
//     Expanded(
//     child: Text(
//     text,
//     style: TextStyle(
//     fontSize: 13,
//     color: Colors.grey[600],
//     ),
//     ),
//     ),
//     ],
//     ),
//     );
//     }
// }





import 'package:final_destination/home.dart';
import 'package:final_destination/login.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  runApp(changepassword());
}

class changepassword extends StatelessWidget {
  const changepassword({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: const Color(0xFF0F2A1D),
        scaffoldBackgroundColor: const Color(0xFFE3EED4),
        fontFamily: 'Poppins',
        inputDecorationTheme: InputDecorationTheme(
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide(color: Colors.grey[400]!),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: const BorderSide(color: Color(0xFF0F2A1D), width: 2),
          ),
          errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: const BorderSide(color: Colors.red),
          ),
          contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
        ),
      ),
      home: changepasswordsub(),
    );
  }
}

class changepasswordsub extends StatefulWidget {
  const changepasswordsub({Key? key}) : super(key: key);

  @override
  State<changepasswordsub> createState() => _changepasswordsubState();
}

class _changepasswordsubState extends State<changepasswordsub> {
  final old = TextEditingController();
  final neww = TextEditingController();
  final confirm = TextEditingController();
  final formkey = GlobalKey<FormState>();
  bool _isLoading = false;
  bool _showOldPassword = false;
  bool _showNewPassword = false;
  bool _showConfirmPassword = false;

  @override
  void dispose() {
    old.dispose();
    neww.dispose();
    confirm.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFE3EED4),
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 2,
        title: Text(
          'Change Password',
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
          icon: const Icon(Icons.arrow_back, color: Color(0xFF0F2A1D)),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => UserHomeApp()),
            );
          },
        ),
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              const Color(0xFFE3EED4),
              Colors.white,
            ],
          ),
        ),
        child: Center(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // Header Section
                  Container(
                    margin: const EdgeInsets.only(bottom: 40),
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
                            Icons.lock_reset,
                            size: 45,
                            color: Colors.white,
                          ),
                        ),
                        const SizedBox(height: 20),
                        const Text(
                          'Update Your Password',
                          style: TextStyle(
                            fontSize: 32,
                            fontWeight: FontWeight.w800,
                            color: Color(0xFF0F2A1D),
                            fontFamily: 'Poppins',
                          ),
                        ),
                        const SizedBox(height: 10),
                        Text(
                          'Enter your current password and set a new one',
                          style: TextStyle(
                            fontSize: 16,
                            color: const Color(0xFF0F2A1D).withOpacity(0.7),
                            fontFamily: 'Poppins',
                            fontWeight: FontWeight.w500,
                          ),
                          textAlign: TextAlign.center,
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

                  // Password Form Card
                  Container(
                    width: double.infinity,
                    constraints: const BoxConstraints(maxWidth: 500),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20),
                      boxShadow: [
                        BoxShadow(
                          color: const Color(0xFF0F2A1D).withOpacity(0.1),
                          spreadRadius: 5,
                          blurRadius: 20,
                          offset: const Offset(0, 5),
                        ),
                      ],
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(40),
                      child: Form(
                        key: formkey,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            // Title
                            const Text(
                              'Security Settings',
                              style: TextStyle(
                                fontSize: 24,
                                fontWeight: FontWeight.w800,
                                color: Color(0xFF0F2A1D),
                                fontFamily: 'Poppins',
                              ),
                            ),
                            const SizedBox(height: 8),
                            Text(
                              'For security, please enter your current password',
                              style: TextStyle(
                                color: const Color(0xFF0F2A1D).withOpacity(0.7),
                                fontFamily: 'Poppins',
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            const SizedBox(height: 30),

                            // Current Password
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  children: [
                                    Text(
                                      'Current Password',
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
                                      return 'Please enter your current password';
                                    }
                                    return null;
                                  },
                                  controller: old,
                                  obscureText: !_showOldPassword,
                                  decoration: InputDecoration(
                                    hintText: 'Enter your current password',
                                    hintStyle: TextStyle(
                                      color: const Color(0xFF0F2A1D).withOpacity(0.4),
                                      fontFamily: 'Poppins',
                                    ),
                                    prefixIcon: const Icon(
                                      Icons.lock_outline,
                                      color: Color(0xFF0F2A1D),
                                    ),
                                    suffixIcon: IconButton(
                                      icon: Icon(
                                        _showOldPassword
                                            ? Icons.visibility
                                            : Icons.visibility_off,
                                        color: const Color(0xFF0F2A1D).withOpacity(0.5),
                                      ),
                                      onPressed: () {
                                        setState(() {
                                          _showOldPassword = !_showOldPassword;
                                        });
                                      },
                                    ),
                                    filled: true,
                                    fillColor: const Color(0xFFE3EED4).withOpacity(0.2),
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10),
                                      borderSide: BorderSide(
                                        color: const Color(0xFF0F2A1D).withOpacity(0.2),
                                      ),
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10),
                                      borderSide: const BorderSide(
                                        color: Color(0xFF0F2A1D),
                                        width: 2,
                                      ),
                                    ),
                                  ),
                                  style: const TextStyle(
                                    fontSize: 16,
                                    color: Color(0xFF0F2A1D),
                                    fontFamily: 'Poppins',
                                  ),
                                ),
                              ],
                            ),

                            const SizedBox(height: 20),

                            // New Password
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  children: [
                                    Text(
                                      'New Password',
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
                                      return 'Please enter new password';
                                    }
                                    if (!RegExp(
                                        r'^(?=.*[A-Z])(?=.*[a-z])(?=.*\d)(?=.*[@$!%*?&])[A-Za-z\d@$!%*?&]{8,}$')
                                        .hasMatch(value)) {
                                      return 'Password must contain:\n• 8+ characters\n• 1 uppercase letter\n• 1 lowercase letter\n• 1 number\n• 1 special character';
                                    }
                                    return null;
                                  },
                                  controller: neww,
                                  obscureText: !_showNewPassword,
                                  decoration: InputDecoration(
                                    hintText: 'Enter your new password',
                                    hintStyle: TextStyle(
                                      color: const Color(0xFF0F2A1D).withOpacity(0.4),
                                      fontFamily: 'Poppins',
                                    ),
                                    prefixIcon: const Icon(
                                      Icons.lock_person,
                                      color: Color(0xFF0F2A1D),
                                    ),
                                    suffixIcon: IconButton(
                                      icon: Icon(
                                        _showNewPassword
                                            ? Icons.visibility
                                            : Icons.visibility_off,
                                        color: const Color(0xFF0F2A1D).withOpacity(0.5),
                                      ),
                                      onPressed: () {
                                        setState(() {
                                          _showNewPassword = !_showNewPassword;
                                        });
                                      },
                                    ),
                                    filled: true,
                                    fillColor: const Color(0xFFE3EED4).withOpacity(0.2),
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10),
                                      borderSide: BorderSide(
                                        color: const Color(0xFF0F2A1D).withOpacity(0.2),
                                      ),
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10),
                                      borderSide: const BorderSide(
                                        color: Color(0xFF0F2A1D),
                                        width: 2,
                                      ),
                                    ),
                                  ),
                                  style: const TextStyle(
                                    fontSize: 16,
                                    color: Color(0xFF0F2A1D),
                                    fontFamily: 'Poppins',
                                  ),
                                ),
                              ],
                            ),

                            const SizedBox(height: 20),

                            // Confirm Password
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  children: [
                                    Text(
                                      'Confirm New Password',
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
                                      return 'Please confirm your password';
                                    }
                                    if (value != neww.text) {
                                      return 'Passwords do not match';
                                    }
                                    return null;
                                  },
                                  controller: confirm,
                                  obscureText: !_showConfirmPassword,
                                  decoration: InputDecoration(
                                    hintText: 'Re-enter your new password',
                                    hintStyle: TextStyle(
                                      color: const Color(0xFF0F2A1D).withOpacity(0.4),
                                      fontFamily: 'Poppins',
                                    ),
                                    prefixIcon: const Icon(
                                      Icons.lock_reset,
                                      color: Color(0xFF0F2A1D),
                                    ),
                                    suffixIcon: IconButton(
                                      icon: Icon(
                                        _showConfirmPassword
                                            ? Icons.visibility
                                            : Icons.visibility_off,
                                        color: const Color(0xFF0F2A1D).withOpacity(0.5),
                                      ),
                                      onPressed: () {
                                        setState(() {
                                          _showConfirmPassword =
                                          !_showConfirmPassword;
                                        });
                                      },
                                    ),
                                    filled: true,
                                    fillColor: const Color(0xFFE3EED4).withOpacity(0.2),
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10),
                                      borderSide: BorderSide(
                                        color: const Color(0xFF0F2A1D).withOpacity(0.2),
                                      ),
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10),
                                      borderSide: const BorderSide(
                                        color: Color(0xFF0F2A1D),
                                        width: 2,
                                      ),
                                    ),
                                  ),
                                  style: const TextStyle(
                                    fontSize: 16,
                                    color: Color(0xFF0F2A1D),
                                    fontFamily: 'Poppins',
                                  ),
                                ),
                              ],
                            ),

                            // Password Requirements
                            const SizedBox(height: 30),
                            Container(
                              padding: const EdgeInsets.all(16),
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
                                      const Icon(
                                        Icons.security,
                                        size: 18,
                                        color: Color(0xFF0F2A1D),
                                      ),
                                      const SizedBox(width: 8),
                                      const Text(
                                        'Password Requirements',
                                        style: TextStyle(
                                          fontWeight: FontWeight.w800,
                                          fontSize: 14,
                                          color: Color(0xFF0F2A1D),
                                          fontFamily: 'Poppins',
                                        ),
                                      ),
                                    ],
                                  ),
                                  const SizedBox(height: 12),
                                  _buildRequirement(
                                    icon: Icons.check_circle,
                                    color: Colors.green,
                                    text: 'Minimum 8 characters',
                                  ),
                                  _buildRequirement(
                                    icon: Icons.check_circle,
                                    color: Colors.green,
                                    text: 'At least one uppercase letter (A-Z)',
                                  ),
                                  _buildRequirement(
                                    icon: Icons.check_circle,
                                    color: Colors.green,
                                    text: 'At least one lowercase letter (a-z)',
                                  ),
                                  _buildRequirement(
                                    icon: Icons.check_circle,
                                    color: Colors.green,
                                    text: 'At least one number (0-9)',
                                  ),
                                  _buildRequirement(
                                    icon: Icons.check_circle,
                                    color: Colors.green,
                                    text:
                                    'At least one special character (@\$!%*?&)',
                                  ),
                                ],
                              ),
                            ),

                            const SizedBox(height: 30),

                            // Update Button
                            SizedBox(
                              width: double.infinity,
                              child: ElevatedButton(
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
                                    await SharedPreferences
                                        .getInstance();

                                    // Check if new and confirm passwords match
                                    if (confirm.text != neww.text) {
                                      showDialog(
                                        context: context,
                                        builder: (context) => AlertDialog(
                                          title: Row(
                                            children: [
                                              const Icon(
                                                Icons.error_outline,
                                                color: Colors.red,
                                              ),
                                              const SizedBox(width: 10),
                                              const Text(
                                                'Password Mismatch',
                                                style: TextStyle(
                                                  color: Colors.red,
                                                  fontWeight:
                                                  FontWeight.w800,
                                                  fontFamily: 'Poppins',
                                                ),
                                              ),
                                            ],
                                          ),
                                          content: const Text(
                                            'New password and confirm password do not match. Please enter the same password in both fields.',
                                            style: TextStyle(
                                              fontFamily: 'Poppins',
                                            ),
                                          ),
                                          actions: [
                                            TextButton(
                                              onPressed: () {
                                                Navigator.pop(context);
                                              },
                                              child: const Text(
                                                'OK',
                                                style: TextStyle(
                                                  color: Color(0xFF0F2A1D),
                                                  fontWeight:
                                                  FontWeight.w800,
                                                  fontFamily: 'Poppins',
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      );
                                      setState(() {
                                        _isLoading = false;
                                      });
                                      return;
                                    }

                                    // Check if old password matches stored password
                                    if (old.text !=
                                        sh.getString('password')) {
                                      showDialog(
                                        context: context,
                                        builder: (context) => AlertDialog(
                                          title: Row(
                                            children: [
                                              const Icon(
                                                Icons.warning,
                                                color: Colors.orange,
                                              ),
                                              const SizedBox(width: 10),
                                              const Text(
                                                'Invalid Password',
                                                style: TextStyle(
                                                  color: Colors.orange,
                                                  fontWeight:
                                                  FontWeight.w800,
                                                  fontFamily: 'Poppins',
                                                ),
                                              ),
                                            ],
                                          ),
                                          content: const Text(
                                            'The current password you entered is incorrect. Please try again.',
                                            style: TextStyle(
                                              fontFamily: 'Poppins',
                                            ),
                                          ),
                                          actions: [
                                            TextButton(
                                              onPressed: () {
                                                Navigator.pop(context);
                                              },
                                              child: const Text(
                                                'OK',
                                                style: TextStyle(
                                                  color: Color(0xFF0F2A1D),
                                                  fontWeight:
                                                  FontWeight.w800,
                                                  fontFamily: 'Poppins',
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      );
                                      setState(() {
                                        _isLoading = false;
                                      });
                                      return;
                                    }

                                    // If all validations pass, submit to server
                                    var data = await http.post(
                                      Uri.parse(
                                          '${sh.getString('ip')}/userchangepassword'),
                                      body: {
                                        'new': neww.text,
                                        'uid': sh.getString('uid').toString()
                                      },
                                    );

                                    // Check response status
                                    if (data.statusCode == 200) {
                                      // Show success message
                                      ScaffoldMessenger.of(context)
                                          .showSnackBar(
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
                                                  'Password updated successfully! Please login again with your new password.',
                                                  style: TextStyle(
                                                    fontFamily: 'Poppins',
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                          backgroundColor: const Color(0xFF0F2A1D),
                                          duration: const Duration(seconds: 3),
                                          behavior:
                                          SnackBarBehavior.floating,
                                        ),
                                      );

                                      // Navigate to login after success
                                      Future.delayed(const Duration(seconds: 2),
                                              () {
                                            Navigator.pushReplacement(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (context) =>
                                                      login()),
                                            );
                                          });
                                    } else {
                                      throw Exception(
                                          'Failed to update password');
                                    }
                                  } catch (e) {
                                    // Show error message
                                    ScaffoldMessenger.of(context)
                                        .showSnackBar(
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
                                                'Error updating password. Please check your connection and try again.',
                                                style: TextStyle(
                                                  fontFamily: 'Poppins',
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                        backgroundColor: Colors.red,
                                        duration: const Duration(seconds: 3),
                                      ),
                                    );
                                  } finally {
                                    setState(() {
                                      _isLoading = false;
                                    });
                                  }
                                },
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: const Color(0xFF0F2A1D),
                                  foregroundColor: Colors.white,
                                  padding: const EdgeInsets.symmetric(
                                      vertical: 18, horizontal: 30),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(12),
                                  ),
                                  elevation: 4,
                                  shadowColor:
                                  const Color(0xFF0F2A1D).withOpacity(0.3),
                                ),
                                child: _isLoading
                                    ? const SizedBox(
                                  width: 20,
                                  height: 20,
                                  child: CircularProgressIndicator(
                                    strokeWidth: 2,
                                    valueColor:
                                    AlwaysStoppedAnimation<Color>(
                                        Colors.white),
                                  ),
                                )
                                    : Row(
                                  mainAxisAlignment:
                                  MainAxisAlignment.center,
                                  children: const [
                                    Icon(
                                      Icons.lock_open,
                                      color: Colors.white,
                                    ),
                                    SizedBox(width: 10),
                                    Text(
                                      'UPDATE PASSWORD',
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

                            const SizedBox(height: 20),

                            // Cancel Button
                            SizedBox(
                              width: double.infinity,
                              child: OutlinedButton(
                                onPressed: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(builder: (context) => UserHomeApp()),
                                  );
                                },
                                style: OutlinedButton.styleFrom(
                                  side: const BorderSide(color: Color(0xFF0F2A1D), width: 1.5),
                                  foregroundColor: const Color(0xFF0F2A1D),
                                  padding: const EdgeInsets.symmetric(
                                      vertical: 16, horizontal: 30),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(12),
                                  ),
                                ),
                                child: const Text(
                                  'CANCEL',
                                  style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w800,
                                    color: Color(0xFF0F2A1D),
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

                  // Bottom Info
                  const SizedBox(height: 40),
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
                        const Icon(
                          Icons.security_outlined,
                          color: Color(0xFF0F2A1D),
                          size: 20,
                        ),
                        const SizedBox(width: 12),
                        Expanded(
                          child: Text(
                            'For security reasons, you will be logged out after changing your password. Please login again with your new credentials.',
                            style: TextStyle(
                              fontSize: 13,
                              color: const Color(0xFF0F2A1D).withOpacity(0.7),
                              fontFamily: 'Poppins',
                              fontWeight: FontWeight.w500,
                            ),
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
      ),
    );
  }

  Widget _buildRequirement({
    required IconData icon,
    required Color color,
    required String text,
  }) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(
            icon,
            size: 16,
            color: color,
          ),
          const SizedBox(width: 8),
          Expanded(
            child: Text(
              text,
              style: TextStyle(
                fontSize: 13,
                color: const Color(0xFF0F2A1D).withOpacity(0.7),
                fontFamily: 'Poppins',
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
