import 'package:flutter/material.dart';

class SliverFloatingAppBarRecipe extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            floating: true,
            expandedHeight: 160.0,
            flexibleSpace: FlexibleSpaceBar(
              title: Text("Floating Sliver AppBar"),
              background: Image.asset(
                'res/images/material_design_3.png',
                fit: BoxFit.fill,
              ),
            ),
          ),
          // If the main content is a list, use SliverList instead.
          SliverFillRemaining(
            child: Center(child:
                Text("Checkout the Floating Sliver AppBar above."
                "It's flexible and disappears on swipe-up gesture.")),
          ),
        ],
      ),
    );
  }

}