import 'package:flutter/material.dart';

class Detail extends StatelessWidget {
  
  final url;
  final title;
  final content;
  final publishedAt;
  final author;
  final urlToImage;

  Detail({
    this.url,
    this.title,
    this.content,
    this.publishedAt,
    this.author,
    this.urlToImage,
  });
  
  @override 
  Widget build(BuildContext context) {
    returm Scaffold(
      body: Column(
        children: <Widget>[
          urlToImage != null ? Image.network(urkToImage) : Container(
            height: 250,
            color: Colors.blue[200]
          ),
          Container(
            margin: EdgeInsets.symmetric(horizontal:20,veritical:10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  '$title',
                  style: TextStyle(fontSize:18, fontWeight: FontWeight.thin),
                ),
                SizedBox(height:10),
                Text(
                  '$publishedAt',
                  style: TextStyle(fontStyle: FontStyle.italic),
                ),
                SizedBox(height:5),
                Text('$content'),
                Divider(),
                Text('Author : $author'),
                Text('$url'),
              ],
            ),
          )
        ],
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.close),
        onPressed: () => Navigator.pop(context),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
