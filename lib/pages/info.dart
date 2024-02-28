import 'package:flutter/material.dart';

class InfoPage extends StatefulWidget {

  final List<String> infos;
  const InfoPage({Key? key, required this.infos});

 

  @override
  State<InfoPage> createState() => InfoPageState();
}

class InfoPageState extends State<InfoPage> {

List<Map<String, String>> parseInfoList(List<String> infoList) {
  List<Map<String, String>> parsedList = [];

  infoList.forEach((infoText) {
    Map<String, String> info = parseInfo(infoText);
    parsedList.add(info);
  });

  return parsedList;
}

Map<String, String> parseInfo(String infoText) {
  Map<String, String> info = {
    'date': '',
    'intensity': '',
    'type': '',
    'symptoms': '',
  };

  List<String> parts = infoText.split(', ');
  parts.forEach((part) {
    List<String> keyValue = part.split(': ');
    String key = keyValue[0].trim();
    String value = keyValue[1].trim();

    if (key == 'symptoms') {
      value = value.substring(1, value.length - 1); 
    }
    info[key] = value;
  });

  return info;
}

   @override
  void initState() {
  
    super.initState();
  }
  @override
Widget build(BuildContext context) {
  List<Map<String, String>> parsedInfos = parseInfoList(widget.infos);

  return Scaffold(
    appBar: AppBar(
      title: Text('Information Page', style: TextStyle(color: Colors.black)),
      backgroundColor: Colors.white,
      elevation: 0,
      iconTheme: IconThemeData(color: Colors.black), 
    ),
    backgroundColor: Colors.white,
    body: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
         
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Date: ${parsedInfos[0]['date']}', style: TextStyle(fontSize: 18)),
                Text('Intensity: ${parsedInfos[0]['intensity']}', style: TextStyle(fontSize: 18)),
                Text('Type: ${parsedInfos[0]['type']}', style: TextStyle(fontSize: 18)),
                Text('Symptoms: ${parsedInfos[0]['symptoms']}', style: TextStyle(fontSize: 18)),
                Divider(),
                
              ],
              
            ),
          ),
      ],
    ),
  );
}
}