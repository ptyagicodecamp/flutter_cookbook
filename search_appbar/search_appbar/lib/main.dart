import 'package:flutter/material.dart';
import 'lexique_frsa.dart';
import 'lexique_safr.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'SeachAppBarRecipe',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: SeachAppBarRecipe(title: 'SeachAppBarRecipe'),
    );
  }
}

class SeachAppBarRecipe extends StatefulWidget {
  SeachAppBarRecipe({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _SearchAppBarRecipeState createState() => _SearchAppBarRecipeState();
}

class _SearchAppBarRecipeState extends State<SeachAppBarRecipe> {
  final List<LexiqueFRSA> frsa;
  final List<LexiqueSAFR> safr;
  _SearchAppBarDelegate _searchDelegate;

  List<Object> wordList;
  TabController tabController;

  //Initializing with sorted list of english words
  _SearchAppBarRecipeState()
      : frsa = listfrsa,
        safr = listsafr,
        super();

  @override
  void initState() {
    super.initState();
    tabController = TabController(vsync: this, length: 2);
    //Initializing search delegate with sorted list of English words
    //_searchDelegate = _SearchAppBarDelegate(wordList);
  }

  Widget tabController() {
    return new MaterialApp(
      title: 'Wordlist',
      debugShowCheckedModeBanner: false,
      //theme: widget._themeData,
      home: DefaultTabController(
        length: 2,
        child: Scaffold(
          appBar: AppBar(
            automaticallyImplyLeading: false,
            title: Text('Word List'),
            actions: <Widget>[
              //Adding the search widget in AppBar
              IconButton(
                tooltip: 'Search',
                icon: const Icon(Icons.search),
                //Don't block the main thread
                onPressed: () {
                  setState(() {
                    var index = DefaultTabController.of(context).index;
                    if (index == 0) {
                      wordList = frsa;
                    } else {
                      wordList = safr;
                    }
                    _searchDelegate = _SearchAppBarDelegate(wordList);
                    showSearchPage(context, _searchDelegate);
                  });
                },
              ),
            ],
            bottom: TabBar(
              tabs: [
                Tab(icon: Icon(Icons.free_breakfast)),
                Tab(icon: Icon(Icons.place)),
              ],
            ),
            //title: Text('Search Tabs Demo'),
          ),
          body: TabBarView(
            children: [listViewWords(), listViewWords2()],
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return tabController();

//    return Scaffold(
//      body: Scrollbar(
//        //Displaying all English words in list in app's main page
//        child: tabController(),
//      ),
//    );
  }

  Widget listViewWords() {
    return ListView.builder(
      itemCount: frsa.length,
      itemBuilder: (context, idx) => ListTile(
        title: Text(frsa[idx].frFRSA),
        onTap: () {},
      ),
    );
  }

  Widget listViewWords2() {
    return ListView.builder(
      itemCount: safr.length,
      itemBuilder: (context, idx) => ListTile(
        title: Text(safr[idx].saSAFR),
        onTap: () {},
      ),
    );
  }

  //Shows Search result
  void showSearchPage(
      BuildContext context, _SearchAppBarDelegate searchDelegate) async {
    final String selected = await showSearch<String>(
      context: context,
      delegate: searchDelegate,
    );

    if (selected != null) {
      Scaffold.of(context).showSnackBar(
        SnackBar(
          content: Text('Your Word Choice: $selected'),
        ),
      );
    }
  }
}

//Search delegate
class _SearchAppBarDelegate extends SearchDelegate<String> {
  final List<Object> _words;
  final List<Object> _history;

  _SearchAppBarDelegate(List<Object> words)
      : _words = words,
        //pre-populated history of words
        _history = <String>['apple', 'orange', 'banana', 'watermelon'],
        super();

  // Setting leading icon for the search bar.
  //Clicking on back arrow will take control to main page
  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      tooltip: 'Back',
      icon: AnimatedIcon(
        icon: AnimatedIcons.menu_arrow,
        progress: transitionAnimation,
      ),
      onPressed: () {
        //Take control back to previous page
        this.close(context, null);
      },
    );
  }

  // Builds page to populate search results.
  @override
  Widget buildResults(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Text('===Your Word Choice==='),
            GestureDetector(
              onTap: () {
                //Define your action when clicking on result item.
                //In this example, it simply closes the page
                this.close(context, this.query);
              },
              child: Text(
                this.query,
                style: Theme.of(context)
                    .textTheme
                    .display2
                    .copyWith(fontWeight: FontWeight.normal),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Suggestions list while typing search query - this.query.
  @override
  Widget buildSuggestions(BuildContext context) {
    final Iterable<String> suggestions = this.query.isEmpty
        ? _history
        : _words.where((word) => word.toString().startsWith(query));

    return _WordSuggestionList(
      query: this.query,
      suggestions: suggestions.toList(),
      onSelected: (String suggestion) {
        this.query = suggestion;
        this._history.insert(0, suggestion);
        showResults(context);
      },
    );
  }

  // Action buttons at the right of search bar.
  @override
  List<Widget> buildActions(BuildContext context) {
    return <Widget>[
      query.isNotEmpty
          ? IconButton(
              tooltip: 'Clear',
              icon: const Icon(Icons.clear),
              onPressed: () {
                query = '';
                showSuggestions(context);
              },
            )
          : IconButton(
              icon: const Icon(Icons.mic),
              tooltip: 'Voice input',
              onPressed: () {
                this.query = 'TBW: Get input from voice';
              },
            ),
    ];
  }
}

// Suggestions list widget displayed in the search page.
class _WordSuggestionList extends StatelessWidget {
  const _WordSuggestionList({this.suggestions, this.query, this.onSelected});

  final List<String> suggestions;
  final String query;
  final ValueChanged<String> onSelected;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme.subhead;
    return ListView.builder(
      itemCount: suggestions.length,
      itemBuilder: (BuildContext context, int i) {
        final String suggestion = suggestions[i];
        return ListTile(
          leading: query.isEmpty ? Icon(Icons.history) : Icon(null),
          // Highlight the substring that matched the query.
          title: RichText(
            text: TextSpan(
              text: suggestion.substring(0, query.length),
              style: textTheme.copyWith(fontWeight: FontWeight.bold),
              children: <TextSpan>[
                TextSpan(
                  text: suggestion.substring(query.length),
                  style: textTheme,
                ),
              ],
            ),
          ),
          onTap: () {
            onSelected(suggestion);
          },
        );
      },
    );
  }
}
