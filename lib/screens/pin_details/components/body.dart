import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:pinterest_flutter/models/pin.dart';

class Body extends StatelessWidget {
  Pin pin;
  Body({Key? key, required this.pin}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Center(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              SizedBox(
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: CachedNetworkImage(
                    imageUrl: pin.image,
                    fit: BoxFit.cover,
                    placeholder: (ctx, val) {
                      return CircularProgressIndicator();
                    },
                  ),
                ),
              ),
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            pin.title,
                            textScaleFactor: 1,
                            style: Theme.of(context).textTheme.headline6,
                          ),
                          RichText(
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
                                  text: pin.rateCount.toString(),
                                ),
                              ],
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
