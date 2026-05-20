// import 'dart:convert';
// import 'dart:math';
//
// import 'package:file_picker/file_picker.dart';
// import 'package:final_destination/login.dart';
// import 'package:flutter/foundation.dart';
// import 'package:flutter/material.dart';
// import 'package:http/http.dart' as http;
// import 'package:shared_preferences/shared_preferences.dart';
//
// void main(){
//   runApp(register());
// }
//
// class register extends StatelessWidget {
//   const register({Key? key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(home: registersub(),);
//   }
// }
//
// class registersub extends StatefulWidget {
//   const registersub({Key? key}) : super(key: key);
//
//   @override
//   State<registersub> createState() => _registersubState();
// }
//
// class _registersubState extends State<registersub> {
//   final name=TextEditingController();
//   final email=TextEditingController();
//   final phone=TextEditingController();
//   final housename=TextEditingController();
//   final post=TextEditingController();
//   final pin=TextEditingController();
//   final place=TextEditingController();
//
//   final password=TextEditingController();
//   final confirmpassword=TextEditingController();
//   final formkey=GlobalKey<FormState>();
//   PlatformFile? _selectedFile;
//   Uint8List? _webFileBytes;
//   String? _result;
//   bool _isLoading = false;
//
//   Future<void> _pickFile() async {
//     FilePickerResult? result = await FilePicker.platform.pickFiles(
//       allowMultiple: false,
//       type: FileType.any, // Any file type allowed
//     );
//
//     if (result != null) {
//       setState(() {
//         _selectedFile = result.files.first;
//         _result = null;
//       });
//
//       if (kIsWeb) {
//         _webFileBytes = result.files.first.bytes;
//       }
//     }
//   }
//
//   //----------------------
//
//   PlatformFile? _selectedFile1;
//   Uint8List? _webFileBytes1;
//   String? _resul1;
//   Future<void> _pickFile1() async {
//     FilePickerResult? result1 = await FilePicker.platform.pickFiles(
//       allowMultiple: false,
//       type: FileType.any, // Any file type allowed
//     );
//
//     if (result1 != null) {
//       setState(() {
//         _selectedFile1 = result1.files.first;
//         _resul1  = null;
//       });
//
//       if (kIsWeb) {
//         _webFileBytes1 = result1.files.first.bytes;
//       }
//     }
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(body: Center(child: SingleChildScrollView(child: SizedBox(height: 1200,width: 1200,child:
//     Form(key: formkey,
//         child: Column(children: [
//
//       ElevatedButton.icon(
//         icon: Icon(Icons.upload_file),
//         label: Text("Select proof"),
//         onPressed: _pickFile,
//       ),
//       if (_selectedFile != null) ...[
//         SizedBox(height: 10),
//         Text("Selected: ${_selectedFile!.name}"),
//       ],
//
//       ElevatedButton.icon(
//         icon: Icon(Icons.upload_file),
//         label: Text("Select photo"),
//         onPressed: _pickFile1,
//       ),
//       if (_selectedFile1 != null) ...[
//         SizedBox(height: 10),
//         Text("Selected: ${_selectedFile1!.name}"),
//       ],
//
//       TextFormField(validator: (value){
//         if(value==null || value.isEmpty){
//           return 'enter valid data';
//         }
//         if(!RegExp(r"^[A-Za-z]+(?: [A-Za-z]+)*$").hasMatch(value))
//         {
//           return 'Only letters ';
//         }
//         return null;
//       },
//         controller: name,
//         decoration: InputDecoration(
//             border: OutlineInputBorder(),
//             hintText: 'enter name',
//             labelText: 'name',
//             prefixIcon: Icon(Icons.abc)
//         ),),SizedBox(height: 20,),
//       TextFormField( validator: (value){
//         if(value==null || value.isEmpty){
//           return 'enter valid data';
//         }
//         if(!RegExp(r"^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$").hasMatch(value)
//         ){
//           return 'Standard email format';
//         }
//         return null;
//       },
//         controller: email,
//         decoration: InputDecoration(
//             border: OutlineInputBorder(),
//             hintText: 'enter email',
//             labelText: 'email',
//             prefixIcon:Icon(Icons.abc)
//         ),),SizedBox(height: 20,),
//       TextFormField( validator: (value){
//         if(value==null || value.isEmpty){
//           return 'enter valid data';
//         }
//         if(!RegExp(r"^\+?[\d\s-]{8,15}$").hasMatch(value))
//         {
//           return 'Digits with optional +, spaces, or hyphens (8–15 chars)';
//         }
//         return null;
//       },
//         controller: phone,
//         decoration: InputDecoration(
//             border: OutlineInputBorder(),
//             hintText: 'enter phone number',
//             labelText: 'phone',
//             prefixIcon: Icon(Icons.abc)
//         ),),SizedBox(height: 20,),
//       TextFormField(  validator: (value){
//         if(value==null || value.isEmpty){
//           return 'enter valid data';
//         }
//         if(!RegExp(r"^[A-Za-z]+(?: [A-Za-z]+)*$").hasMatch(value))
//         {
//           return 'Only letters, spaces, dots, apostrophes, or hyphens';
//         }
//         return null;
//       },
//         controller: housename,
//         decoration: InputDecoration(
//             border: OutlineInputBorder(),
//             hintText: 'enter housename',
//             labelText: 'housename',
//             prefixIcon: Icon(Icons.abc)
//         ),),SizedBox(height: 20,),
//       TextFormField( validator: (value){
//         if(value==null || value.isEmpty){
//           return 'enter valid data';
//         }
//         if(!RegExp(r"^[A-Za-z]+(?: [A-Za-z]+)*$").hasMatch(value))
//         {
//           return 'Only letters, spaces, dots, apostrophes, or hyphens';
//         }
//         return null;
//       },
//         controller: post ,
//         decoration: InputDecoration(
//             border: OutlineInputBorder(),
//             hintText: 'enter post',
//             labelText: 'post',
//             prefixIcon: Icon(Icons.abc)
//         ),),SizedBox(height: 20,),
//       TextFormField( validator: (value){
//         if(value==null || value.isEmpty){
//           return 'enter valid data';
//         }
//         if(!RegExp(r"^\d{6}$").hasMatch(value))
//         {
//           return 'Exactly 6 digits';
//         }
//         return null;
//       },
//         controller: pin,
//         decoration: InputDecoration(
//             border: OutlineInputBorder(),
//             hintText: 'enter pin',
//             labelText: 'pin',
//             prefixIcon: Icon(Icons.abc)
//         ),),SizedBox(height: 20,),
//       TextFormField( validator: (value){
//         if(value==null || value.isEmpty){
//           return 'enter valid data';
//         }
//         if(!RegExp(r"^[A-Za-z]+(?: [A-Za-z]+)*$").hasMatch(value))
//         {
//           return 'Only letters, spaces, dots, apostrophes, or hyphens';
//         }
//         return null;
//       },
//         controller: place,
//         decoration: InputDecoration(
//             border: OutlineInputBorder(),
//             hintText: 'enter place',
//             labelText: 'place',
//             prefixIcon: Icon(Icons.abc)
//         ),),SizedBox(height: 20,),
//
//       TextFormField( validator: (value){
//         if(value==null || value.isEmpty){
//           return 'enter valid data';
//         }
//         if(!RegExp(r'(?=.*[a-z])(?=.*[A-Z])(?=.*[@$!%*?&]).{8,}').hasMatch(value))
//         {
//           return ' Min 8 chars, at least 1 number, 1 lowercase, 1 uppercase, 1 special character';
//         }
//         return null;
//       },
//         controller: password,
//         decoration: InputDecoration(
//             border: OutlineInputBorder(),
//             hintText: 'enter password',
//             labelText: 'password',
//             prefixIcon: Icon(Icons.abc)
//         ),),SizedBox(height: 20,),
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
//         controller: confirmpassword,
//         decoration: InputDecoration(
//             border: OutlineInputBorder(),
//             hintText: 'confirm password',
//             labelText: 'confirm password',
//             prefixIcon: Icon(Icons.abc)
//         ),),SizedBox(height: 20,),
//       ElevatedButton(onPressed: () async {
//         if(!formkey.currentState!.validate()){
//           return;
//         }
//         SharedPreferences sh=await SharedPreferences.getInstance();
//         var request =   await http.MultipartRequest(
//             'POST',
//             Uri.parse('${sh.getString('ip')}/userregister')
//         );
//
//         // 🔹 Normal Form Data
//         request.fields['name'] = name.text;
//         request.fields['email'] = email.text;
//         request.fields['phone'] = phone.text;
//         request.fields['housename']=housename.text;
//         request.fields['post']=post.text;
//         request.fields['pin']=pin.text;
//         request.fields['place']=place.text;
//         request.fields['latitude']=sh.getString('latitude').toString();
//         request.fields['longitude']=sh.getString('longitude').toString();
//         request.fields['password']=password.text;
//         request.fields['confirmpassword']=confirmpassword.text;
//
//
//
//         // 🔹 File Upload Part
//         if (kIsWeb) {
//           request.files.add(http.MultipartFile.fromBytes(
//             'file',
//             _webFileBytes!,
//             filename: _selectedFile!.name,
//           ));
//         } else {
//           request.files.add(await http.MultipartFile.fromPath(
//             'file',
//             _selectedFile!.path!,
//           ));
//         }
//
//         if (kIsWeb) {
//           request.files.add(http.MultipartFile.fromBytes(
//             'file1',
//             _webFileBytes1!,
//             filename: _selectedFile1!.name,
//           ));
//         } else {
//           request.files.add(await http.MultipartFile.fromPath(
//             'file',
//             _selectedFile1!.path!,
//           ));
//         }
//         // =====================================================
//         // 🌐 END SERVER UPLOAD SECTION
//         // =====================================================
//
//         var response = await request.send();
//         var data = await response.stream.bytesToString();
//         var decoded = json.decode(data);
//         showDialog(context: context, builder: (context)=>AlertDialog(
//           title: Text('Registration'),
//           content: Text('Registered successfully'),
//           actions: [
//             TextButton(onPressed: (){
//               Navigator.push(context, MaterialPageRoute(builder: (context)=>login()));
//             }, child: Text('ok'))
//           ],
//         ));
//
//       }, child: Text('register'))
//     ],)),),),),);
//   }
// }




import 'dart:convert';
import 'dart:math';

import 'package:file_picker/file_picker.dart';
import 'package:final_destination/login.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  runApp(register());
}

class register extends StatelessWidget {
  const register({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: const Color(0xFF0F2A1D),
        scaffoldBackgroundColor: const Color(0xFFE3EED4),
        fontFamily: 'Poppins',
      ),
      home: registersub(),
    );
  }
}

class registersub extends StatefulWidget {
  const registersub({Key? key}) : super(key: key);

  @override
  State<registersub> createState() => _registersubState();
}

class _registersubState extends State<registersub> {
  final name = TextEditingController();
  final email = TextEditingController();
  final phone = TextEditingController();
  final housename = TextEditingController();
  final post = TextEditingController();
  final pin = TextEditingController();
  final place = TextEditingController();

  final password = TextEditingController();
  final confirmpassword = TextEditingController();
  final formkey = GlobalKey<FormState>();
  PlatformFile? _selectedFile;
  Uint8List? _webFileBytes;
  String? _result;
  bool _isLoading = false;

  Future<void> _pickFile() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      allowMultiple: false,
      type: FileType.any, // Any file type allowed
    );

    if (result != null) {
      setState(() {
        _selectedFile = result.files.first;
        _result = null;
      });

      if (kIsWeb) {
        _webFileBytes = result.files.first.bytes;
      }
    }
  }

  //----------------------

  PlatformFile? _selectedFile1;
  Uint8List? _webFileBytes1;
  String? _resul1;
  Future<void> _pickFile1() async {
    FilePickerResult? result1 = await FilePicker.platform.pickFiles(
      allowMultiple: false,
      type: FileType.any, // Any file type allowed
    );

    if (result1 != null) {
      setState(() {
        _selectedFile1 = result1.files.first;
        _resul1 = null;
      });

      if (kIsWeb) {
        _webFileBytes1 = result1.files.first.bytes;
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFE3EED4),
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 2,
        title: Text(
          'Create Account',
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
          onPressed: () => Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => login()),
          ),
        ),
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Container(
            width: 1200,
            padding: const EdgeInsets.all(20),
            child: Form(
              key: formkey,
              child: Column(
                children: [
                  // Header Icon
                  Container(
                    padding: const EdgeInsets.all(20),
                    decoration: BoxDecoration(
                      color: const Color(0xFF0F2A1D).withOpacity(0.1),
                      shape: BoxShape.circle,
                    ),
                    child: const Icon(
                      Icons.person_add_alt_1,
                      size: 50,
                      color: Color(0xFF0F2A1D),
                    ),
                  ),
                  const SizedBox(height: 20),

                  // Title
                  const Text(
                    'Register New Account',
                    style: TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.w900,
                      color: Color(0xFF0F2A1D),
                      fontFamily: 'Poppins',
                    ),
                  ),
                  const SizedBox(height: 10),
                  const Text(
                    'Please fill in the details to create your account',
                    style: TextStyle(
                      fontSize: 14,
                      color: Color(0xFF0F2A1D),
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const SizedBox(height: 30),

                  // File Upload Section
                  Container(
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(15),
                      boxShadow: [
                        BoxShadow(
                          color: const Color(0xFF0F2A1D).withOpacity(0.1),
                          blurRadius: 10,
                          offset: const Offset(0, 5),
                        ),
                      ],
                    ),
                    child: Column(
                      children: [
                        // Proof Upload
                        ElevatedButton.icon(
                          icon: const Icon(Icons.upload_file),
                          label: const Text(
                            "Select ID Proof",
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w600,
                              fontFamily: 'Poppins',
                            ),
                          ),
                          onPressed: _pickFile,
                          style: ElevatedButton.styleFrom(
                            backgroundColor: const Color(0xFF0F2A1D),
                            foregroundColor: Colors.white,
                            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                            elevation: 4,
                            minimumSize: const Size(double.infinity, 45),
                          ),
                        ),
                        if (_selectedFile != null) ...[
                          const SizedBox(height: 10),
                          Container(
                            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                            decoration: BoxDecoration(
                              color: const Color(0xFF0F2A1D).withOpacity(0.1),
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: Row(
                              children: [
                                const Icon(
                                  Icons.check_circle,
                                  color: Colors.green,
                                  size: 16,
                                ),
                                const SizedBox(width: 8),
                                Expanded(
                                  child: Text(
                                    "Selected: ${_selectedFile!.name}",
                                    style: const TextStyle(
                                      fontSize: 12,
                                      color: Color(0xFF0F2A1D),
                                      fontFamily: 'Poppins',
                                      fontWeight: FontWeight.w600,
                                    ),
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                        const SizedBox(height: 15),

                        // Photo Upload
                        ElevatedButton.icon(
                          icon: const Icon(Icons.upload_file),
                          label: const Text(
                            "Select Profile Photo",
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w600,
                              fontFamily: 'Poppins',
                            ),
                          ),
                          onPressed: _pickFile1,
                          style: ElevatedButton.styleFrom(
                            backgroundColor: const Color(0xFF0F2A1D).withOpacity(0.8),
                            foregroundColor: Colors.white,
                            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                            elevation: 2,
                            minimumSize: const Size(double.infinity, 45),
                          ),
                        ),
                        if (_selectedFile1 != null) ...[
                          const SizedBox(height: 10),
                          Container(
                            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                            decoration: BoxDecoration(
                              color: const Color(0xFF0F2A1D).withOpacity(0.1),
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: Row(
                              children: [
                                const Icon(
                                  Icons.check_circle,
                                  color: Colors.green,
                                  size: 16,
                                ),
                                const SizedBox(width: 8),
                                Expanded(
                                  child: Text(
                                    "Selected: ${_selectedFile1!.name}",
                                    style: const TextStyle(
                                      fontSize: 12,
                                      color: Color(0xFF0F2A1D),
                                      fontFamily: 'Poppins',
                                      fontWeight: FontWeight.w600,
                                    ),
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ],
                    ),
                  ),
                  const SizedBox(height: 20),

                  // Personal Information Section
                  Container(
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(15),
                      boxShadow: [
                        BoxShadow(
                          color: const Color(0xFF0F2A1D).withOpacity(0.1),
                          blurRadius: 10,
                          offset: const Offset(0, 5),
                        ),
                      ],
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'Personal Information',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w900,
                            color: Color(0xFF0F2A1D),
                            fontFamily: 'Poppins',
                          ),
                        ),
                        const Divider(height: 20, color: Color(0xFF0F2A1D)),

                        // Name Field
                        _buildTextField(
                          controller: name,
                          label: 'Full Name',
                          hint: 'Enter your full name',
                          icon: Icons.person,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter your name';
                            }
                            if (!RegExp(r"^[A-Za-z]+(?: [A-Za-z]+)*$").hasMatch(value)) {
                              return 'Only letters allowed';
                            }
                            return null;
                          },
                        ),
                        const SizedBox(height: 16),

                        // Email Field
                        _buildTextField(
                          controller: email,
                          label: 'Email Address',
                          hint: 'Enter your email',
                          icon: Icons.email,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter your email';
                            }
                            if (!RegExp(r"^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$").hasMatch(value)) {
                              return 'Enter a valid email address';
                            }
                            return null;
                          },
                        ),
                        const SizedBox(height: 16),

                        // Phone Field
                        _buildTextField(
                          controller: phone,
                          label: 'Phone Number',
                          hint: 'Enter your phone number',
                          icon: Icons.phone,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter your phone number';
                            }
                            if (!RegExp(r"^\+?[\d\s-]{8,15}$").hasMatch(value)) {
                              return 'Enter a valid phone number';
                            }
                            return null;
                          },
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 20),

                  // Address Information Section
                  Container(
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(15),
                      boxShadow: [
                        BoxShadow(
                          color: const Color(0xFF0F2A1D).withOpacity(0.1),
                          blurRadius: 10,
                          offset: const Offset(0, 5),
                        ),
                      ],
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'Address Information',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w900,
                            color: Color(0xFF0F2A1D),
                            fontFamily: 'Poppins',
                          ),
                        ),
                        const Divider(height: 20, color: Color(0xFF0F2A1D)),

                        // House Name Field
                        _buildTextField(
                          controller: housename,
                          label: 'House Name',
                          hint: 'Enter your house name',
                          icon: Icons.home,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter your house name';
                            }
                            if (!RegExp(r"^[A-Za-z]+(?: [A-Za-z]+)*$").hasMatch(value)) {
                              return 'Only letters allowed';
                            }
                            return null;
                          },
                        ),
                        const SizedBox(height: 16),

                        // Post Field
                        _buildTextField(
                          controller: post,
                          label: 'Post Office',
                          hint: 'Enter your post office',
                          icon: Icons.local_post_office,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter your post office';
                            }
                            if (!RegExp(r"^[A-Za-z]+(?: [A-Za-z]+)*$").hasMatch(value)) {
                              return 'Only letters allowed';
                            }
                            return null;
                          },
                        ),
                        const SizedBox(height: 16),

                        // Place Field
                        _buildTextField(
                          controller: place,
                          label: 'Place/City',
                          hint: 'Enter your place or city',
                          icon: Icons.location_city,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter your place';
                            }
                            if (!RegExp(r"^[A-Za-z]+(?: [A-Za-z]+)*$").hasMatch(value)) {
                              return 'Only letters allowed';
                            }
                            return null;
                          },
                        ),
                        const SizedBox(height: 16),

                        // Pin Code Field
                        _buildTextField(
                          controller: pin,
                          label: 'PIN Code',
                          hint: 'Enter 6-digit PIN code',
                          icon: Icons.pin_drop,
                          keyboardType: TextInputType.number,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter your PIN code';
                            }
                            if (!RegExp(r"^\d{6}$").hasMatch(value)) {
                              return 'Exactly 6 digits required';
                            }
                            return null;
                          },
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 20),

                  // Security Information Section
                  Container(
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(15),
                      boxShadow: [
                        BoxShadow(
                          color: const Color(0xFF0F2A1D).withOpacity(0.1),
                          blurRadius: 10,
                          offset: const Offset(0, 5),
                        ),
                      ],
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'Security Information',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w900,
                            color: Color(0xFF0F2A1D),
                            fontFamily: 'Poppins',
                          ),
                        ),
                        const Divider(height: 20, color: Color(0xFF0F2A1D)),

                        // Password Field
                        _buildTextField(
                          controller: password,
                          label: 'Password',
                          hint: 'Create a strong password',
                          icon: Icons.lock,
                          obscureText: true,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter a password';
                            }
                            if (!RegExp(r'(?=.*[a-z])(?=.*[A-Z])(?=.*[@$!%*?&]).{8,}').hasMatch(value)) {
                              return 'Min 8 chars, at least 1 lowercase, 1 uppercase, 1 special character';
                            }
                            return null;
                          },
                        ),
                        const SizedBox(height: 16),

                        // Confirm Password Field
                        _buildTextField(
                          controller: confirmpassword,
                          label: 'Confirm Password',
                          hint: 'Re-enter your password',
                          icon: Icons.lock_outline,
                          obscureText: true,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please confirm your password';
                            }
                            if (!RegExp(r'^(?=.*[A-Z])(?=.*[a-z])(?=.*\d)(?=.*[@$!%*?&])[A-Za-z\d@$!%*?&]{8,}$').hasMatch(value)) {
                              return 'Password does not meet requirements';
                            }
                            return null;
                          },
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 30),

                  // Register Button
                  SizedBox(
                    width: double.infinity,
                    height: 55,
                    child: ElevatedButton(
                      onPressed: () async {
                        if (!formkey.currentState!.validate()) {
                          return;
                        }
                        if (_selectedFile == null) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: const Text('Please select ID proof'),
                              backgroundColor: Colors.red,
                              behavior: SnackBarBehavior.floating,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                            ),
                          );
                          return;
                        }
                        if (_selectedFile1 == null) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: const Text('Please select profile photo'),
                              backgroundColor: Colors.red,
                              behavior: SnackBarBehavior.floating,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                            ),
                          );
                          return;
                        }

                        SharedPreferences sh = await SharedPreferences.getInstance();
                        var request = await http.MultipartRequest(
                            'POST', Uri.parse('${sh.getString('ip')}/userregister'));

                        // 🔹 Normal Form Data
                        request.fields['name'] = name.text;
                        request.fields['email'] = email.text;
                        request.fields['phone'] = phone.text;
                        request.fields['housename'] = housename.text;
                        request.fields['post'] = post.text;
                        request.fields['pin'] = pin.text;
                        request.fields['place'] = place.text;
                        request.fields['latitude'] = sh.getString('latitude').toString();
                        request.fields['longitude'] = sh.getString('longitude').toString();
                        request.fields['password'] = password.text;
                        request.fields['confirmpassword'] = confirmpassword.text;

                        // 🔹 File Upload Part
                        if (kIsWeb) {
                          request.files.add(http.MultipartFile.fromBytes(
                            'file',
                            _webFileBytes!,
                            filename: _selectedFile!.name,
                          ));
                        } else {
                          request.files.add(await http.MultipartFile.fromPath(
                            'file',
                            _selectedFile!.path!,
                          ));
                        }

                        if (kIsWeb) {
                          request.files.add(http.MultipartFile.fromBytes(
                            'file1',
                            _webFileBytes1!,
                            filename: _selectedFile1!.name,
                          ));
                        } else {
                          request.files.add(await http.MultipartFile.fromPath(
                            'file1',
                            _selectedFile1!.path!,
                          ));
                        }

                        // 🌐 END SERVER UPLOAD SECTION
                        var response = await request.send();
                        var data = await response.stream.bytesToString();
                        var decoded = json.decode(data);

                        showDialog(
                          context: context,
                          builder: (context) => AlertDialog(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20),
                            ),
                            title: const Text(
                              'Registration Successful',
                              style: TextStyle(
                                fontWeight: FontWeight.w800,
                                color: Color(0xFF0F2A1D),
                                fontFamily: 'Poppins',
                              ),
                            ),
                            content: const Text(
                              'Your account has been created successfully!',
                              style: TextStyle(
                                fontFamily: 'Poppins',
                              ),
                            ),
                            actions: [
                              TextButton(
                                onPressed: () {
                                  Navigator.pushAndRemoveUntil(
                                    context,
                                    MaterialPageRoute(builder: (context) => login()),
                                        (route) => false,
                                  );
                                },
                                style: TextButton.styleFrom(
                                  foregroundColor: const Color(0xFF0F2A1D),
                                ),
                                child: const Text(
                                  'LOGIN NOW',
                                  style: TextStyle(
                                    fontWeight: FontWeight.w800,
                                    fontFamily: 'Poppins',
                                  ),
                                ),
                              ),
                            ],
                          ),
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFF0F2A1D),
                        foregroundColor: Colors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15),
                        ),
                        elevation: 4,
                      ),
                      child: const Text(
                        'CREATE ACCOUNT',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w800,
                          fontFamily: 'Poppins',
                          letterSpacing: 1,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),

                  // Login Link
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        'Already have an account? ',
                        style: TextStyle(
                          color: Color(0xFF0F2A1D),
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => login()),
                          );
                        },
                        child: const Text(
                          'Login',
                          style: TextStyle(
                            color: Color(0xFF0F2A1D),
                            fontWeight: FontWeight.w900,
                            fontFamily: 'Poppins',
                            decoration: TextDecoration.underline,
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildTextField({
    required TextEditingController controller,
    required String label,
    required String hint,
    required IconData icon,
    required String? Function(String?) validator,
    TextInputType keyboardType = TextInputType.text,
    bool obscureText = false,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: const TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w800,
            color: Color(0xFF0F2A1D),
            fontFamily: 'Poppins',
          ),
        ),
        const SizedBox(height: 5),
        TextFormField(
          controller: controller,
          validator: validator,
          keyboardType: keyboardType,
          obscureText: obscureText,
          decoration: InputDecoration(
            hintText: hint,
            hintStyle: TextStyle(
              fontSize: 14,
              color: const Color(0xFF0F2A1D).withOpacity(0.5),
              fontFamily: 'Poppins',
            ),
            prefixIcon: Icon(
              icon,
              color: const Color(0xFF0F2A1D).withOpacity(0.7),
              size: 20,
            ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: BorderSide.none,
            ),
            filled: true,
            fillColor: const Color(0xFF0F2A1D).withOpacity(0.05),
            contentPadding: const EdgeInsets.symmetric(vertical: 15, horizontal: 15),
          ),
          style: const TextStyle(
            fontSize: 14,
            color: Color(0xFF0F2A1D),
            fontFamily: 'Poppins',
            fontWeight: FontWeight.w600,
          ),
        ),
      ],
    );
  }
}