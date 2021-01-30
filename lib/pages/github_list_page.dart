import 'package:flutter/material.dart';

import 'package:dio/dio.dart';

import 'package:desafio_git_list_public_repositories/themes/v1_colors.dart';
import 'package:desafio_git_list_public_repositories/utils/extensions.dart';
import 'package:desafio_git_list_public_repositories/utils/go_url_app.dart';
import 'package:desafio_git_list_public_repositories/components/animated_fade_in.dart';
import 'package:desafio_git_list_public_repositories/models/public_repositories_model.dart';
import 'package:desafio_git_list_public_repositories/repositories/public_repositories_repository.dart';

class GithubListPage extends StatefulWidget {
  GithubListPage({Key key}) : super(key: key);

  @override
  _GithubListPageState createState() => _GithubListPageState();
}

class _GithubListPageState extends State<GithubListPage> {
  final _repository = PublicRepositoriesRepository(Dio());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      floatingActionButton: FloatingActionButton(
        // isExtended: true,
        child: Icon(Icons.replay),
        backgroundColor: gPrimaryOrangeColor,
        onPressed: () {
          setState(() {});
        },
      ),
      body: FutureBuilder<List<PublicRepositoriesModel>>(
        future: _repository.findAll(),
        builder: (_, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            // return V2SplashScreen(
            //   loadTimeSec: 5,
            //   loading: false,
            //   nextScreen: GithubListPage(),
            //   assetOrNetworkImage: true,
            //   assetImage: './assets/images/logo_immensa_color.webp',
            //   otherPageContext: context,
            // );
            return Center(
              child: CircularProgressIndicator(),
            );
          }
          if (snapshot.connectionState == ConnectionState.done &&
              snapshot.hasData) {
            final repositories = snapshot.data;
            return AnimatedFadeIn(
              delay: 1.5,
              child: ListView.builder(
                itemCount: repositories.length,
                itemBuilder: (context, index) {
                  final repositoryUser = repositories[index];
                  return Card(
                    elevation: 3,
                    child: ListTile(
                      title: Text(repositoryUser.fullName.isNullOrEmpty
                          ? ""
                          : repositoryUser.fullName),
                      subtitle: Text(repositoryUser.description.isNullOrEmpty
                          ? ""
                          : repositoryUser.description),
                      trailing: Image(
                        image: AssetImage('./assets/images/octocat.webp'),
                        fit: BoxFit.fill,
                        isAntiAlias: true,
                        width: 35,
                      ),
                      leading: Image(
                        image: NetworkImage(repositoryUser.owner.avatarUrl),
                        width: 50,
                      ),
                      onTap: () {
                        launchInBrowser(repositoryUser.htmlUrl);
                      },
                    ),
                  );
                },
              ),
            );
          }
          return Container();
        },
      ),
    );
  }
}
