import 'package:flutter/material.dart';

class AjouterExercice extends StatefulWidget {
  @override
  _AjouterExerciceState createState() => _AjouterExerciceState();
}

class _AjouterExerciceState extends State<AjouterExercice> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _descriptionController = TextEditingController();
  final _categoryController = TextEditingController();
  final _difficultyLevelController = TextEditingController();
  final _durationController = TextEditingController();
  final _caloriesBurnedController = TextEditingController();
  final _equipmentNeededController = TextEditingController();
  final _videoUrlController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add Exercise'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
              TextFormField(
                controller: _nameController,
                decoration: InputDecoration(labelText: 'Name'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter a name';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _descriptionController,
                decoration: InputDecoration(labelText: 'Description'),
                maxLines: 3,
              ),
              TextFormField(
                controller: _categoryController,
                decoration: InputDecoration(labelText: 'Category'),
              ),
              TextFormField(
                controller: _difficultyLevelController,
                decoration: InputDecoration(labelText: 'Difficulty Level'),
              ),
              TextFormField(
                controller: _durationController,
                decoration: InputDecoration(labelText: 'Duration (minutes)'),
                keyboardType: TextInputType.number,
              ),
              TextFormField(
                controller: _caloriesBurnedController,
                decoration: InputDecoration(labelText: 'Calories Burned'),
                keyboardType: TextInputType.number,
              ),
              TextFormField(
                controller: _equipmentNeededController,
                decoration: InputDecoration(labelText: 'Equipment Needed'),
              ),
              TextFormField(
                controller: _videoUrlController,
                decoration: InputDecoration(labelText: 'Video URL'),
              ),
              SizedBox(height: 16.0),
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    // Save the exercise data
                    // You can access the form field values using the controllers
                    // For example: _nameController.text
                  }
                },
                child: Text('Save'),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _nameController.dispose();
    _descriptionController.dispose();
    _categoryController.dispose();
    _difficultyLevelController.dispose();
    _durationController.dispose();
    _caloriesBurnedController.dispose();
    _equipmentNeededController.dispose();
    _videoUrlController.dispose();
    super.dispose();
  }
}
