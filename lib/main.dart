import 'package:flutter/material.dart';
import 'cupertino_page.dart';
void main() => runApp(MyApp());

// 변경할 수 없는 위젯
class MyApp extends StatelessWidget {
  @override
  // 플러터는 위젯으로 이루어져 있다.[
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        //home: HelloPage('Hello World'));
        // import 해줘야됨!!
        home: CupertinoPage()
    );
  }
}

// stful 엔터치면 StatefulWidget 생성 가능! - Class 옆에 class 이름 바로 입력해줘야됨!
/* StatefulWidget은 @immutable로 표시된 위젯을 상속하므로 StatefulWidget의 하위 클래스도 변경할 수 없어야합니다
 * 따라서 모든 StatefulWidget 안의 변수는 final 선언해줘야됨!
 * 그리고 초기화를 위해 생성자를 만들어 줘야됨!
 */
class HelloPage extends StatefulWidget {
  final String title;

  // 생성자
  HelloPage(this.title);

  @override
  _HelloPageState createState() => _HelloPageState();
}

class _HelloPageState extends State<HelloPage> {
  // 얘는 변경가능한 메세지, _없으면 public _있으면 private
  String _message = 'Hello World';
  int _counter = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        floatingActionButton:
          FloatingActionButton(
              child: Icon(Icons.add),
              onPressed: _changeMessage),
        appBar: AppBar(
          title: Text(widget.title),
        ),
        body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(_message, style: TextStyle(fontSize: 30)),
                Text('$_counter', style: TextStyle(fontSize: 30)),
              ],
            )
        ));
  }

  // message 값을 바꿔주는 메소드
  void _changeMessage() {
    setState(() {
      _message = '헬로 월드';
      _counter++;
    });
  }
}
