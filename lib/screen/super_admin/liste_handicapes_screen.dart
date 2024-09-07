import 'package:flutter/material.dart';

class ListeHandicapesScreen extends StatefulWidget {
  const ListeHandicapesScreen({super.key});

  @override
  State<ListeHandicapesScreen> createState() => _ListeHandicapesScreenState();
}

class _ListeHandicapesScreenState extends State<ListeHandicapesScreen> {
  final _searchController = TextEditingController();
  //List<User> suggestions = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Les specialiter"),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right:  10),
            child: IconButton(
                onPressed: (){
                  showAddSpecialtyDialog(context);
                },
                icon: Icon(Icons.add,color:  Colors.black,)
            ),
          )
        ],
      ),
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: TextField(
                controller: _searchController,
                decoration: InputDecoration(
                  hintText: 'Rechercher...',
                  filled: true,
                  fillColor: Colors.white,
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.greenAccent, width: 2.0),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.indigo, width: 2.0),
                  ),
                  errorBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.red, width: 3.0),
                  ),
                  focusedErrorBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.red, width: 3.0),
                  ),
                  prefixIcon: Icon(Icons.search),
                  //border: OutlineInputBorder(),
                ),
                onChanged: (value) {
                  /*suggestions.clear();
                  suggestions.addAll(widget.teachers.where((element)=>element.name.toLowerCase().contains(value.toLowerCase())));

                  if(value.isEmpty){
                    suggestions.clear();
                    suggestions.addAll(widget.teachers);
                  }*/
                  setState(() {

                  });
                },
              ),
            ),
            Expanded(
              child: ListView.builder(
                shrinkWrap: true,
                itemCount: 20,
                itemBuilder: (context,index){
                  return Container(
                    margin: EdgeInsets.all(8.0),
                    decoration: BoxDecoration(
                      color: Colors.grey[100],
                      borderRadius: BorderRadius.circular(20),
                      border: Border.all(color: Colors.black),
                    ),
                    child: ListTile(
                      onTap: (){
                        //Navigator.of(context).pushNamed("/voir_hopital");
                      },
                      title: Text("Syndrome".toUpperCase(),style: TextStyle(fontWeight: FontWeight.w900),),
                      subtitle: Text("dfdfdfdfdf"),
                      trailing: Icon(Icons.update,color: Colors.blue,),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}



Future<void> showAddSpecialtyDialog(BuildContext context) async {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _descriptionController = TextEditingController();

  return showDialog<void>(
    context: context,
    barrierDismissible: true,
    builder: (BuildContext context) {
      return AlertDialog(
        title: Text('Ajouter Handicape',textAlign: TextAlign.center,),
        content: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                TextFormField(
                  controller: _nameController,
                  decoration: InputDecoration(labelText: 'Nom'),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Entrez un nom svp';
                    }
                    return null;
                  },
                ),
                TextFormField(
                  controller: _descriptionController,
                  decoration: InputDecoration(labelText: 'Description'),
                  maxLines: 3,
                ),
              ],
            ),
          ),
        ),
        actions: <Widget>[
          TextButton(
            child: Text('Annuler'),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
          TextButton(
            child: Text('Enregistrer'),
            onPressed: () {
              if (_formKey.currentState!.validate()) {
                // Save the specialty data
                // You can access the form field values using the controllers
                // For example: _nameController.text
                Navigator.of(context).pop();
              }
            },
          ),
        ],
      );
    },
  );
}
