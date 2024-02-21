import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class TheSearch extends SearchDelegate<String> {
  var compressionRateSearch;

  TheSearch(
      {required this.contextPage,
      required this.controller,
      this.compressionRateSearch});
  BuildContext contextPage;
  WebViewController controller;
  final suggestions1 = ["https://www.google.com"];

  @override
  String get searchFieldLabel => "Nom d'étudiant ";

  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
        icon: Icon(Icons.clear),
        onPressed: () {
          query = "";
        },
      )
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      icon: AnimatedIcon(
        icon: AnimatedIcons.menu_home,
        progress: transitionAnimation,
      ),
      onPressed: () {
        close(context, '');
      },
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    final suggestions = query.isEmpty ? suggestions1 : [];

    return ListView.builder(
      itemBuilder: (content, index) => ListTile(
          leading: Icon(Icons.arrow_left), title: Text(suggestions[index])),
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    // TODO: implement buildResults
    throw UnimplementedError();
  }
}
