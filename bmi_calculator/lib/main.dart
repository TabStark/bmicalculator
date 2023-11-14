import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(primarySwatch: Colors.purple),
      debugShowCheckedModeBanner: false,
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  var getWt = TextEditingController();
  var getCt = TextEditingController();
  var getFt = TextEditingController();
  var getIn = TextEditingController();
  var result = "";
  var bgColor;
  var bmi;
  var msg = '';
  var Txtcol;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("BMI Calculator"),
      ),
      body: Container(
        color: bgColor,
        child: Center(
          child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Container(
              padding: EdgeInsets.all(20),
              width: 370,
              height: 550,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.white,
                  boxShadow: const [
                    BoxShadow(color: Colors.grey, blurRadius: 10)
                  ]),
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    TextField(
                      controller: getWt,
                      decoration: const InputDecoration(
                          label: Text("Enter Your Weight"),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(15)),
                          )),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    TextField(
                      controller: getCt,
                      decoration: const InputDecoration(
                          label: Text("Enter Your Height in Centimeter"),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(15)),
                          )),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    const Divider(
                      thickness: 1,
                      color: Colors.grey,
                    ),
                    const SizedBox(
                      height: 20,
                      child: Text("or"),
                    ),
                    TextField(
                      controller: getFt,
                      decoration: const InputDecoration(
                          label: Text("Enter Your Height in Feet"),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(15)),
                          )),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    TextField(
                      controller: getIn,
                      decoration: const InputDecoration(
                          label: Text("Enter Your Height in Inch"),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(15)),
                          )),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    ElevatedButton(
                        onPressed: calculate, child: Text("Calculate")),
                    const SizedBox(
                      height: 20,
                    ),
                    Text(
                      result,
                      style: TextStyle(fontSize: 20, color: Txtcol),
                    ),
                    Text(
                      msg,
                      style: TextStyle(fontSize: 20, color: Txtcol),
                    )
                  ]),
            ),
          ),
        ),
      ),
    );
  }

  calculate() {
    var redWt = getWt.text.toString();
    var redCt = getCt.text.toString();
    var redFt = getFt.text.toString();
    var redIn = getIn.text.toString();

    if (redWt != "" && redFt != "" && redIn != "") {
      var Calwt = int.parse(redWt);
      var Calft = int.parse(redFt);
      var Calinc = int.parse(redIn);

      var tinc = (Calft * 12) + Calinc;
      var tCm = tinc * 2.54;
      var tM = tCm / 100;

      bmi = Calwt / (tM * tM);

      setState(() {
        Colorfun();
        result = "Your BMI is ${bmi.toStringAsFixed(2)}";
      });
    } else if (redWt != "" && redCt != "") {
      var Calwt = int.parse(redWt);
      var Calct = int.parse(redCt);

      var tmeter = Calct / 100;
      bmi = Calwt / (tmeter * tmeter);

      setState(() {
        Colorfun();
        result = "Your BMI is ${bmi.toStringAsFixed(2)}";
      });
    } else {
      setState(() {
        result = "Please Fill all the details";
        Txtcol = Colors.red;
      });
    }
  }

  void Colorfun() {
    if (bmi > 25) {
      msg = "You are Over Weight";
      bgColor = Colors.orangeAccent;
      Txtcol = Colors.orange;
    } else if (bmi < 18) {
      msg = "You are Under Weight";
      bgColor = Colors.redAccent;
      Txtcol = Colors.redAccent;
    } else {
      msg = "You are Healthy";
      bgColor = Colors.greenAccent;
      Txtcol = const Color.fromARGB(255, 1, 70, 4);
    }
  }
}
