
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';


class DesktopScreen extends StatefulWidget {
  @override
  createState() => DesktopScreenState();
}

class DesktopScreenState extends State<DesktopScreen>
{
  var from;
  var to;
  dynamic val;
  dynamic result=0;
  String? message = '';
  convert( from, to, val)
  {
    dynamic unit = {'Meter':[1,100,1000],
      'Centimeter':[.01,1,10],
      'Millimeter': [.001,.1,1]};
    var index = {'Meter':0, 'Centimeter':1, 'Millimeter':2};

    var s = unit[from];
    var mul = s[index[to]];

    setState(() {
      result = val*mul;
      message = 'Your Output is ${result} ${to}';
    });

  }



  Widget build(BuildContext context)
  {
    var units = ['Meter','Centimeter','Millimeter'];
    return MaterialApp(home: Scaffold(appBar: AppBar(title: Center(child: Text('Unit Convertor App'))),
      body:   Row(
        children: [

          Padding(
            padding: const EdgeInsets.fromLTRB(140,0,0,0),

            child: Container(
              child: Column(children: [
                SizedBox(height: 150,),
                Container(
                  child: Row(
                    children: [
                      SizedBox(width: 28,),
                      Column(
                        children: [
                          Text('From', style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),),
                          DropdownButton(items: units.map((String a){
                            return DropdownMenuItem(child: Text(a), value: a,);}).toList(),
                              onChanged: (value){
                                setState(() {
                                  from =  value;
                                });
                              }, value: from),

                        ],
                      ),
                      SizedBox(width: 50,),
                      Column(
                        children: [
                          Text('To', style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),),
                          DropdownButton(items: units.map((String a){
                            return DropdownMenuItem(child: Text(a), value: a,);}).toList(),
                              onChanged: (value){
                                setState(() {
                                  to =  value;
                                });
                              }, value: to),
                        ],
                      ),

                    ],
                  ),
                  width: 310,
                ),


                SizedBox(height: 20,),

                Container(
                  child: TextField(decoration: InputDecoration(label: Center(child: Text('Value', style: TextStyle(fontSize: 10),)), hintText: 'Enter the Value'),onChanged: (value){
                    setState(() {
                      val = int.tryParse(value);

                    });


                  }, textAlign: TextAlign.center, keyboardType: TextInputType.number,
                    inputFormatters: <TextInputFormatter>[FilteringTextInputFormatter.digitsOnly,], ),
                  width: 240,
                ),

                SizedBox(height: 50,),
                Container(
                  child:
                  ElevatedButton(onPressed: () {
                    if(from.isEmpty || to.isEmpty || val==null)
                    {
                      return;
                    }
                    else{
                      convert(from,to,val);
                    }
                  },
                    style: ElevatedButton.styleFrom(
                      primary: Colors.blue,
                      onPrimary: Colors.white,
                      elevation: 20,  // Elevation
                      shadowColor: Colors.black, // Shadow Color
                    ),
                    child: const Text(
                      'Convert',
                      style: TextStyle(fontSize: 20),
                    ),
                  ),

                  width: 240,
                ),
                SizedBox(height: 50,),

                Text('${message}', style: TextStyle(fontSize: 20,),),

              ],),
              margin: EdgeInsets.all(30),  decoration:BoxDecoration(border: Border.all( width: 3, color: Colors.black
            ),
                borderRadius: BorderRadius.circular(15)
            ), ),
          ),

          Padding(
            padding: const EdgeInsets.fromLTRB(150, 120, 0 ,0),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(0,0,120,0),
                  child: Container(child: Text('UNIT CONVERTOR', style: TextStyle(fontSize: 40, color: Colors.blue, fontWeight: FontWeight.bold),)

                  ),
                ),
                SizedBox(height: 35,),

                Container(child: Text('''A unit converter is a tool or software that allows you to convert measurements from one unit to another.\n It is commonly used to convert lengths, weights, volumes, temperatures, and other physical quantities. \nIn the context of your question, let's focus on length conversion.\nWhen converting lengths, such as meters (m), centimeters (cm), and millimeters (mm),\n a unit converter provides a convenient way to switch between these units. \nHere's a brief description of each unit:\n\nMeter (m): It is the fundamental unit of length in the metric system and is equal to 100 centimeters or 1,000 millimeters. \nMeters are commonly used to measure larger distances, such as the height of a person or the length of a room.\n\nCentimeter (cm): It is a smaller unit of length, where 1 centimeter is equal to 0.01 meters or 10 millimeters.\n Centimeters are often used for measuring smaller objects or finer details within larger objects.\n\nMillimeter (mm): It is an even smaller unit of length, where 1 millimeter \nis equal to 0.001 meters or 0.1 centimeters. Millimeters are commonly used for precise measurements, \nsuch as the thickness of a coin or the diameter of a small object.''',
                  style: TextStyle(fontSize: 15,),)

                ),

              ],
            ),
          ),

        ],
      ),



    ),
      debugShowCheckedModeBanner: false,);

  }
}





