import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/user.dart';

class RechercheHopital extends StatefulWidget {
  List<User> teachers = [];

  RechercheHopital({required this.teachers});

  @override
  _SearchDialogContentState createState() => _SearchDialogContentState();
}

class _SearchDialogContentState extends State<RechercheHopital> {
  final _searchController = TextEditingController();
  List<User> suggestions = [];

  @override
  void initState() {
    suggestions.addAll(widget.teachers);
    super.initState();
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }


  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Row(
          children: [
            Expanded(
              child: TextField(
                controller: _searchController,
                autofocus: true,
                decoration: InputDecoration(
                  hintText: 'nom...',
                  prefixIcon: Icon(Icons.search),
                  //border: OutlineInputBorder(),
                ),
                onChanged: (value) {
                  suggestions.clear();
                  suggestions.addAll(widget.teachers.where((element)=>element.name.toLowerCase().contains(value.toLowerCase())));

                  if(value.isEmpty){
                    suggestions.clear();
                    suggestions.addAll(widget.teachers);
                  }
                  setState(() {

                  });
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(right: 20,top: 10,left: 10),
              child: IconButton(
                  onPressed: (){
                    Navigator.of(context).pop();
                  },
                  icon: Icon(Icons.close,color: Colors.red,)
              ),
            )
          ],
        ),
        Expanded(
          child: Column(
            children: [
              SizedBox(height: 10,),
              Text("Rechercher un hopital",style: TextStyle(color: Colors.grey),),
              SizedBox(height: 10,),
              Expanded(
                child: ListView.builder(
                  itemCount: suggestions.length, // Replace with your actual data length
                  itemBuilder: (context, index) {
                    //return AssignSubjectToTeacher(subject: widget.subject, personel: suggestions[index]);
                  },
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}