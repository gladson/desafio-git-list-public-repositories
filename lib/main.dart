import 'package:flutter/material.dart';

import 'package:desafio_git_list_public_repositories/themes/v1_theme.dart';
import 'package:desafio_git_list_public_repositories/pages/splashscreen/v1_splashscreen.dart';
import 'package:desafio_git_list_public_repositories/pages/github_list_page.dart';

void main() {
  runApp(DesafioApp());
}

class DesafioApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Desafio - Git List Public Repositories',
      theme: v1Theme,
      debugShowCheckedModeBanner: false,
      home: V1SplashScreen(
        loadTimeSec: 3,
        loading: true,
        nextScreen: GithubListPage(),
        assetOrNetworkImage: true,
        assetImage: './assets/images/logo_immensa_color.webp',
      ),
    );
  }
}
