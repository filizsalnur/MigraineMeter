import 'package:flutter/material.dart';
import 'package:migraine_meter/pages/calendar_page.dart';

class InfoPage extends StatefulWidget {
  final List<String> info;
  final String dateOfEvent;

  const InfoPage({Key? key, required this.info, required this.dateOfEvent}) : super(key: key);

  @override
  InfoPageState createState() => InfoPageState();
}

class InfoPageState extends State<InfoPage> {
  Map<String, String> resultMap = {};
  List<String> symptoms = [];

  @override
  void initState() {
   symptoms= convertListToMap(widget.info);
   setState(() {
    symptoms=symptoms;
   });
   
  

  }



  String englishToTurkish(String value) {
    switch (value) {
      case 'Intensity':
        return 'Şiddet';
      case 'Type':
        return 'Tip';
      case 'Symptoms':
        return 'Belirtiler';
      case 'No Ache':
        return 'Ağrı Yok';
      case 'Low Ache':
        return 'Hafif Ağrı';
      case 'Medium Ache':
        return 'Orta Ağrı';
      case 'High Ache':
        return 'Yüksek Ağrı';
      case 'Very High Ache':
        return 'Çok Yüksek Ağrı';
      case 'Squeezing Pain':
        return 'Sıkıştırıcı Ağrı';
      case 'Feeling of Pressure':
        return 'Basınç Hissi';
      case 'Pain with Movement':
        return 'Hareketle Ağrı';
      case 'Nausea':
        return 'Mide Bulantısı';
      case 'Vomiting':
        return 'Kusma';
      case 'Sensitivity to Light':
        return 'Işığa Hassasiyet';
      case 'Sensitivity to Sound':
        return 'Sese Hassasiyet';
      case 'Sensitivity to Smell':
        return 'Kokuya Hassasiyet';
      case 'Visual Disturbances':
        return 'Görme Bozuklukları';
      case 'Runny Nose':
        return 'Burun Akıntısı';
      case 'Dizziness':
        return 'Baş Dönmesi';
      case 'Neck Pain':
        return 'Boyun Ağrısı';
      case 'Info Page':
        return 'Bilgi Sayfası';
      default:
        return value;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(englishToTurkish("Info Page")),
        backgroundColor: Colors.purple.shade900,
      ),
      body: ListView(
        padding: EdgeInsets.all(16.0),
        children: [
          _buildInfoDate('Tarih', formatDate(widget.dateOfEvent)),
          _buildInfoItem('Intensity', englishToTurkish(_getValueByKey('intensity'))),
_buildSymptoms('Semptomlar', symptoms),

          _buildImageByPart(_getValueByKey('type')),
        ],
      ),
    );
  }

  String _getValueByKey(String key) {
    for (String item in widget.info) {
      if (item.contains('$key:')) {
        return item.split(':').last.trim();
      }
    }
    return ''; 
  }

  String formatDate(String date) {
    date = date.split(' ').first;
    DateTime date1 = DateTime.parse(date);
    return CalendarPageState().formatDateTr(date1);
  }


  Widget _buildInfoItem(String title, String value) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          englishToTurkish(title),
          style: TextStyle(
            fontSize: 22.0,
            fontWeight: FontWeight.bold,
            color: Colors.purple.shade900,
          ),
        ),
        SizedBox(height: 8.0),
        Text(
          value,
          style: TextStyle(fontSize: 20.0),
        ),
        Divider(), 
        SizedBox(height: 8.0),
      ],
    );
  }

  Widget _buildInfoDate(String title, String value) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          value,
          style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold, color: Colors.purple.shade900),
        ),
        Divider(), 
        SizedBox(height: 8.0),
      ],
    );
  }

 Widget _buildSymptoms(String title, List<String> value) {
  
  
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(
        englishToTurkish(title),
        style: TextStyle(
          fontSize: 22.0,
          fontWeight: FontWeight.bold,
          color: Colors.purple.shade900,
        ),
      ),
      SizedBox(height: 8.0),
      ListView.builder(
        shrinkWrap: true,
        itemCount: value.length,
        itemBuilder: (context, index) {
          return Text(
            englishToTurkish(value[index]),
            style: TextStyle(fontSize: 20.0),
          );
        },
      ),
      Divider(), 
      SizedBox(height: 8.0),
    ],
  );
}
  Widget _buildImageByPart(String type) {
    String imagePath = 'assets/default_image.png';

    if (type.contains('part1')) {
      imagePath = 'assets/b1.png';
    } else if (type.contains('part2')) {
      imagePath = 'assets/b2.png';
    } else if (type.contains('part3')) {
      imagePath = 'assets/b3.png';
    } else if (type.contains('part4')) {
      imagePath = 'assets/b4.png';
    } else if (type.contains('part5')) {
      imagePath = 'assets/b5.png';
    } else if (type.contains('part6')) {
      imagePath = 'assets/b6.png';
    } else if (type.contains('part7')) {
      imagePath = 'assets/b7.png';
    } else if (type.contains('part8')) {
      imagePath = 'assets/b8.png';
    } else if (type.contains('part9')) {
      imagePath = 'assets/b9.png';
    } else if (type.contains('part10')) {
      imagePath = 'assets/b10.png';
    }

    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text(
              'Ağrının Lokasyonu',
              style: TextStyle(
                fontSize: 22.0,
                fontWeight: FontWeight.bold,
                color: Colors.purple.shade900,
              ),
            ),
          ],
        ),
        Image.asset(
          imagePath,
          width: 300,
          height: 300,
        ),
      ],
    );
  }

  List<String> convertListToMap(List<String> data) {
  Map<String, String> resultMap = {};
  bool symptomsFound = false; // "symptoms" anahtarının bulunup bulunmadığını izlemek için bir bayrak
  
  for (String item in data) {
    List<String> parts = item.split(',');
    for (String part in parts) {
      if (symptomsFound) {
        List<String> symptomList = part
            .split(',')
            .map((symptom) => symptom.trim())
            .toList();
            print("<<<<<<<<<<<<<<<<<<< SYMPTOM >>>>>>>>>>>>>>>>>>>>>");
            print(symptomList);
            symptoms.add(symptomList.toString().trim().replaceAll('[', '').replaceAll(']', '').replaceAll('}', ''));
        for (String symptom in symptomList) {
          List<String> keyValue = symptom.split(':');
          String key = keyValue[0].trim();
          String value = keyValue.sublist(1).join(':').trim();
          resultMap[key] = value;
          
        }
      } else if (part.contains('symptoms')) {
 
        symptomsFound = true;
      } else {
    
        List<String> keyValue = part.split(':');
        String key = keyValue[0].trim();
        String value = keyValue.sublist(1).join(':').trim();
        resultMap[key] = value;
      }
    }
  }


  return symptoms;
}
}
