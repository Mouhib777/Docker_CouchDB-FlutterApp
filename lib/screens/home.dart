import 'package:flutter/material.dart';
import 'package:flutter_application_3/screens/lcs_imStudents.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:http/http.dart' as http;

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;
    return WillPopScope(
      onWillPop: () async {
        return false;
      },
      child: Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                width: screenWidth * 0.93,
                child: ElevatedButton(
                  onPressed: () async {
                    final response = await http.get(
                      Uri.parse('http://20.189.116.244:5984'),
                    );
                    print(
                      "Status code: ${response.statusCode}\n${response.body}",
                    );
                    EasyLoading.showInfo(
                        "Status code: ${response.statusCode}\n${response.body}",
                        duration: Duration(seconds: 12));
                  },
                  child: Text("Test CouchDB Container",
                      style: TextStyle(
                          fontSize: 22,
                          color: Colors.white,
                          fontWeight: FontWeight.bold)),
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.red,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10))),
                ),
              ),
              SizedBox(
                height: screenHeight * 0.05,
              ),
              SizedBox(
                width: screenWidth * 0.93,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).push(PageRouteBuilder(
                        transitionDuration: Duration.zero,
                        pageBuilder: (context, animation, secondaryAnimation) =>
                            Lcs_im_Students()));
                  },
                  child: Text("Get students from CouchDB",
                      style: TextStyle(
                          fontSize: 22,
                          color: Colors.white,
                          fontWeight: FontWeight.bold)),
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.red,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10))),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
