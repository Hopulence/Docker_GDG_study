import 'package:docker_study/provider.dart';
import 'package:docker_study/user.dart';
import 'package:flutter/material.dart';


import 'item.dart';

void main() => runApp(Provider(
  child: MyApp(),
));

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final _titleController = new TextEditingController();
  final _bodyController = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    final bloc = Provider.of(context).bloc;

    addUser() {
      final user = User(id: _titleController.text, password: _bodyController.text);
      bloc.add(user);
    }

    return Scaffold(
      appBar: AppBar(
        title: Text('Sign In'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: <Widget>[
            TextField(
              controller: _titleController,
            ),
            TextField(
              controller: _bodyController,
            ),
            StreamBuilder(
              stream: bloc.value,
              builder: (BuildContext context, AsyncSnapshot<String> snapshot) {
                final value = snapshot.data ?? "";
                return Text(value);
              },
            ),
            RaisedButton(
              child: Text('enroll'),
              onPressed: () {
                //TODO 클릭시 타이틀과 내용을 스트림으로 던짐
                //타이틀과 내용 서버로 저장
                addUser();
              },
            ),
            Container(
              height: 300,
              child: StreamBuilder(
                stream: bloc.users,
                builder: (context, AsyncSnapshot<List<User>> snapshot) {
                  final users = snapshot.data ?? [];
                  var user;
                  return ListView.builder(
                    shrinkWrap: true,
                    itemCount: user.length,
                    itemBuilder: (context, index) => Text(users[index].id),
                  );
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}

class TextFeild {
}