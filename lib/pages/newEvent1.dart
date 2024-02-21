import 'package:flutter/material.dart';

class NewEvent extends StatefulWidget {
  const NewEvent({super.key});

  @override
  State<NewEvent> createState() => _NewEventState();
}

class _NewEventState extends State<NewEvent> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Yeni Atak',
          style: TextStyle(color: Colors.purple, fontSize: 25),
        ),
        backgroundColor: Colors.white,
      ),
      backgroundColor: Colors.purple.shade900,
      body: Center(
        child: Column(
          children: <Widget>[
            SizedBox(
              height: 20,
            ),
            Text(
              "Bu atağınızın en yüksek şiddeti nedir?",
              style: TextStyle(fontSize: 22, color: Colors.white),
            ),
            SizedBox(
              height: 50,
            ),
            Row(
              children: [
                ElevatedButton(
                    onPressed: null,
                    child: Image(
                      height: 150,
                      image: AssetImage('assets/3.png'),
                    )),
                SizedBox(
                  width: 20,
                ),
                ElevatedButton(
                    onPressed: null,
                    child: Image(
                      height: 150,
                      image: AssetImage('assets/4.png'),
                    )),
              ],
            ),
            SizedBox(
              height: 50,
            ),
            Row(
              children: [
                ElevatedButton(
                    onPressed: null,
                    child: Image(
                      height: 150,
                      image: AssetImage('assets/2.png'),
                    )),
                SizedBox(
                  width: 20,
                ),
                ElevatedButton(
                    onPressed: null,
                    child: Image(
                      height: 150,
                      image: AssetImage('assets/1.png'),
                    )),
              ],
            ),
            SizedBox(
              height: 50,
            ),
            Row(
              children: [
                Row(
                  children: [
                    SizedBox(
                      width: 110,
                    ),
                    ElevatedButton(
                        onPressed: () {},
                        child: Image(
                          height: 150,
                          image: AssetImage('assets/5.png'),
                        )),
                  ],
                )
              ],
            ),
            Column(
              children: [
                SizedBox(
                  height: 50,
                ),
                Row(children: [
                  SizedBox(
                    width: 200,
                  ),
                  ElevatedButton(
                      onPressed: null,
                      child: Text(
                        "Devam",
                        style: TextStyle(color: Colors.white, fontSize: 30),
                      )),
                ]),
              ],
            )
          ],
        ),
      ),
    );
  }
}
