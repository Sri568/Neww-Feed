import 'package:flutter/material.dart';
import 'package:newsfeed/model/newsmodel.dart';

import 'newsparse.dart';



class Favorites extends StatelessWidget{

  const Favorites();
  @override
  Widget build(BuildContext context) {
    final InheritedDataProvider? myInheritedWidget = InheritedDataProvider.of(context);
     List<Datum> alist = null ?.myInheritedWidget.data;
    return Scaffold(
      body: Container(
          decoration: BoxDecoration(
              color: Colors.white
          ),
          child: ListView.builder(
            itemCount: 0,
            padding: EdgeInsets.all(8.0),
            itemBuilder: (BuildContext context, int index) {
              return Column(
                children: [
                  GestureDetector(
                    child: Card(
                      color: Colors.white,
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15.0)),
                      child: Column(
                        children: [
                          ListTile(
                            title: Text(alist[index].title,style: TextStyle(color: Colors.black,fontSize: 16.0),),
                            subtitle: Text(alist[index].published,style: TextStyle(color: Colors.black),),
                            leading: Icon(Icons.favorite ,
                                color:  Colors.red  ),

                          )
                        ],
                      ),
                    ),

                  )
                ],
              );
            },
          )
      ),
    );
  }

}

