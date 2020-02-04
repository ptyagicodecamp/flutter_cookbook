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
        ListTile(
            isThreeLine: true,
            title: Padding(
              padding: EdgeInsets.all(10.0),
              child: Text(
                this.name,
                style: TextStyle(fontSize: 20),
              ),
            ),
            subtitle: Row(
              children: <Widget>[
                IconButton(
                  icon: Icon(Icons.slideshow),
                  onPressed: () => Navigator.pushNamed(context, this.pageName),
                ),
                SizedBox(
                  width: 5,
                ),
                IconButton(
                  icon: Icon(Icons.code),
                  onPressed: () => Navigator.popAndPushNamed(
                    context,
                    router.SHOW_CODE_FILE,
                    arguments:
                        ScreenArguments(this.codeFilePath, this.codeGithubPath),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(10.0),
                  child: Text(
                    this.description,
                    style: TextStyle(fontSize: 15),
                  ),
                ),
              ],
            )
//          Padding(
//              padding: EdgeInsets.all(10.0),
//              child: Text(this.description, style: TextStyle(fontSize: 15))),
//          isThreeLine: true,
            //onTap: () => Navigator.pushNamed(context, this.pageName),
            ),
        Divider(
          color: Colors.blue,
        ),
      ],
    );
  }
}
