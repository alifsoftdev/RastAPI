import 'package:rest_api/helper/model.dart';
import 'package:http/http.dart' as http;

class UserHelper {
  Future <List<User>?>getUserData()async{
    var response=await http.get(Uri.parse('https://jsonplaceholder.typicode.com/posts'));
    if (response.statusCode==200) {
      var data=response.body;
      print(data);
      return userFromJson(data);
    }
  }
}