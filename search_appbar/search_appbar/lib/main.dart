import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:english_words/english_words.dart' as words;
import 'package:speech_recognition/speech_recognition.dart';

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

class Language {
  final String name;
  final String code;

  const Language(this.name, this.code);
}

class SeachAppBarRecipe extends StatefulWidget {
  SeachAppBarRecipe({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _SearchAppBarRecipeState createState() => _SearchAppBarRecipeState();
}

class _SearchAppBarRecipeState extends State<SeachAppBarRecipe> {
  //speech
  SpeechRecognition _speech;
  bool _speechRecognitionAvailable = false;
  bool _isListening = false;

  String transcription = '';

//String _currentLocale = 'en_US';
  Language selectedLang = const Language('English', 'en_US');

  final List<String> kWords;
  _SearchAppBarDelegate _searchDelegate;

  //Initializing with sorted list of english words
  _SearchAppBarRecipeState()
      : kWords = List.from(Set.from(words.all))
          ..sort(
            (w1, w2) => w1.toLowerCase().compareTo(w2.toLowerCase()),
          ),
        super();

  @override
  void initState() {
    super.initState();
    //Initializing search delegate with sorted list of English words
    _searchDelegate = _SearchAppBarDelegate(kWords);
    activateSpeechRecognizer();
  }

  void requestPermission() async {
    PermissionStatus permission = await PermissionHandler()
        .checkPermissionStatus(PermissionGroup.microphone);

    if (permission != PermissionStatus.granted) {
      await PermissionHandler()
          .requestPermissions([PermissionGroup.microphone]);
    }
  }

  // Platform messages are asynchronous, so we initialize in an async method.
  void activateSpeechRecognizer() {
    requestPermission();

    print('_MyAppState.activateSpeechRecognizer... ');
    _speech = new SpeechRecognition();
    _speech.setAvailabilityHandler(onSpeechAvailability);
    _speech.setCurrentLocaleHandler(onCurrentLocale);
    _speech.setRecognitionStartedHandler(onRecognitionStarted);
    _speech.setRecognitionResultHandler(onRecognitionResult);
    _speech.setRecognitionCompleteHandler(onRecognitionComplete);
    //_speech.setErrorHandler(errorHandler);
    _speech
        .activate()
        .then((res) => setState(() => _speechRecognitionAvailable = res));
  }

  void start() => _speech
      .listen(locale: selectedLang.code)
      .then((result) => print('Strted listening => result $result'));

  void cancel() =>
      _speech.cancel().then((result) => setState(() => _isListening = result));

  void stop() => _speech.stop().then((result) {
        setState(() => _isListening = result);
      });

  void onSpeechAvailability(bool result) =>
      setState(() => _speechRecognitionAvailable = result);

  void onCurrentLocale(String locale) =>
      setState(() => selectedLang = Language('English', 'en_US'));

  void onRecognitionStarted() => setState(() => _isListening = true);

  void onRecognitionResult(String text) {
    setState(() {
      transcription = text;
      showSearchPage(context, _searchDelegate, transcription);
    });
  }

  void onRecognitionComplete() => setState(() => _isListening = false);

  void errorHandler() => activateSpeechRecognizer();

  Widget _buildVoiceInput({String label, VoidCallback onPressed}) =>
      new Padding(
          padding: const EdgeInsets.all(12.0),
          child: Row(
            children: <Widget>[
              FlatButton(
                //onPressed: onPressed,
                child: Text(
                  label,
                  style: const TextStyle(color: Colors.white),
                ),
              ),
              IconButton(
                icon: Icon(Icons.mic),
                onPressed: onPressed,
              ),
            ],
          ));

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text('Word List'),
        actions: <Widget>[
          _buildVoiceInput(
            onPressed: _speechRecognitionAvailable && !_isListening
                ? () => start()
                : () => stop(),
            label: _isListening ? 'Listening...' : '',
          ),
          //Adding the search widget in AppBar
          IconButton(
            tooltip: 'Search',
            icon: const Icon(Icons.search),
            //Don't block the main thread
            onPressed: () {
              showSearchPage(context, _searchDelegate, transcription);
            },
          ),
        ],
      ),
      body: Scrollbar(
        //Displaying all English words in list in app's main page
        child: ListView.builder(
          itemCount: kWords.length,
          itemBuilder: (context, idx) => ListTile(
            title: Text(kWords[idx]),
            onTap: () {
              Scaffold.of(context).showSnackBar(SnackBar(
                  content: Text("Click the Search action"),
                  action: SnackBarAction(
                    label: 'Search',
                    onPressed: () {
                      showSearchPage(context, _searchDelegate, transcription);
                    },
                  )));
            },
          ),
        ),
      ),
    );
  }

  //Shows Search result
  void showSearchPage(BuildContext context,
      _SearchAppBarDelegate searchDelegate, String transcription) async {
    final String selected = await showSearch<String>(
      context: context,
      delegate: searchDelegate,
      query: transcription,
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
  final List<String> _words;
  final List<String> _history;
  final String preQry;

  _SearchAppBarDelegate(List<String> words)
      : _words = words,
        //pre-populated history of words
        _history = <String>['apple', 'orange', 'banana', 'watermelon'],
        preQry = "",
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
        : _words.where((word) => word.startsWith(query));

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
    List<Widget> actions = List();
    if (query.isNotEmpty) {
      actions.add(IconButton(
        tooltip: 'Clear',
        icon: const Icon(Icons.clear),
        onPressed: () {
          query = '';
          showSuggestions(context);
        },
      ));
    }

    return actions;
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
