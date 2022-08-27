// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

class PinDetails extends StatelessWidget {
  Map details;
  PinDetails({
    Key? key,
    required this.details,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var deviceSize = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              children: [
                SizedBox(
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: CachedNetworkImage(
                      imageUrl: details['urls']['regular'],
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
                              'Photo by ${details['user']['name']}',
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
                                    text: details['likes'].toString(),
                                  ),
                                ],
                              ),
                            ),
                            // Text(details['description'],
                            //     style: Theme.of(context).textTheme.headline6),
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
      ),
    );
  }
}
