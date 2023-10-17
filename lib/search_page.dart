import 'package:flutter/material.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({Key? key}) : super(key: key);

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  delegate() => null;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xff29235c),
        // leading: IconButton(
        //     onPressed: () {
        //       Navigator.pop(context);
        //     },
        //     icon: Icon(
        //       Icons.arrow_back_ios_new,
        //       color: Colors.white,
        //       size: 16,
        //     )),
        actions: [
          IconButton(
              onPressed: () {
                showSearch(context: context, delegate: MySearchDelegate());
              },
              icon: Icon(Icons.search))
        ],
      ),
    );
  }
}

class MySearchDelegate extends SearchDelegate {
  List<String> searchResult = [
    'Swat',
    'Kalam',
    'Malam Jabba',
    'Bahrain',
    'Gabin jabba',
  ];
  @override
  List<Widget>? buildActions(BuildContext context) {
    // TODO: implement buildActions
    IconButton(
      onPressed: () {
        if (query.isEmpty) {
          close(context, null);
        } else {
          query = '';
        }
      },
      icon: const Icon(Icons.clear),
    );
  }

  @override
  Widget? buildLeading(BuildContext context) {
    // TODO: implement buildLeading
    icon:
    const Icon(Icons.arrow_back);
    onPressed:
    () => close(context, null);
  }

  @override
  Widget buildResults(BuildContext context) {
    // TODO: implement buildResults
    return Text(
      query,
      style: const TextStyle(fontSize: 64, fontWeight: FontWeight.bold),
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    // TODO: implement buildSuggestions
    List<String> suggestions = searchResult.where((searchResult) {
      final result = searchResult.toLowerCase();
      final input = query.toLowerCase();
      return result.contains(input);
    }).toList();
    return ListView.builder(
        itemCount: suggestions.length,
        itemBuilder: (context, index) {
          final suggestion = suggestions[index];
          return ListTile(
              title: Text(suggestion),
              onTap: () {
                query = suggestion;
                showResults(context);
              });
        });
  }
}
