import 'package:flutter/material.dart';
import 'package:flutter_app/addLanguage.dart';
import 'package:flutter_svg/flutter_svg.dart';

// main: no mundo DART, ponto de entrada da aplicação
void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      //theme: ThemeData(primarySwatch: Colors.blue),
      theme: ThemeData.dark(),
      //home: MyHomePage(title: 'Flutter Demo Home Page'),
      initialRoute: '/',
      routes: {
        "/": (context) => MyHomePage(),
        "/add": (context) => AddLanguage()
      },
    );
  }
}

class MyHomePage extends StatefulWidget {
  // {} = parâmetros são opcionais
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  // visibilidade: público e privado
  // privado só adicionar o _ na frente do nome
  @override
  _MyHomePageState createState() => _MyHomePageState(); // todo: wtf?
}

class _MyHomePageState extends State<MyHomePage> {
  /*int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }*/

  List<bool> selects = List.generate(4, (index) => false);
  List<String> _labels = ['Android Studio', 'iOS Nativo', 'Flutter', 'Ionic'];

  List<Widget> buildListItens() {
    return [
      if (selects[0]) getNativeAndroidOption,
      if (selects[1]) getNativeiOSOption,
      if (selects[2]) getFlutterOption,
      if (selects[3]) getIonicOption
    ];
  }

  Widget getNativeAndroidOption = Card(
    child: ListTile(
      leading: Icon(Icons.android),
      title: Text('Android Nativo'),
      subtitle: Text('Linguagens C, Java e Kotlin'),
    ),
  );
  Widget getNativeiOSOption = Card(
    child: ListTile(
      leading: SvgPicture.asset("images/apple.svg"),
      title: Text('iOS Nativo'),
      subtitle: Text('Linguagens Objective C e Swift'),
    ),
  );
  Widget getFlutterOption = Card(
    child: ListTile(
      leading: FlutterLogo(),
      title: Text('Flutter'),
      subtitle: Text('Linguagens DART e nativas'),
    ),
  );
  Widget getIonicOption = Card(
    child: ListTile(
      leading: Icon(Icons.blur_circular),
      title: Text('Ionic'),
      subtitle: Text('Linguagens JavaScipt e TypeScript'),
    ),
  );

  Widget buildChoiceChip(int index) => ChoiceChip(
      label: Text(_labels[index]),
      selected: selects[index],
      onSelected: (value) {
        setState(() {
          selects[index] = value;
        });
      });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Languages'),
        actions: [
          IconButton(icon: Icon(Icons.add_circle_outline), onPressed: () {
            Navigator.pushNamed(
                context,
                "/add"
            );
          })
        ],
      ),
      body: Column(
        children: <Widget>[
          Wrap(
            spacing: 10,
            children: <Widget>[
              buildChoiceChip(0),
              buildChoiceChip(1),
              buildChoiceChip(2),
              buildChoiceChip(3),
            ],
          ),
          Expanded(
            child: ListView(children: buildListItens()),
          ),
        ],
      ),
    );
  }
}
