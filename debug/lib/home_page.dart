import 'package:flutter/material.dart';

class Page {
  Page({
    this.name,
    this.endPoint,
  });

  final String name;
  final String endPoint;
}

final pages = <Page>[
  Page(
    name: 'Shape',
    endPoint: 'shape_page',
  ),
];

class PageCard extends StatelessWidget {
  PageCard({Key key, @required this.package, @required this.onPressed}):super(key: key);

  final Page package;
  final Function onPressed;
  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    final TextStyle titleStyle = theme.textTheme.title;
    final TextStyle descriptionStyle = theme.textTheme.body1;

    return Container(
      padding: const EdgeInsets.all(4.0),
      child: GestureDetector(
        onTap: () {
          this.onPressed(this.package.endPoint);
        },
        child: Card(
          child: DefaultTextStyle(
            softWrap: false,
            overflow: TextOverflow.ellipsis,
            style: descriptionStyle,
            child: Padding(
              padding: const EdgeInsets.fromLTRB(12.0, 12.0, 12.0, 12.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 10.0),
                    child: Text(this.package.name, style: titleStyle,),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 4.0),
                    child: Text('GitHub:  ${this.package.endPoint}'),
                  ),
                ],
              ),
            ),
          )
        ),
      )
    );
  }
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Chart Packages'),
      ),
      body: ListView(
        children: pages.map((package) => (
          PageCard(
            package: package,
            onPressed: (String endPoint) {
              Navigator.pushNamed(context, '/demos/$endPoint');
            },
          )
        )).toList(),
      )
    );
  }
}
