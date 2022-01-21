import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  _customNavigationBar() {

        return Container(
                    //           decoration: BoxDecoration(
                    //   gradient: LinearGradient(
                    //     begin: Alignment.topLeft,
                    //     end: Alignment.topRight,
                    //     colors: [Colors.pink.shade300, Colors.pink.shade100],
                    //   ),
                    // ),
          height: 60,
          child: Stack(
            children: <Widget>[
              Positioned(
                bottom: 0,
                child: ClipPath(
                  clipper: NavBarClipper(),
                  child: Container(
                    height: 60,
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.topLeft,
                        end: Alignment.topRight,
                        colors: [Colors.pink.shade300, Colors.pink.shade100],
                      ),
                    ),
                  ),
                ),
              ),
              Positioned(
                bottom: 10,
                width: MediaQuery.of(context).size.width,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  //  _navItem(),
                  children: const [
                    Icon(
                      Icons.home,
                      size: 30,
                      color: Colors.purple,
                    ),
                    Icon(
                      Icons.nightlight,
                      size: 30,
                      color: Colors.purple,
                    ),
                    Icon(
                      Icons.menu,
                      size: 30,
                      color: Colors.purple,
                    ),
                    Icon(
                      Icons.library_music,
                      size: 30,
                      color: Colors.purple,
                    ),
                    Icon(
                      Icons.person,
                      size: 30,
                      color: Colors.purple,
                    ),
                  ],
                ),
              )
            ],
          ),
        );
    //  }
   // );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: _customNavigationBar(),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
              image: NetworkImage(
                "https://image.freepik.com/free-photo/abstract-background-design_196038-2086.jpg",
              ),
              fit: BoxFit.cover),
        ),
        child: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 10),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  height: 25,
                ),
                const Text(
                  "Explore Meditation",
                  style: TextStyle(
                      fontSize: 40,
                      fontWeight: FontWeight.bold,
                      color: Colors.purple),
                ),
                SizedBox(
                  height: 20,
                ),
                ReuseScrollWidget(
                  category: "Categories",
                  cwid: 120,
                  cht: 120,
                  isize: 60,
                ),
                SizedBox(
                  height: 20,
                ),
                ReuseScrollWidget(
                  category: "Meditation Basics",
                  cwid: 220,
                  cht: 160,
                  isize: 80,
                ),
                SizedBox(
                  height: 20,
                ),
                ReuseScrollWidget(
                  category: "Recommended",
                  cwid: 280,
                  cht: 180,
                  isize: 100,
                ),
                // SizedBox(height: 05,)
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class ReuseScrollWidget extends StatelessWidget {
  double cwid, cht, isize;
  String category;
  ReuseScrollWidget(
      {required this.category,
      required this.cwid,
      required this.cht,
      required this.isize});

  @override
  Widget build(BuildContext context) {
    Widget ReUseContainer(double cwid, double cht, double isize) {
      return Column(
        children: [
          Container(
            width: cwid,
            height: cht,
            decoration: BoxDecoration(
                color: Colors.pink.shade100,
                border: Border.all(width: 5, color: Colors.purple),
                borderRadius: BorderRadius.circular(20)),
            child: Icon(
              Icons.category,
              size: isize,
              color: Colors.pink.shade300,
            ),
          ),
          SizedBox(
            height: 05,
          ),
          Text("category")
        ],
      );
    }

    return Align(
      alignment: Alignment.topLeft,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            category,
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          SizedBox(
            height: 10,
          ),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: [
                ReUseContainer(
                  cwid,
                  cht,
                  isize,
                ),
                SizedBox(
                  width: 05,
                ),
                ReUseContainer(
                  cwid,
                  cht,
                  isize,
                ),
                SizedBox(
                  width: 05,
                ),
                ReUseContainer(
                  cwid,
                  cht,
                  isize,
                ),
                SizedBox(
                  width: 05,
                ),
                ReUseContainer(
                  cwid,
                  cht,
                  isize,
                ),
                SizedBox(
                  width: 05,
                ),
                ReUseContainer(
                  cwid,
                  cht,
                  isize,
                ),
                SizedBox(
                  width: 05,
                ),
                ReUseContainer(
                  cwid,
                  cht,
                  isize,
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}

class NavBarClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();
    var sw = size.width;
    var sh = size.height;

    path.cubicTo(sw / 12, 0, sw / 12, 2 * sh / 12, 2 * sw / 12, 2 * sh / 9);

    path.cubicTo(3 * sw / 12, 2 * sh / 9, 3 * sw / 12, 0, 4 * sw / 12, 0);

    path.cubicTo(
        5 * sw / 12, 0, 5 * sw / 12, 2 * sh / 12, 6 * sw / 12, 2 * sh / 9);

    path.cubicTo(7 * sw / 12, 2 * sh / 9, 7 * sw / 12, 0, 8 * sw / 12, 0);

    path.cubicTo(
        9 * sw / 12, 0, 9 * sw / 12, 2 * sh / 12, 10 * sw / 12, 2 * sh / 9);

    path.cubicTo(11 * sw / 12, 2 * sh / 9, 11 * sw / 12, 0, sw, 0);
    path.lineTo(sw, sh);
    path.lineTo(0, sh);
    path.close();
    return path;
  }

  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}
