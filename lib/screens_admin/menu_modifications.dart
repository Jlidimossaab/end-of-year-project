import 'package:flutter/material.dart';
import 'package:pfa_mobile_app/customs/sharedElements/SmallText.dart';
import 'package:pfa_mobile_app/customs/sharedElements/SmallTextCentered.dart';

import '../customs/sharedElements/AppColors.dart';
import '../customs/sharedElements/BigText.dart';

class MenuModification extends StatefulWidget {
  const MenuModification({Key? key}) : super(key: key);

  @override
  State<MenuModification> createState() => _MenuModificationState();
}

class _MenuModificationState extends State<MenuModification> {

  final TextEditingController _newMenuTitle = TextEditingController();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: BigText(text: " Menu Modification "),
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
                        child: buildAccountRow(context, "Change Menu Title","New menu title",_newMenuTitle,'menu title')
                    ),
                  ),
                ),

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
                        child: buildAccountRow(context, "Change Maximum Number","New maximum number",_newMenuTitle,'max number')
                    ),
                  ),
                ),


                const SizedBox(height: 20,),

                FlatButton(
                  minWidth: 300,
                   height: 50,
                   color: AppColors.mainColor,
                    onPressed: (){},
                    child: SmallText(text:"Add menu item",size: 20,color: AppColors.backgroundWhite,)
                ),

                 Padding(
                  padding:const EdgeInsets.symmetric(horizontal:20,vertical: 20),
                  child: BigText(text: "Modify the menu list ",size: 24,),
                  )  ,
                Padding(
                    padding: const EdgeInsets.all(20),
                    child: Table(
                      border: TableBorder.all(),
                      children: [
                        buildRow(['Lunch','Dinner'], isHeader: true),
                        buildRow(['Menu Item 1','Menu Item 2']),
                        buildRow(['Menu Item 3','Menu Item 4']),
                        buildRow(['Menu Item 5','Menu Item 6']),
                        buildRow(['Menu Item 7','Menu Item 8']),
                        buildRow(['Menu Item 9','Menu Item 10']),
                        buildRow(['Menu Item 11','Menu Item 12']),
                      ],
                    )
                )
              ],
          ),
        ),
      ),
    );
  }



  GestureDetector buildAccountRow(BuildContext context, String label,
      String hintedText, TextEditingController textForm, String choice) {
    return GestureDetector(
      onTap: () {
        showDialog(context: context, builder: (BuildContext context) {
          return AlertDialog(
            title: SmallText(text: label),
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
          padding: const EdgeInsets.only(left: 80),
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
  TableRow buildRow(List<String> cells, {bool isHeader = false}) => TableRow(
    children: cells.map((cell) {
      final style = TextStyle(
        fontWeight: isHeader? FontWeight.bold : FontWeight.normal,
        color: isHeader? Colors.black: Colors.grey[600] ,
        fontSize: 18,
      );

      return Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(7),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(cell,style: style),
                  !isHeader? Padding(
                    padding: const EdgeInsets.only(right: 0),
                    child: IconButton(
                      icon: const Icon(Icons.mode_edit, color: Colors.black),
                      onPressed: (){

                      },
                    ),
                  ): const Padding(
                    padding: EdgeInsets.only(right: 0))
                ]
              ),
            ),
          ]
      );
    }).toList()
  );
}
