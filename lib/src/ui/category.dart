import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_ecommerce/src/utils/corousel_slider.dart';


class CategoryPage extends StatefulWidget {
  @override
  _CategoryPageState createState() => _CategoryPageState();
}

class _CategoryPageState extends State<CategoryPage> {
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
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            imageSlider(),
//            SizedBox(
//              height: 10,
//            ),
            topDealsSection(),
//            SizedBox(
//              height: 10,
//            ),
//            topDealsSection(),
//            SizedBox(
//              height: 10,
//            ),
//            topDealsSection()
          ],
        ),
      ),
    );
  }

  Widget imageSlider() {
    return Container(
      child: CarouselSlider(
        items: carouselSliderList(imageUrl),
        aspectRatio: 2,
        viewportFraction: 0.6,
        initialPage: 0,
        autoPlay: true,
        autoPlayInterval: Duration(seconds: 2),
        autoPlayAnimationDuration: Duration(milliseconds: 800),
        pauseAutoPlayOnTouch: Duration(seconds: 2),
        enlargeCenterPage: true,
      ),
    );
  }

  List<Widget> carouselSliderList(List<String> imageUrl) {
    return imageUrl.map((i) {
      return Builder(builder: (BuildContext context) {
        return imageSliderItem(i);
      });
    }).toList();
  }

  Widget imageSliderItem(String url) {
    return Card(
      color: Color(0X000000),
      child: Container(
          width: MediaQuery.of(context).size.width / 1.1,
          padding: EdgeInsets.all(5.0),
          margin: EdgeInsets.symmetric(horizontal: 5.0),
          child: Image.network(
            url,
            fit: BoxFit.fitHeight,
          )),
    );
  }

  Widget topDealsSection() {
    return Container(
      color: Colors.blue,
      child: Column(
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(12.0),
                child: Text(
                  "Deals of the Day",
                  style: TextStyle(fontSize: 18.0, color: Colors.white),
                ),
              ),
              Align(
                alignment: Alignment.topRight,
                child: Padding(
                  padding: const EdgeInsets.only(top: 10.0, right: 10.0),
                  child: RaisedButton(
                    disabledColor: Colors.white,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10)),
                    onPressed: null,
                    color: Colors.white,
                    child: Text(
                      "View All",
                      style: TextStyle(color: Colors.black),
                    ),
                  ),
                ),
              ),
            ],
          ),
          Divider(
            height: 5,
          ),
          dealsGrid(),
          SizedBox(
            height: 10,
          )
        ],
      ),
    );
  }

  Widget dealsGrid() {
    return Card(
      margin: EdgeInsets.only(top: 10, bottom: 10, right: 10, left: 10),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      child: Container(padding: EdgeInsets.all(10),
        child: Column(
          children: <Widget>[
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[dealsItem(),dealsItem()],
            ),
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[dealsItem(),dealsItem()],
            )
          ],
        ),
      ),
    );
  }

  Widget dealsItem() {
    return GestureDetector(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          SizedBox(
            height: 10,
          ),
          Image.network(
            "https://i.pinimg.com/originals/24/7a/0a/247a0a55e5e6aa0cb2215f375b85dc67.png",
            height: 100,
            width: MediaQuery.of(context).size.width / 2.5,
          ),
          Text(
            "Nike Shoes",
            style: TextStyle(color: Colors.black),
          ),
          Text(
            "Rs 5000",
            style: TextStyle(color: Colors.black),
          )
        ],
      ),
    );
  }
}
