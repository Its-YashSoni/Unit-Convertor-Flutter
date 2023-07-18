
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';


class MobileScreen extends StatefulWidget {
  @override
  createState() => MobileScreenState();
}

class MobileScreenState extends State<MobileScreen>
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
      'Millimeter': [.001,.1,1],
    };
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
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    var units = ['Meter','Centimeter','Millimeter'];
    return MaterialApp(home: Scaffold(appBar: AppBar(title: Center(child: Text('Unit Convertor App'))),
      body:    SingleChildScrollView(
        child: Container(
          child: Column(children: [
                    SizedBox(height: height*0.2,),
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
                      width: width*0.7,
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

                      width: width*0.6,
                    ),
                    SizedBox(height: 50,),

                    Text('${message}', style: TextStyle(fontSize: 20,),),

                  ],),  decoration:BoxDecoration(border: Border.all( width: 3, color: Colors.black
              ),
                  borderRadius: BorderRadius.circular(15)
              ), width: width,height: height,),
      ), ),

      debugShowCheckedModeBanner: false,);

  }
}





