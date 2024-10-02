import 'package:flutter/material.dart';

class ListeDirecteurScreen extends StatefulWidget {
  const ListeDirecteurScreen({super.key});

  @override
  State<ListeDirecteurScreen> createState() => _ListeDirecteurScreenState();
}

class _ListeDirecteurScreenState extends State<ListeDirecteurScreen> {
  final _searchController = TextEditingController();
  //List<User> suggestions = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Les Directeur"),
      ),
      body: SafeArea(
        child: LayoutBuilder(
          builder: (context, constraints) {
            final width = constraints.maxWidth;
            final height = constraints.maxHeight;
            final itemHeight = 140.0;
            final itemWidth = 100.0;

            final crossCount = (width / itemWidth).floor();

            return Column(
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
                    child: GridView.builder(
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: crossCount,
                        childAspectRatio: itemWidth / itemHeight,
                      ),
                      itemBuilder: (context, index) {
                        return InkWell(
                          onTap: (){

                          },
                          child: Container(
                            decoration: BoxDecoration(
                              border: Border.all(color: Colors.primaries[index % Colors.primaries.length],width: 3),
                            ),
                            margin: const EdgeInsets.all(8),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                SizedBox(height: 5,),
                                CircleAvatar(
                                  radius: 40,
                                  backgroundColor: Colors.black,
                                ),
                                Text('Nom', style: const TextStyle(fontSize: 18),),
                                Text('Hopital', style: const TextStyle(fontSize: 20),),
                              ],
                            ),
                          ),
                        );
                      },
                    )),
              ],
            );
          },
        ),
      ),
    );
  }
}
