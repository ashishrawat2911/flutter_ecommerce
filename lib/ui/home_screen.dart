import 'package:flutter/material.dart';
import 'package:flutter_ecommerce/uitls/corousel_slider.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _current = 0;
  List<String> imageUrl;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    imageUrl = [
      "https://i.pinimg.com/originals/24/7a/0a/247a0a55e5e6aa0cb2215f375b85dc67.png",
      "https://i.pinimg.com/originals/24/7a/0a/247a0a55e5e6aa0cb2215f375b85dc67.png",
      "https://i.pinimg.com/originals/24/7a/0a/247a0a55e5e6aa0cb2215f375b85dc67.png",
      "https://i.pinimg.com/originals/24/7a/0a/247a0a55e5e6aa0cb2215f375b85dc67.png"
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: <Widget>[_appbarSearch(), imageSlider(), topDealsSection()],
      ),
    );
  }

  Widget _appbarSearch() {
    return Row(
      children: <Widget>[
        Card(
          child: Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Icon(Icons.search),
                SizedBox(
                  width: 5.0,
                ),
                Text("Search Items"),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget imageSlider() {
    return Container(
      child: Column(
        children: <Widget>[
          CarouselSlider(
            items: carouselSliderList(imageUrl),
            aspectRatio: 2,
            viewportFraction: 0.8,
            initialPage: 0,
            autoPlay: true,
            autoPlayInterval: Duration(seconds: 2),
            autoPlayAnimationDuration: Duration(milliseconds: 800),
            pauseAutoPlayOnTouch: Duration(seconds: 2),
            enlargeCenterPage: true,
            onPageChanged: (index) {
              setState(() {
                _current = index;
              });
            },
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: map<Widget>(
              imageUrl,
              (index, url) {
                return dots(_current, index);
              },
            ),
          )
        ],
      ),
    );
  }

  Widget dots(int current, int index) {
    if (current != index) {
      return Container(
        width: 8.0,
        height: 8.0,
        margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 2.0),
        decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: _current == index
                ? Color.fromRGBO(0, 0, 0, 0.9)
                : Color.fromRGBO(0, 0, 0, 0.4)),
      );
    } else {
      return Container(
        width: 8.0,
        height: 8.0,
        margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 2.0),
        decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: _current == index
                ? Color.fromRGBO(0, 0, 0, 0.9)
                : Color.fromRGBO(0, 0, 0, 0.4)),
      );
    }
  }

  List<Widget> carouselSliderList(List<String> imageUrl) {
    return imageUrl.map((i) {
      return Builder(builder: (BuildContext context) {
        return imageSliderItem(i);
      });
    }).toList();
  }

  Widget imageSliderItem(String name) {
    return Card(
      child: Container(
          height: MediaQuery.of(context).size.width,
          padding: EdgeInsets.all(5.0),
          margin: EdgeInsets.symmetric(horizontal: 5.0),
          child: Image.network(
            name,
            fit: BoxFit.fitHeight,
          )),
    );
  }

  List<T> map<T>(List list, Function handler) {
    List<T> result = [];
    for (var i = 0; i < list.length; i++) {
      result.add(handler(i, list[i]));
    }
    return result;
  }

  Widget topDealsSection() {
    return Card(
      child: Column(
        children: <Widget>[
          Stack(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(12.0),
                child: Text(
                  "Deals of the Day",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18.0),
                ),
              ),
              Align(
                alignment: Alignment.topRight,
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: MaterialButton(
                    height: 40.0,
                    onPressed: null,
                    color: Colors.white,
                    child: Text(
                      "View All",
                      style: TextStyle(color: Colors.grey),
                    ),
                  ),
                ),
              ),
            ],
          ),
          dealsGrid()
        ],
      ),
    );
  }

  Widget dealsGrid() {
    return Container(
        child: Column(
      children: <Widget>[
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[dealsItem(), dealsItem()],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[dealsItem(), dealsItem()],
        )
      ],
    ));
  }

  Widget dealsItem() {
    return GestureDetector(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Image.network(
            "https://i.pinimg.com/originals/24/7a/0a/247a0a55e5e6aa0cb2215f375b85dc67.png",
            height: MediaQuery.of(context).size.height / 5.5,
            width: MediaQuery.of(context).size.width / 2.2,
          ),
          Text("Nike Shoes"),
          Text("Rs 5000")
        ],
      ),
    );
  }
}
