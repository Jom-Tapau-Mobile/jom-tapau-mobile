import 'package:flutter/material.dart';
import 'package:jom_tapau_mobile/screens/admin/editFromFood.dart';
import 'package:jom_tapau_mobile/services/auth.dart';
import 'package:jom_tapau_mobile/snackbar.dart';
import '../../services/api_services.dart';

class EditFood extends StatefulWidget {
  final List<dynamic> data;
  const EditFood({required this.data});

  @override
  State<EditFood> createState() => _EditFoodState();
}

class _EditFoodState extends State<EditFood> {
  AuthService _auth = AuthService();

  @override
  Widget build(BuildContext context) {
    print(widget.data.length);
    return Scaffold(
        backgroundColor: Color.fromARGB(255, 218, 214, 214),
        appBar: AppBar(
          title: Text('Admin'),
          centerTitle: true,
          backgroundColor: Colors.red,
          actions: <Widget>[
            IconButton(
              onPressed: () {},
              icon: Icon(Icons.person),
            ),
            IconButton(
              icon: Icon(Icons.logout),
              tooltip: 'Logout',
              onPressed: () async {
                await _auth.signOut();
              },
            )
          ],
        ),
        body: ListView(
          children: <Widget>[
            Padding(
              padding: EdgeInsets.fromLTRB(10, 40, 10, 0),
              child: Container(
                /* width: 300, // Specify the desired width
                height: 400,  */ // Specify the desired height
                child: GridView.count(
                  crossAxisCount: 2,
                  controller: new ScrollController(keepScrollOffset: false),
                  shrinkWrap: true,
                  children: List.generate(widget.data.length, (index) {
                    return Padding(
                      padding: EdgeInsets.fromLTRB(1, 2, 1, 2),
                      child: Card(
                        child: Column(
                          children: [
                            Image.network(
                              widget.data[index]['imgURL'],
                              height: 80,
                              width: 150,
                              // fit: BoxFit.cover
                            ),
                            Padding(
                              padding: EdgeInsets.all(8.0),
                              child: Text(
                                widget.data[index]['name'],
                                style: TextStyle(fontSize: 14),
                              ),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Container(
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    border: Border.all(
                                      color: Color.fromARGB(34, 1, 1, 1),
                                    ),
                                    color: Color.fromARGB(255, 229, 226, 226),
                                  ),
                                  child: IconButton(
                                    icon: Icon(Icons.edit),
                                    onPressed: () {
                                      var foodObj = {
                                        "id": widget.data[index]['_id'],
                                        "name": widget.data[index]['name'],
                                        "price": widget.data[index]['price'],
                                        "imgURL": widget.data[index]['imgURL'],
                                        "category": widget.data[index]
                                            ['category'],
                                        "description": widget.data[index]
                                            ['description']
                                      };
                                      getSingleFood(widget.data[index]['_id'])
                                          .then((value) {
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    EditFoodForm(
                                                        data: foodObj)));
                                      });
                                      // Handle button 1 tap
                                      print(
                                          'Button 1 tapped for ${widget.data[index]['_id']}');
                                    },
                                  ),
                                ),
                                Container(
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    border: Border.all(
                                      color: Color.fromARGB(34, 1, 1, 1),
                                    ),
                                    color: Color.fromARGB(255, 238, 24, 24),
                                  ),
                                  child: IconButton(
                                    icon: Icon(Icons.delete),
                                    onPressed: () {
                                      var message =
                                          deleteFood(widget.data[index]['_id']);

                                      showSnackbar(context);
                                      // Handle button 1 tap
                                      print(
                                          'Button 1 tapped for ${widget.data[index]['_id']}');
                                    },
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    );
                  }),
                ),
              ),
            ),
          ],
        ));
  }
}
