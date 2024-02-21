import 'package:flutter/material.dart';
import 'package:migraine_meter/pages/historyPage.dart';

class BottomBar extends StatefulWidget {
  final String pageName;
  const BottomBar({super.key,
  required this.pageName,
  });

  @override
  State<BottomBar> createState() => BottomBarState();
}

class BottomBarState extends State<BottomBar> {
  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      height: 70,
      color: Colors.white,
      elevation: 100,
      shape: const CircularNotchedRectangle(),

      child:Padding(padding: EdgeInsets.all(0),
      child: Column(
        children: [
          SizedBox(height: 10,),
          Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
           
            ElevatedButton(
                onPressed: () {},
                child: Icon(Icons.home, size: 40,color: (widget.pageName =="home") ?Colors.white: Colors.black),
                style: ButtonStyle(
                  shape: MaterialStateProperty.all(CircleBorder()),
                  padding: MaterialStateProperty.all(EdgeInsets.all(10)),
                    elevation: MaterialStateProperty.all(0),
                  backgroundColor: (widget.pageName =="home") ? MaterialStateProperty.all(Colors.purple.shade900):MaterialStateProperty.all(Colors.white), 
                 
                ),
              ),
            ElevatedButton(
                onPressed: () {
                    Navigator.push(context,
                  MaterialPageRoute(builder: (context) => MainHistory()));
                },
                child: Icon(Icons.history, size: 40,color: (widget.pageName =="history") ?Colors.white: Colors.black),
                style: ButtonStyle(
                  shape: MaterialStateProperty.all(CircleBorder()),
                  padding: MaterialStateProperty.all(EdgeInsets.all(10)),
                    elevation: MaterialStateProperty.all(0),
                  backgroundColor: (widget.pageName =="history") ? MaterialStateProperty.all(Colors.purple.shade900):MaterialStateProperty.all(Colors.white), 
                 
                ),
              ),
              ElevatedButton(
                onPressed: () {},
                child: Icon(Icons.settings, size: 40,color: (widget.pageName =="settings") ?Colors.white: Colors.black,),
                style: ButtonStyle(
                  shape: MaterialStateProperty.all(CircleBorder()),
                  padding: MaterialStateProperty.all(EdgeInsets.all(10)),
                  elevation: MaterialStateProperty.all(0),
                  backgroundColor: (widget.pageName =="settings") ? MaterialStateProperty.all(Colors.purple.shade900):MaterialStateProperty.all(Colors.white),
                 
                ),
              )
                      
          ]),
        ],
      ),)
    );
  }
}