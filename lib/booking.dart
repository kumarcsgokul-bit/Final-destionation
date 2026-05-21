// import 'package:final_destination/viewpackage.dart';
// import 'package:http/http.dart' as http;
// import 'package:flutter/material.dart';
// import 'package:shared_preferences/shared_preferences.dart';
//
// void main(){
//   runApp(booking());
// }
//
// class booking extends StatelessWidget {
//   const booking({Key? key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(home: bookingsub(),);
//   }
// }
// class bookingsub extends StatefulWidget {
//   const bookingsub({Key? key}) : super(key: key);
//
//   @override
//   State<bookingsub> createState() => _bookingsubState();
// }
//
// class _bookingsubState extends State<bookingsub> {
//   final totalperson=TextEditingController();
//   final provide_date=TextEditingController();
//   final formkey=GlobalKey<FormState>();
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(body: Center(child: SingleChildScrollView(child: SizedBox(height: 500,width: 500,child:
//     Form(key: formkey,
//     child: Column(children: [
//       TextFormField(validator: (value){
//         if(value==null || value.isEmpty){
//           return 'enter valid data';
//         }
//         return null;
//       },
//         controller: totalperson,
//       decoration: InputDecoration(
//         border: OutlineInputBorder(),
//         hintText: 'enter total persons',
//         labelText: 'total persons',
//         prefixIcon: Icon(Icons.abc)
//       ),),SizedBox(height: 20,),
//       TextFormField(validator: (value){
//         if(value==null || value.isEmpty){
//           return 'enter valid data';
//         }
//         return null;
//       },
//         controller: provide_date,
//       decoration: InputDecoration(
//         border: OutlineInputBorder(),
//         hintText: 'provide date',
//         labelText: 'date',
//         prefixIcon: Icon(Icons.date_range)
//       ),),SizedBox(height: 20,),
//       ElevatedButton(onPressed: () async {
//       if(!formkey.currentState!.validate()) {
//         return;
//       }
//         SharedPreferences sh=await SharedPreferences.getInstance();
//         var data=await http.post(Uri.parse('${sh.getString('ip')}/userbooking'),
//         body: {
//           'totalperson':totalperson.text,
//           'provide_date':provide_date.text,
//           'ownid':sh.getString('ownid').toString(),
//           'uid':sh.getString('uid').toString()
//         });
//
//         Navigator.push(context, MaterialPageRoute(builder: (context)=>viewpackage()));
//       }, child: Text('book'))
//     ],),),),),),);
//   }
// }
//

import 'package:final_destination/viewpackage.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:final_destination/home.dart';

void main() {
  runApp(booking());
}

class booking extends StatelessWidget {
  const booking({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: const Color(0xFF0F2A1D),
        scaffoldBackgroundColor: const Color(0xFFE3EED4),
        fontFamily: 'Poppins',
      ),
      home: bookingsub(),
    );
  }
}

class bookingsub extends StatefulWidget {
  const bookingsub({Key? key}) : super(key: key);

  @override
  State<bookingsub> createState() => _bookingsubState();
}

class _bookingsubState extends State<bookingsub> {
  final totalperson = TextEditingController();
  final provide_date = TextEditingController();
  final formkey = GlobalKey<FormState>();
  bool _isLoading = false;

  Future<void> _selectDate() async {
    DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime.now(),
      lastDate: DateTime.now().add(const Duration(days: 365)),
      builder: (BuildContext context, Widget? child) {
        return Theme(
          data: ThemeData.light().copyWith(
            primaryColor: const Color(0xFF0F2A1D),
            colorScheme: const ColorScheme.light(
              primary: Color(0xFF0F2A1D),
              onPrimary: Colors.white,
              surface: Colors.white,
              onSurface: Color(0xFF0F2A1D),
            ),
            dialogBackgroundColor: Colors.white,
          ),
          child: child!,
        );
      },
    );

    if (pickedDate != null) {
      String formattedDate = "${pickedDate.day.toString().padLeft(2, '0')}/${pickedDate.month.toString().padLeft(2, '0')}/${pickedDate.year}";
      setState(() {
        provide_date.text = formattedDate;
      });
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
          'Book Package',
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
            MaterialPageRoute(builder: (context) => viewpackage()),
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
                          Icons.book_online,
                          size: 45,
                          color: Colors.white,
                        ),
                      ),
                      const SizedBox(height: 16),
                      const Text(
                        'Book Your Adventure',
                        style: TextStyle(
                          fontSize: 28,
                          fontWeight: FontWeight.w800,
                          color: Color(0xFF0F2A1D),
                          fontFamily: 'Poppins',
                        ),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        'Fill in the details to book your package',
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
                          // Total Persons Field
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  Text(
                                    'Total Persons',
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
                                    return 'Please enter total persons';
                                  }
                                  if (int.tryParse(value) == null) {
                                    return 'Please enter a valid number';
                                  }
                                  if (int.parse(value) <= 0) {
                                    return 'Number of persons must be greater than 0';
                                  }
                                  return null;
                                },
                                controller: totalperson,
                                keyboardType: TextInputType.number,
                                decoration: InputDecoration(
                                  hintText: 'Enter number of persons',
                                  hintStyle: TextStyle(
                                    color: const Color(0xFF0F2A1D).withOpacity(0.4),
                                    fontFamily: 'Poppins',
                                  ),
                                  prefixIcon: const Icon(
                                    Icons.people,
                                    color: Color(0xFF0F2A1D),
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
                                  fontSize: 16,
                                  color: Color(0xFF0F2A1D),
                                  fontFamily: 'Poppins',
                                ),
                              ),
                            ],
                          ),

                          const SizedBox(height: 20),

                          // Date Field with Calendar Picker
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  Text(
                                    'Travel Date',
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
                              GestureDetector(
                                onTap: _selectDate,
                                child: AbsorbPointer(
                                  child: TextFormField(
                                    validator: (value) {
                                      if (value == null || value.isEmpty) {
                                        return 'Please select travel date';
                                      }
                                      return null;
                                    },
                                    controller: provide_date,
                                    decoration: InputDecoration(
                                      hintText: 'DD/MM/YYYY',
                                      hintStyle: TextStyle(
                                        color: const Color(0xFF0F2A1D).withOpacity(0.4),
                                        fontFamily: 'Poppins',
                                      ),
                                      prefixIcon: const Icon(
                                        Icons.calendar_today,
                                        color: Color(0xFF0F2A1D),
                                      ),
                                      suffixIcon: Container(
                                        margin: const EdgeInsets.all(8),
                                        decoration: BoxDecoration(
                                          color: const Color(0xFF0F2A1D).withOpacity(0.1),
                                          borderRadius: BorderRadius.circular(10),
                                        ),
                                        child: IconButton(
                                          icon: const Icon(
                                            Icons.date_range,
                                            color: Color(0xFF0F2A1D),
                                            size: 20,
                                          ),
                                          onPressed: _selectDate,
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
                                      fontSize: 16,
                                      color: Color(0xFF0F2A1D),
                                      fontFamily: 'Poppins',
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),

                          const SizedBox(height: 32),

                          // Booking Info Card
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
                                  Icons.info_outline,
                                  color: Color(0xFF0F2A1D),
                                  size: 20,
                                ),
                                const SizedBox(width: 12),
                                Expanded(
                                  child: Text(
                                    'Please ensure all details are correct before booking',
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

                          const SizedBox(height: 30),

                          // Book Button
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
                                  SharedPreferences sh = await SharedPreferences.getInstance();
                                  var data = await http.post(
                                    Uri.parse('${sh.getString('ip')}/userbooking'),
                                    body: {
                                      'totalperson': totalperson.text,
                                      'provide_date': provide_date.text,
                                      'ownid': sh.getString('ownid').toString(),
                                      'uid': sh.getString('uid').toString()
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
                                                'Booking successful!',
                                                style: TextStyle(
                                                  fontFamily: 'Poppins',
                                                ),
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
                                  Navigator.pushReplacement(
                                    context,
                                    MaterialPageRoute(builder: (context) => viewpackage()),
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
                                              'Booking failed. Please try again.',
                                              style: TextStyle(
                                                fontFamily: 'Poppins',
                                              ),
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
                                  Icon(Icons.book_online, size: 22),
                                  SizedBox(width: 10),
                                  Text(
                                    'CONFIRM BOOKING',
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
                                  MaterialPageRoute(builder: (context) => viewpackage()),
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
    totalperson.dispose();
    provide_date.dispose();
    super.dispose();
  }
}