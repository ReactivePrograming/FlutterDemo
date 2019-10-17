import 'package:flutter/material.dart';

void main() => runApp(ListDemoView());

//定义我们的listView

class ListDemoView extends StatefulWidget {

  @override
  _ListViewState createState() => _ListViewState();

}

//定义状态，statefulless的生成之后没有办法改变

class _ListViewState extends State<ListDemoView> {

  //属性
  List<String> items = <String>["A", "B", "C", "D"];

  //任何一个widget 初始化的必走的方法，类似于viewDidLoad
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    //局部变量
    Iterable<Widget> listTitles = items.map<Widget>( (String item) => buildListTitle(context, item));

    return new MaterialApp(
        title: "new",
        home: new Scaffold(
          appBar: AppBar(
            title: Text('List View 真机'),
            actions: <Widget>[
              IconButton(icon: const Icon(Icons.sort_by_alpha), tooltip: "sort", onPressed: () {

              }),
              IconButton(icon: const Icon(Icons.more_horiz), onPressed: null)
            ],
          ),
          body: Scrollbar(
            child: ListView(
              padding: EdgeInsets.symmetric(vertical: 4.0),
              children: listTitles.toList(),
            ),
          ),
        ),
    );

  }

  //自定义cell title

  Widget buildListTitle(BuildContext context, String item) {
    Widget secondary;
    secondary = const Text("Additional item information");
    return MergeSemantics(
      child: ListTile(
        isThreeLine: false,
        dense: false,
        leading: null,
        title: Text('this is $item'),
        subtitle: secondary,
        trailing: null,
      ),
    );
  }
}





















