import 'package:flutter/material.dart';

class SliverSnapAppBarRecipe extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _SliverSnapAppBarRecipeState();
}

class _SliverSnapAppBarRecipeState extends State<SliverSnapAppBarRecipe> {
  bool _snapped = false;
  bool _floating = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            snap: this._snapped,
            floating: this._floating,
            expandedHeight: 160.0,
            flexibleSpace: FlexibleSpaceBar(
              title: Text("Snapped Sliver AppBar Demo"),
//              background: Image.asset(
//                'res/images/material_design_3.png',
//                fit: BoxFit.fill,
//              ),
            ),
          ),
          // If the main content is a list, use SliverList instead.
          SliverFillRemaining(
            child:
                Center(child: Text("Only a floating appbar can be snapped.")),
          ),
        ],
      ),
      bottomNavigationBar: this._bottomAppBar(),
    );
  }

  Widget _bottomAppBar() {
    return BottomAppBar(
      child: ButtonBar(
        alignment: MainAxisAlignment.center,
        children: <Widget>[
          Row(
            children: <Widget>[
              Text('Floating'),
              Switch(
                onChanged: (bool val) {
                  setState(() {
                    this._floating = val;

                    if (!val) {
                      this._snapped = false;
                    }
                  });
                },
                value: this._floating,
              )
            ],
          ),
          Row(
            children: <Widget>[
              Text('Snapped'),
              Switch(
                onChanged: (bool val) {
                  setState(() {
                    this._snapped = val;
                    //appbar must be floating to apply snapping on
                    this._floating = this._floating || val;
                  });
                },
                value: this._snapped,
              )
            ],
          )
        ],
      ),
    );
  }
}
