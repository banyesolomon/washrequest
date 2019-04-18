import 'package:flutter/material.dart';
import 'package:washrequest/mapp.dart';



class FindCarwash extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<FindCarwash> {
//CONTROLLERS
  TextEditingController MyLocationFild = TextEditingController();

  //FORM KEYS
  var _formKey = GlobalKey<FormState>();

  //VARIABLES
  final double _minimumPadding = 10.0;
  var _serviceType = ['Wash form me at home', 'Wash for me at car wash'];
  var _defultItemSelected = 'Wash for me at car wash';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        leading: CircleAvatar(
          backgroundColor: Colors.white,
        ),
        centerTitle: true,
        title: Text(
          'Find a carwah near you',
          textAlign: TextAlign.left,
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
      ),

      body: Form(
        key: _formKey,
        child: Padding(
          padding: EdgeInsets.all(_minimumPadding),

          child: ListView(
            children: <Widget>[
              Row(
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.only(
                        top: _minimumPadding * 2,
                        bottom: _minimumPadding * 2,
                        right: _minimumPadding),
                    child: Container(
                        width: 25.0,
                        child: Icon(
                          Icons.location_on,
                          color: Colors.greenAccent,
                        )),
                  ),

                  //TEXT FOEM
                  Expanded(
                    child: Padding(
                      padding: EdgeInsets.only(
                          top: _minimumPadding * 2,
                          bottom: _minimumPadding * 2),
                      child: TextFormField(
                        validator: (var value) {
                          if (value.isEmpty) {
                            return 'this field cannot be left empty';
                          };
                        },
                        controller: MyLocationFild,
                        decoration: InputDecoration(
                          hintText: 'Eg, 1, felix street, ikeja, lagos ',
                          labelText: 'Your location',
                          alignLabelWithHint: true,
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(5.0)),
                        ),
                      ),
                    ),
                  ),
                ],
              ),

              //DROP DOWN MENU BUTTON OPTION
              Row(
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.only(
                        top: _minimumPadding * 2,
                        bottom: _minimumPadding * 2,
                        right: _minimumPadding),
                    child: Icon(
                      Icons.more,
                      color: Colors.blueAccent,
                    ),
                  ),

                  Expanded(
                    child: Padding(
                        padding: EdgeInsets.only(
                            top: _minimumPadding * 2,
                            bottom: _minimumPadding * 2),
                        child: DropdownButton<String>(
                          isDense: true,
                          iconSize: 30,
                          isExpanded: true,
                            elevation: 12,


                            items: _serviceType.map((String value) {
                              return DropdownMenuItem<String>(
                                  value: value, child: Text(value));
                            }).toList(),

                            value: _defultItemSelected,
                            onChanged: (String newItemSelected){
                            onDropDownItemSelected(newItemSelected);

                            })
                    ),
                  ),
                ],
              ),


              Padding(
                padding: EdgeInsets.only(
                    left: _minimumPadding * 5,
                    right: _minimumPadding * 5,
                    bottom: _minimumPadding),

                child: Container(
                  child: Row(
                    children: <Widget>[
                      //THE BUTTON
                      Padding(
                        padding: EdgeInsets.only(
                            top: _minimumPadding * 2,
                            bottom: _minimumPadding * 2,
                            left: _minimumPadding *2,
                            right: _minimumPadding),
                        child: Icon(
                          Icons.search,
                          color: Colors.greenAccent,size: 40,
                        ),
                      ),


                      RaisedButton(
                        color: Colors.greenAccent,
                        child: Text(
                          "Search",
                          style: TextStyle(color: Colors.white, fontSize: 15),
                        ),
                        shape: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.0)),
                        onPressed: () {
                          if(_formKey.currentState.validate()){
                            Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) => myLocation(),)
                            );
                          };

                          },
                      ),
                    ],
                  ),
                ),
              ),

              //DropdownButton(items: _serviceType.map(f), onChanged: null)
            ],
          ),
        ),
      ),
    );
  }

  void onDropDownItemSelected(String newItemSelected) {
    setState(() {
      this._defultItemSelected = newItemSelected;
    });
  }
}
