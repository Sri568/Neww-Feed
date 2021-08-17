import 'package:newsfeed/home/newsparse.dart';

class DataHold{

 static List<Datum> _favList=[];
 static List<Datum> _newsList=[];

  List<Datum> get alist => _favList;

  set alist(List<Datum> value) {
    _favList = value;
  }

 static List<Datum> get newsList => _newsList;

  static set newsList(List<Datum> value) {
    _newsList = value;
  }
}