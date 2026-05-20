// import 'dart:convert';
//
// import 'package:final_destination/forgotemail.dart';
// import 'package:final_destination/home.dart';
// import 'package:final_destination/register.dart';
// import 'package:flutter/material.dart';
// import 'package:http/http.dart' as http;
// import 'package:shared_preferences/shared_preferences.dart';
//
// import 'forgotpass.dart';
//
// void main(){
//   runApp(login());
// }
//
//
// class login extends StatelessWidget {
//   const login({Key? key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(home: loginsub(),);
//   }
// }
// class loginsub extends StatefulWidget {
//   const loginsub({Key? key}) : super(key: key);
//
//   @override
//   State<loginsub> createState() => _loginsubState();
// }
//
// class _loginsubState extends State<loginsub> {
//   final username=TextEditingController(text:'vishnudevpk895@gmail.com');
//   final password=TextEditingController(text: 'Vdpk@1234');
//   final formkey=GlobalKey<FormState>();
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(body: Center(child: SingleChildScrollView(child: SizedBox(height: 500,width: 500,child:
//     Form(key: formkey,
//       child: Column(children: [
//       TextFormField(validator: (value){
//         if(value==null || value.isEmpty){
//           return 'enter valid data';
//         }
//         return null;
//       },
//         controller: username,
//         decoration: InputDecoration(
//         border: OutlineInputBorder(),
//         hintText: 'enter username',
//         labelText: 'username',
//         prefixIcon: Icon(Icons.abc)
//       ),),SizedBox(height: 20,),
//       TextFormField(validator: (value){
//         if(value==null || value.isEmpty){
//           return 'enter valid data';
//         }
//         return null;
//       },
//         controller: password,
//         decoration: InputDecoration(
//         border: OutlineInputBorder(),
//         hintText: 'enter password',
//         labelText: 'password',
//         prefixIcon:Icon(Icons.abc)
//       ),),SizedBox(height: 20,),
//       ElevatedButton(onPressed: () async {
//       if(!formkey.currentState!.validate()) {
//         return;
//       }
//         SharedPreferences sh=await SharedPreferences.getInstance();
//        var data=await http.post(Uri.parse('${sh.getString('ip')}/login2'),
//        body: {
//          'username':username.text,
//          'password':password.text,
//        });
//        var d=json.decode(data.body);
//        if(d['status']=='ok'){
//        sh.setString('uid', d['uid'].toString());
//        sh.setString('password', password.text);
//        Navigator.push(context, MaterialPageRoute(builder: (context)=>UserHomeApp()));
//        }
//       }, child: Text('login')),
//       SizedBox(height: 20,),
//       ElevatedButton(onPressed: (){
//         Navigator.push(context, MaterialPageRoute(builder: (context)=>register()));
//       }, child: Text('register')),
//         ElevatedButton(onPressed: (){
//           Navigator.push(context, MaterialPageRoute(builder: (context)=> forgotemail()));
//         }, child: Text('forgot password'))
//
//       ],),),),),),);
//   }
//
//   // user() {}
// }


//
// import 'dart:convert';
// import 'dart:ui';
//
// import 'package:final_destination/home.dart';
// import 'package:final_destination/register.dart';
// import 'package:flutter/material.dart';
// import 'package:http/http.dart' as http;
// import 'package:shared_preferences/shared_preferences.dart';
//
// void main() {
//   runApp(login());
// }
//
// class login extends StatelessWidget {
//   const login({Key? key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Travel Login',
//       theme: ThemeData.dark().copyWith(
//         scaffoldBackgroundColor: Colors.transparent,
//         primaryColor: const Color(0xFF0F3D3A),
//         appBarTheme: const AppBarTheme(
//           backgroundColor: Colors.transparent,
//           elevation: 0,
//           centerTitle: true,
//         ),
//         inputDecorationTheme: InputDecorationTheme(
//           filled: true,
//           fillColor: Colors.white.withOpacity(0.15),
//           border: OutlineInputBorder(
//             borderRadius: BorderRadius.circular(20),
//             borderSide: BorderSide.none,
//           ),
//           enabledBorder: OutlineInputBorder(
//             borderRadius: BorderRadius.circular(20),
//             borderSide: BorderSide(
//               color: Colors.white.withOpacity(0.3),
//               width: 1.5,
//             ),
//           ),
//           focusedBorder: OutlineInputBorder(
//             borderRadius: BorderRadius.circular(20),
//             borderSide: const BorderSide(
//               color: Color(0xFF2EF21D),
//               width: 2,
//             ),
//           ),
//           hintStyle: TextStyle(
//             color: Colors.white.withOpacity(0.7),
//           ),
//           labelStyle: const TextStyle(
//             color: Color(0xFF2EF21D),
//             fontWeight: FontWeight.w500,
//             shadows: [
//               Shadow(
//                 color: Colors.black,
//                 blurRadius: 3,
//                 offset: Offset(1, 1),
//               ),
//             ],
//           ),
//           contentPadding: const EdgeInsets.symmetric(
//             horizontal: 24,
//             vertical: 20,
//           ),
//         ),
//       ),
//       home: const loginsub(),
//       debugShowCheckedModeBanner: false,
//     );
//   }
// }
//
// class loginsub extends StatefulWidget {
//   const loginsub({Key? key}) : super(key: key);
//
//   @override
//   State<loginsub> createState() => _loginsubState();
// }
//
// class _loginsubState extends State<loginsub>
//     with SingleTickerProviderStateMixin {
//   final username = TextEditingController(text: 'abcd@gmail.com');
//   final password = TextEditingController(text: 'Abcd@123');
//   final formkey = GlobalKey<FormState>();
//   bool _isLoading = false;
//   late AnimationController _buttonController;
//   late Animation<double> _buttonScale;
//
//   @override
//   void initState() {
//     super.initState();
//     _buttonController = AnimationController(
//       duration: const Duration(milliseconds: 200),
//       vsync: this,
//     );
//     _buttonScale = Tween<double>(begin: 1.0, end: 0.95).animate(
//       CurvedAnimation(parent: _buttonController, curve: Curves.easeInOut),
//     );
//   }
//
//   @override
//   void dispose() {
//     _buttonController.dispose();
//     super.dispose();
//   }
//
//   Future<void> _animateButton() async {
//     await _buttonController.forward();
//     await _buttonController.reverse();
//   }
//
//   Widget _glassContainer({required Widget child, double? height, EdgeInsets? padding, double borderRadius = 25}) {
//     return Container(
//       height: height,
//       padding: padding ?? const EdgeInsets.all(0),
//       decoration: BoxDecoration(
//         borderRadius: BorderRadius.circular(borderRadius),
//         gradient: LinearGradient(
//           begin: Alignment.topLeft,
//           end: Alignment.bottomRight,
//           colors: [
//             Colors.white.withOpacity(0.15),
//             Colors.white.withOpacity(0.05),
//           ],
//         ),
//         border: Border.all(
//           color: Colors.white.withOpacity(0.2),
//           width: 1.5,
//         ),
//         boxShadow: [
//           BoxShadow(
//             color: Colors.black.withOpacity(0.3),
//             blurRadius: 30,
//             spreadRadius: 5,
//           ),
//         ],
//       ),
//       child: ClipRRect(
//         borderRadius: BorderRadius.circular(borderRadius),
//         child: BackdropFilter(
//           filter: ImageFilter.blur(sigmaX: 15, sigmaY: 15),
//           child: child,
//         ),
//       ),
//     );
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Container(
//         width: double.infinity,
//         height: double.infinity,
//         decoration: const BoxDecoration(
//           image: DecorationImage(
//             image: NetworkImage(
//               'https://images.unsplash.com/photo-1544620347-c4fd4a3d5957?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=2069&q=80',
//             ),
//             fit: BoxFit.cover,
//             colorFilter: ColorFilter.mode(
//               Colors.black54,
//               BlendMode.darken,
//             ),
//           ),
//         ),
//         child: Stack(
//           children: [
//             // Main content
//             Center(
//               child: SingleChildScrollView(
//                 child: Container(
//                   constraints: const BoxConstraints(maxWidth: 500),
//                   padding: const EdgeInsets.all(24),
//                   child: Column(
//                     mainAxisAlignment: MainAxisAlignment.center,
//                     crossAxisAlignment: CrossAxisAlignment.stretch,
//                     children: [
//                       // Glassmorphic header with travel icon
//                       _glassContainer(
//                         padding: const EdgeInsets.all(30),
//                         child: Column(
//                           children: [
//                             Container(
//                               padding: const EdgeInsets.all(20),
//                               decoration: BoxDecoration(
//                                 shape: BoxShape.circle,
//                                 gradient: LinearGradient(
//                                   colors: [
//                                     const Color(0xFF0F3D3A),
//                                     const Color(0xFF2EF21D),
//                                   ],
//                                   begin: Alignment.topLeft,
//                                   end: Alignment.bottomRight,
//                                 ),
//                                 boxShadow: [
//                                   BoxShadow(
//                                     color: const Color(0xFF2EF21D).withOpacity(0.5),
//                                     blurRadius: 20,
//                                     spreadRadius: 3,
//                                   ),
//                                 ],
//                               ),
//                               child: const Icon(
//                                 Icons.travel_explore_rounded,
//                                 size: 50,
//                                 color: Colors.white,
//                                 shadows: [
//                                   Shadow(
//                                     color: Colors.black,
//                                     blurRadius: 10,
//                                   ),
//                                 ],
//                               ),
//                             ),
//                             const SizedBox(height: 20),
//                             Text(
//                               'FINAL DESTINATION',
//                               style: TextStyle(
//                                 fontSize: 28,
//                                 fontWeight: FontWeight.w700,
//                                 color: Colors.white,
//                                 letterSpacing: 3,
//                                 shadows: [
//                                   Shadow(
//                                     color: Colors.black.withOpacity(0.7),
//                                     blurRadius: 10,
//                                     offset: const Offset(2, 2),
//                                   ),
//                                 ],
//                               ),
//                             ),
//                             const SizedBox(height: 8),
//                             Text(
//                               'Discover Your Journey',
//                               style: TextStyle(
//                                 fontSize: 14,
//                                 color: Colors.white.withOpacity(0.8),
//                                 letterSpacing: 1,
//                                 shadows: [
//                                   Shadow(
//                                     color: Colors.black.withOpacity(0.5),
//                                     blurRadius: 5,
//                                   ),
//                                 ],
//                               ),
//                             ),
//                           ],
//                         ),
//                       ),
//
//                       const SizedBox(height: 30),
//
//                       // Glassmorphic form container
//                       _glassContainer(
//                         padding: const EdgeInsets.all(30),
//                         child: Form(
//                           key: formkey,
//                           child: Column(
//                             children: [
//                               // Username field with travel icon
//                               Container(
//                                 margin: const EdgeInsets.only(bottom: 20),
//                                 child: TextFormField(
//                                   validator: (value) {
//                                     if (value == null || value.isEmpty) {
//                                       return 'Please enter your username or email';
//                                     }
//                                     return null;
//                                   },
//                                   controller: username,
//                                   style: const TextStyle(
//                                     color: Colors.white,
//                                     fontSize: 16,
//                                     shadows: [
//                                       Shadow(
//                                         color: Colors.black,
//                                         blurRadius: 2,
//                                       ),
//                                     ],
//                                   ),
//                                   decoration: InputDecoration(
//                                     hintText: 'Enter your username or email',
//                                     hintStyle: TextStyle(
//                                       color: Colors.white.withOpacity(0.6),
//                                       shadows: [
//                                         Shadow(
//                                           color: Colors.black.withOpacity(0.5),
//                                           blurRadius: 3,
//                                         ),
//                                       ],
//                                     ),
//                                     labelText: 'TRAVELER ID',
//                                     labelStyle: const TextStyle(
//                                       color: Color(0xFF2EF21D),
//                                       fontWeight: FontWeight.w600,
//                                       shadows: [
//                                         Shadow(
//                                           color: Colors.black,
//                                           blurRadius: 5,
//                                           offset: Offset(1, 1),
//                                         ),
//                                       ],
//                                     ),
//                                     prefixIcon: Icon(
//                                       Icons.person_pin_circle_rounded,
//                                       color: const Color(0xFF2EF21D).withOpacity(0.9),
//                                       shadows: [
//                                         Shadow(
//                                           color: Colors.black.withOpacity(0.5),
//                                           blurRadius: 3,
//                                         ),
//                                       ],
//                                     ),
//                                     filled: true,
//                                     fillColor: Colors.white.withOpacity(0.1),
//                                   ),
//                                 ),
//                               ),
//
//                               // Password field with lock icon
//                               Container(
//                                 margin: const EdgeInsets.only(bottom: 30),
//                                 child: TextFormField(
//                                   validator: (value) {
//                                     if (value == null || value.isEmpty) {
//                                       return 'Please enter your password';
//                                     }
//                                     return null;
//                                   },
//                                   controller: password,
//                                   obscureText: true,
//                                   style: const TextStyle(
//                                     color: Colors.white,
//                                     fontSize: 16,
//                                     shadows: [
//                                       Shadow(
//                                         color: Colors.black,
//                                         blurRadius: 2,
//                                       ),
//                                     ],
//                                   ),
//                                   decoration: InputDecoration(
//                                     hintText: 'Enter your secure password',
//                                     hintStyle: TextStyle(
//                                       color: Colors.white.withOpacity(0.6),
//                                       shadows: [
//                                         Shadow(
//                                           color: Colors.black.withOpacity(0.5),
//                                           blurRadius: 3,
//                                         ),
//                                       ],
//                                     ),
//                                     labelText: 'SECURE ACCESS',
//                                     labelStyle: const TextStyle(
//                                       color: Color(0xFF2EF21D),
//                                       fontWeight: FontWeight.w600,
//                                       shadows: [
//                                         Shadow(
//                                           color: Colors.black,
//                                           blurRadius: 5,
//                                           offset: Offset(1, 1),
//                                         ),
//                                       ],
//                                     ),
//                                     prefixIcon: Icon(
//                                       Icons.lock_clock_rounded,
//                                       color: const Color(0xFF2EF21D).withOpacity(0.9),
//                                       shadows: [
//                                         Shadow(
//                                           color: Colors.black.withOpacity(0.5),
//                                           blurRadius: 3,
//                                         ),
//                                       ],
//                                     ),
//                                     filled: true,
//                                     fillColor: Colors.white.withOpacity(0.1),
//                                   ),
//                                 ),
//                               ),
//
//                               // Glassmorphic login button with travel theme
//                               AnimatedBuilder(
//                                 animation: _buttonScale,
//                                 builder: (context, child) {
//                                   return Transform.scale(
//                                     scale: _buttonScale.value,
//                                     child: child,
//                                   );
//                                 },
//                                 child: Container(
//                                   height: 55,
//                                   decoration: BoxDecoration(
//                                     borderRadius: BorderRadius.circular(20),
//                                     gradient: LinearGradient(
//                                       colors: [
//                                         const Color(0xFF0F3D3A),
//                                         const Color(0xFF2EF21D),
//                                       ],
//                                       begin: Alignment.topLeft,
//                                       end: Alignment.bottomRight,
//                                     ),
//                                     boxShadow: [
//                                       BoxShadow(
//                                         color: const Color(0xFF2EF21D).withOpacity(0.4),
//                                         blurRadius: 15,
//                                         spreadRadius: 2,
//                                         offset: const Offset(0, 4),
//                                       ),
//                                       BoxShadow(
//                                         color: Colors.black.withOpacity(0.3),
//                                         blurRadius: 10,
//                                         offset: const Offset(0, 2),
//                                       ),
//                                     ],
//                                   ),
//                                   child: Material(
//                                     color: Colors.transparent,
//                                     borderRadius: BorderRadius.circular(20),
//                                     child: InkWell(
//                                       borderRadius: BorderRadius.circular(20),
//                                       onTap: _isLoading
//                                           ? null
//                                           : () async {
//                                         await _animateButton();
//                                         if (!formkey.currentState!.validate()) {
//                                           return;
//                                         }
//
//                                         setState(() {
//                                           _isLoading = true;
//                                         });
//
//                                         try {
//                                           SharedPreferences sh = await SharedPreferences.getInstance();
//                                           var data = await http.post(
//                                             Uri.parse('${sh.getString('ip')}/login2'),
//                                             body: {
//                                               'username': username.text,
//                                               'password': password.text,
//                                             },
//                                           );
//
//                                           var d = json.decode(data.body);
//                                           if (d['status'] == 'ok') {
//                                             sh.setString('uid', d['uid'].toString());
//                                             sh.setString('password', password.text);
//                                             Navigator.push(
//                                               context,
//                                               MaterialPageRoute(builder: (context) => user()),
//                                             );
//                                           } else {
//                                             ScaffoldMessenger.of(context).showSnackBar(
//                                               SnackBar(
//                                                 content: Text(d['message'] ?? 'Login failed'),
//                                                 backgroundColor: Colors.red.withOpacity(0.8),
//                                                 behavior: SnackBarBehavior.floating,
//                                                 shape: RoundedRectangleBorder(
//                                                   borderRadius: BorderRadius.circular(15),
//                                                 ),
//                                               ),
//                                             );
//                                           }
//                                         } catch (e) {
//                                           ScaffoldMessenger.of(context).showSnackBar(
//                                             SnackBar(
//                                               content: Text('Error: $e'),
//                                               backgroundColor: Colors.red.withOpacity(0.8),
//                                               behavior: SnackBarBehavior.floating,
//                                               shape: RoundedRectangleBorder(
//                                                 borderRadius: BorderRadius.circular(15),
//                                               ),
//                                             ),
//                                           );
//                                         } finally {
//                                           setState(() {
//                                             _isLoading = false;
//                                           });
//                                         }
//                                       },
//                                       splashColor: Colors.white.withOpacity(0.2),
//                                       highlightColor: Colors.white.withOpacity(0.1),
//                                       child: Stack(
//                                         children: [
//                                           if (_isLoading)
//                                             Positioned.fill(
//                                               child: Container(
//                                                 decoration: BoxDecoration(
//                                                   borderRadius: BorderRadius.circular(20),
//                                                   gradient: LinearGradient(
//                                                     colors: [
//                                                       const Color(0xFF0F3D3A).withOpacity(0.8),
//                                                       const Color(0xFF2EF21D).withOpacity(0.8),
//                                                     ],
//                                                     begin: Alignment.topLeft,
//                                                     end: Alignment.bottomRight,
//                                                   ),
//                                                 ),
//                                                 child: const Center(
//                                                   child: CircularProgressIndicator(
//                                                     strokeWidth: 3,
//                                                     valueColor:
//                                                     AlwaysStoppedAnimation<Color>(Colors.white),
//                                                   ),
//                                                 ),
//                                               ),
//                                             )
//                                           else
//                                             Center(
//                                               child: Row(
//                                                 mainAxisAlignment: MainAxisAlignment.center,
//                                                 children: [
//                                                   Icon(
//                                                     Icons.flight_takeoff_rounded,
//                                                     color: Colors.white.withOpacity(0.9),
//                                                     size: 22,
//                                                   ),
//                                                   const SizedBox(width: 12),
//                                                   Text(
//                                                     'BEGIN JOURNEY',
//                                                     style: TextStyle(
//                                                       fontSize: 16,
//                                                       fontWeight: FontWeight.w700,
//                                                       color: Colors.white,
//                                                       letterSpacing: 1.2,
//                                                       shadows: [
//                                                         Shadow(
//                                                           color: Colors.black.withOpacity(0.7),
//                                                           blurRadius: 5,
//                                                           offset: const Offset(1, 1),
//                                                         ),
//                                                       ],
//                                                     ),
//                                                   ),
//                                                 ],
//                                               ),
//                                             ),
//                                         ],
//                                       ),
//                                     ),
//                                   ),
//                                 ),
//                               ),
//                             ],
//                           ),
//                         ),
//                       ),
//
//                       const SizedBox(height: 25),
//
//                       // Divider
//                       Container(
//                         height: 1,
//                         margin: const EdgeInsets.symmetric(horizontal: 20),
//                         decoration: BoxDecoration(
//                           gradient: LinearGradient(
//                             colors: [
//                               Colors.transparent,
//                               const Color(0xFF2EF21D).withOpacity(0.5),
//                               Colors.transparent,
//                             ],
//                           ),
//                         ),
//                       ),
//
//                       const SizedBox(height: 25),
//
//                       // Glassmorphic register button
//                       _glassContainer(
//                         padding: const EdgeInsets.all(0),
//                         child: Material(
//                           color: Colors.transparent,
//                           borderRadius: BorderRadius.circular(20),
//                           child: InkWell(
//                             borderRadius: BorderRadius.circular(20),
//                             onTap: () {
//                               Navigator.push(
//                                 context,
//                                 MaterialPageRoute(builder: (context) => const register()),
//                               );
//                             },
//                             splashColor: const Color(0xFF2EF21D).withOpacity(0.3),
//                             highlightColor: Colors.white.withOpacity(0.05),
//                             child: Container(
//                               height: 55,
//                               padding: const EdgeInsets.symmetric(horizontal: 30),
//                               child: Row(
//                                 mainAxisAlignment: MainAxisAlignment.center,
//                                 children: [
//                                   Icon(
//                                     Icons.add_location_alt_rounded,
//                                     color: const Color(0xFF2EF21D).withOpacity(0.9),
//                                     size: 22,
//                                   ),
//                                   const SizedBox(width: 12),
//                                   Text(
//                                     'CREATE TRAVEL PROFILE',
//                                     style: TextStyle(
//                                       fontSize: 14,
//                                       fontWeight: FontWeight.w600,
//                                       color: const Color(0xFF2EF21D),
//                                       letterSpacing: 1,
//                                       shadows: [
//                                         Shadow(
//                                           color: Colors.black.withOpacity(0.5),
//                                           blurRadius: 3,
//                                         ),
//                                       ],
//                                     ),
//                                   ),
//                                 ],
//                               ),
//                             ),
//                           ),
//                         ),
//                       ),
//
//                       const SizedBox(height: 40),
//
//                       // Footer
//                       Container(
//                         padding: const EdgeInsets.all(15),
//                         decoration: BoxDecoration(
//                           borderRadius: BorderRadius.circular(15),
//                           color: Colors.black.withOpacity(0.3),
//                           border: Border.all(
//                             color: const Color(0xFF2EF21D).withOpacity(0.3),
//                             width: 1,
//                           ),
//                         ),
//                         child: Column(
//                           children: [
//                             Text(
//                               '"The journey of a thousand miles begins with a single step"',
//                               textAlign: TextAlign.center,
//                               style: TextStyle(
//                                 fontStyle: FontStyle.italic,
//                                 color: Colors.white.withOpacity(0.7),
//                                 fontSize: 12,
//                                 letterSpacing: 0.5,
//                               ),
//                             ),
//                             const SizedBox(height: 5),
//                             Text(
//                               '© 2024 Final Destination Travel',
//                               textAlign: TextAlign.center,
//                               style: TextStyle(
//                                 color: Colors.white.withOpacity(0.5),
//                                 fontSize: 10,
//                                 letterSpacing: 1,
//                               ),
//                             ),
//                           ],
//                         ),
//                       ),
//                     ],
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
// import 'dart:convert';
// import 'package:final_destination/home.dart';
// import 'package:final_destination/register.dart';
// import 'package:final_destination/services/location/location_provider.dart';
// import 'package:final_destination/services/notification/notification_provider.dart';
// import 'package:flutter/material.dart';
// import 'package:http/http.dart' as http;
// import 'package:shared_preferences/shared_preferences.dart';
//
// void main() {
//   runApp(const login());
// }
//
// class login extends StatelessWidget {
//   const login({Key? key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       theme: ThemeData(
//         primaryColor: const Color(0xFF1A237E),
//         fontFamily: 'Poppins',
//         inputDecorationTheme: InputDecorationTheme(
//           border: OutlineInputBorder(
//             borderRadius: BorderRadius.circular(12),
//             borderSide: const BorderSide(color: Colors.grey),
//           ),
//           focusedBorder: OutlineInputBorder(
//             borderRadius: BorderRadius.circular(12),
//             borderSide: const BorderSide(color: Color(0xFF1A237E), width: 2),
//           ),
//           contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 18),
//         ),
//       ),
//       home: const loginsub(),
//     );
//   }
// }
//
// class loginsub extends StatefulWidget {
//   const loginsub({Key? key}) : super(key: key);
//
//   @override
//   State<loginsub> createState() => _loginsubState();
// }
//
// class _loginsubState extends State<loginsub> {
//   final username = TextEditingController(text: 'xyz@gmail.com');
//   final password = TextEditingController(text: 'Xyz@12345');
//   final formkey = GlobalKey<FormState>();
//   bool _isLoading = false;
//   bool _obscurePassword = true;
//
//   // Nature background image URL - Replace with your own image
//   final String backgroundImageUrl = 'https://images.unsplash.com/photo-1507525428034-b723cf961d3e?ixlib=rb-1.2.1&auto=format&fit=crop&w=1920&q=80';
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Stack(
//         children: [
//           // Background Image with overlay
//           Container(
//             width: double.infinity,
//             height: double.infinity,
//             decoration: BoxDecoration(
//               image: DecorationImage(
//                 image: NetworkImage(backgroundImageUrl),
//                 fit: BoxFit.cover,
//                 colorFilter: ColorFilter.mode(
//                   Colors.black.withOpacity(0.4),
//                   BlendMode.darken,
//                 ),
//               ),
//             ),
//           ),
//
//           // Gradient Overlay for better text readability
//           Container(
//             width: double.infinity,
//             height: double.infinity,
//             decoration: BoxDecoration(
//               gradient: LinearGradient(
//                 begin: Alignment.topCenter,
//                 end: Alignment.bottomCenter,
//                 colors: [
//                   Colors.black.withOpacity(0.5),
//                   Colors.black.withOpacity(0.3),
//                   Colors.transparent,
//                   Colors.black.withOpacity(0.3),
//                   Colors.black.withOpacity(0.5),
//                 ],
//                 stops: const [0.0, 0.3, 0.5, 0.7, 1.0],
//               ),
//             ),
//           ),
//
//           // Nature Pattern Overlay (Optional)
//           Container(
//             width: double.infinity,
//             height: double.infinity,
//             decoration: BoxDecoration(
//               image: DecorationImage(
//                 image: const AssetImage('assets/nature_pattern.png'), // Create a pattern overlay
//                 fit: BoxFit.cover,
//                 opacity: 0.1,
//                 colorFilter: ColorFilter.mode(
//                   Colors.white.withOpacity(0.1),
//                   BlendMode.overlay,
//                 ),
//               ),
//             ),
//           ),
//
//           Center(
//             child: SingleChildScrollView(
//               child: Padding(
//                 padding: const EdgeInsets.all(20.0),
//                 child: Column(
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   crossAxisAlignment: CrossAxisAlignment.center,
//                   children: [
//                     // Logo/Header Section with Nature Theme
//                     Container(
//                       margin: const EdgeInsets.only(bottom: 40),
//                       child: Column(
//                         children: [
//                           // Nature-themed logo container
//                           Container(
//                             width: 100,
//                             height: 100,
//                             decoration: BoxDecoration(
//                               color: Colors.white.withOpacity(0.2),
//                               borderRadius: BorderRadius.circular(25),
//                               boxShadow: [
//                                 BoxShadow(
//                                   color: Colors.black.withOpacity(0.3),
//                                   blurRadius: 20,
//                                   spreadRadius: 2,
//                                   offset: const Offset(0, 5),
//                                 ),
//                                 BoxShadow(
//                                   color: Colors.green.withOpacity(0.3),
//                                   blurRadius: 30,
//                                   spreadRadius: 5,
//                                   offset: const Offset(0, 0),
//                                 ),
//                               ],
//                               border: Border.all(
//                                 color: Colors.white.withOpacity(0.3),
//                                 width: 2,
//                               ),
//                             ),
//                             child: Stack(
//                               alignment: Alignment.center,
//                               children: [
//                                 // Circular nature pattern
//                                 Container(
//                                   width: 90,
//                                   height: 90,
//                                   decoration: BoxDecoration(
//                                     shape: BoxShape.circle,
//                                     gradient: RadialGradient(
//                                       colors: [
//                                         Colors.green.withOpacity(0.3),
//                                         Colors.blue.withOpacity(0.2),
//                                         Colors.transparent,
//                                       ],
//                                     ),
//                                   ),
//                                 ),
//                                 const Icon(
//                                   Icons.travel_explore,
//                                   size: 50,
//                                   color: Colors.white,
//                                   shadows: [
//                                     Shadow(
//                                       blurRadius: 10,
//                                       color: Colors.black,
//                                     ),
//                                   ],
//                                 ),
//                               ],
//                             ),
//                           ),
//                           const SizedBox(height: 25),
//                           const Text(
//                             'Final Destination',
//                             style: TextStyle(
//                               color: Colors.white,
//                               fontSize: 36,
//                               fontWeight: FontWeight.bold,
//                               letterSpacing: 1.5,
//                               shadows: [
//                                 Shadow(
//                                   blurRadius: 10,
//                                   color: Colors.black,
//                                   offset: Offset(2, 2),
//                                 ),
//                               ],
//                             ),
//                           ),
//                           const SizedBox(height: 8),
//                           const Text(
//                             'Where Nature Meets Adventure',
//                             style: TextStyle(
//                               color: Colors.white70,
//                               fontSize: 16,
//                               fontWeight: FontWeight.w400,
//                               letterSpacing: 1.2,
//                               shadows: [
//                                 Shadow(
//                                   blurRadius: 5,
//                                   color: Colors.black,
//                                 ),
//                               ],
//                             ),
//                           ),
//                         ],
//                       ),
//                     ),
//
//                     // Login Card with Glassmorphism Effect
//                     Container(
//                       width: double.infinity,
//                       constraints: const BoxConstraints(maxWidth: 450),
//                       decoration: BoxDecoration(
//                         color: Colors.white.withOpacity(0.15),
//                         borderRadius: BorderRadius.circular(24),
//                         boxShadow: [
//                           BoxShadow(
//                             color: Colors.black.withOpacity(0.3),
//                             blurRadius: 30,
//                             spreadRadius: 5,
//                             offset: const Offset(0, 10),
//                           ),
//                         ],
//                         border: Border.all(
//                           color: Colors.white.withOpacity(0.3),
//                           width: 1,
//                         ),
//                       ),
//                       padding: const EdgeInsets.all(40),
//                       child: Form(
//                         key: formkey,
//                         child: Column(
//                           children: [
//                             const Text(
//                               'Welcome Back',
//                               style: TextStyle(
//                                 fontSize: 28,
//                                 fontWeight: FontWeight.bold,
//                                 color: Colors.white,
//                                 shadows: [
//                                   Shadow(
//                                     blurRadius: 5,
//                                     color: Colors.black,
//                                   ),
//                                 ],
//                               ),
//                             ),
//                             const SizedBox(height: 10),
//                             const Text(
//                               'Sign in to continue your journey',
//                               style: TextStyle(
//                                 fontSize: 16,
//                                 color: Colors.white70,
//                               ),
//                             ),
//                             const SizedBox(height: 30),
//
//                             // Username Field
//                             Container(
//                               decoration: BoxDecoration(
//                                 borderRadius: BorderRadius.circular(12),
//                                 boxShadow: [
//                                   BoxShadow(
//                                     color: Colors.black.withOpacity(0.2),
//                                     blurRadius: 10,
//                                     offset: const Offset(0, 5),
//                                   ),
//                                 ],
//                               ),
//                               child: TextFormField(
//                                 validator: (value) {
//                                   if (value == null || value.isEmpty) {
//                                     return 'Please enter your email';
//                                   }
//                                   if (!RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$')
//                                       .hasMatch(value)) {
//                                     return 'Please enter a valid email';
//                                   }
//                                   return null;
//                                 },
//                                 controller: username,
//                                 style: const TextStyle(
//                                   fontSize: 16,
//                                   color: Colors.white,
//                                 ),
//                                 decoration: InputDecoration(
//                                   filled: true,
//                                   fillColor: Colors.black.withOpacity(0.4),
//                                   hintText: 'Enter your email',
//                                   hintStyle: TextStyle(
//                                     color: Colors.white.withOpacity(0.7),
//                                   ),
//                                   labelText: 'EMAIL',
//                                   labelStyle: const TextStyle(
//                                     color: Colors.white,
//                                     fontWeight: FontWeight.bold,
//                                     fontSize: 12,
//                                     letterSpacing: 1,
//                                   ),
//                                   prefixIcon: Container(
//                                     margin: const EdgeInsets.only(right: 15),
//                                     width: 60,
//                                     child: const Icon(
//                                       Icons.email_outlined,
//                                       color: Colors.white,
//                                       size: 22,
//                                     ),
//                                   ),
//                                   border: OutlineInputBorder(
//                                     borderRadius: BorderRadius.circular(12),
//                                     borderSide: BorderSide.none,
//                                   ),
//                                   focusedBorder: OutlineInputBorder(
//                                     borderRadius: BorderRadius.circular(12),
//                                     borderSide: const BorderSide(
//                                       color: Colors.white,
//                                       width: 2,
//                                     ),
//                                   ),
//                                   contentPadding: const EdgeInsets.symmetric(
//                                     horizontal: 20,
//                                     vertical: 18,
//                                   ),
//                                 ),
//                               ),
//                             ),
//                             const SizedBox(height: 25),
//
//                             // Password Field
//                             Container(
//                               decoration: BoxDecoration(
//                                 borderRadius: BorderRadius.circular(12),
//                                 boxShadow: [
//                                   BoxShadow(
//                                     color: Colors.black.withOpacity(0.2),
//                                     blurRadius: 10,
//                                     offset: const Offset(0, 5),
//                                   ),
//                                 ],
//                               ),
//                               child: TextFormField(
//                                 validator: (value) {
//                                   if (value == null || value.isEmpty) {
//                                     return 'Please enter your password';
//                                   }
//                                   if (value.length < 6) {
//                                     return 'Password must be at least 6 characters';
//                                   }
//                                   return null;
//                                 },
//                                 controller: password,
//                                 obscureText: _obscurePassword,
//                                 style: const TextStyle(
//                                   fontSize: 16,
//                                   color: Colors.white,
//                                 ),
//                                 decoration: InputDecoration(
//                                   filled: true,
//                                   fillColor: Colors.black.withOpacity(0.4),
//                                   hintText: 'Enter your password',
//                                   hintStyle: TextStyle(
//                                     color: Colors.white.withOpacity(0.7),
//                                   ),
//                                   labelText: 'PASSWORD',
//                                   labelStyle: const TextStyle(
//                                     color: Colors.white,
//                                     fontWeight: FontWeight.bold,
//                                     fontSize: 12,
//                                     letterSpacing: 1,
//                                   ),
//                                   prefixIcon: Container(
//                                     margin: const EdgeInsets.only(right: 15),
//                                     width: 60,
//                                     child: const Icon(
//                                       Icons.lock_outline,
//                                       color: Colors.white,
//                                       size: 22,
//                                     ),
//                                   ),
//                                   suffixIcon: IconButton(
//                                     icon: Icon(
//                                       _obscurePassword
//                                           ? Icons.visibility_off_outlined
//                                           : Icons.visibility_outlined,
//                                       color: Colors.white.withOpacity(0.7),
//                                     ),
//                                     onPressed: () {
//                                       setState(() {
//                                         _obscurePassword = !_obscurePassword;
//                                       });
//                                     },
//                                   ),
//                                   border: OutlineInputBorder(
//                                     borderRadius: BorderRadius.circular(12),
//                                     borderSide: BorderSide.none,
//                                   ),
//                                   focusedBorder: OutlineInputBorder(
//                                     borderRadius: BorderRadius.circular(12),
//                                     borderSide: const BorderSide(
//                                       color: Colors.white,
//                                       width: 2,
//                                     ),
//                                   ),
//                                   contentPadding: const EdgeInsets.symmetric(
//                                     horizontal: 20,
//                                     vertical: 18,
//                                   ),
//                                 ),
//                               ),
//                             ),
//                             const SizedBox(height: 15),
//
//                             // Forgot Password
//                             Align(
//                               alignment: Alignment.centerRight,
//                               child: TextButton(
//                                 onPressed: () {
//                                   // Add forgot password functionality here
//                                 },
//                                 style: TextButton.styleFrom(
//                                   foregroundColor: Colors.white,
//                                 ),
//                                 child: const Text(
//                                   'Forgot Password?',
//                                   style: TextStyle(
//                                     fontWeight: FontWeight.w500,
//                                     shadows: [
//                                       Shadow(
//                                         blurRadius: 3,
//                                         color: Colors.black,
//                                       ),
//                                     ],
//                                   ),
//                                 ),
//                               ),
//                             ),
//                             const SizedBox(height: 30),
//
//                             // Login Button with Nature Theme
//                             Container(
//                               decoration: BoxDecoration(
//                                 borderRadius: BorderRadius.circular(12),
//                                 boxShadow: [
//                                   BoxShadow(
//                                     color: Colors.green.withOpacity(0.5),
//                                     blurRadius: 15,
//                                     spreadRadius: 2,
//                                     offset: const Offset(0, 5),
//                                   ),
//                                   BoxShadow(
//                                     color: Colors.blue.withOpacity(0.3),
//                                     blurRadius: 20,
//                                     spreadRadius: 3,
//                                     offset: const Offset(0, 0),
//                                   ),
//                                 ],
//                               ),
//                               child: SizedBox(
//                                 width: double.infinity,
//                                 height: 56,
//                                 child: ElevatedButton(
//                                   onPressed: _isLoading
//                                       ? null
//                                       : () async {
//                                     if (!formkey.currentState!.validate()) {
//                                       return;
//                                     }
//                                     setState(() {
//                                       _isLoading = true;
//                                     });
//                                     try {
//                                       SharedPreferences sh =
//                                       await SharedPreferences
//                                           .getInstance();
//                                       var data = await http.post(
//                                         Uri.parse(
//                                             '${sh.getString('ip')}/login2'),
//                                         body: {
//                                           'username': username.text,
//                                           'password': password.text,
//                                         },
//                                       );
//                                       var d = json.decode(data.body);
//                                       if (d['status'] == 'ok') {
//                                         sh.setString(
//                                             'uid', d['uid'].toString());
//                                         sh.setString('password', password.text);
//                                         // ignore: use_build_context_synchronously
//                                         final notificationService = getNotificationService();
//                                         await notificationService.init();
//
//                                         final locationService = getLocationService(userId: "uid");
//
//                                         locationService.start((lat, lng) {
//                                           notificationService.show("📍 Location Update", "$lat, $lng");
//                                         });
//
//                                         Navigator.push(
//                                           context,
//                                           MaterialPageRoute(
//                                             builder: (context) => const UserHomeApp(),
//                                           ),
//                                         );
//                                       } else {
//                                         ScaffoldMessenger.of(context)
//                                             .showSnackBar(
//                                           SnackBar(
//                                             content: Text(
//                                               d['message'] ??
//                                                   'Login failed. Please check your credentials.',
//                                             ),
//                                             backgroundColor: Colors.red,
//                                           ),
//                                         );
//                                       }
//                                     } catch (e) {
//                                       ScaffoldMessenger.of(context)
//                                           .showSnackBar(
//                                         const SnackBar(
//                                           content: Text(
//                                               'Network error. Please try again.'),
//                                           backgroundColor: Colors.red,
//                                         ),
//                                       );
//                                     } finally {
//                                       setState(() {
//                                         _isLoading = false;
//                                       });
//                                     }
//                                   },
//                                   style: ElevatedButton.styleFrom(
//                                     backgroundColor: const Color(0xFF4CAF50),
//                                     foregroundColor: Colors.white,
//                                     elevation: 0,
//                                     shape: RoundedRectangleBorder(
//                                       borderRadius: BorderRadius.circular(12),
//                                     ),
//                                     padding: EdgeInsets.zero,
//                                   ),
//                                   child: _isLoading
//                                       ? const SizedBox(
//                                     width: 24,
//                                     height: 24,
//                                     child: CircularProgressIndicator(
//                                       strokeWidth: 2,
//                                       color: Colors.white,
//                                     ),
//                                   )
//                                       : Row(
//                                     mainAxisAlignment:
//                                     MainAxisAlignment.center,
//                                     children: [
//                                       const Icon(
//                                         Icons.login,
//                                         size: 20,
//                                       ),
//                                       const SizedBox(width: 10),
//                                       const Text(
//                                         'LOGIN',
//                                         style: TextStyle(
//                                           fontSize: 16,
//                                           fontWeight: FontWeight.bold,
//                                           letterSpacing: 1,
//                                         ),
//                                       ),
//                                       const SizedBox(width: 10),
//                                       Container(
//                                         padding: const EdgeInsets.all(4),
//                                         decoration: BoxDecoration(
//                                           color: Colors.white.withOpacity(0.2),
//                                           borderRadius:
//                                           BorderRadius.circular(20),
//                                         ),
//                                         child: const Icon(
//                                           Icons.arrow_forward,
//                                           size: 18,
//                                           color: Colors.white,
//                                         ),
//                                       ),
//                                     ],
//                                   ),
//                                 ),
//                               ),
//                             ),
//                             const SizedBox(height: 25),
//
//                             // Divider
//                             Row(
//                               children: [
//                                 Expanded(
//                                   child: Divider(
//                                     color: Colors.white.withOpacity(0.5),
//                                     thickness: 1,
//                                   ),
//                                 ),
//                                 Padding(
//                                   padding:
//                                   const EdgeInsets.symmetric(horizontal: 15),
//                                   child: Text(
//                                     'New to Final Destination?',
//                                     style: TextStyle(
//                                       color: Colors.white,
//                                       fontSize: 14,
//                                       shadows: [
//                                         Shadow(
//                                           blurRadius: 3,
//                                           color: Colors.black,
//                                         ),
//                                       ],
//                                     ),
//                                   ),
//                                 ),
//                                 Expanded(
//                                   child: Divider(
//                                     color: Colors.white.withOpacity(0.5),
//                                     thickness: 1,
//                                   ),
//                                 ),
//                               ],
//                             ),
//                             const SizedBox(height: 25),
//
//                             // Register Button
//                             Container(
//                               decoration: BoxDecoration(
//                                 borderRadius: BorderRadius.circular(12),
//                                 border: Border.all(
//                                   color: Colors.white.withOpacity(0.5),
//                                   width: 1,
//                                 ),
//                                 boxShadow: [
//                                   BoxShadow(
//                                     color: Colors.black.withOpacity(0.2),
//                                     blurRadius: 10,
//                                     offset: const Offset(0, 5),
//                                   ),
//                                 ],
//                               ),
//                               child: SizedBox(
//                                 width: double.infinity,
//                                 height: 56,
//                                 child: OutlinedButton(
//                                   onPressed: () async {
//                                     final notificationService = getNotificationService();
//                                     await notificationService.init();
//
//                                     final locationService = getLocationService(userId: "uid");
//
//                                     locationService.start((lat, lng) {
//                                       notificationService.show("📍 Location Update", "$lat, $lng");
//                                     });
//                                     Navigator.push(
//                                       context,
//                                       MaterialPageRoute(
//                                         builder: (context) => const register(),
//                                       ),
//                                     );
//                                   },
//                                   style: OutlinedButton.styleFrom(
//                                     foregroundColor: Colors.white,
//                                     side: BorderSide(
//                                       color: Colors.white.withOpacity(0.5),
//                                       width: 1,
//                                     ),
//                                     shape: RoundedRectangleBorder(
//                                       borderRadius: BorderRadius.circular(12),
//                                     ),
//                                     backgroundColor: Colors.transparent,
//                                   ),
//                                   child: const Row(
//                                     mainAxisAlignment: MainAxisAlignment.center,
//                                     children: [
//                                       Icon(
//                                         Icons.person_add_outlined,
//                                         size: 20,
//                                       ),
//                                       SizedBox(width: 10),
//                                       Text(
//                                         'CREATE NEW ACCOUNT',
//                                         style: TextStyle(
//                                           fontSize: 15,
//                                           fontWeight: FontWeight.bold,
//                                           letterSpacing: 0.5,
//                                         ),
//                                       ),
//                                     ],
//                                   ),
//                                 ),
//                               ),
//                             ),
//
//                             const SizedBox(height: 20),
//
//                             // Terms and Privacy
//                             Text(
//                               'By continuing, you agree to our Terms of Service and Privacy Policy',
//                               textAlign: TextAlign.center,
//                               style: TextStyle(
//                                 color: Colors.white.withOpacity(0.8),
//                                 fontSize: 12,
//                               ),
//                             ),
//                           ],
//                         ),
//                       ),
//                     ),
//
//                     // Footer with Nature Theme
//                     const SizedBox(height: 40),
//                     Row(
//                       mainAxisAlignment: MainAxisAlignment.center,
//                       children: [
//                         Icon(
//                           Icons.eco,
//                           color: Colors.green.withOpacity(0.7),
//                           size: 16,
//                         ),
//                         const SizedBox(width: 8),
//                         Text(
//                           '© 2024 Final Destination. All rights reserved.',
//                           style: TextStyle(
//                             color: Colors.white.withOpacity(0.7),
//                             fontSize: 12,
//                             shadows: [
//                               Shadow(
//                                 blurRadius: 3,
//                                 color: Colors.black,
//                               ),
//                             ],
//                           ),
//                         ),
//                         const SizedBox(width: 8),
//                         Icon(
//                           Icons.forest,
//                           color: Colors.green.withOpacity(0.7),
//                           size: 16,
//                         ),
//                       ],
//                     ),
//                   ],
//                 ),
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }

//
//
// import 'dart:convert';
// import 'package:final_destination/home.dart';
// import 'package:final_destination/register.dart';
// import 'package:final_destination/services/location/location_provider.dart';
// import 'package:final_destination/services/notification/notification_provider.dart';
// import 'package:flutter/material.dart';
// import 'package:http/http.dart' as http;
// import 'package:shared_preferences/shared_preferences.dart';
//
// void main() {
//   runApp(const login());
// }
//
// class login extends StatelessWidget {
//   const login({Key? key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       theme: ThemeData(
//         primaryColor: const Color(0xFF1A237E),
//         fontFamily: 'Poppins',
//         inputDecorationTheme: InputDecorationTheme(
//           border: OutlineInputBorder(
//             borderRadius: BorderRadius.circular(12),
//             borderSide: const BorderSide(color: Colors.grey),
//           ),
//           focusedBorder: OutlineInputBorder(
//             borderRadius: BorderRadius.circular(12),
//             borderSide: const BorderSide(color: Color(0xFF1A237E), width: 2),
//           ),
//           contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 18),
//         ),
//       ),
//       home: const loginsub(),
//     );
//   }
// }
//
// class loginsub extends StatefulWidget {
//   const loginsub({Key? key}) : super(key: key);
//
//   @override
//   State<loginsub> createState() => _loginsubState();
// }
//
// class _loginsubState extends State<loginsub> {
//   final username = TextEditingController(text: 'vishnudevpk895@gmail.com');
//   final password = TextEditingController(text: 'Vdpk@1234');
//   final formkey = GlobalKey<FormState>();
//   bool _isLoading = false;
//   bool _obscurePassword = true;
//
//   // Nature background image URL - Replace with your own image
//   final String backgroundImageUrl = 'https://images.unsplash.com/photo-1507525428034-b723cf961d3e?ixlib=rb-1.2.1&auto=format&fit=crop&w=1920&q=80';
//
//   // Method to show forgot password dialog
//   void _showForgotPasswordDialog() {
//     final emailController = TextEditingController();
//     final _formKey = GlobalKey<FormState>();
//     bool _isLoading = false;
//
//     showDialog(
//       context: context,
//       barrierDismissible: false,
//       builder: (BuildContext context) {
//         return StatefulBuilder(
//           builder: (context, setState) {
//             return Dialog(
//               shape: RoundedRectangleBorder(
//                 borderRadius: BorderRadius.circular(20),
//               ),
//               backgroundColor: Colors.transparent,
//               child: Container(
//                 decoration: BoxDecoration(
//                   color: Colors.white.withOpacity(0.95),
//                   borderRadius: BorderRadius.circular(20),
//                   boxShadow: [
//                     BoxShadow(
//                       color: Colors.black.withOpacity(0.3),
//                       blurRadius: 20,
//                       spreadRadius: 5,
//                     ),
//                   ],
//                 ),
//                 padding: const EdgeInsets.all(24),
//                 child: Form(
//                   key: _formKey,
//                   child: Column(
//                     mainAxisSize: MainAxisSize.min,
//                     children: [
//                       // Header with nature theme
//                       Container(
//                         width: 70,
//                         height: 70,
//                         decoration: BoxDecoration(
//                           color: const Color(0xFF4CAF50).withOpacity(0.1),
//                           shape: BoxShape.circle,
//                         ),
//                         child: const Icon(
//                           Icons.lock_reset,
//                           size: 35,
//                           color: Color(0xFF4CAF50),
//                         ),
//                       ),
//                       const SizedBox(height: 16),
//                       const Text(
//                         'Forgot Password?',
//                         style: TextStyle(
//                           fontSize: 24,
//                           fontWeight: FontWeight.bold,
//                           color: Color(0xFF1A237E),
//                         ),
//                       ),
//                       const SizedBox(height: 8),
//                       const Text(
//                         'Enter your email address to reset your password',
//                         textAlign: TextAlign.center,
//                         style: TextStyle(
//                           fontSize: 14,
//                           color: Colors.grey,
//                         ),
//                       ),
//                       const SizedBox(height: 24),
//
//                       // Email Field
//                       TextFormField(
//                         controller: emailController,
//                         validator: (value) {
//                           if (value == null || value.isEmpty) {
//                             return 'Please enter your email';
//                           }
//                           if (!RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$')
//                               .hasMatch(value)) {
//                             return 'Please enter a valid email';
//                           }
//                           return null;
//                         },
//                         decoration: InputDecoration(
//                           hintText: 'Enter your email',
//                           prefixIcon: const Icon(
//                             Icons.email_outlined,
//                             color: Color(0xFF4CAF50),
//                           ),
//                           border: OutlineInputBorder(
//                             borderRadius: BorderRadius.circular(12),
//                           ),
//                           focusedBorder: OutlineInputBorder(
//                             borderRadius: BorderRadius.circular(12),
//                             borderSide: const BorderSide(
//                               color: Color(0xFF4CAF50),
//                               width: 2,
//                             ),
//                           ),
//                         ),
//                       ),
//                       const SizedBox(height: 24),
//
//                       // Buttons
//                       Row(
//                         children: [
//                           Expanded(
//                             child: OutlinedButton(
//                               onPressed: _isLoading ? null : () {
//                                 Navigator.pop(context);
//                               },
//                               style: OutlinedButton.styleFrom(
//                                 side: const BorderSide(color: Colors.grey),
//                                 shape: RoundedRectangleBorder(
//                                   borderRadius: BorderRadius.circular(12),
//                                 ),
//                                 padding: const EdgeInsets.symmetric(vertical: 14),
//                               ),
//                               child: const Text('Cancel'),
//                             ),
//                           ),
//                           const SizedBox(width: 12),
//                           Expanded(
//                             child: ElevatedButton(
//                               onPressed: _isLoading ? null : () async {
//                                 if (_formKey.currentState!.validate()) {
//                                   setState(() {
//                                     _isLoading = true;
//                                   });
//                                   await _resetPassword(emailController.text, context);
//                                   setState(() {
//                                     _isLoading = false;
//                                   });
//                                 }
//                               },
//                               style: ElevatedButton.styleFrom(
//                                 backgroundColor: const Color(0xFF4CAF50),
//                                 foregroundColor: Co12lors.white,
//                                 shape: RoundedRectangleBorder(
//                                   borderRadius: BorderRadius.circular(12),
//                                 ),
//                                 padding: const EdgeInsets.symmetric(vertical: 14),
//                               ),
//                               child: _isLoading
//                                   ? const SizedBox(
//                                 width: 20,
//                                 height: 20,
//                                 child: CircularProgressIndicator(
//                                   strokeWidth: 2,
//                                   color: Colors.white,
//                                 ),
//                               )
//                                   : const Text('Reset Password'),
//                             ),
//                           ),
//                         ],
//                       ),
//                     ],
//                   ),
//                 ),
//               ),
//             );
//           },
//         );
//       },
//     );
//   }
//
//   // Method to handle password reset API call
//   Future<void> _resetPassword(String email, BuildContext context) async {
//     try {
//       SharedPreferences sh = await SharedPreferences.getInstance();
//       var response = await http.post(
//         Uri.parse('${sh.getString('ip')}/forgotemail'),
//         body: {
//           'email': email,
//         },
//       );
//
//       var data = json.decode(response.body);
//
//       if (data['status'] == 'ok') {
//         // Show success message
//         ScaffoldMessenger.of(context).showSnackBar(
//           SnackBar(
//             content: Text(data['message'] ?? 'Password reset link sent to your email'),
//             backgroundColor: Colors.green,
//             duration: const Duration(seconds: 4),
//           ),
//         );
//         Navigator.pop(context); // Close the dialog
//       } else {
//         // Show error message
//         ScaffoldMessenger.of(context).showSnackBar(
//           SnackBar(
//             content: Text(data['message'] ?? 'Email not found'),
//             backgroundColor: Colors.red,
//           ),
//         );
//       }
//     } catch (e) {
//       ScaffoldMessenger.of(context).showSnackBar(
//         const SnackBar(
//           content: Text('Network error. Please try again.'),
//           backgroundColor: Colors.red,
//         ),
//       );
//     }
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Stack(
//         children: [
//           // Background Image with overlay
//           Container(
//             width: double.infinity,
//             height: double.infinity,
//             decoration: BoxDecoration(
//               image: DecorationImage(
//                 image: NetworkImage(backgroundImageUrl),
//                 fit: BoxFit.cover,
//                 colorFilter: ColorFilter.mode(
//                   Colors.black.withOpacity(0.4),
//                   BlendMode.darken,
//                 ),
//               ),
//             ),
//           ),
//
//           // Gradient Overlay for better text readability
//           Container(
//             width: double.infinity,
//             height: double.infinity,
//             decoration: BoxDecoration(
//               gradient: LinearGradient(
//                 begin: Alignment.topCenter,
//                 end: Alignment.bottomCenter,
//                 colors: [
//                   Colors.black.withOpacity(0.5),
//                   Colors.black.withOpacity(0.3),
//                   Colors.transparent,
//                   Colors.black.withOpacity(0.3),
//                   Colors.black.withOpacity(0.5),
//                 ],
//                 stops: const [0.0, 0.3, 0.5, 0.7, 1.0],
//               ),
//             ),
//           ),
//
//           // Nature Pattern Overlay (Optional)
//           Container(
//             width: double.infinity,
//             height: double.infinity,
//             decoration: BoxDecoration(
//               image: DecorationImage(
//                 image: const AssetImage('assets/nature_pattern.png'),
//                 fit: BoxFit.cover,
//                 opacity: 0.1,
//                 colorFilter: ColorFilter.mode(
//                   Colors.white.withOpacity(0.1),
//                   BlendMode.overlay,
//                 ),
//               ),
//             ),
//           ),
//
//           Center(
//             child: SingleChildScrollView(
//               child: Padding(
//                 padding: const EdgeInsets.all(20.0),
//                 child: Column(
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   crossAxisAlignment: CrossAxisAlignment.center,
//                   children: [
//                     // Logo/Header Section with Nature Theme
//                     Container(
//                       margin: const EdgeInsets.only(bottom: 40),
//                       child: Column(
//                         children: [
//                           // Nature-themed logo container
//                           Container(
//                             width: 100,
//                             height: 100,
//                             decoration: BoxDecoration(
//                               color: Colors.white.withOpacity(0.2),
//                               borderRadius: BorderRadius.circular(25),
//                               boxShadow: [
//                                 BoxShadow(
//                                   color: Colors.black.withOpacity(0.3),
//                                   blurRadius: 20,
//                                   spreadRadius: 2,
//                                   offset: const Offset(0, 5),
//                                 ),
//                                 BoxShadow(
//                                   color: Colors.green.withOpacity(0.3),
//                                   blurRadius: 30,
//                                   spreadRadius: 5,
//                                   offset: const Offset(0, 0),
//                                 ),
//                               ],
//                               border: Border.all(
//                                 color: Colors.white.withOpacity(0.3),
//                                 width: 2,
//                               ),
//                             ),
//                             child: Stack(
//                               alignment: Alignment.center,
//                               children: [
//                                 // Circular nature pattern
//                                 Container(
//                                   width: 90,
//                                   height: 90,
//                                   decoration: BoxDecoration(
//                                     shape: BoxShape.circle,
//                                     gradient: RadialGradient(
//                                       colors: [
//                                         Colors.green.withOpacity(0.3),
//                                         Colors.blue.withOpacity(0.2),
//                                         Colors.transparent,
//                                       ],
//                                     ),
//                                   ),
//                                 ),
//                                 const Icon(
//                                   Icons.travel_explore,
//                                   size: 50,
//                                   color: Colors.white,
//                                   shadows: [
//                                     Shadow(
//                                       blurRadius: 10,
//                                       color: Colors.black,
//                                     ),
//                                   ],
//                                 ),
//                               ],
//                             ),
//                           ),
//                           const SizedBox(height: 25),
//                           const Text(
//                             'Final Destination',
//                             style: TextStyle(
//                               color: Colors.white,
//                               fontSize: 36,
//                               fontWeight: FontWeight.bold,
//                               letterSpacing: 1.5,
//                               shadows: [
//                                 Shadow(
//                                   blurRadius: 10,
//                                   color: Colors.black,
//                                   offset: Offset(2, 2),
//                                 ),
//                               ],
//                             ),
//                           ),
//                           const SizedBox(height: 8),
//                           const Text(
//                             'Where Nature Meets Adventure',
//                             style: TextStyle(
//                               color: Colors.white70,
//                               fontSize: 16,
//                               fontWeight: FontWeight.w400,
//                               letterSpacing: 1.2,
//                               shadows: [
//                                 Shadow(
//                                   blurRadius: 5,
//                                   color: Colors.black,
//                                 ),
//                               ],
//                             ),
//                           ),
//                         ],
//                       ),
//                     ),
//
//                     // Login Card with Glassmorphism Effect
//                     Container(
//                       width: double.infinity,
//                       constraints: const BoxConstraints(maxWidth: 450),
//                       decoration: BoxDecoration(
//                         color: Colors.white.withOpacity(0.15),
//                         borderRadius: BorderRadius.circular(24),
//                         boxShadow: [
//                           BoxShadow(
//                             color: Colors.black.withOpacity(0.3),
//                             blurRadius: 30,
//                             spreadRadius: 5,
//                             offset: const Offset(0, 10),
//                           ),
//                         ],
//                         border: Border.all(
//                           color: Colors.white.withOpacity(0.3),
//                           width: 1,
//                         ),
//                       ),
//                       padding: const EdgeInsets.all(40),
//                       child: Form(
//                         key: formkey,
//                         child: Column(
//                           children: [
//                             const Text(
//                               'Welcome Back',
//                               style: TextStyle(
//                                 fontSize: 28,
//                                 fontWeight: FontWeight.bold,
//                                 color: Colors.white,
//                                 shadows: [
//                                   Shadow(
//                                     blurRadius: 5,
//                                     color: Colors.black,
//                                   ),
//                                 ],
//                               ),
//                             ),
//                             const SizedBox(height: 10),
//                             const Text(
//                               'Sign in to continue your journey',
//                               style: TextStyle(
//                                 fontSize: 16,
//                                 color: Colors.white70,
//                               ),
//                             ),
//                             const SizedBox(height: 30),
//
//                             // Username Field
//                             Container(
//                               decoration: BoxDecoration(
//                                 borderRadius: BorderRadius.circular(12),
//                                 boxShadow: [
//                                   BoxShadow(
//                                     color: Colors.black.withOpacity(0.2),
//                                     blurRadius: 10,
//                                     offset: const Offset(0, 5),
//                                   ),
//                                 ],
//                               ),
//                               child: TextFormField(
//                                 validator: (value) {
//                                   if (value == null || value.isEmpty) {
//                                     return 'Please enter your email';
//                                   }
//                                   if (!RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$')
//                                       .hasMatch(value)) {
//                                     return 'Please enter a valid email';
//                                   }
//                                   return null;
//                                 },
//                                 controller: username,
//                                 style: const TextStyle(
//                                   fontSize: 16,
//                                   color: Colors.white,
//                                 ),
//                                 decoration: InputDecoration(
//                                   filled: true,
//                                   fillColor: Colors.black.withOpacity(0.4),
//                                   hintText: 'Enter your email',
//                                   hintStyle: TextStyle(
//                                     color: Colors.white.withOpacity(0.7),
//                                   ),
//                                   labelText: 'EMAIL',
//                                   labelStyle: const TextStyle(
//                                     color: Colors.white,
//                                     fontWeight: FontWeight.bold,
//                                     fontSize: 12,
//                                     letterSpacing: 1,
//                                   ),
//                                   prefixIcon: Container(
//                                     margin: const EdgeInsets.only(right: 15),
//                                     width: 60,
//                                     child: const Icon(
//                                       Icons.email_outlined,
//                                       color: Colors.white,
//                                       size: 22,
//                                     ),
//                                   ),
//                                   border: OutlineInputBorder(
//                                     borderRadius: BorderRadius.circular(12),
//                                     borderSide: BorderSide.none,
//                                   ),
//                                   focusedBorder: OutlineInputBorder(
//                                     borderRadius: BorderRadius.circular(12),
//                                     borderSide: const BorderSide(
//                                       color: Colors.white,
//                                       width: 2,
//                                     ),
//                                   ),
//                                   contentPadding: const EdgeInsets.symmetric(
//                                     horizontal: 20,
//                                     vertical: 18,
//                                   ),
//                                 ),
//                               ),
//                             ),
//                             const SizedBox(height: 25),
//
//                             // Password Field
//                             Container(
//                               decoration: BoxDecoration(
//                                 borderRadius: BorderRadius.circular(12),
//                                 boxShadow: [
//                                   BoxShadow(
//                                     color: Colors.black.withOpacity(0.2),
//                                     blurRadius: 10,
//                                     offset: const Offset(0, 5),
//                                   ),
//                                 ],
//                               ),
//                               child: TextFormField(
//                                 validator: (value) {
//                                   if (value == null || value.isEmpty) {
//                                     return 'Please enter your password';
//                                   }
//                                   if (value.length < 6) {
//                                     return 'Password must be at least 6 characters';
//                                   }
//                                   return null;
//                                 },
//                                 controller: password,
//                                 obscureText: _obscurePassword,
//                                 style: const TextStyle(
//                                   fontSize: 16,
//                                   color: Colors.white,
//                                 ),
//                                 decoration: InputDecoration(
//                                   filled: true,
//                                   fillColor: Colors.black.withOpacity(0.4),
//                                   hintText: 'Enter your password',
//                                   hintStyle: TextStyle(
//                                     color: Colors.white.withOpacity(0.7),
//                                   ),
//                                   labelText: 'PASSWORD',
//                                   labelStyle: const TextStyle(
//                                     color: Colors.white,
//                                     fontWeight: FontWeight.bold,
//                                     fontSize: 12,
//                                     letterSpacing: 1,
//                                   ),
//                                   prefixIcon: Container(
//                                     margin: const EdgeInsets.only(right: 15),
//                                     width: 60,
//                                     child: const Icon(
//                                       Icons.lock_outline,
//                                       color: Colors.white,
//                                       size: 22,
//                                     ),
//                                   ),
//                                   suffixIcon: IconButton(
//                                     icon: Icon(
//                                       _obscurePassword
//                                           ? Icons.visibility_off_outlined
//                                           : Icons.visibility_outlined,
//                                       color: Colors.white.withOpacity(0.7),
//                                     ),
//                                     onPressed: () {
//                                       setState(() {
//                                         _obscurePassword = !_obscurePassword;
//                                       });
//                                     },
//                                   ),
//                                   border: OutlineInputBorder(
//                                     borderRadius: BorderRadius.circular(12),
//                                     borderSide: BorderSide.none,
//                                   ),
//                                   focusedBorder: OutlineInputBorder(
//                                     borderRadius: BorderRadius.circular(12),
//                                     borderSide: const BorderSide(
//                                       color: Colors.white,
//                                       width: 2,
//                                     ),
//                                   ),
//                                   contentPadding: const EdgeInsets.symmetric(
//                                     horizontal: 20,
//                                     vertical: 18,
//                                   ),
//                                 ),
//                               ),
//                             ),
//                             const SizedBox(height: 15),
//
//                             // Forgot Password - NOW WORKING
//                             Align(
//                               alignment: Alignment.centerRight,
//                               child: TextButton(
//                                 onPressed: _showForgotPasswordDialog, // This is now implemented
//                                 style: TextButton.styleFrom(
//                                   foregroundColor: Colors.white,
//                                 ),
//                                 child: const Text(
//                                   'Forgot Password?',
//                                   style: TextStyle(
//                                     fontWeight: FontWeight.w500,
//                                     shadows: [
//                                       Shadow(
//                                         blurRadius: 3,
//                                         color: Colors.black,
//                                       ),
//                                     ],
//                                   ),
//                                 ),
//                               ),
//                             ),
//                             const SizedBox(height: 30),
//
//                             // Login Button with Nature Theme
//                             Container(
//                               decoration: BoxDecoration(
//                                 borderRadius: BorderRadius.circular(12),
//                                 boxShadow: [
//                                   BoxShadow(
//                                     color: Colors.green.withOpacity(0.5),
//                                     blurRadius: 15,
//                                     spreadRadius: 2,
//                                     offset: const Offset(0, 5),
//                                   ),
//                                   BoxShadow(
//                                     color: Colors.blue.withOpacity(0.3),
//                                     blurRadius: 20,
//                                     spreadRadius: 3,
//                                     offset: const Offset(0, 0),
//                                   ),
//                                 ],
//                               ),
//                               child: SizedBox(
//                                 width: double.infinity,
//                                 height: 56,
//                                 child: ElevatedButton(
//                                   onPressed: _isLoading
//                                       ? null
//                                       : () async {
//                                     if (!formkey.currentState!.validate()) {
//                                       return;
//                                     }
//                                     setState(() {
//                                       _isLoading = true;
//                                     });
//                                     try {
//                                       SharedPreferences sh =
//                                       await SharedPreferences
//                                           .getInstance();
//                                       var data = await http.post(
//                                         Uri.parse(
//                                             '${sh.getString('ip')}/login2'),
//                                         body: {
//                                           'username': username.text,
//                                           'password': password.text,
//                                         },
//                                       );
//                                       var d = json.decode(data.body);
//                                       if (d['status'] == 'ok') {
//                                         sh.setString(
//                                             'uid', d['uid'].toString());
//                                         sh.setString('password', password.text);
//                                         // ignore: use_build_context_synchronously
//                                         final notificationService = getNotificationService();
//                                         await notificationService.init();
//
//                                         final locationService = getLocationService(userId: "uid");
//
//                                         locationService.start((lat, lng) {
//                                           notificationService.show("📍 Location Update", "$lat, $lng");
//                                         });
//
//                                         Navigator.push(
//                                           context,
//                                           MaterialPageRoute(
//                                             builder: (context) => const UserHomeApp(),
//                                           ),
//                                         );
//                                       } else {
//                                         ScaffoldMessenger.of(context)
//                                             .showSnackBar(
//                                           SnackBar(
//                                             content: Text(
//                                               d['message'] ??
//                                                   'Login failed. Please check your credentials.',
//                                             ),
//                                             backgroundColor: Colors.red,
//                                           ),
//                                         );
//                                       }
//                                     } catch (e) {
//                                       ScaffoldMessenger.of(context)
//                                           .showSnackBar(
//                                         const SnackBar(
//                                           content: Text(
//                                               'Network error. Please try again.'),
//                                           backgroundColor: Colors.red,
//                                         ),
//                                       );
//                                     } finally {
//                                       setState(() {
//                                         _isLoading = false;
//                                       });
//                                     }
//                                   },
//                                   style: ElevatedButton.styleFrom(
//                                     backgroundColor: const Color(0xFF4CAF50),
//                                     foregroundColor: Colors.white,
//                                     elevation: 0,
//                                     shape: RoundedRectangleBorder(
//                                       borderRadius: BorderRadius.circular(12),
//                                     ),
//                                     padding: EdgeInsets.zero,
//                                   ),
//                                   child: _isLoading
//                                       ? const SizedBox(
//                                     width: 24,
//                                     height: 24,
//                                     child: CircularProgressIndicator(
//                                       strokeWidth: 2,
//                                       color: Colors.white,
//                                     ),
//                                   )
//                                       : Row(
//                                     mainAxisAlignment:
//                                     MainAxisAlignment.center,
//                                     children: [
//                                       const Icon(
//                                         Icons.login,
//                                         size: 20,
//                                       ),
//                                       const SizedBox(width: 10),
//                                       const Text(
//                                         'LOGIN',
//                                         style: TextStyle(
//                                           fontSize: 16,
//                                           fontWeight: FontWeight.bold,
//                                           letterSpacing: 1,
//                                         ),
//                                       ),
//                                       const SizedBox(width: 10),
//                                       Container(
//                                         padding: const EdgeInsets.all(4),
//                                         decoration: BoxDecoration(
//                                           color: Colors.white.withOpacity(0.2),
//                                           borderRadius:
//                                           BorderRadius.circular(20),
//                                         ),
//                                         child: const Icon(
//                                           Icons.arrow_forward,
//                                           size: 18,
//                                           color: Colors.white,
//                                         ),
//                                       ),
//                                     ],
//                                   ),
//                                 ),
//                               ),
//                             ),
//                             const SizedBox(height: 25),
//
//                             // Divider
//                             Row(
//                               children: [
//                                 Expanded(
//                                   child: Divider(
//                                     color: Colors.white.withOpacity(0.5),
//                                     thickness: 1,
//                                   ),
//                                 ),
//                                 Padding(
//                                   padding:
//                                   const EdgeInsets.symmetric(horizontal: 15),
//                                   child: Text(
//                                     'New to Final Destination?',
//                                     style: TextStyle(
//                                       color: Colors.white,
//                                       fontSize: 14,
//                                       shadows: [
//                                         Shadow(
//                                           blurRadius: 3,
//                                           color: Colors.black,
//                                         ),
//                                       ],
//                                     ),
//                                   ),
//                                 ),
//                                 Expanded(
//                                   child: Divider(
//                                     color: Colors.white.withOpacity(0.5),
//                                     thickness: 1,
//                                   ),
//                                 ),
//                               ],
//                             ),
//                             const SizedBox(height: 25),
//
//                             // Register Button
//                             Container(
//                               decoration: BoxDecoration(
//                                 borderRadius: BorderRadius.circular(12),
//                                 border: Border.all(
//                                   color: Colors.white.withOpacity(0.5),
//                                   width: 1,
//                                 ),
//                                 boxShadow: [
//                                   BoxShadow(
//                                     color: Colors.black.withOpacity(0.2),
//                                     blurRadius: 10,
//                                     offset: const Offset(0, 5),
//                                   ),
//                                 ],
//                               ),
//                               child: SizedBox(
//                                 width: double.infinity,
//                                 height: 56,
//                                 child: OutlinedButton(
//                                   onPressed: () async {
//                                     final notificationService = getNotificationService();
//                                     await notificationService.init();
//
//                                     final locationService = getLocationService(userId: "uid");
//
//                                     locationService.start((lat, lng) {
//                                       notificationService.show("📍 Location Update", "$lat, $lng");
//                                     });
//                                     Navigator.push(
//                                       context,
//                                       MaterialPageRoute(
//                                         builder: (context) => const register(),
//                                       ),
//                                     );
//                                   },
//                                   style: OutlinedButton.styleFrom(
//                                     foregroundColor: Colors.white,
//                                     side: BorderSide(
//                                       color: Colors.white.withOpacity(0.5),
//                                       width: 1,
//                                     ),
//                                     shape: RoundedRectangleBorder(
//                                       borderRadius: BorderRadius.circular(12),
//                                     ),
//                                     backgroundColor: Colors.transparent,
//                                   ),
//                                   child: const Row(
//                                     mainAxisAlignment: MainAxisAlignment.center,
//                                     children: [
//                                       Icon(
//                                         Icons.person_add_outlined,
//                                         size: 20,
//                                       ),
//                                       const SizedBox(width: 10),
//                                       Text(
//                                         'CREATE NEW ACCOUNT',
//                                         style: TextStyle(
//                                           fontSize: 15,
//                                           fontWeight: FontWeight.bold,
//                                           letterSpacing: 0.5,
//                                         ),
//                                       ),
//                                     ],
//                                   ),
//                                 ),
//                               ),
//                             ),
//
//                             const SizedBox(height: 20),
//
//                             // Terms and Privacy
//                             Text(
//                               'By continuing, you agree to our Terms of Service and Privacy Policy',
//                               textAlign: TextAlign.center,
//                               style: TextStyle(
//                                 color: Colors.white.withOpacity(0.8),
//                                 fontSize: 12,
//                               ),
//                             ),
//                           ],
//                         ),
//                       ),
//                     ),
//
//                     // Footer with Nature Theme
//                     const SizedBox(height: 40),
//                     Row(
//                       mainAxisAlignment: MainAxisAlignment.center,
//                       children: [
//                         Icon(
//                           Icons.eco,
//                           color: Colors.green.withOpacity(0.7),
//                           size: 16,
//                         ),
//                         const SizedBox(width: 8),
//                         Text(
//                           '© 2024 Final Destination. All rights reserved.',
//                           style: TextStyle(
//                             color: Colors.white.withOpacity(0.7),
//                             fontSize: 12,
//                             shadows: [
//                               Shadow(
//                                 blurRadius: 3,
//                                 color: Colors.black,
//                               ),
//                             ],
//                           ),
//                         ),
//                         const SizedBox(width: 8),
//                         Icon(
//                           Icons.forest,
//                           color: Colors.green.withOpacity(0.7),
//                           size: 16,
//                         ),
//                       ],
//                     ),
//                   ],
//                 ),
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
//
//
// import 'dart:convert';
// import 'dart:ui';
//
// import 'package:final_destination/forgotemail.dart';
// import 'package:final_destination/home.dart';
// import 'package:final_destination/main.dart';
// import 'package:final_destination/register.dart';
// import 'package:flutter/material.dart';
// import 'package:http/http.dart' as http;
// import 'package:shared_preferences/shared_preferences.dart';
//
// void main() {
//   runApp(login());
// }
//
// class login extends StatelessWidget {
//   const login({Key? key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       theme: ThemeData.dark().copyWith(
//         scaffoldBackgroundColor: Colors.transparent,
//         primaryColor: const Color(0xFF0F3D3A),
//         appBarTheme: const AppBarTheme(
//           backgroundColor: Colors.transparent,
//           elevation: 0,
//           centerTitle: true,
//         ),
//         inputDecorationTheme: InputDecorationTheme(
//           filled: true,
//           fillColor: Colors.white.withOpacity(0.15),
//           border: OutlineInputBorder(
//             borderRadius: BorderRadius.circular(20),
//             borderSide: BorderSide.none,
//           ),
//           enabledBorder: OutlineInputBorder(
//             borderRadius: BorderRadius.circular(20),
//             borderSide: BorderSide(
//               color: Colors.white.withOpacity(0.3),
//               width: 1.5,
//             ),
//           ),
//           focusedBorder: OutlineInputBorder(
//             borderRadius: BorderRadius.circular(20),
//             borderSide: const BorderSide(
//               color: Color(0xFF2EF21D),
//               width: 2,
//             ),
//           ),
//           hintStyle: TextStyle(
//             color: Colors.white.withOpacity(0.7),
//           ),
//           labelStyle: const TextStyle(
//             color: Color(0xFF2EF21D),
//             fontWeight: FontWeight.w500,
//           ),
//           contentPadding: const EdgeInsets.symmetric(
//             horizontal: 20,
//             vertical: 16,
//           ),
//         ),
//       ),
//       home: loginsub(),
//     );
//   }
// }
//
// class loginsub extends StatefulWidget {
//   const loginsub({Key? key}) : super(key: key);
//
//   @override
//   State<loginsub> createState() => _loginsubState();
// }
//
// class _loginsubState extends State<loginsub> {
//   final username = TextEditingController(text: 'vishnudevpk895@gmail.com');
//   final password = TextEditingController(text: 'Vdpk@123');
//   final formkey = GlobalKey<FormState>();
//   bool _isLoading = false;
//   bool _obscurePassword = true;
//
//   // Background image URL
//   final String backgroundImageUrl = 'https://images.unsplash.com/photo-1507525428034-b723cf961d3e?ixlib=rb-1.2.1&auto=format&fit=crop&w=1920&q=80';
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(leading: IconButton(
//         icon: const Icon(Icons.arrow_back_ios, color: Color(0xFF0F2A1D), size: 22),
//         onPressed: () => Navigator.push(
//           context,
//           MaterialPageRoute(builder: (context) => ipsub()),
//         ),
//       ),),
//       body: Stack(
//         children: [
//           // Background Image with overlay
//           Container(
//             width: double.infinity,
//             height: double.infinity,
//             decoration: BoxDecoration(
//               image: DecorationImage(
//                 image: NetworkImage(backgroundImageUrl),
//                 fit: BoxFit.cover,
//                 colorFilter: ColorFilter.mode(
//                   Colors.black.withOpacity(0.4),
//                   BlendMode.darken,
//                 ),
//               ),
//             ),
//           ),
//
//           // Gradient Overlay for better text readability
//           Container(
//             width: double.infinity,
//             height: double.infinity,
//             decoration: BoxDecoration(
//               gradient: LinearGradient(
//                 begin: Alignment.topCenter,
//                 end: Alignment.bottomCenter,
//                 colors: [
//                   Colors.black.withOpacity(0.5),
//                   Colors.black.withOpacity(0.3),
//                   Colors.transparent,
//                   Colors.black.withOpacity(0.3),
//                   Colors.black.withOpacity(0.5),
//                 ],
//                 stops: const [0.0, 0.3, 0.5, 0.7, 1.0],
//               ),
//             ),
//           ),
//
//           // Main content
//           Center(
//             child: SingleChildScrollView(
//               padding: const EdgeInsets.all(20.0),
//               child: Container(
//                 constraints: const BoxConstraints(maxWidth: 450),
//                 child: Column(
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   children: [
//                     // Logo/Header Section
//                     Container(
//                       margin: const EdgeInsets.only(bottom: 30),
//                       child: Column(
//                         children: [
//                           Container(
//                             width: 80,
//                             height: 80,
//                             decoration: BoxDecoration(
//                               color: Colors.white.withOpacity(0.2),
//                               borderRadius: BorderRadius.circular(20),
//                               boxShadow: [
//                                 BoxShadow(
//                                   color: Colors.black.withOpacity(0.3),
//                                   blurRadius: 20,
//                                   spreadRadius: 2,
//                                   offset: const Offset(0, 5),
//                                 ),
//                               ],
//                               border: Border.all(
//                                 color: Colors.white.withOpacity(0.3),
//                                 width: 2,
//                               ),
//                             ),
//                             child: const Icon(
//                               Icons.travel_explore,
//                               size: 40,
//                               color: Colors.white,
//                             ),
//                           ),
//                           const SizedBox(height: 15),
//                           const Text(
//                             'Final Destination',
//                             style: TextStyle(
//                               color: Colors.white,
//                               fontSize: 28,
//                               fontWeight: FontWeight.bold,
//                               letterSpacing: 1.5,
//                               shadows: [
//                                 Shadow(
//                                   blurRadius: 10,
//                                   color: Colors.black,
//                                   offset: Offset(2, 2),
//                                 ),
//                               ],
//                             ),
//                           ),
//                         ],
//                       ),
//                     ),
//
//                     // Login Form Container
//                     Container(
//                       decoration: BoxDecoration(
//                         color: Colors.white.withOpacity(0.15),
//                         borderRadius: BorderRadius.circular(24),
//                         border: Border.all(
//                           color: Colors.white.withOpacity(0.3),
//                           width: 1,
//                         ),
//                       ),
//                       padding: const EdgeInsets.all(30),
//                       child: Form(
//                         key: formkey,
//                         child: Column(
//                           children: [
//                             // Username Field
//                             TextFormField(
//                               validator: (value) {
//                                 if (value == null || value.isEmpty) {
//                                   return 'Please enter your email';
//                                 }
//                                 return null;
//                               },
//                               controller: username,
//                               style: const TextStyle(
//                                 color: Colors.white,
//                                 fontSize: 16,
//                               ),
//                               decoration: InputDecoration(
//                                 hintText: 'Enter your email',
//                                 labelText: 'EMAIL',
//                                 prefixIcon: const Icon(
//                                   Icons.email_outlined,
//                                   color: Color(0xFF2EF21D),
//                                 ),
//                               ),
//                             ),
//                             const SizedBox(height: 20),
//
//                             // Password Field
//                             TextFormField(
//                               validator: (value) {
//                                 if (value == null || value.isEmpty) {
//                                   return 'Please enter your password';
//                                 }
//                                 return null;
//                               },
//                               controller: password,
//                               obscureText: _obscurePassword,
//                               style: const TextStyle(
//                                 color: Colors.white,
//                                 fontSize: 16,
//                               ),
//                               decoration: InputDecoration(
//                                 hintText: 'Enter your password',
//                                 labelText: 'PASSWORD',
//                                 prefixIcon: const Icon(
//                                   Icons.lock_outline,
//                                   color: Color(0xFF2EF21D),
//                                 ),
//                                 suffixIcon: IconButton(
//                                   icon: Icon(
//                                     _obscurePassword
//                                         ? Icons.visibility_off_outlined
//                                         : Icons.visibility_outlined,
//                                     color: Colors.white.withOpacity(0.7),
//                                   ),
//                                   onPressed: () {
//                                     setState(() {
//                                       _obscurePassword = !_obscurePassword;
//                                     });
//                                   },
//                                 ),
//                               ),
//                             ),
//                             const SizedBox(height: 20),
//
//                             // Login Button
//                             Container(
//                               width: double.infinity,
//                               height: 50,
//                               decoration: BoxDecoration(
//                                 borderRadius: BorderRadius.circular(20),
//                                 gradient: const LinearGradient(
//                                   colors: [
//                                     Color(0xFF0F3D3A),
//                                     Color(0xFF2EF21D),
//                                   ],
//                                   begin: Alignment.topLeft,
//                                   end: Alignment.bottomRight,
//                                 ),
//                               ),
//                               child: ElevatedButton(
//                                 onPressed: _isLoading
//                                     ? null
//                                     : () async {
//                                   if (!formkey.currentState!.validate()) {
//                                     return;
//                                   }
//                                   setState(() {
//                                     _isLoading = true;
//                                   });
//                                   try {
//                                     SharedPreferences sh = await SharedPreferences.getInstance();
//                                     var data = await http.post(
//                                       Uri.parse('${sh.getString('ip')}/login2'),
//                                       body: {
//                                         'username': username.text,
//                                         'password': password.text,
//                                       },
//                                     );
//                                     var d = json.decode(data.body);
//                                     if (d['status'] == 'ok') {
//                                       sh.setString('uid', d['uid'].toString());
//                                       sh.setString('password', password.text);
//                                       // ignore: use_build_context_synchronously
//                                       Navigator.push(
//                                         context,
//                                         MaterialPageRoute(
//                                           builder: (context) => UserHomeApp(),
//                                         ),
//                                       );
//                                     } else {
//                                       ScaffoldMessenger.of(context).showSnackBar(
//                                         SnackBar(
//                                           content: Text(
//                                             d['message'] ?? 'Login failed',
//                                           ),
//                                           backgroundColor: Colors.red,
//                                         ),
//                                       );
//                                     }
//                                   } catch (e) {
//                                     ScaffoldMessenger.of(context).showSnackBar(
//                                       const SnackBar(
//                                         content: Text('Network error. Please try again.'),
//                                         backgroundColor: Colors.red,
//                                       ),
//                                     );
//                                   } finally {
//                                     setState(() {
//                                       _isLoading = false;
//                                     });
//                                   }
//                                 },
//                                 style: ElevatedButton.styleFrom(
//                                   backgroundColor: Colors.transparent,
//                                   foregroundColor: Colors.white,
//                                   elevation: 0,
//                                   shape: RoundedRectangleBorder(
//                                     borderRadius: BorderRadius.circular(20),
//                                   ),
//                                 ),
//                                 child: _isLoading
//                                     ? const CircularProgressIndicator(
//                                   strokeWidth: 3,
//                                   valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
//                                 )
//                                     : const Text(
//                                   'LOGIN',
//                                   style: TextStyle(
//                                     fontSize: 16,
//                                     fontWeight: FontWeight.w700,
//                                     letterSpacing: 1.2,
//                                   ),
//                                 ),
//                               ),
//                             ),
//                           ],
//                         ),
//                       ),
//                     ),
//
//                     const SizedBox(height: 20),
//
//                     // Register Button
//                     Container(
//                       width: double.infinity,
//                       decoration: BoxDecoration(
//                         color: Colors.white.withOpacity(0.15),
//                         borderRadius: BorderRadius.circular(20),
//                         border: Border.all(
//                           color: Colors.white.withOpacity(0.3),
//                           width: 1,
//                         ),
//                       ),
//                       child: TextButton(
//                         onPressed: () {
//                           Navigator.push(
//                             context,
//                             MaterialPageRoute(
//                               builder: (context) => register(),
//                             ),
//                           );
//                         },
//                         style: TextButton.styleFrom(
//                           foregroundColor: const Color(0xFF2EF21D),
//                           padding: const EdgeInsets.symmetric(vertical: 15),
//                         ),
//                         child: const Text(
//                           'CREATE NEW ACCOUNT',
//                           style: TextStyle(
//                             fontSize: 14,
//                             fontWeight: FontWeight.w600,
//                             letterSpacing: 1,
//                           ),
//                         ),
//                       ),
//                     ),
//
//                     const SizedBox(height: 20),
//
//                     // Forgot Password Button - Using forgotemail.dart
//                     Container(
//                       width: double.infinity,
//                       decoration: BoxDecoration(
//                         color: Colors.white.withOpacity(0.15),
//                         borderRadius: BorderRadius.circular(20),
//                         border: Border.all(
//                           color: Colors.white.withOpacity(0.3),
//                           width: 1,
//                         ),
//                       ),
//                       child: TextButton(
//                         onPressed: () {
//                           Navigator.push(
//                             context,
//                             MaterialPageRoute(
//                               builder: (context) => forgotemail(),
//                             ),
//                           );
//                         },
//                         style: TextButton.styleFrom(
//                           foregroundColor: const Color(0xFF2EF21D),
//                           padding: const EdgeInsets.symmetric(vertical: 15),
//                         ),
//                         child: const Text(
//                           'FORGOT PASSWORD',
//                           style: TextStyle(
//                             fontSize: 14,
//                             fontWeight: FontWeight.w600,
//                             letterSpacing: 1,
//                           ),
//                         ),
//                       ),
//                     ),
//
//                     const SizedBox(height: 30),
//
//                     // Terms and Privacy
//                     Text(
//                       'By continuing, you agree to our Terms of Service and Privacy Policy',
//                       textAlign: TextAlign.center,
//                       style: TextStyle(
//                         color: Colors.white.withOpacity(0.8),
//                         fontSize: 12,
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }

import 'dart:convert';
import 'dart:ui';

import 'package:final_destination/forgotemail.dart';
import 'package:final_destination/home.dart';
import 'package:final_destination/main.dart';
import 'package:final_destination/register.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  runApp(login());
}

class login extends StatelessWidget {
  const login({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: Colors.transparent,
        primaryColor: const Color(0xFF0F3D3A),
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.transparent,
          elevation: 0,
          centerTitle: true,
        ),
        inputDecorationTheme: InputDecorationTheme(
          filled: true,
          fillColor: Colors.white.withOpacity(0.15),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20),
            borderSide: BorderSide.none,
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20),
            borderSide: BorderSide(
              color: Colors.white.withOpacity(0.3),
              width: 1.5,
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20),
            borderSide: const BorderSide(
              color: Color(0xFF2EF21D),
              width: 2,
            ),
          ),
          hintStyle: TextStyle(
            color: Colors.white.withOpacity(0.7),
          ),
          labelStyle: const TextStyle(
            color: Color(0xFF2EF21D),
            fontWeight: FontWeight.w500,
          ),
          contentPadding: const EdgeInsets.symmetric(
            horizontal: 20,
            vertical: 16,
          ),
        ),
      ),
      home: loginsub(),
    );
  }
}

class loginsub extends StatefulWidget {
  const loginsub({Key? key}) : super(key: key);

  @override
  State<loginsub> createState() => _loginsubState();
}

class _loginsubState extends State<loginsub> {
  final username = TextEditingController(text: 'vishnudevpk895@gmail.com');
  final password = TextEditingController(text: 'Vdpk@123');
  final formkey = GlobalKey<FormState>();
  bool _isLoading = false;
  bool _obscurePassword = true;

  // Background image URL
  final String backgroundImageUrl = 'https://images.unsplash.com/photo-1507525428034-b723cf961d3e?ixlib=rb-1.2.1&auto=format&fit=crop&w=1920&q=80';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios, color: Colors.white, size: 22),
          onPressed: () => Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => ipsub()),
          ),
        ),
      ),
      extendBodyBehindAppBar: true,
      body: Stack(
        children: [
          // Background Image with overlay
          Container(
            width: double.infinity,
            height: double.infinity,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: NetworkImage(backgroundImageUrl),
                fit: BoxFit.cover,
                colorFilter: ColorFilter.mode(
                  Colors.black.withOpacity(0.4),
                  BlendMode.darken,
                ),
              ),
            ),
          ),

          // Gradient Overlay for better text readability
          Container(
            width: double.infinity,
            height: double.infinity,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Colors.black.withOpacity(0.5),
                  Colors.black.withOpacity(0.3),
                  Colors.transparent,
                  Colors.black.withOpacity(0.3),
                  Colors.black.withOpacity(0.5),
                ],
                stops: const [0.0, 0.3, 0.5, 0.7, 1.0],
              ),
            ),
          ),

          // Main content
          Center(
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(20.0),
              child: Container(
                constraints: const BoxConstraints(maxWidth: 450),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    // Logo/Header Section
                    Container(
                      margin: const EdgeInsets.only(bottom: 30),
                      child: Column(
                        children: [
                          Container(
                            width: 80,
                            height: 80,
                            decoration: BoxDecoration(
                              color: Colors.white.withOpacity(0.2),
                              borderRadius: BorderRadius.circular(20),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black.withOpacity(0.3),
                                  blurRadius: 20,
                                  spreadRadius: 2,
                                  offset: const Offset(0, 5),
                                ),
                              ],
                              border: Border.all(
                                color: Colors.white.withOpacity(0.3),
                                width: 2,
                              ),
                            ),
                            child: const Icon(
                              Icons.travel_explore,
                              size: 40,
                              color: Colors.white,
                            ),
                          ),
                          const SizedBox(height: 15),
                          const Text(
                            'Final Destination',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 28,
                              fontWeight: FontWeight.bold,
                              letterSpacing: 1.5,
                              shadows: [
                                Shadow(
                                  blurRadius: 10,
                                  color: Colors.black,
                                  offset: Offset(2, 2),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),

                    // Login Form Container
                    Container(
                      decoration: BoxDecoration(
                        color: Colors.white.withOpacity(0.15),
                        borderRadius: BorderRadius.circular(24),
                        border: Border.all(
                          color: Colors.white.withOpacity(0.3),
                          width: 1,
                        ),
                      ),
                      padding: const EdgeInsets.all(30),
                      child: Form(
                        key: formkey,
                        child: Column(
                          children: [
                            // Username Field
                            TextFormField(
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Please enter your email';
                                }
                                return null;
                              },
                              controller: username,
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 16,
                              ),
                              decoration: InputDecoration(
                                hintText: 'Enter your email',
                                labelText: 'EMAIL',
                                prefixIcon: const Icon(
                                  Icons.email_outlined,
                                  color: Color(0xFF2EF21D),
                                ),
                              ),
                            ),
                            const SizedBox(height: 20),

                            // Password Field
                            TextFormField(
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Please enter your password';
                                }
                                return null;
                              },
                              controller: password,
                              obscureText: _obscurePassword,
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 16,
                              ),
                              decoration: InputDecoration(
                                hintText: 'Enter your password',
                                labelText: 'PASSWORD',
                                prefixIcon: const Icon(
                                  Icons.lock_outline,
                                  color: Color(0xFF2EF21D),
                                ),
                                suffixIcon: IconButton(
                                  icon: Icon(
                                    _obscurePassword
                                        ? Icons.visibility_off_outlined
                                        : Icons.visibility_outlined,
                                    color: Colors.white.withOpacity(0.7),
                                  ),
                                  onPressed: () {
                                    setState(() {
                                      _obscurePassword = !_obscurePassword;
                                    });
                                  },
                                ),
                              ),
                            ),
                            const SizedBox(height: 20),

                            // Login Button
                            Container(
                              width: double.infinity,
                              height: 50,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                gradient: const LinearGradient(
                                  colors: [
                                    Color(0xFF0F3D3A),
                                    Color(0xFF2EF21D),
                                  ],
                                  begin: Alignment.topLeft,
                                  end: Alignment.bottomRight,
                                ),
                              ),
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
                                    SharedPreferences sh = await SharedPreferences.getInstance();
                                    var data = await http.post(
                                      Uri.parse('${sh.getString('ip')}/login2'),
                                      body: {
                                        'username': username.text,
                                        'password': password.text,
                                      },
                                    );
                                    var d = json.decode(data.body);
                                    if (d['status'] == 'ok') {
                                      sh.setString('uid', d['uid'].toString());
                                      sh.setString('password', password.text);
                                      // ignore: use_build_context_synchronously
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) => UserHomeApp(),
                                        ),
                                      );
                                    } else {
                                      ScaffoldMessenger.of(context).showSnackBar(
                                        SnackBar(
                                          content: Text(
                                            d['message'] ?? 'Login failed',
                                          ),
                                          backgroundColor: Colors.red,
                                        ),
                                      );
                                    }
                                  } catch (e) {
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      const SnackBar(
                                        content: Text('Network error. Please try again.'),
                                        backgroundColor: Colors.red,
                                      ),
                                    );
                                  } finally {
                                    setState(() {
                                      _isLoading = false;
                                    });
                                  }
                                },
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.transparent,
                                  foregroundColor: Colors.white,
                                  elevation: 0,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                ),
                                child: _isLoading
                                    ? const CircularProgressIndicator(
                                  strokeWidth: 3,
                                  valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                                )
                                    : const Text(
                                  'LOGIN',
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w700,
                                    letterSpacing: 1.2,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),

                    const SizedBox(height: 20),

                    // Register Button
                    Container(
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: Colors.white.withOpacity(0.15),
                        borderRadius: BorderRadius.circular(20),
                        border: Border.all(
                          color: Colors.white.withOpacity(0.3),
                          width: 1,
                        ),
                      ),
                      child: TextButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => register(),
                            ),
                          );
                        },
                        style: TextButton.styleFrom(
                          foregroundColor: const Color(0xFF2EF21D),
                          padding: const EdgeInsets.symmetric(vertical: 15),
                        ),
                        child: const Text(
                          'CREATE NEW ACCOUNT',
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                            letterSpacing: 1,
                          ),
                        ),
                      ),
                    ),

                    const SizedBox(height: 20),

                    // Forgot Password Button - Using forgotemail.dart
                    Container(
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: Colors.white.withOpacity(0.15),
                        borderRadius: BorderRadius.circular(20),
                        border: Border.all(
                          color: Colors.white.withOpacity(0.3),
                          width: 1,
                        ),
                      ),
                      child: TextButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => forgotemail(),
                            ),
                          );
                        },
                        style: TextButton.styleFrom(
                          foregroundColor: const Color(0xFF2EF21D),
                          padding: const EdgeInsets.symmetric(vertical: 15),
                        ),
                        child: const Text(
                          'FORGOT PASSWORD',
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                            letterSpacing: 1,
                          ),
                        ),
                      ),
                    ),

                    const SizedBox(height: 30),

                    // Terms and Privacy
                    Text(
                      'By continuing, you agree to our Terms of Service and Privacy Policy',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.white.withOpacity(0.8),
                        fontSize: 12,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}



