import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:pinterest_flutter/providers/pin_provider.dart';
import 'package:provider/provider.dart';
import 'package:pinterest_flutter/models/pin.dart';

import 'gridTile.dart';

class Body extends StatelessWidget {
  Body({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Center(
        child: Consumer<PinProvider>(
          builder: (context, provider, child) => SizedBox(
            child: FutureBuilder(
              future: provider.getPinList(),
              builder: (context, snapshot) {
                switch (snapshot.connectionState) {
                  case ConnectionState.waiting:
                    return CircularProgressIndicator();
                  default:
                    return SingleChildScrollView(
                      padding: EdgeInsets.all(20),
                      child: Container(
                        height: MediaQuery.of(context).size.height * 0.85,
                        child: (snapshot.data as List<Pin>).length == 0
                            ? Text("Couldn't load pins")
                            : MasonryGridView.count(
                                crossAxisCount: 2,
                                itemCount: (snapshot.data as List<Pin>).length,
                                itemBuilder: (context, index) {
                                  return GridTileObject(
                                    pin: (snapshot.data as List<Pin>)[index],
                                  );
                                }),
                      ),
                    );
                }
              },
            ),
          ),
        ),
      ),
    );
  }
}
