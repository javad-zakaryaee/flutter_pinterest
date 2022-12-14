// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:pinterest_flutter/screens/pin_details/pin_details.dart';
import 'package:pinterest_flutter/data/api_service.dart';
import 'package:pinterest_flutter/models/pin.dart';

class GridTileObject extends StatelessWidget {
  Pin pin;
  GridTileObject({
    Key? key,
    required this.pin,
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
                        pin: pin,
                      )));
        },
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(15),
            clipBehavior: Clip.hardEdge,
            child: CachedNetworkImage(
              imageUrl: pin.image,
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
                    text: pin.rating.toString(),
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
