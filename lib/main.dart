import 'package:flutter/material.dart';
import 'package:introduction_screen/introduction_screen.dart';
import './homepage.dart';

void main() => runApp(App());

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Introduction screen',
      debugShowCheckedModeBanner: false,
      home: OnBoardingPage(),
    );
  }
}

class OnBoardingPage extends StatefulWidget {
  @override
  _OnBoardingPageState createState() => _OnBoardingPageState();
}

class _OnBoardingPageState extends State<OnBoardingPage> {
  final introKey = GlobalKey<IntroductionScreenState>();

  void _onIntroEnd(context) {
    Navigator.of(context).pushReplacement(
      MaterialPageRoute(builder: (_) => HomePage()),
    );
  }

  Widget _buildImage(
    String assetName,
  ) {
    return Image.asset(
      'assets/$assetName',
    );
  }

  @override
  Widget build(BuildContext context) {
    PageDecoration pageDecoration = PageDecoration(
      titleTextStyle: const TextStyle(
          fontSize: 28.0,
          color: Color(0xFF7C41A3),
          fontWeight: FontWeight.w700),
      bodyTextStyle: TextStyle(fontSize: 19.0, color: Colors.pink.shade300),
      descriptionPadding: const EdgeInsets.fromLTRB(16.0, 0.0, 16.0, 16.0),
      pageColor: Colors.white,
      imagePadding: EdgeInsets.zero,
    );

    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: NetworkImage(
                "https://image.freepik.com/free-photo/abstract-background-design_196038-2086.jpg"),
                fit: BoxFit.cover
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 50.0),
          child: IntroductionScreen(
            key: introKey,
            globalBackgroundColor: Colors.white,
            globalFooter: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: 150,
                  height: 60,
                  decoration: BoxDecoration(
                      color: Colors.pink.shade300,
                      borderRadius: BorderRadius.circular(50)),
                  child: FlatButton(
                    child: const Text(
                      'Sign in',
                      style: TextStyle(
                          fontSize: 16.0,
                          fontWeight: FontWeight.bold,
                          color: Colors.white),
                    ),
                    onPressed: () => _onIntroEnd(context),
                  ),
                ),
                SizedBox(
                  width: 30,
                ),
                Container(
                  width: 150,
                  height: 60,
                  decoration: BoxDecoration(
                      color: Colors.pink.shade300,
                      borderRadius: BorderRadius.circular(50)),
                  child: FlatButton(
                    child: const Text(
                      'Sign up',
                      style: TextStyle(
                          fontSize: 16.0,
                          fontWeight: FontWeight.bold,
                          color: Colors.white),
                    ),
                    onPressed: () => _onIntroEnd(context),
                  ),
                ),
              ],
            ),
            pages: [
              PageViewModel(
                title: "Mindfulness for\nfor a better you",
                body: "Learn to live happier",
                decoration: pageDecoration,
                image: Image.network(
                    "https://graphicriver.img.customer.envatousercontent.com/files/309616965/preview.jpg?auto=compress%2Cformat&fit=crop&crop=top&w=590&h=590&s=eda2c18154e046149f6aee32c5f90774"),
              ),
            ],
            showSkipButton: false,
            showDoneButton: false,
            showNextButton: false,
          ),
        ),
      ),
    );
  }
}
