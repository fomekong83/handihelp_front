import 'package:flutter/material.dart';

class ListeExercicesScreen extends StatefulWidget {
  const ListeExercicesScreen({super.key});

  @override
  State<ListeExercicesScreen> createState() => _ListeExercicesScreenState();
}

class _ListeExercicesScreenState extends State<ListeExercicesScreen> {
  final _searchController = TextEditingController();
  //List<User> suggestions = [];

  int _calculateCrossAxisCount(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final desiredWidth = 150.0; // Desired width of each grid item

    final crossAxisCount = screenWidth ~/ desiredWidth;
    return crossAxisCount.clamp(1, 6); // Limit the crossAxisCount between 1 and 6
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Les Exercices"),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right:  10),
            child: IconButton(
                onPressed: (){
                  Navigator.of(context).pushNamed("/ajouter_exercice");
                },
                icon: Icon(Icons.add,color:  Colors.black,)
            ),
          )
        ],
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            children: [
              TextField(
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
              SizedBox(height: 10,),
              Expanded(
                child: GridView.builder(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: _calculateCrossAxisCount(context),
                    crossAxisSpacing: 8.0,
                    mainAxisSpacing: 8.0,
                  ),
                  itemCount: 100, // Replace with your actual item count
                  itemBuilder: (context, index) {
                    return InkWell(
                      onTap: (){
                        showDialog(
                            context: context,
                            builder: (context){
                              return AlertDialog(
                                content: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Container(
                                      height: 200,
                                      color: Colors.black,
                                    ),
                                    Text("Name"),
                                    Text("Category"),
                                  ],
                                ),
                              );
                            }
                        );
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.grey[300],
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                        child: Center(
                          child: Text('Item $index'),
                        ),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}


