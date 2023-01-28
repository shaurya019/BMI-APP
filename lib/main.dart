import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.indigo,
      ),
      home: const MyHomePage(title: 'BMI APP'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {

      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {

    var wtController = TextEditingController();
    var ftController = TextEditingController();
    var inController = TextEditingController();
    var result = "";
    return Scaffold(
      appBar: AppBar(

        title: Text(widget.title),
      ),
      body:Center(
        child: Container(
          width: 300,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('BMI' , style: TextStyle(
                fontSize: 34,fontWeight: FontWeight.w700,
              ),),
              SizedBox(height: 21),
              TextField(
                controller: wtController,
                decoration: InputDecoration(
                  label: Text('Enter Weight'),
                  prefixIcon: Icon(Icons.line_weight),
                ),
                keyboardType: TextInputType.number,
              ),
              SizedBox(height: 11),
              TextField(
                controller: ftController,
                decoration: InputDecoration(
                  label: Text('Enter Height (in Feet)'),
                  prefixIcon: Icon(Icons.height),
                ),
                keyboardType: TextInputType.number,
              ),
              SizedBox(height: 11),
              TextField(
                controller: inController,
                decoration: InputDecoration(
                  label: Text('Enter Height (in inch)'),
                  prefixIcon: Icon(Icons.height),
                ),
                keyboardType: TextInputType.number,
              ),
              SizedBox(height: 16),
              ElevatedButton(onPressed: (){
                var wt = wtController.text.toString();
                var ft = ftController.text.toString();
                var inch = inController.text.toString();

                if(wt!="" && ft!="" && inch!=""){

                  var iWt = int.parse(wt);
                  var ift = int.parse(ft);
                  var iInch = int.parse(inch);

                  var tInch = (ift*12)+iInch;
                  var tCm = tInch*2.54;
                  var tM = tCm/100;
                  var bmi = iWt/(tM*tM);
                  setState((){
                    result = 'BMI : $bmi';
                  });
                }else{
                  setState(() {
                    result = "Please Fill All Requirements !!";
                  });
                }
              }, child: Text('Calculated')),
              Text(result,style: TextStyle(fontSize: 46),),
            ],
          ),
        ),
      ),
    );
  }
}
