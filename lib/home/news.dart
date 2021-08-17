import 'package:flutter/material.dart';
import 'package:newsfeed/home/favorites.dart';

import 'package:newsfeed/home/newsparse.dart';
import 'package:newsfeed/model/newsdata.dart';
import 'package:newsfeed/network/apimanager.dart';


import 'newsparse.dart';


class News extends StatefulWidget {
  const News({Key? key}) : super(key: key);

  @override
  _NewsState createState() => _NewsState();
}

class _NewsState extends State<News> {
  late Future<NewsParse> data;
  List<Datum> savedNews=[];
  @override
  void initState() {

    super.initState();

        data = new APIManager().newsCall();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          decoration: BoxDecoration(
            color: Colors.white
          ),
          child: SafeArea(
            child: FutureBuilder(
                future: data,
            builder: (BuildContext context, AsyncSnapshot<NewsParse> snapshot) {
              print("test: ${snapshot.hasData}");
                  if(snapshot.hasData){
                     return NewsListView(context,snapshot.data!.data);
                  }else
                    return CircularProgressIndicator();

              },
            ),
          ),
        ),
      )
    );
  }

  Widget NewsListView(BuildContext context, List<Datum> data) {
    DataHold.newsList=data;
    return ListView.builder(
      itemCount: data.length,
      padding: EdgeInsets.all(8.0),
      itemBuilder: (BuildContext context, int index) {
        var selectedNews=data[index];
        bool isSaved=savedNews.contains(selectedNews);
        return Column(
          children: [
            GestureDetector(
              child: Card(
                color: Colors.white,
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15.0)),
                child: Column(
                  children: [
                    ListTile(
                      title: Text(data[index].title,style: TextStyle(color: Colors.black,fontSize: 16.0),),
                      subtitle: Text(data[index].published,style: TextStyle(color: Colors.black),),
                      leading: Icon(isSaved? Icons.favorite : Icons.favorite_border,
                        color:  isSaved ? Colors.red : null ),

                    )
                  ],
                ),
              ),
              onTap: (){
               // Navigator.push(context, MaterialPageRoute(builder:(context) =>RudoDetails(data[index].assetName)));
                setState(() {
                  if(isSaved){
                    savedNews.remove(selectedNews);
                  }else {
                    savedNews.add(selectedNews);
                  }
                  DataHold().alist=savedNews;
                });



              },
            )
          ],
        );
      },

    );
  }

}
