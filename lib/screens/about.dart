import 'package:flutter/material.dart';
import 'package:practice/widgets/leftdrawer.dart';
import 'package:practice/widgets/rightdrawer.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;


class about extends StatefulWidget {
  const about({super.key});

  @override
  State<about> createState() => _aboutState();
}

class _aboutState extends State<about> {
  var _imageUrl = "https://cdn-icons-png.flaticon.com/512/2224/2224321.png";

  void initState() {
      // TODO: implement initState
      super.initState();
      _fetchUserProfile();
    }
  
  _fetchUserProfile() async {
      final response = await http.get(Uri.parse('https://randomuser.me/api/'));
      
        final userData = json.decode(response.body);
        setState(() {
          _imageUrl = userData['results'][0]['picture']['large'];
        });
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (BuildContext , BoxConstraints constraints){
        if(constraints.maxWidth>720){
          return webUI(context);
        } else{
          return mobileUI(context);
        }
      },
      );
  }

   Widget mobileUI(BuildContext context) {
      return 
        Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 207, 65, 229),
        title: Text("About",textAlign: TextAlign.center ),
        actions: [
          Builder(
            builder: (context) => IconButton(
              onPressed: () => Scaffold.of(context).openEndDrawer(), 
              icon: CircleAvatar(radius: 10,
              backgroundColor: Colors.white,
              child:ClipOval(child:
              _imageUrl == "https://cdn-icons-png.flaticon.com/512/2224/2224321.png"? CircularProgressIndicator():Image.network(_imageUrl))))
      )],
      ),
      endDrawer: rightdrawer(),
      drawer: Drawer(
        width:MediaQuery.of(context).size.width<720?MediaQuery.of(context).size.width*.5:MediaQuery.of(context).size.width*.33,
        child:
        Container(
        color: Color.fromARGB(255, 243, 182, 252),
        child: 
        Column(
          children: [
            Container(height: 50,),
            Sidebuttons(context,"Home",0),
            Container(height: 10,),
            Sidebuttons(context,"Projects",1),
            Container(height: 10,),
            Sidebuttons(context,"Report",2),
            Expanded(child: Container()),
            Sidebuttons(context,"Settings",3),
            Container(height: 10,),
            Sidebuttons(context,"About Us",4),
            Container(height: 50,),
            ],
        )
        )
        ),
        body: Container(
          color:Color.fromARGB(255, 234, 172, 244),
          child: Center(
            child: Column(
              children: [
                Container(
                  width: 500,
                  alignment: Alignment.topCenter,
                  child:Image.asset("assets/UI.jpg"),
                ),
                Container(height:10),
                Card(
                  elevation: 20,
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.all(Radius.circular(12.0))
                    ),
                    padding: null,
                    width: 800,
                    child: 
                    Text("\n                  Flutter maybe easy for others but, for me it is pretty hard. One of the hardest things that I had to understand was how the whole built-in code of flutter. Firstly, this was my first UI subject that I have taken. Secondly,the last time I was able to try doing UI was in grade 8 in html. \n                  However, as soon as I got the hang of it. It was actually ok it was not that hard, but it wasn't that easy. As time passes and as the subject got deeper it was actually becoming harder like adding drawers, while also adding packages that have now concrete manual.\n                  As of now, I am still having lots of problems one of those would be in this project which is the drawer, because I cant open it automatically.\n")),
                )
            ],
            
          ),
        ),
      ),
    );
  }

  Widget webUI(BuildContext context) {
    return Scaffold(appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 207, 65, 229),
        title: Text("About",textAlign: TextAlign.center ),
        actions: [
          Builder(
            builder: (context) => IconButton(
              onPressed: () => Scaffold.of(context).openEndDrawer(), 
              icon: CircleAvatar(radius: 10,
              backgroundColor: Colors.white,
              child:ClipOval(child:
              _imageUrl == "https://cdn-icons-png.flaticon.com/512/2224/2224321.png"? CircularProgressIndicator():Image.network(_imageUrl)))))
        ],
      ),
      endDrawer: rightdrawer(),
        body: Container(
          color:Color.fromARGB(255, 234, 172, 244),
          child: Center(
            child: Row(
              children: 
                        [ Drawer(
                          width:MediaQuery.of(context).size.width<720?MediaQuery.of(context).size.width*.5:MediaQuery.of(context).size.width*.33,
                          child:
                          Container(
                          color: Color.fromARGB(255, 243, 182, 252),
                          child: 
                          Column(
                            children: [
                              Container(height: 50,),
                              Sidebuttons(context,"Home",0),
                              Container(height: 10,),
                               Container(
                              width: MediaQuery.of(context).size.width<720?MediaQuery.of(context).size.width*.45:MediaQuery.of(context).size.width*.30,
                              height:50,
                              child:
                              ElevatedButton.icon(onPressed: (() {
                                    Navigator.pushReplacementNamed(context, '/api');;
                                  }),
                                  icon:Icon(Icons.contact_support), 
                                  label: Text("API meals"),
                                  style: ElevatedButton.styleFrom(backgroundColor: Color.fromARGB(255, 207, 65, 229)),
                                  ),
                              ),
                              Container(height: 10,),
                              Sidebuttons(context,"Report",2),
                              Expanded(child: Container()),
                              Sidebuttons(context,"Settings",3),
                              Container(height: 10,),
                              Sidebuttons(context,"About Us",4),
                              Container(height: 50,),
                              ],
                            )
                            )
                            ),
                          Column(
                          children: [
                            Center(
                              child: Row(
                                children: 
                                  [
                                    Container(
                                    width: 450,
                                    alignment: Alignment.topCenter,
                                    child:Image.asset("assets/UI.jpg"),
                                  ),
                                ],
                              ),
                            ),
                            Container(height:10),
                            Row(
                              children: 
                                [
                                  Center(
                                  child: Card(
                                    elevation: 20,
                                    child: Container(
                                        decoration: BoxDecoration(
                                          color: Colors.white,
                                          borderRadius: BorderRadius.all(Radius.circular(12.0))
                                        ),
                                        width: MediaQuery.of(context).size.width*.6,
                                        padding: null,
                                        child: 
                                        Text("\n                  Flutter maybe easy for others but, for me it is pretty hard. One of the hardest things that I had to understand was how the whole built-in code of flutter. Firstly, this was my first UI subject that I have taken. Secondly,the last time I was able to try doing UI was in grade 8 in html. \n                  However, as soon as I got the hang of it. It was actually ok it was not that hard, but it wasn't that easy. As time passes and as the subject got deeper it was actually becoming harder like adding drawers, while also adding packages that have now concrete manual.\n                  As of now, I am still having lots of problems one of those would be in this project which is the drawer, because I cant open it automatically.\n")),
                                  ),
                                ),
                              ],
                            )
                        ],
              
                        ),
                      ],
            ),
        ),
      ),);}

  Container Sidebuttons(BuildContext context, String text, int number ) {
    var arr = [Icons.home, Icons.business_center, Icons.summarize, Icons.settings, Icons.contact_support];
    return Container(
          width: MediaQuery.of(context).size.width<720?MediaQuery.of(context).size.width*.45:MediaQuery.of(context).size.width*.30,
          height:50,
          child:
          ElevatedButton.icon(onPressed: (() {
                
              }),
              icon:Icon(arr[number]), 
              label: Text(text ),
              style: ElevatedButton.styleFrom(backgroundColor: Color.fromARGB(255, 207, 65, 229)),
               )
          );
  }
}