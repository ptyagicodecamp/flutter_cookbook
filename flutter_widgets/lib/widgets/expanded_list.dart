import 'package:flutter/material.dart';

void main() => runApp(
      ExpansionList(),
    );

class ListItem {
  final String title;
  final String title2;
  final List<ListItem> children;

  ListItem(this.title, this.title2, this.children);
}

final List<ListItem> items = <ListItem>[
  ListItem(
    'Go',
    'जा (JA)',
    <ListItem>[
      ListItem(
        'Past Tense',
        '',
        <ListItem>[
          ListItem('I went', 'मैं गया | (Main gaya)', []),
          ListItem(
              'I went to school', 'मैं स्कूल गया | (Main school gaya)', []),
        ],
      ),
      ListItem(
        'Present Tense',
        '',
        <ListItem>[
          ListItem('I go', '', []),
          ListItem('I go to school', '', []),
        ],
      ),
      ListItem(
        'Future Tense',
        '',
        <ListItem>[
          ListItem('I will go.', '', []),
          ListItem('I will go to school.', '', []),
        ],
      ),
    ],
  ),
  ListItem(
    'Drink',
    '',
    <ListItem>[
      ListItem(
        'Past Tense',
        '',
        <ListItem>[
          ListItem('I drank.', '', []),
          ListItem('I drank water.', '', []),
        ],
      ),
      ListItem(
        'Present Tense',
        '',
        <ListItem>[
          ListItem('I drink.', '', []),
          ListItem('I drink water.', '', []),
        ],
      ),
      ListItem(
        'Future Tense',
        '',
        <ListItem>[
          ListItem('I will drink.', '', []),
          ListItem('I will drink water.', '', []),
        ],
      ),
    ],
  ),
];

class ExpansionList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: ListView.builder(
            itemCount: items.length,
            itemBuilder: (BuildContext context, int index) =>
                ListItemWidget(items[index])),
      ),
    );
  }
}

class ListItemWidget extends StatelessWidget {
  final ListItem item;

  const ListItemWidget(this.item);

  @override
  Widget build(BuildContext context) {
    return buildListTiles(item);
  }

  Widget buildListTiles(ListItem item) {
    if (item.children.isEmpty) {
      return ListTile(
        title: Text(item.title),
        subtitle: Text(item.title2),
      );
    }

    return ExpansionTile(
      key: PageStorageKey<ListItem>(item),
      title: Text(item.title),
      children: item.children.map<Widget>(buildListTiles).toList(),
    );
  }
}
