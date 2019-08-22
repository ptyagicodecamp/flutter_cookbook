import 'package:flutter/material.dart';
import 'dual_word.dart';
import 'englist_to_hindi.dart';
import 'hindi_to_english.dart';

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

class _SearchAppBarRecipeState extends State<SeachAppBarRecipe>
    with SingleTickerProviderStateMixin {
  final List<EnglishToHindi> english;
  final List<HindiToEnglish> hindi;
  _SearchAppBarDelegate _searchDelegate;

  //List<Object> wordList;
  TabController tabController;

  //Initializing with sorted list of english words
  _SearchAppBarRecipeState()
      : english = listfrsa,
        hindi = listsafr,
        super();

  @override
  void initState() {
    super.initState();

    //Initializing search delegate with frsa
    _searchDelegate = _SearchAppBarDelegate(english);

    tabController = TabController(vsync: this, length: 2)
      ..addListener(() {
        setState(() {
          switch (tabController.index) {
            case 0:
              _searchDelegate = _SearchAppBarDelegate(english);
              break;
            case 1:
              _searchDelegate = _SearchAppBarDelegate(hindi);
              break;

          }
        });
      });
  }

  Widget tabApp() {
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
                  showSearchPage(context, _searchDelegate);
                },
              ),
            ],
            bottom: TabBar(
              tabs: [
                Tab(icon: Icon(Icons.free_breakfast)),
                Tab(icon: Icon(Icons.place)),
              ],
              controller: tabController,
            ),
            //title: Text('Search Tabs Demo'),
          ),
          body: TabBarView(
            controller: tabController,
            children: [listViewWords(), listViewWords2()],
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text(
          "Search in Tabs",
          style: TextStyle(
              color: Colors.white, fontSize: 22.0, fontWeight: FontWeight.w600),
        ),
        actions: <Widget>[
          IconButton(
            tooltip: 'Search',
            icon: const Icon(Icons.search),
            //Don't block the main thread
            onPressed: () {
              setState(() {
                showSearchPage(context, _searchDelegate);
              });

            },
          ),

        ],

        bottom: TabBar(
          tabs: [
            Tab(text: "English"),
            Tab(text: "Hindi",),
          ],
          indicatorColor: Colors.white,
          controller: tabController,
        ),
      ),
      body: TabBarView(
        controller: tabController,
        children: [listViewWords(), listViewWords2()],
      ),

    );
  }

  Widget listViewWords() {
    return ListView.builder(
      itemCount: english.length,
      itemBuilder: (context, idx) => ListTile(
        title: Text(english[idx].english),
        onTap: () {},
      ),
    );
  }

  Widget listViewWords2() {
    return ListView.builder(
      itemCount: hindi.length,
      itemBuilder: (context, idx) => ListTile(
        title: Text(hindi[idx].hindi),
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
  final List<DualWord> _words;
  final List<DualWord> _history;

  _SearchAppBarDelegate(List<Object> words)
      : _words = words,
        //pre-populated history of words
       _history = [], //<String>['apple', 'orange', 'banana', 'watermelon'],
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
    final Iterable<DualWord> suggestions = this.query.isEmpty
        ? _words
        : _words.where((word) => word.isMatching(query));

    return _WordSuggestionList(
      query: this.query,
      suggestions: suggestions.toList(),
      onSelected: (DualWord suggestion) {
        this.query = suggestion.getWord();
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
  const _WordSuggestionList({this.suggestions, this.query, this.otherWord, this.onSelected});

  final List<DualWord> suggestions;
  final String query;
  final String otherWord;
  final ValueChanged<DualWord> onSelected;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme.subhead;
    return ListView.builder(
      itemCount: suggestions.length,
      itemBuilder: (BuildContext context, int i) {
        final DualWord suggestion = suggestions[i];
        return ListTile(
          leading: query.isEmpty ? Icon(Icons.history) : Icon(null),
          // Highlight the substring that matched the query.
          title: RichText(
            text: TextSpan(
              text: suggestion.getWord().substring(0, query.length),
              style: textTheme.copyWith(fontWeight: FontWeight.bold),
              children: <TextSpan>[
                TextSpan(
                  text: suggestion.getWord().substring(query.length),
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
