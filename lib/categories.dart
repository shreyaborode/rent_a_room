import 'package:flutter/material.dart';

class Categories extends StatefulWidget {
  const Categories({Key? key}) : super(key: key);

  @override
  State<Categories> createState() => _CategoriesState();
}

class _CategoriesState extends State<Categories> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.redAccent,
        title: Text('Categories'),
        elevation: 2,
      ),

      body: Center(
        child: Column(
          children: <Widget>[

            Container(
              padding: EdgeInsets.symmetric(vertical: 2.0, horizontal: 15),
              child: Card(
                child: ListTile(
                  leading: Icon(Icons.home_work_rounded,size: 26,color: Colors.redAccent,),
                  title: Text('Flats'),
                  trailing: Icon(Icons.arrow_forward_outlined),
                  onTap: (){},
                ),
              ),
            ),

            Container(
              padding: EdgeInsets.symmetric(vertical: 2.0, horizontal: 15),
              child: Card(
                child: ListTile(
                  leading: Icon(Icons.roofing,size: 26,color: Colors.redAccent),
                  title: Text('Rooms'),
                  trailing: Icon(Icons.arrow_forward_outlined),
                  onTap: (){},
                ),
              ),
            ),

            Container(
              padding: EdgeInsets.symmetric(vertical: 2.0, horizontal: 15),
              child: Card(
                child: ListTile(
                  leading: Icon(Icons.home,size: 26,color: Colors.redAccent),
                  title: Text('Houses'),
                  trailing: Icon(Icons.arrow_forward_outlined),
                  onTap: (){},
                ),
              ),
            ),

            Container(
              padding: EdgeInsets.symmetric(vertical: 2.0, horizontal: 15),
              child: Card(
                child: ListTile(
                  leading: Icon(Icons.list_alt_outlined,size: 26,color: Colors.redAccent),
                  title: Text('View All'),
                  trailing: Icon(Icons.arrow_forward_outlined),
                  onTap: (){},
                ),
              ),
            ),

          ],
        ),
      ),

    );
  }
}
