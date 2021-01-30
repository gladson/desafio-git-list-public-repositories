import 'dart:io';
import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:desafio_git_list_public_repositories/themes/v1_colors.dart';
import 'package:desafio_git_list_public_repositories/components/animated_gradient_background.dart';

class V1SplashScreen extends StatefulWidget {
  // ! assetOrNetworkImage => true - AssetImage || false - NetworkImage
  final bool assetOrNetworkImage;
  final String assetImage;
  final String networkImage;
  final double imageSize;
  final bool loading;
  final int loadTimeSec;
  final Widget nextScreen;
  final BuildContext otherPageContext;
  V1SplashScreen(
      {@required this.assetOrNetworkImage,
      this.assetImage,
      this.networkImage,
      this.imageSize,
      this.loading,
      this.loadTimeSec,
      @required this.nextScreen,
      this.otherPageContext});

  @override
  _V1SplashScreenState createState() => _V1SplashScreenState();
}

class _V1SplashScreenState extends State<V1SplashScreen> {
  @override
  void initState() {
    countStart(widget.loadTimeSec != null ? widget.loadTimeSec : 2);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Stack(
        children: <Widget>[
          Positioned.fill(
            child: AnimatedGradientBackground(
              color1Begin: gColor1SplashScreenBegin,
              color1End: gColor1SplashScreenEnd,
              color2Begin: gColor2SplashScreenBegin,
              color2End: gColor2SplashScreenEnd,
            ),
          ),
          Positioned.fill(
            child: Center(
              child: Image(
                image: widget.assetOrNetworkImage == true
                    ? AssetImage(widget.assetImage)
                    : NetworkImage(widget.networkImage),
                width: widget.imageSize,
              ),
            ),
          ),
          Positioned.fill(
            child: Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                height: MediaQuery.of(context).size.height * 0.1,
                child: Center(
                  child: Padding(
                    padding: EdgeInsets.only(
                        right: 10, left: 10, bottom: 20, top: 5),
                    child: widget.loading != null
                        ? widget.loading
                            ? Platform.isAndroid
                                ? LinearProgressIndicator() //CircularProgressIndicator()
                                : CupertinoActivityIndicator()
                            : Center()
                        : Center(),
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }

  void countStart(int timeload) async {
    var materialPageRoute;

    await Future.delayed(Duration(seconds: timeload)).then((value) {
      if (Platform.isAndroid) {
        materialPageRoute =
            MaterialPageRoute(builder: (context) => widget.nextScreen);
      } else {
        materialPageRoute =
            CupertinoPageRoute(builder: (context) => widget.nextScreen);
      }
      return {Navigator.pushReplacement(context, materialPageRoute)};
    });
  }
}
