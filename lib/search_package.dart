import 'dart:convert';

import 'package:final_destination/booking.dart';
import 'package:final_destination/view_extradetails.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

void main(){
  runApp(search_viewpackage());

}
class search_viewpackage extends StatelessWidget {
  const search_viewpackage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: search_viewpackagesub(),);
  }
}
class search_viewpackagesub extends StatefulWidget {
  const search_viewpackagesub({Key? key}) : super(key: key);

  @override
  State<search_viewpackagesub> createState() => _search_viewpackagesubState();
}

class _search_viewpackagesubState extends State<search_viewpackagesub> {
  Future<List<Joke>> _getJokes() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String b = prefs.getString("lid").toString();
    String foodimage="";
    var data =
    await http.post(Uri.parse(prefs.getString("ip").toString()+"/search_userviewpackage"),
        body: {"id":b}
    );

    var jsonData = json.decode(data.body);
//    print(jsonData);
    List<Joke> jokes = [];
    for (var joke in jsonData["message"]) {
      print(joke);
      Joke newJoke = Joke(
        joke["id"].toString(),
        joke["title"].toString(),
        joke["category"].toString(),
        joke["name"].toString(),
        joke["package_details"],
        joke["guide_no"],
        joke["amount"].toString(),
        prefs.getString('ip').toString()+joke["photo"].toString(),

      );
      jokes.add(newJoke);
    }
    return jokes;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(body:
    Container(

      child:
      FutureBuilder(
        future: _getJokes(),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
//              print("snapshot"+snapshot.toString());
          if (snapshot.data == null) {
            return Container(
              child: Center(
                child: Text("Loading..."),
              ),
            );
          } else {
            return ListView.builder(
              itemCount: snapshot.data.length,
              itemBuilder: (BuildContext context, int index) {
                var i = snapshot.data![index];
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Card(
                    elevation: 3,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                      side: BorderSide(color: Colors.grey.shade300),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [

                          SizedBox(height: 10),

                          _buildRow("title:", i.title.toString()),
                          _buildRow("category", i.category.toString()),
                          _buildRow("name:", i.name.toString()),
                          _buildRow("package_details:", i.package_details.toString()),
                          _buildRow("guide contact number:", i.guide_no.toString()),
                          _buildRow("amount:", i.amount.toString()),
                          Image.network(i.photo.toString(),height: 200,width: 200,),


                        ],
                      ),
                    ),
                  ),
                );
              },
            );


          }
        },


      ),





    ),
    );
  }
  Widget _buildRow(String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        children: [
          SizedBox(
            width: 100,
            child: Text(
              label,
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          SizedBox(width: 5),
          Flexible(
            child: Text(
              value,
              style: TextStyle(
                color: Colors.grey.shade800,
              ),
            ),
          ),
        ],
      ),
    );
  }

}
class Joke {
  final String id;
  final String title;
  final String category;
  final String name;
  final String package_details;
  final String guide_no;
  final String amount;
  final String photo;



  Joke(this.id,this.title,this.category,this.name,this.package_details,this.guide_no, this.amount,this.photo);
//  print("hiiiii");
}