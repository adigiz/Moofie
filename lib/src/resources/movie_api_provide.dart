import 'dart:async';
import 'package:http/http.dart';
import 'dart:convert';
import '../models/item_model.dart';

class MovieApiProvider {
  Client client = Client();
  final _apiKey = '8bb8a6c86a255498de07a16d086113d9';

  Future<ItemModel> fetchMovieList() async {
    print('entered');
    final response = await client.get("http://api.themoviedb.org/3/movie/popular?api_key=$_apiKey");
    print(response.body.toString());
    if (response.statusCode == 200) {
      return ItemModel.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to load post');
    }
  }
}
