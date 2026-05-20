// import 'dart:convert';
// import 'dart:math';
//
// import 'package:file_picker/file_picker.dart';
// import 'package:final_destination/login.dart';
// import 'package:final_destination/viewprofile.dart';
// import 'package:flutter/foundation.dart';
// import 'package:flutter/material.dart';
// import 'package:http/http.dart' as http;
// import 'package:shared_preferences/shared_preferences.dart';
//
//
//
// class editprofilesub extends StatefulWidget {
//   final String id;
//   final String name;
//   final String email;
//   final String phone;
//   final String housename;
//   final String post;
//   final String pin;
//   final String place;
//   final String latitude;
//   final String longitude;
//
//   const editprofilesub({Key? key, required this.id, required this.name,
//     required this.email, required this.phone, required this.housename, required this.post,
//     required this.pin, required this.place, required this.latitude, required this.longitude}) : super(key: key);
//
//   @override
//   State<editprofilesub> createState() => _editprofilesubState();
// }
//
// class _editprofilesubState extends State<editprofilesub> {
//   final name=TextEditingController();
//   final email=TextEditingController();
//   final phone=TextEditingController();
//   final housename=TextEditingController();
//   final post=TextEditingController();
//   final pin=TextEditingController();
//   final place=TextEditingController();
//   final latitude=TextEditingController();
//   final longitude=TextEditingController();
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
//   void initState() {
//     // TODO: implement initState
//     super.initState();
//     name.text=widget.name;
//     email.text=widget.email;
//     phone.text=widget.phone;
//     housename.text=widget.housename;
//     post.text=widget.post;
//     pin.text=widget.pin;
//     place.text=widget.place;
//     latitude.text=widget.latitude;
//     longitude.text=widget.longitude;
//
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(body: Center(child: SingleChildScrollView(child: SizedBox(height: 1200,width: 1200,child:
//     Form(key: formkey,
//         child: Column(children: [
//
//           ElevatedButton.icon(
//             icon: Icon(Icons.upload_file),
//             label: Text("Select proof"),
//             onPressed: _pickFile,
//           ),
//           if (_selectedFile != null) ...[
//             SizedBox(height: 10),
//             Text("Selected: ${_selectedFile!.name}"),
//           ],
//
//           ElevatedButton.icon(
//             icon: Icon(Icons.upload_file),
//             label: Text("Select photo"),
//             onPressed: _pickFile1,
//           ),
//           if (_selectedFile1 != null) ...[
//             SizedBox(height: 10),
//             Text("Selected: ${_selectedFile1!.name}"),
//           ],
//
//           TextFormField(validator: (value){
//             if(value==null || value.isEmpty){
//               return 'enter valid data';
//             }
//             if(!RegExp(r"^[A-Za-z]+(?: [A-Za-z]+)*$").hasMatch(value))
//             {
//               return 'Only letters ';
//             }
//             return null;
//           },
//             controller: name,
//             decoration: InputDecoration(
//                 border: OutlineInputBorder(),
//                 hintText: 'enter name',
//                 labelText: 'name',
//                 prefixIcon: Icon(Icons.abc)
//             ),),SizedBox(height: 20,),
//           TextFormField( validator: (value){
//             if(value==null || value.isEmpty){
//               return 'enter valid data';
//             }
//             if(!RegExp(r"^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$").hasMatch(value)
//             ){
//               return 'Standard email format';
//             }
//             return null;
//           },
//             controller: email,
//             decoration: InputDecoration(
//                 border: OutlineInputBorder(),
//                 hintText: 'enter email',
//                 labelText: 'email',
//                 prefixIcon:Icon(Icons.abc)
//             ),),SizedBox(height: 20,),
//           TextFormField( validator: (value){
//             if(value==null || value.isEmpty){
//               return 'enter valid data';
//             }
//             if(!RegExp(r"^\+?[\d\s-]{8,15}$").hasMatch(value))
//             {
//               return 'Digits with optional +, spaces, or hyphens (8–15 chars)';
//             }
//             return null;
//           },
//             controller: phone,
//             decoration: InputDecoration(
//                 border: OutlineInputBorder(),
//                 hintText: 'enter phone number',
//                 labelText: 'phone',
//                 prefixIcon: Icon(Icons.abc)
//             ),),SizedBox(height: 20,),
//           TextFormField(  validator: (value){
//             if(value==null || value.isEmpty){
//               return 'enter valid data';
//             }
//             if(!RegExp(r"^[A-Za-z]+(?: [A-Za-z]+)*$").hasMatch(value))
//             {
//               return 'Only letters, spaces, dots, apostrophes, or hyphens';
//             }
//             return null;
//           },
//             controller: housename,
//             decoration: InputDecoration(
//                 border: OutlineInputBorder(),
//                 hintText: 'enter housename',
//                 labelText: 'housename',
//                 prefixIcon: Icon(Icons.abc)
//             ),),SizedBox(height: 20,),
//           TextFormField( validator: (value){
//             if(value==null || value.isEmpty){
//               return 'enter valid data';
//             }
//             if(!RegExp(r"^[A-Za-z]+(?: [A-Za-z]+)*$").hasMatch(value))
//             {
//               return 'Only letters, spaces, dots, apostrophes, or hyphens';
//             }
//             return null;
//           },
//             controller: post ,
//             decoration: InputDecoration(
//                 border: OutlineInputBorder(),
//                 hintText: 'enter post',
//                 labelText: 'post',
//                 prefixIcon: Icon(Icons.abc)
//             ),),SizedBox(height: 20,),
//           TextFormField( validator: (value){
//             if(value==null || value.isEmpty){
//               return 'enter valid data';
//             }
//             if(!RegExp(r"^\d{6}$").hasMatch(value))
//             {
//               return 'Exactly 6 digits';
//             }
//             return null;
//           },
//             controller: pin,
//             decoration: InputDecoration(
//                 border: OutlineInputBorder(),
//                 hintText: 'enter pin',
//                 labelText: 'pin',
//                 prefixIcon: Icon(Icons.abc)
//             ),),SizedBox(height: 20,),
//           TextFormField( validator: (value){
//             if(value==null || value.isEmpty){
//               return 'enter valid data';
//             }
//             if(!RegExp(r"^[A-Za-z]+(?: [A-Za-z]+)*$").hasMatch(value))
//             {
//               return 'Only letters, spaces, dots, apostrophes, or hyphens';
//             }
//             return null;
//           },
//             controller: place,
//             decoration: InputDecoration(
//                 border: OutlineInputBorder(),
//                 hintText: 'enter place',
//                 labelText: 'place',
//                 prefixIcon: Icon(Icons.abc)
//             ),),SizedBox(height: 20,),
//           TextFormField(  validator: (value){
//             if(value==null || value.isEmpty){
//               return 'enter valid data';
//             }
//             return null;
//           },
//             controller: latitude,
//             decoration: InputDecoration(
//                 border: OutlineInputBorder(),
//                 hintText: 'enter latitude',
//                 labelText: 'latitude',
//                 prefixIcon: Icon(Icons.abc)
//             ),),SizedBox(height: 20,),
//           TextFormField( validator: (value){
//             if(value==null || value.isEmpty){
//               return 'enter valid data';
//             }
//             return null;
//           },
//             controller: longitude,
//             decoration: InputDecoration(
//                 border: OutlineInputBorder(),
//                 hintText: 'enter longitude',
//                 labelText: 'longitude',
//                 prefixIcon: Icon(Icons.abc)
//             ),),SizedBox(height: 20,),
//
//           ElevatedButton(onPressed: () async {
//             if(!formkey.currentState!.validate()){
//               return;
//             }
//             SharedPreferences sh=await SharedPreferences.getInstance();
//             var request =   await http.MultipartRequest(
//                 'POST',
//                 Uri.parse('${sh.getString('ip')}/usereditprofile')
//             );
//
//             // 🔹 Normal Form Data
//             request.fields['id'] = widget.id;
//             request.fields['name'] = name.text;
//             request.fields['email'] = email.text;
//             request.fields['phone'] = phone.text;
//             request.fields['housename']=housename.text;
//             request.fields['post']=post.text;
//             request.fields['pin']=pin.text;
//             request.fields['place']=place.text;
//             request.fields['latitude']=latitude.text;
//             request.fields['longitude']=longitude.text;
//
//
//             // 🔹 File Upload Part
//             if (kIsWeb) {
//               request.files.add(http.MultipartFile.fromBytes(
//                 'file',
//                 _webFileBytes!,
//                 filename: _selectedFile!.name,
//               ));
//             } else {
//               request.files.add(await http.MultipartFile.fromPath(
//                 'file',
//                 _selectedFile!.path!,
//               ));
//             }
//
//             if (kIsWeb) {
//               request.files.add(http.MultipartFile.fromBytes(
//                 'file1',
//                 _webFileBytes1!,
//                 filename: _selectedFile1!.name,
//               ));
//             } else {
//               request.files.add(await http.MultipartFile.fromPath(
//                 'file',
//                 _selectedFile1!.path!,
//               ));
//             }
//             // =====================================================
//             // 🌐 END SERVER UPLOAD SECTION
//             // =====================================================
//
//             var response = await request.send();
//             var data = await response.stream.bytesToString();
//             var decoded = json.decode(data);
//
//             Navigator.push(context, MaterialPageRoute(builder: (context)=>viewprofile()));
//
//
//           }, child: Text('Update'))
//         ],)),),),),);
//   }
// }


import 'dart:convert';
import 'dart:io';
import 'package:file_picker/file_picker.dart';
import 'package:final_destination/login.dart';
import 'package:final_destination/viewprofile.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class editprofilesub extends StatefulWidget {
  final String id;
  final String name;
  final String email;
  final String phone;
  final String housename;
  final String post;
  final String pin;
  final String place;
  final String latitude;
  final String longitude;

  const editprofilesub({
    Key? key,
    required this.id,
    required this.name,
    required this.email,
    required this.phone,
    required this.housename,
    required this.post,
    required this.pin,
    required this.place,
    required this.latitude,
    required this.longitude,
  }) : super(key: key);

  @override
  State<editprofilesub> createState() => _editprofilesubState();
}

class _editprofilesubState extends State<editprofilesub> {
  final name = TextEditingController();
  final email = TextEditingController();
  final phone = TextEditingController();
  final housename = TextEditingController();
  final post = TextEditingController();
  final pin = TextEditingController();
  final place = TextEditingController();
  final latitude = TextEditingController();
  final longitude = TextEditingController();
  final formkey = GlobalKey<FormState>();

  PlatformFile? _selectedFile;
  Uint8List? _webFileBytes;
  PlatformFile? _selectedFile1;
  Uint8List? _webFileBytes1;

  bool _isLoading = false;
  bool _isProofValid = true;
  bool _isPhotoValid = true;

  @override
  void initState() {
    super.initState();
    name.text = widget.name;
    email.text = widget.email;
    phone.text = widget.phone;
    housename.text = widget.housename;
    post.text = widget.post;
    pin.text = widget.pin;
    place.text = widget.place;
    latitude.text = widget.latitude;
    longitude.text = widget.longitude;
  }

  // Validates name - only letters and spaces allowed
  String? _validateName(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter your name';
    }
    if (!RegExp(r'^[a-zA-Z ]+$').hasMatch(value)) {
      return 'Name can only contain letters and spaces';
    }
    if (value.length < 3) {
      return 'Name must be at least 3 characters long';
    }
    return null;
  }

  // Validates email format
  String? _validateEmail(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter your email address';
    }
    if (!RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$').hasMatch(value)) {
      return 'Please enter a valid email address (e.g., example@domain.com)';
    }
    return null;
  }

  // Validates phone number
  String? _validatePhone(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter your phone number';
    }
    if (!RegExp(r'^[0-9]{10}$').hasMatch(value)) {
      return 'Phone number must be 10 digits';
    }
    return null;
  }

  // Validates house name
  String? _validateHouseName(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter house name';
    }
    if (value.length < 3) {
      return 'House name must be at least 3 characters';
    }
    return null;
  }

  // Validates post
  String? _validatePost(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter post office';
    }
    if (value.length < 3) {
      return 'Post office must be at least 3 characters';
    }
    return null;
  }

  // Validates PIN code
  String? _validatePin(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter PIN code';
    }
    if (!RegExp(r'^[0-9]{6}$').hasMatch(value)) {
      return 'PIN code must be exactly 6 digits';
    }
    return null;
  }

  // Validates place
  String? _validatePlace(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter place';
    }
    if (value.length < 3) {
      return 'Place must be at least 3 characters';
    }
    return null;
  }

  // Validates latitude
  String? _validateLatitude(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter latitude';
    }
    // Check if it's a valid latitude (-90 to 90)
    try {
      double lat = double.parse(value);
      if (lat < -90 || lat > 90) {
        return 'Latitude must be between -90 and 90';
      }
    } catch (e) {
      return 'Please enter a valid number';
    }
    return null;
  }

  // Validates longitude
  String? _validateLongitude(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter longitude';
    }
    // Check if it's a valid longitude (-180 to 180)
    try {
      double lng = double.parse(value);
      if (lng < -180 || lng > 180) {
        return 'Longitude must be between -180 and 180';
      }
    } catch (e) {
      return 'Please enter a valid number';
    }
    return null;
  }

  // Validates file type for proof
  Future<bool> _validateProofFile() async {
    if (_selectedFile == null) {
      // User can skip uploading new proof
      return true;
    }

    String? fileName = _selectedFile!.name;
    if (fileName == null || fileName.isEmpty) {
      return false;
    }

    // Check file extension
    List<String> allowedExtensions = ['.jpg', '.jpeg', '.png', '.pdf', '.doc', '.docx'];
    String extension = fileName.toLowerCase().substring(fileName.lastIndexOf('.'));

    if (!allowedExtensions.contains(extension)) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Invalid file type. Please upload JPG, PNG, PDF or DOC files'),
          backgroundColor: Colors.red,
        ),
      );
      return false;
    }

    // Check file size (max 5MB)
    if (_selectedFile!.size > 5 * 1024 * 1024) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('File size too large. Maximum size is 5MB'),
          backgroundColor: Colors.red,
        ),
      );
      return false;
    }

    return true;
  }

  // Validates file type for photo
  Future<bool> _validatePhotoFile() async {
    if (_selectedFile1 == null) {
      // User can skip uploading new photo
      return true;
    }

    String? fileName = _selectedFile1!.name;
    if (fileName == null || fileName.isEmpty) {
      return false;
    }

    // Check file extension for images only
    List<String> allowedExtensions = ['.jpg', '.jpeg', '.png'];
    String extension = fileName.toLowerCase().substring(fileName.lastIndexOf('.'));

    if (!allowedExtensions.contains(extension)) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Invalid file type. Please upload JPG or PNG images only'),
          backgroundColor: Colors.red,
        ),
      );
      return false;
    }

    // Check file size (max 2MB for photos)
    if (_selectedFile1!.size > 2 * 1024 * 1024) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Image size too large. Maximum size is 2MB'),
          backgroundColor: Colors.red,
        ),
      );
      return false;
    }

    return true;
  }

  Future<void> _pickFile() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      allowMultiple: false,
      type: FileType.custom,
      allowedExtensions: ['jpg', 'jpeg', 'png', 'pdf', 'doc', 'docx'],
    );

    if (result != null) {
      setState(() {
        _selectedFile = result.files.first;
      });

      if (kIsWeb) {
        _webFileBytes = result.files.first.bytes;
      }

      // Validate the file
      bool isValid = await _validateProofFile();
      setState(() {
        _isProofValid = isValid;
      });
    }
  }

  Future<void> _pickFile1() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      allowMultiple: false,
      type: FileType.image,
      allowedExtensions: ['jpg', 'jpeg', 'png'],
    );

    if (result != null) {
      setState(() {
        _selectedFile1 = result.files.first;
      });

      if (kIsWeb) {
        _webFileBytes1 = result.files.first.bytes;
      }

      // Validate the file
      bool isValid = await _validatePhotoFile();
      setState(() {
        _isPhotoValid = isValid;
      });
    }
  }

  // Validates the entire form including files
  Future<bool> _validateForm() async {
    // Validate text fields
    if (!formkey.currentState!.validate()) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Please fill all required fields correctly'),
          backgroundColor: Colors.orange,
        ),
      );
      return false;
    }

    // Validate proof file
    if (!_isProofValid && _selectedFile != null) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Please upload a valid proof document'),
          backgroundColor: Colors.red,
        ),
      );
      return false;
    }

    // Validate photo file
    if (!_isPhotoValid && _selectedFile1 != null) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Please upload a valid profile photo'),
          backgroundColor: Colors.red,
        ),
      );
      return false;
    }

    return true;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF1A237E),
        elevation: 0,
        title: Text(
          'Edit Profile',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Color(0xFF1A237E).withOpacity(0.1),
              Color(0xFF3949AB).withOpacity(0.05),
              Colors.white,
            ],
          ),
        ),
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Form(
              key: formkey,
              autovalidateMode: AutovalidateMode.onUserInteraction,
              child: Column(
                children: [
                  // Profile Photo Section
                  Card(
                    elevation: 5,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(20),
                      child: Column(
                        children: [
                          Row(
                            children: [
                              Icon(
                                Icons.camera_alt,
                                color: Color(0xFF1A237E),
                              ),
                              SizedBox(width: 10),
                              Text(
                                'Profile Photo',
                                style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                  color: Color(0xFF1A237E),
                                ),
                              ),
                              SizedBox(width: 10),
                              Text(
                                '(Optional)',
                                style: TextStyle(
                                  fontSize: 14,
                                  color: Colors.grey[600],
                                  fontStyle: FontStyle.italic,
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 10),
                          Text(
                            'Upload JPG/PNG image (Max 2MB)',
                            style: TextStyle(
                              fontSize: 14,
                              color: Colors.grey[600],
                            ),
                          ),
                          SizedBox(height: 15),
                          _buildFileUpload(
                            label: 'Upload Profile Photo',
                            selectedFile: _selectedFile1,
                            isValid: _isPhotoValid,
                            onPressed: _pickFile1,
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: 20),

                  // Proof Document Section
                  Card(
                    elevation: 5,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(20),
                      child: Column(
                        children: [
                          Row(
                            children: [
                              Icon(
                                Icons.document_scanner,
                                color: Color(0xFF1A237E),
                              ),
                              SizedBox(width: 10),
                              Text(
                                'Proof Document',
                                style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                  color: Color(0xFF1A237E),
                                ),
                              ),
                              SizedBox(width: 10),
                              Text(
                                '(Optional)',
                                style: TextStyle(
                                  fontSize: 14,
                                  color: Colors.grey[600],
                                  fontStyle: FontStyle.italic,
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 10),
                          Text(
                            'Upload JPG/PNG/PDF/DOC file (Max 5MB)',
                            style: TextStyle(
                              fontSize: 14,
                              color: Colors.grey[600],
                            ),
                          ),
                          SizedBox(height: 15),
                          _buildFileUpload(
                            label: 'Upload Proof Document',
                            selectedFile: _selectedFile,
                            isValid: _isProofValid,
                            onPressed: _pickFile,
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: 20),

                  // Personal Information Section
                  Card(
                    elevation: 5,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Icon(
                                Icons.person_outline,
                                color: Color(0xFF1A237E),
                              ),
                              SizedBox(width: 10),
                              Text(
                                'Personal Information',
                                style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                  color: Color(0xFF1A237E),
                                ),
                              ),
                              SizedBox(width: 10),
                              Text(
                                '(Required)',
                                style: TextStyle(
                                  fontSize: 14,
                                  color: Colors.red,
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 20),
                          _buildTextField(
                            controller: name,
                            label: 'Full Name *',
                            hint: 'Enter your full name',
                            icon: Icons.person,
                            validator: _validateName,
                          ),
                          SizedBox(height: 15),
                          _buildTextField(
                            controller: email,
                            label: 'Email Address *',
                            hint: 'Enter your email',
                            icon: Icons.email,
                            validator: _validateEmail,
                          ),
                          SizedBox(height: 15),
                          _buildTextField(
                            controller: phone,
                            label: 'Phone Number *',
                            hint: 'Enter 10-digit phone number',
                            icon: Icons.phone,
                            validator: _validatePhone,
                            keyboardType: TextInputType.phone,
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: 20),

                  // Address Information Section
                  Card(
                    elevation: 5,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Icon(
                                Icons.home_outlined,
                                color: Color(0xFF1A237E),
                              ),
                              SizedBox(width: 10),
                              Text(
                                'Address Information',
                                style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                  color: Color(0xFF1A237E),
                                ),
                              ),
                              SizedBox(width: 10),
                              Text(
                                '(Required)',
                                style: TextStyle(
                                  fontSize: 14,
                                  color: Colors.red,
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 20),
                          _buildTextField(
                            controller: housename,
                            label: 'House Name *',
                            hint: 'Enter house name',
                            icon: Icons.house,
                            validator: _validateHouseName,
                          ),
                          SizedBox(height: 15),
                          _buildTextField(
                            controller: post,
                            label: 'Post Office *',
                            hint: 'Enter post office',
                            icon: Icons.local_post_office,
                            validator: _validatePost,
                          ),
                          SizedBox(height: 15),
                          Row(
                            children: [
                              Expanded(
                                child: _buildTextField(
                                  controller: place,
                                  label: 'Place *',
                                  hint: 'Enter place',
                                  icon: Icons.place,
                                  validator: _validatePlace,
                                ),
                              ),
                              SizedBox(width: 15),
                              Expanded(
                                child: _buildTextField(
                                  controller: pin,
                                  label: 'PIN Code *',
                                  hint: '6-digit PIN code',
                                  icon: Icons.pin,
                                  validator: _validatePin,
                                  keyboardType: TextInputType.number,
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 15),
                          Row(
                            children: [
                              Expanded(
                                child: _buildTextField(
                                  controller: latitude,
                                  label: 'Latitude *',
                                  hint: 'Enter latitude (-90 to 90)',
                                  icon: Icons.location_on,
                                  validator: _validateLatitude,
                                  keyboardType: TextInputType.numberWithOptions(decimal: true),
                                ),
                              ),
                              SizedBox(width: 15),
                              Expanded(
                                child: _buildTextField(
                                  controller: longitude,
                                  label: 'Longitude *',
                                  hint: 'Enter longitude (-180 to 180)',
                                  icon: Icons.location_on,
                                  validator: _validateLongitude,
                                  keyboardType: TextInputType.numberWithOptions(decimal: true),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: 30),

                  // Update Button
                  Container(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () async {
                        if (await _validateForm()) {
                          await _submitForm();
                        }
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Color(0xFF1A237E),
                        foregroundColor: Colors.white,
                        padding: EdgeInsets.symmetric(vertical: 16),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        elevation: 3,
                      ),
                      child: _isLoading
                          ? Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SizedBox(
                            width: 20,
                            height: 20,
                            child: CircularProgressIndicator(
                              color: Colors.white,
                              strokeWidth: 2,
                            ),
                          ),
                          SizedBox(width: 10),
                          Text('Updating Profile...'),
                        ],
                      )
                          : Text(
                        'Update Profile',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 20),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildFileUpload({
    required String label,
    required PlatformFile? selectedFile,
    required bool isValid,
    required VoidCallback onPressed,
  }) {
    return Column(
      children: [
        ElevatedButton(
          onPressed: onPressed,
          style: ElevatedButton.styleFrom(
            backgroundColor: isValid ? Color(0xFF1A237E) : Colors.red,
            foregroundColor: Colors.white,
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 12),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(isValid ? Icons.cloud_upload : Icons.error),
              SizedBox(width: 10),
              Text(label),
            ],
          ),
        ),
        if (selectedFile != null) ...[
          SizedBox(height: 10),
          Container(
            padding: EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: isValid ? Colors.green[50] : Colors.red[50],
              borderRadius: BorderRadius.circular(10),
              border: Border.all(
                color: isValid ? Colors.green[100]! : Colors.red[100]!,
              ),
            ),
            child: Row(
              children: [
                Icon(
                  isValid ? Icons.check_circle : Icons.error,
                  color: isValid ? Colors.green : Colors.red,
                  size: 20,
                ),
                SizedBox(width: 10),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        selectedFile.name,
                        style: TextStyle(
                          color: isValid ? Colors.green[800] : Colors.red[800],
                          fontWeight: FontWeight.w500,
                        ),
                        overflow: TextOverflow.ellipsis,
                      ),
                      SizedBox(height: 4),
                      Text(
                        '${(selectedFile.size / 1024).toStringAsFixed(1)} KB',
                        style: TextStyle(
                          color: Colors.grey[600],
                          fontSize: 12,
                        ),
                      ),
                    ],
                  ),
                ),
                if (!isValid) ...[
                  SizedBox(width: 10),
                  IconButton(
                    icon: Icon(Icons.close, size: 18),
                    color: Colors.red,
                    onPressed: () {
                      setState(() {
                        if (selectedFile == _selectedFile) {
                          _selectedFile = null;
                          _webFileBytes = null;
                        } else {
                          _selectedFile1 = null;
                          _webFileBytes1 = null;
                        }
                      });
                    },
                  ),
                ],
              ],
            ),
          ),
        ],
      ],
    );
  }

  Widget _buildTextField({
    required TextEditingController controller,
    required String label,
    required String hint,
    required IconData icon,
    required String? Function(String?) validator,
    TextInputType keyboardType = TextInputType.text,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: TextStyle(
            fontWeight: FontWeight.w600,
            color: Colors.grey[700],
            fontSize: 14,
          ),
        ),
        SizedBox(height: 5),
        TextFormField(
          controller: controller,
          validator: validator,
          keyboardType: keyboardType,
          decoration: InputDecoration(
            hintText: hint,
            prefixIcon: Icon(icon, color: Color(0xFF1A237E)),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide(color: Colors.grey[300]!),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide(color: Color(0xFF1A237E)),
            ),
            errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide(color: Colors.red),
            ),
            focusedErrorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide(color: Colors.red),
            ),
            filled: true,
            fillColor: Colors.grey[50],
            contentPadding: EdgeInsets.symmetric(horizontal: 15, vertical: 15),
          ),
        ),
      ],
    );
  }

  Future<void> _submitForm() async {
    setState(() {
      _isLoading = true;
    });

    try {
      SharedPreferences sh = await SharedPreferences.getInstance();
      var request = http.MultipartRequest(
        'POST',
        Uri.parse('${sh.getString('ip')}/usereditprofile'),
      );

      // Form Data
      request.fields['id'] = widget.id;
      request.fields['name'] = name.text.trim();
      request.fields['email'] = email.text.trim();
      request.fields['phone'] = phone.text.trim();
      request.fields['housename'] = housename.text.trim();
      request.fields['post'] = post.text.trim();
      request.fields['pin'] = pin.text.trim();
      request.fields['place'] = place.text.trim();
      request.fields['latitude'] = latitude.text.trim();
      request.fields['longitude'] = longitude.text.trim();

      // File Upload - Proof (optional)
      if (_selectedFile != null && _isProofValid) {
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
      }

      // File Upload - Photo (optional)
      if (_selectedFile1 != null && _isPhotoValid) {
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
      }

      var response = await request.send();
      var data = await response.stream.bytesToString();
      var decoded = json.decode(data);

      setState(() {
        _isLoading = false;
      });

      if (response.statusCode == 200 && decoded['status'] == 'success') {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Profile updated successfully!'),
            backgroundColor: Colors.green,
            duration: Duration(seconds: 3),
          ),
        );

        // Navigate back after successful update
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => viewprofile()),
        );
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Failed to update profile: ${decoded['message'] ?? 'Unknown error'}'),
            backgroundColor: Colors.red,
          ),
        );
      }
    } catch (e) {
      setState(() {
        _isLoading = false;
      });

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Error: ${e.toString()}'),
          backgroundColor: Colors.red,
        ),
      );
    }
  }

  @override
  void dispose() {
    name.dispose();
    email.dispose();
    phone.dispose();
    housename.dispose();
    post.dispose();
    pin.dispose();
    place.dispose();
    latitude.dispose();
    longitude.dispose();
    super.dispose();
  }
}