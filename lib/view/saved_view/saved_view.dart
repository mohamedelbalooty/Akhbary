import 'package:akhbary_app/states/database_sates.dart';
import 'package:akhbary_app/view_model/database_view_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:localize_and_translate/localize_and_translate.dart';
import 'package:provider/provider.dart';
import 'saved_view_components.dart';
import '../app_components.dart';

class SavedView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildCustomAppBar(title: 'saved articles'.tr()),
      body: Consumer<DatabaseViewModel>(
        builder: (context, provider, child) {
          if (provider.databaseStates == DatabaseStates.InitialState) {
            provider.getSavedArticlesFromDatabase();
            return Container(
              color: Colors.transparent,
            );
          } else {
            return provider.savedArticles.length != 0
                ? BuildListOfSavedItem(
                    articles: provider.savedArticles,
                  )
                : BuildNoSavedItem();
          }
        },
      ),
    );
  }
}