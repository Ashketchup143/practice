import 'package:flutter/material.dart';
import 'package:practice/widgets/leftdrawer.dart';
import 'package:practice/widgets/rightdrawer.dart';

class home extends StatelessWidget {
  const home({super.key});

  @override

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 207, 65, 229),
        title: Text("Home",textAlign: TextAlign.center,),
        actions: [
          Builder(
            builder: (context) => IconButton(
              onPressed: () => Scaffold.of(context).openEndDrawer(), 
              icon: Container(child:Icon(Icons.account_circle_sharp))))
        ],
      ),
      endDrawer: rightdrawer(),
      drawer: leftdrawer(),
       body:LayoutBuilder(
      builder: (BuildContext , BoxConstraints constraints){
        if(constraints.maxWidth>720){
          return webUI(context);
        } else{
          return mobileUI(context);
        }
      },
      )
  );
  }
    Widget mobileUI(BuildContext context) {
      return Container(
        child:
      Container(
        color: Color.fromARGB(255, 234, 172, 244),
        child:
        Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                width: 300,
                height: 300,
                child: Image.asset("assets/logo.png"))])
                )
                ),
        );
      
    
  }
  
  Widget webUI(BuildContext context) {
    return Container(child:
      Container(
        color: Color.fromARGB(255, 234, 172, 244),
        child:
        Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                width: 400,
                height: 400,
                child: Image.asset("assets/logo.png"))])
                )
                ),
        );

  }
}