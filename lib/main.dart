import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as convert;

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const LoginPage(),
    );
  }
}

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  Future<void> postData() async {
  var url = Uri.https('my-json-server.typicode.com', '/typicode/demo/posts');
  
  // Create a map representing the data you want to send
  var data = {
    'id': 4,
    'title': 'New Post',
  };

  // Convert the data map to JSON string
  var body = convert.jsonEncode(data);

  // Send the POST request
  var response = await http.post(
    url,
    headers: {'Content-Type': 'application/json'},
    body: body,
  );

  // Check the response status
  if (response.statusCode == 201) {
    print('Post request successful');
    print('Response body: ${response.body}');
  } else {
    print('Post request failed with status: ${response.statusCode}');
  }
}
  List<dynamic> data = [];
  var postdata = {
    'id': 4,
    'title': 'New Post',
  };
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Flutter Http Request'),
      ),
      body: Container(
        child: Column(
          children: [
            ElevatedButton.icon(
              onPressed: () async {
                var url = Uri.https(
                  'my-json-server.typicode.com',
                  '/typicode/demo/posts',
                );
                var response = await http.get(url);
                print('Request failed with status: ${response.statusCode}.');
                print('Request failed with data: ${response.body}.');

                if (response.statusCode == 200) {
                  var jsonData = convert.jsonDecode(response.body);
                  setState(() {
                    data = jsonData;
                  });
                }
              },
              icon: const Icon(Icons.download),
              label: const Text("Mydata"),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: data.length,
                itemBuilder: (context, index) {
                  var item = data[index];
                  return Card(
                    child: ListTile(
                      title: Text(item['id'].toString()),
                      subtitle: Text(item['title']),
                    ),
                  );
                },
              ),
            ),
            ElevatedButton.icon(
              onPressed: (){
              postData();
              }, 
              icon: Icon(Icons.upload),
               label: Text("Upload data"))
          ],
        ),

      ),
    );
  }
}