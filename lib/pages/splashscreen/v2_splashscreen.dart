import 'dart:async';
import 'dart:io';

import 'package:desafio_git_list_public_repositories/components/animated_gradient_background.dart';
import 'package:desafio_git_list_public_repositories/pages/github_list_page.dart';
import 'package:desafio_git_list_public_repositories/themes/v1_colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class V2SplashScreen extends StatefulWidget {
  // ! assetOrNetworkImage => true - AssetImage || false - NetworkImage
  final bool assetOrNetworkImage;
  final String assetImage;
  final String networkImage;
  final double imageSize;
  final bool loading;
  final int loadTimeSec;
  final Widget nextScreen;
  final BuildContext otherPageContext;
  V2SplashScreen(
      {@required this.assetOrNetworkImage,
      this.assetImage,
      this.networkImage,
      this.imageSize,
      this.loading,
      this.loadTimeSec,
      @required this.nextScreen,
      this.otherPageContext});

  @override
  _V2SplashScreenState createState() => _V2SplashScreenState();
}

class _V2SplashScreenState extends State<V2SplashScreen> {
  @override
  void didChangeDependencies() {
    // ignore: todo
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
    Timer(Duration(seconds: 5), () {
      if (Platform.isAndroid) {
        MaterialPageRoute(builder: (_) => widget.nextScreen);
      } else {
        CupertinoPageRoute(builder: (_) => widget.nextScreen);
      }
      return {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (_) => GithubListPage()),
        )
      };
    });
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
}
