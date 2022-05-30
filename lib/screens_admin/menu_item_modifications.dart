import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../customs/sharedElements/AppColors.dart';
import '../customs/sharedElements/AppColors.dart';
import '../customs/sharedElements/BigText.dart';
import '../customs/sharedElements/SmallText.dart';
import '../models/menu_item.dart';

class MenuItemModification extends StatefulWidget {
  MenuItem menuItem;
  MenuItemModification({Key? key,required this.menuItem}) : super(key: key);
  @override
  State<MenuItemModification> createState() => _MenuItemModificationState();
}

class _MenuItemModificationState extends State<MenuItemModification> {
  @override
  final TextEditingController _newMenuItemTitle = TextEditingController();
  final TextEditingController availabilityDateController = TextEditingController();
  DateTime _date = DateTime.now();
  Widget build(BuildContext context) {
    widget.menuItem;
    return Scaffold(
        appBar: AppBar(
          title: BigText(text: " Menu item 1 "),
          leading: const BackButton(
            color : AppColors.textColor,
          ),
        ),
        body: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              children: [
                const SizedBox(height: 30,),
                Padding(
                  padding: const EdgeInsets.all(15),
                  child: SizedBox(
                    height: 60,
                    child: Card(
                        shape: const RoundedRectangleBorder(
                          side:  BorderSide(
                            color: Colors.grey,
                            width: 2.0,
                          ),
                        ),
                        child: buildAccountRow(context, "Change Menu item title","New menu title",_newMenuItemTitle,'menu title')
                    ),
                  ),
                ),

                Padding(
                  padding: const EdgeInsets.all(20),
                  child: SizedBox(
                    height: 60,
                      child: SizedBox(
                        height: 60,
                        child: TextFormField(
                          textAlign: TextAlign.center,
                          style: const TextStyle(
                            fontSize: 18,
                            height: 0.4,
                          ),
                          controller:
                          availabilityDateController,
                          //editing controller of this TextField
                          decoration: InputDecoration(
                              prefixIcon: const Icon(Icons.calendar_today), //icon of text field
                              hintText:
                              "Availability date :   ${_date.year}-${_date.month}-${_date.day}",
                              border: OutlineInputBorder(
                                  borderSide: BorderSide(color: AppColors.mainColor)),
                              focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(color: AppColors.mainColor))),
                          readOnly: true,
                          //set to true, so that user will not able to edit text
                          onTap: () async {
                            setState(() {
                              _selectDate(context);
                            });
                          },
                        ),
                      ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(20,0,20,20),
                  child: SizedBox(
                    height: 60,
                    child: Card(
                      shape: const RoundedRectangleBorder(
                        side:  BorderSide(
                          color: Colors.grey,
                          width: 2.0,
                        ),
                      ),
                      child: buildAccountRow(context, "Change maximum component's number","New maximum number",_newMenuItemTitle,"max components"),
                    ),
                  ),
                ),


                 Center(
                  child: Padding(
                    padding:const EdgeInsets.symmetric(horizontal:0,vertical: 20),
                    child: BigText(text:"Modify your menu item components"),
                  ),
                ),
                SmallText(
                  text: "Add a component",
                  color: AppColors.mainColor,
                  size: 18,
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(40,20,0,0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                    SizedBox(
                      width: 220,
                      height: 40,
                      child: OutlinedButton(
                        onPressed: () {
                        },
                          child: SmallText(
                          text: "Pizza",
                          color: AppColors.mainColor,
                          size: 18,
                        ),
                        style: OutlinedButton.styleFrom(
                        side: BorderSide(color: AppColors.mainColor),
                        ),
                      ),
                    ),
                      IconButton(
                        icon: const Icon(Icons.delete_rounded),
                        onPressed: () {
                        },
                      ),
                      IconButton(
                        icon: const Icon(Icons.mode_edit),
                        onPressed: () {
                        },
                      ),
                    ]
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(40,20,0,0),
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        SizedBox(
                          width: 220,
                          height: 40,
                          child: OutlinedButton(
                            onPressed: () {
                            },
                            child: SmallText(
                              text: "Hamburger",
                              color: AppColors.mainColor,
                              size: 18,
                            ),
                            style: OutlinedButton.styleFrom(
                              side: BorderSide(color: AppColors.mainColor),
                            ),
                          ),
                        ),
                        IconButton(
                          icon: const Icon(Icons.delete_rounded),
                          onPressed: () {
                          },
                        ),
                        IconButton(
                          icon: const Icon(Icons.mode_edit),
                          onPressed: () {
                          },
                        ),
                      ]
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(40,20,0,0),
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        SizedBox(
                          width: 220,
                          height: 40,
                          child: OutlinedButton(
                            onPressed: () {
                            },
                            child: SmallText(
                              text: "stuffed baguette",
                              color: AppColors.mainColor,
                              size: 18,
                            ),
                            style: OutlinedButton.styleFrom(
                              side: BorderSide(color: AppColors.mainColor),
                            ),
                          ),
                        ),
                        IconButton(
                          icon: const Icon(Icons.delete_rounded),
                          onPressed: () {
                          },
                        ),
                        IconButton(
                          icon: const Icon(Icons.mode_edit),
                          onPressed: () {
                          },
                        ),
                      ]
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(80,20, 0, 20),
                  child: Row(
                    children: [
                      FlatButton(
                        height: 40,
                        color: AppColors.mainColor,
                          onPressed: (){},
                          child:  BigText(text: "save changes",)
                      ),
                      const SizedBox(width: 20,),
                      SizedBox(
                        height: 40,
                        child: OutlinedButton(
                            onPressed: (){},
                            child: const Text("Cancel",style: TextStyle(
                              fontSize: 20,
                            ),)
                        ),
                      )
                    ],
                  ),
                )
              ],
        ),
      )
      )
    );
  }
  Future<void> _selectDate(BuildContext context,) async {
    DateTime? _datePicker = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(
          2000), //DateTime.now() - not to allow to choose before today.
      lastDate: DateTime(2101),
    );
    if (_datePicker != null) {
      setState(() {
        _date = _datePicker;
      });
    }
  }
  GestureDetector buildAccountRow(BuildContext context, String label,
      String hintedText, TextEditingController textForm, String choice) {
    return GestureDetector(
      onTap: () {
        showDialog(context: context, builder: (BuildContext context) {
          return AlertDialog(
            title: Text(label),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 8, vertical: 16),
                  child: TextField(
                    controller: textForm,
                    decoration: InputDecoration(
                      border: const OutlineInputBorder(),
                      hintText: hintedText,
                    ),
                  ),
                ),
              ],
            ),
            actions: [
              TextButton(onPressed: () {
                Navigator.of(context).pop();
              },
                child: const Text("Close"),
              ),
              TextButton(onPressed: () {
                Navigator.of(context).pop();
              },
                child: const Text("Edit"),
              ),
            ],
          );
        });
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8.0),
        child: Padding(
          padding: const EdgeInsets.only(left: 60),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("Change $choice", style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w500,
                color: Colors.grey[600],
              ),
              ),
              const Padding(
                  padding: EdgeInsets.only(right: 50),
                  child: Icon(Icons.mode_edit, color: Colors.black,
                  )
              ),
            ],),
        ),
      ),
    );
  }
}
