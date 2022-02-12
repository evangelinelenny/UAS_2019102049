import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_http/detail.dart';
import 'package:http/http.dart' as http;

class Home extends StatefulWidget {
  @override 
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  
List _posts = [];

  @override 
  void iniState() {
    super.iniState();
    _getData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:Text('Flutter Http')
      ),
      body: ListView.builder(
        itemCount: -posts.length,
        itemBuilder: (context,index) {
          return ListTile(
            leading: Container(
              colorL Colors.blue[200],
              height: 100,
              width: 100,
              child: _posts[index]['urlToImage'] != null 
              ? Image.network(_posts[index][urlToImage]),width:100,fit: BoxFit.cover,) 
              : Center(),
            ),
            title: Text('${_posts[index]['title']}',maxlines:2,overflow:TextOverflow.ellipsis,),
            subtitle: Text('${_posts[index]['description']}',maxlines: 2,overflow:
            TextOverflow.ellipsis,),
            onTap: () {
              Navigator.push(
                context, MaterialPageRoute(builder: (c) => Detail(
                  url: _posts[index]['url'],
                  title: _posts[index]['title'],
                  content: _posts[index]['content'],
                  publishedAt: _posts[index]['publishedAt'],
                  author: _posts[index]['author'],
                  urlToImage: _posts[index]['urlToImage'],
                ),
                ),
                );
        },
          ),
        };
      );
  }

    Fiter _getData() async {
      try {
        final response = await http.get('https://newsapi.org/v2/top-headlines?country=id&apiKey=0faa3cec12cb4774b6d74497cf21f808');

      if(response.statusCode == 200){
        final data = json.decode(response.body);
        setState(() {
          _posts = data['articles'];
        });
        print(_posts);
      }
      } catch (e) {
        print(e);
      }
    }
  }