// import 'package:flutter/material.dart';
// import 'package:shared_preferences/shared_preferences.dart';
//
// import 'login.dart';
//
// void main(){
//   runApp(ip());
// }
//
// class ip extends StatelessWidget {
//   const ip({Key? key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(home: ipsub(),);
//   }
// }
//
// class ipsub extends StatefulWidget {
//   const ipsub({Key? key}) : super(key: key);
//
//   @override
//   State<ipsub> createState() => _ipsubState();
// }
//
// class _ipsubState extends State<ipsub> {
//   final ip=TextEditingController(text: '192.168.29.45');
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(body:Center(child: SingleChildScrollView(child: SizedBox(height: 500,width: 500, child: Column(children: [
//       TextField(controller: ip,
//         decoration: InputDecoration(
//      border: OutlineInputBorder(),
//
//     ),),
//       SizedBox(height: 20,),
//       ElevatedButton(onPressed: () async {
//         SharedPreferences sh=await SharedPreferences.getInstance();
//         sh.setString('ip', 'http://${ip.text}:8000');
//         Navigator.push(context, MaterialPageRoute(builder: (context)=>login()));
//       }, child: Text('submit'))
//       ],),),),) ,);
//   }
// }

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'login.dart';

void main() {
  runApp(ip());
}

class ip extends StatelessWidget {
  const ip({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: ipsub(),
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blueGrey,
      ),
    );
  }
}

class ipsub extends StatefulWidget {
  const ipsub({Key? key}) : super(key: key);

  @override
  State<ipsub> createState() => _ipsubState();
}

class _ipsubState extends State<ipsub> {
  final ip = TextEditingController(text:'10.48.241.153');
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    // Mint Mist and Desaturated Teal Color Palette
    Color mintMist = Color(0xFFE0F2F1); // Light mint background
    Color desaturatedTeal = Color(0xFF5F9EA0); // Cadet Blue - desaturated teal
    Color darkTeal = Color(0xFF2F4F4F); // Dark Slate Gray for contrast
    Color lightTeal = Color(0xFFB2DFDB); // Light teal for highlights

    return Scaffold(
      backgroundColor: mintMist,
      body: Center(
        child: SingleChildScrollView(
          child: Container(
            constraints: BoxConstraints(maxWidth: 500),
            padding: EdgeInsets.all(20),
            child: Form(
              key: _formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  // Decorative Header
                  Container(
                    padding: EdgeInsets.all(20),
                    margin: EdgeInsets.only(bottom: 40),
                    decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.9),
                      borderRadius: BorderRadius.circular(20),
                      boxShadow: [
                        BoxShadow(
                          color: desaturatedTeal.withOpacity(0.1),
                          blurRadius: 20,
                          spreadRadius: 5,
                          offset: Offset(0, 5),
                        ),
                      ],
                      border: Border.all(
                        color: desaturatedTeal.withOpacity(0.2),
                        width: 1,
                      ),
                    ),
                    child: Column(
                      children: [
                        Icon(
                          Icons.settings_ethernet,
                          size: 60,
                          color: desaturatedTeal,
                        ),
                        SizedBox(height: 16),
                        Text(
                          'Server Configuration',
                          style: TextStyle(
                            fontSize: 28,
                            fontWeight: FontWeight.bold,
                            color: darkTeal,
                            letterSpacing: 0.5,
                          ),
                        ),
                        SizedBox(height: 8),
                        Text(
                          'Enter your server IP address to continue',
                          style: TextStyle(
                            fontSize: 16,
                            color: desaturatedTeal,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ),
                  ),

                  // IP Address Input Card
                  Card(
                    elevation: 8,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                    color: Colors.white,
                    shadowColor: desaturatedTeal.withOpacity(0.3),
                    child: Padding(
                      padding: EdgeInsets.all(25),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Icon(
                                Icons.language,
                                color: desaturatedTeal,
                                size: 24,
                              ),
                              SizedBox(width: 12),
                              Text(
                                'Server IP Address',
                                style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.w600,
                                  color: darkTeal,
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 20),
                          Container(
                            decoration: BoxDecoration(
                              color: mintMist.withOpacity(0.5),
                              borderRadius: BorderRadius.circular(12),
                              border: Border.all(
                                color: desaturatedTeal.withOpacity(0.3),
                                width: 1.5,
                              ),
                            ),
                            child: TextFormField(
                              controller: ip,
                              decoration: InputDecoration(
                                contentPadding: EdgeInsets.symmetric(
                                  horizontal: 20,
                                  vertical: 18,
                                ),
                                border: InputBorder.none,
                                hintText: 'Enter IP address',
                                hintStyle: TextStyle(
                                  color: desaturatedTeal.withOpacity(0.6),
                                ),
                                prefixIcon: Padding(
                                  padding: EdgeInsets.only(left: 15, right: 10),
                                  child: Text(
                                    'http://',
                                    style: TextStyle(
                                      color: desaturatedTeal,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ),
                                suffixIcon: Padding(
                                  padding: EdgeInsets.only(right: 15),
                                  child: Text(
                                    ':8000',
                                    style: TextStyle(
                                      color: desaturatedTeal,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ),
                              ),
                              style: TextStyle(
                                fontSize: 16,
                                color: darkTeal,
                                fontWeight: FontWeight.w500,
                              ),
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Please enter an IP address';
                                }
                                // Basic IP validation
                                final ipPattern = RegExp(
                                    r'^(\d{1,3}\.){3}\d{1,3}$');
                                if (!ipPattern.hasMatch(value)) {
                                  return 'Please enter a valid IP address';
                                }
                                return null;
                              },
                            ),
                          ),
                          SizedBox(height: 8),
                          Padding(
                            padding: EdgeInsets.only(left: 4),
                            child: Text(
                              'Example: 192.168.1.100',
                              style: TextStyle(
                                fontSize: 14,
                                color: desaturatedTeal.withOpacity(0.7),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),

                  SizedBox(height: 30),

                  // Submit Button
                  Container(
                    height: 60,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      gradient: LinearGradient(
                        begin: Alignment.centerLeft,
                        end: Alignment.centerRight,
                        colors: [
                          desaturatedTeal,
                          Color(0xFF4A8B8C), // Slightly darker teal
                        ],
                      ),
                      boxShadow: [
                        BoxShadow(
                          color: desaturatedTeal.withOpacity(0.4),
                          blurRadius: 10,
                          spreadRadius: 2,
                          offset: Offset(0, 4),
                        ),
                      ],
                    ),
                    child: ElevatedButton(
                      onPressed: () async {
                        if (_formKey.currentState!.validate()) {
                          SharedPreferences sh =
                          await SharedPreferences.getInstance();
                          sh.setString('ip', 'http://${ip.text}:8000');
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => login()),
                          );
                        }
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.transparent,
                        shadowColor: Colors.transparent,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15),
                        ),
                        padding: EdgeInsets.zero,
                      ),
                      child: Container(
                        alignment: Alignment.center,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.check_circle,
                              color: Colors.white,
                              size: 22,
                            ),
                            SizedBox(width: 12),
                            Text(
                              'CONNECT TO SERVER',
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                                color: Colors.white,
                                letterSpacing: 0.5,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),

                  SizedBox(height: 20),

                  // Information Box
                  Container(
                    padding: EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: lightTeal.withOpacity(0.3),
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(
                        color: desaturatedTeal.withOpacity(0.2),
                        width: 1,
                      ),
                    ),
                    child: Row(
                      children: [
                        Icon(
                          Icons.info_outline,
                          color: desaturatedTeal,
                          size: 20,
                        ),
                        SizedBox(width: 12),
                        Expanded(
                          child: Text(
                            'Ensure your device is connected to the same network as the server',
                            style: TextStyle(
                              fontSize: 14,
                              color: darkTeal.withOpacity(0.8),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),

                  SizedBox(height: 20),

                  // Footer Note
                  Text(
                    'Default IP: 192.168.29.45',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 14,
                      color: desaturatedTeal.withOpacity(0.7),
                      fontStyle: FontStyle.italic,
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
}