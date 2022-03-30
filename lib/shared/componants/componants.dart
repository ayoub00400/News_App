import 'package:flutter/material.dart';

Widget NewsItemPageBuilder(Map<String, dynamic> ItemObject) {
  return SafeArea(
      child: Scaffold(
          body: Column(children: [
    Image(
      image: NetworkImage(ItemObject['urlToImage']),
    ),
    Expanded(
        child: Padding(
      padding: EdgeInsets.symmetric(vertical: 8, horizontal: 8),
      child: Container(
          decoration: BoxDecoration(
              color: Color.fromARGB(162, 94, 94, 94),
              borderRadius: BorderRadius.circular(20)),
          child: null),
    )),
  ])));
}

Widget BuildNewsListItem(Map<String, dynamic> ItemObject) {
  return Builder(
      builder: (context) => Expanded(
          child: Padding(
              padding: EdgeInsets.symmetric(vertical: 20, horizontal: 12),
              child: GestureDetector(
                  onTap: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => NewsItemPageBuilder(ItemObject)));
                  },
                  child: Container(
                    decoration:
                        BoxDecoration(borderRadius: BorderRadius.circular(20)),
                    clipBehavior: Clip.antiAliasWithSaveLayer,
                    height: 200,
                    child: Stack(alignment: Alignment.center, children: [
                      Container(
                        height: 200,
                        width: double.infinity,
                        child: Image(
                            fit: BoxFit.fill,
                            image: NetworkImage(ItemObject['urlToImage'])),
                      ),
                      Positioned(
                        bottom: 0,
                        child: Container(
                          height: 50,
                          width: 370,
                          color: Colors.black.withOpacity(.5),
                          child: Text(
                            ItemObject['title'],
                            overflow: TextOverflow.ellipsis,
                            textAlign: TextAlign.start,
                            maxLines: 2,
                            style: TextStyle(color: Colors.white, fontSize: 20),
                          ),
                        ),
                      )
                    ]),
                  )))));
}
