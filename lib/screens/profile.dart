import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:polygon_clipper/polygon_clipper.dart';

final List<String> imgList = [
  'images/streamhuddle-screenshot.png',
  'images/txgun-screenshot.png',
  'images/paywei-screenshot.png',
];

final List<String> imgTitle = [
  'StreamHuddle',
  'TXGun',
  'Paywei',
];

final List<String> imgDescription = [
  'Permissions-based cloud scene rendering engine for video streaming',
  'TXGun',
  'Paywei',
];

final List<Widget> imageSliders = imgList
    .map((item) => Container(
          child: Container(
            margin: EdgeInsets.all(5.0),
            child: Card(
              clipBehavior: Clip.antiAlias,
              child: Column(
                children: [
                  ListTile(
                    leading: Icon(Icons.arrow_drop_down_circle),
                    title: Text(imgTitle[imgList.indexOf(item)]),
                    subtitle: Text(
                      "Django and React",
                      style: TextStyle(
                        color: Colors.black.withOpacity(0.6),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(16.0),
                    child: Text(
                      imgDescription[imgList.indexOf(item)],
                      style: TextStyle(
                        color: Colors.black.withOpacity(0.6),
                      ),
                    ),
                  ),
                  Image.asset(item),
                ],
              ),
            ),
          ),
        ))
    .toList();

class Profile extends StatefulWidget {
  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          decoration: BoxDecoration(
            color: Colors.black,
            image: DecorationImage(
              fit: BoxFit.cover,
              colorFilter: ColorFilter.mode(
                Colors.black.withOpacity(0.1),
                BlendMode.dstATop,
              ),
              image: AssetImage('images/Whangaehu.png'),
            ),
          ),
          child: Column(
            children: [
              Container(
                padding: EdgeInsets.only(top: 20.0),
                height: 180.0,
                child: ClipPolygon(
                  sides: 7,
                  borderRadius: 5.0,
                  boxShadows: [
                    PolygonBoxShadow(
                      color: Colors.white,
                      elevation: 1.0,
                    ),
                    PolygonBoxShadow(color: Colors.grey, elevation: 5.0)
                  ],
                  child: Image.asset(
                    'images/aud_profile.jpg',
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Text(
                'Audrey Bound',
                style: TextStyle(
                    fontSize: 46.0,
                    color: Colors.white,
                    fontFamily: 'Arizonia'),
              ),
              Text(
                'FULL-STACK SOFTWARE ENGINEER',
                style: TextStyle(color: Colors.blueGrey[600]),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SocialButton('images/github_logo_black.png'),
                  SocialButton('images/fb_logo_black.png'),
                  SocialButton('images/gmail_logo_black.png'),
                ],
              ),
              SizedBox(
                height: 30.0,
              ),
              CarouselSlider(
                options: CarouselOptions(
                  height: 370.0,
                  aspectRatio: 2.0,
                  enableInfiniteScroll: false,
                ),
                items: imageSliders,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class SocialButton extends StatelessWidget {
  SocialButton(this.imageString);
  String imageString;

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      constraints: BoxConstraints(
        minWidth: 20.0,
        maxWidth: 25.0,
        maxHeight: 25.0,
      ),
      onPressed: () {},
      elevation: 2.0,
      fillColor: Colors.white,
      child: Image.asset(
        imageString,
        fit: BoxFit.cover,
      ),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(5.0),
        ),
      ),
      padding: EdgeInsets.all(7.0),
    );
  }
}
