import 'package:flutter/material.dart';

class ListeHopitauxScreen extends StatefulWidget {
  const ListeHopitauxScreen({super.key});

  @override
  State<ListeHopitauxScreen> createState() => _ListeHopitauxScreenState();
}

class _ListeHopitauxScreenState extends State<ListeHopitauxScreen> {
  final _searchController = TextEditingController();
  //List<User> suggestions = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Liste des Hopitaux"),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right:  10),
            child: IconButton(
                onPressed: (){
                  Navigator.of(context).pushNamed("/ajouter_hopital");
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
                        Navigator.of(context).pushNamed("/voir_hopital");
                      },
                      title: Text("Hopital efoulan".toUpperCase(),style: TextStyle(fontWeight: FontWeight.w900),),
                      subtitle: Text("dfdfdfdfdf"),
                      trailing: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text("8"),
                          Text("Medecin")
                        ],
                      ),
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
