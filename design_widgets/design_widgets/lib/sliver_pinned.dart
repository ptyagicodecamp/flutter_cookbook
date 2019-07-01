import 'package:flutter/material.dart';

class SliverPinnedAppBarRecipe extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            pinned: true,
            expandedHeight: 160.0,
            flexibleSpace: FlexibleSpaceBar(
              title: Text("Pinned Sliver AppBar"),
              background: Image.asset(
                'res/images/material_design_3.png',
                fit: BoxFit.fill,
              ),
            ),
          ),
          // If the main content is a list, use SliverList instead.
          SliverFillRemaining(
            child: Center(child: Text(
                "Checkout the Pinned Sliver AppBar above."
            "It's flexible and gets pinned on swipe-up gesture.")),
          ),
        ],
      ),
    );
  }

}