// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:pinterest_flutter/routes/PinDetails/pindetails.dart';

class GridTileObject extends StatelessWidget {
  String imageUrl;
  Map jsonData;
  var rating;
  GridTileObject({
    Key? key,
    required this.imageUrl,
    required this.jsonData,
    required this.rating,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.4,
      margin: EdgeInsets.symmetric(vertical: 5, horizontal: 5),
      child: GestureDetector(
        onLongPress: () {
          showBottomSheet(
              backgroundColor: Colors.transparent,
              context: context,
              builder: ((context) {
                return Container(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height * 0.2,
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        CircleAvatar(
                          backgroundColor: Colors.white,
                          child: IconButton(
                              onPressed: () {},
                              icon: Icon(Icons.save_alt_rounded)),
                        ),
                        CircleAvatar(
                            backgroundColor: Colors.white,
                            child: IconButton(
                                onPressed: () {}, icon: Icon(Icons.edit))),
                        CircleAvatar(
                          backgroundColor: Colors.white,
                          child: IconButton(
                              onPressed: () {},
                              icon: Icon(Icons.share_outlined)),
                        ),
                        CircleAvatar(
                            backgroundColor: Colors.white,
                            child: IconButton(
                                onPressed: () {}, icon: Icon(Icons.whatsapp)))
                      ]),
                );
              }));
        },
        onLongPressCancel: () {
          Navigator.pop(context);
        },
        onLongPressEnd: (_) {
          Navigator.pop(context);
        },
        onTap: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => PinDetails(
                        details: jsonData,
                      )));
        },
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(15),
            clipBehavior: Clip.hardEdge,
            child: CachedNetworkImage(
              imageUrl: imageUrl,
              fit: BoxFit.fill,
              placeholder: (ctx, val) {
                return CircularProgressIndicator();
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 5),
            child: RichText(
              text: TextSpan(
                children: [
                  WidgetSpan(
                    child: Icon(
                      Icons.favorite,
                      size: 14,
                      color: Colors.red,
                    ),
                  ),
                  TextSpan(
                    text: rating.toString(),
                  ),
                ],
              ),
            ),
          )
        ]),
      ),
    );
  }
}
