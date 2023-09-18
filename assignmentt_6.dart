import 'package:flutter/cupertino.dart';

import 'package:flutter/material.dart';

List<String> Images = [
  'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQjaZWqWfcUskU_FilsOpEpwY3Ehnmqxdtjlw&usqp=CAU',
  'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQjaZWqWfcUskU_FilsOpEpwY3Ehnmqxdtjlw&usqp=CAU',
  'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTv-oOY-qCTfAueOmKFxtQR-8L0J9knQkmpIg&usqp=CAU',
  'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSECtg5jpZmjf6LgZSq34X_G_QuqrV8tjo_t-_Zf5EQRiGc134n_hy2bncdg4myrxrz-QE&usqp=CAU',
  'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTv-oOY-qCTfAueOmKFxtQR-8L0J9knQkmpIg&usqp=CAU',
  'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTv-oOY-qCTfAueOmKFxtQR-8L0J9knQkmpIg&usqp=CAU',
];

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatelessWidget {
  get images => null;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text('Photo Gallery'),
        ),
        body: Column(
          //mainAxisAlignment: MainAxisAlignment.start ,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
                padding: EdgeInsets.all(8.0),
                child: SingleChildScrollView(
                  child: Text(
                    'Welcome to My Photo Gallery!',
                    style: TextStyle(fontSize: 25, fontWeight: FontWeight.w400),
                  ),
                )),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: TextField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Search For Photos',
                ),
              ),
            ),
            Expanded(
                child: GridView.builder(
                    //shrinkWrap: true,

                    //scrollDirection: Axis.vertical,
                    itemCount: Images.length,
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 3, crossAxisSpacing: 15),
                    itemBuilder: (context, index) {
                      Text('Photo $index');
                      return GridTile(
                        footer: Text(
                          'Photo $index',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontSize: 15, fontWeight: FontWeight.bold),
                        ),
                        child: GestureDetector(
                          onTap: () {
                            ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(content: Text('Photo Number $index')));
                          },
                          child: Container(
                            //padding: EdgeInsets.all(12.0),
                            margin: EdgeInsets.all(10.0),

                            height: 400,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(12.0),
                              image: DecorationImage(
                                image: NetworkImage(
                                  Images[index],
                                ),
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                        ),
                      );
                    })),
            Expanded(
              child: ListView.separated(
                itemCount: 3,
                itemBuilder: (context, index) {
                  return ListTile(
                      title: Text(
                        'Photo $index',
                      ),
                      subtitle: Text('Description for Photo $index'),
                      leading: CircleAvatar(
                        backgroundImage: NetworkImage(
                          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQ8dAHdFADBWov0RUOmmmHUY9jacolVnT2AwA&usqp=CAU',
                        ),
                      ));
                },
                separatorBuilder: (context, index) {
                  return Column(
                    children: <Widget>[
                      SizedBox(
                        height: 10,
                      ),
                    ],
                  );
                },
              ),
            ),
            Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                // crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  FloatingActionButton(
                    child: Icon(
                      Icons.upload,
                      size: 30,
                    ),

                    // key: Icon(Icons.upload),
                    onPressed: () {
                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                          content: Text('Photos Upadted Successfully')));
                    },
                  ),
                ],
              ),
            )
          ],
        ));
  }
}
