import 'package:class_network/pages/login_page.dart';
import 'package:class_network/widgets/icon_cn.dart';
import 'package:flutter/material.dart';

class SplashScreenPage extends StatefulWidget {
  const SplashScreenPage({
    Key key,
  }) : super(key: key);

  @override
  _SplashScreenPageState createState() => _SplashScreenPageState();
}

class _SplashScreenPageState extends State<SplashScreenPage> {
  @override
  void initState() {
    super.initState();
    Future.delayed(
      Duration(
        seconds: 2,
      ),
      () {
        Navigator.pushReplacement(
          context,
          PageRouteBuilder(
            transitionDuration: Duration(seconds: 2),
            pageBuilder: (_, __, ___) => LoginPage(),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          SizedBox(
            height: 20.0,
          ),
          IconWidget_CN(),
          SizedBox(
            height: 20.0,
          ),
          Column(
            children: [
              Center(
                child: Row(
                  children: [
                    Image.asset(
                      'assets/images/logo.png',
                      scale: 30,
                    ),
                    SizedBox(
                      width: 20.0,
                    ),
                    Text(
                      "ORSHWARE",
                      style: TextStyle(
                        color: Colors.blueAccent[700],
                        fontSize: 25.0,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ],
                  mainAxisSize: MainAxisSize.min,
                ),
              ),
              SizedBox(
                height: 50.0,
              ),
            ],
          ),
        ],
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
      ),
    );
  }
}
