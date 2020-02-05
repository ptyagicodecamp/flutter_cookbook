import 'package:flutter/material.dart';
import 'package:flutter_widgets/codefile.dart';
import 'package:flutter_widgets/screen_args.dart';
import 'util.dart';
import 'router.dart' as router;

class RecipeWidget extends StatelessWidget {
  String name;
  String description;
  String pageName;
  String codeFilePath;
  String codeGithubPath;

  RecipeWidget(this.name, this.description, this.pageName, this.codeFilePath,
      this.codeGithubPath);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Card(
          color: Colors.grey[100],
          child: Column(
            children: <Widget>[
              ListTile(
                  isThreeLine: true,
                  title: Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text(
                      this.name,
                      style: TextStyle(fontSize: 20),
                    ),
                  ),
                  subtitle: Column(
                    children: <Widget>[
                      Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Text(
                          this.description,
                          style: TextStyle(
                              fontSize: 15, fontWeight: FontWeight.w400),
                        ),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Row(
                        children: <Widget>[
                          Padding(
                            padding: EdgeInsets.all(8.0),
                            child: IconButton(
                              icon: Icon(Icons.slideshow),
                              onPressed: () => Navigator.pushNamed(
                                context,
                                this.pageName,
                                arguments: ScreenArguments(
                                    this.name,
                                    this.pageName,
                                    this.codeFilePath,
                                    this.codeGithubPath),
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          IconButton(
                            icon: Icon(Icons.code),
                            onPressed: () => Navigator.pushNamed(
                              context,
                              router.SHOW_CODE_FILE,
                              arguments: ScreenArguments(
                                  this.name,
                                  this.pageName,
                                  this.codeFilePath,
                                  this.codeGithubPath),
                            ),
                          ),
                        ],
                      )
                    ],
                  )
//          Padding(
//              padding: EdgeInsets.all(10.0),
//              child: Text(this.description, style: TextStyle(fontSize: 15))),
//          isThreeLine: true,
                  //onTap: () => Navigator.pushNamed(context, this.pageName),
                  ),
            ],
          ),
        ),
//        Divider(
//          color: Colors.blue,
//        ),
      ],
    );
  }
}
