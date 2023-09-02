import 'package:flutter/cupertino.dart';

class homeCupertino extends StatelessWidget {
  const homeCupertino({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        middle: Text("Home Page"),
      ),
      child: Center(child: Text("This is CupertinoApp")),
    );
  }
}
