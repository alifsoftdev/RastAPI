import 'package:flutter/material.dart';
import 'package:rest_api/helper/userHelper.dart';
import 'helper/model.dart';

class Home extends StatefulWidget {
  
  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
List <User>? users;
bool isloaded=false;
getData()async{
   users= await UserHelper().getUserData();
   setState(() {
     isloaded=true;
   });
}

@override
  void initState() {
    getData();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Users'),
        centerTitle: true,
      ),
      body: ListView.builder(
        itemCount: users?.length??0,
        itemBuilder:(context, index){
          return Card(
               child: ListTile(
                title: Text(users![index].title),
                subtitle: Text(users![index].id.toString()),
               ),
          );
        }
        ),
    );
  }
}