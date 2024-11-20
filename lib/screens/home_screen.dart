import 'package:provider/provider.dart';
import 'package:flutter/material.dart';
import 'package:recipe_book/providers/recipes_provider.dart';
import 'package:recipe_book/screens/recipe_detail.dart';


class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});


  @override
  Widget build(BuildContext context) {
    final recipesProvider = Provider.of<RecipesProvider>(context , listen: false);
    recipesProvider.fetchRecipes();

    
    return Scaffold(
      body: Consumer<RecipesProvider>(
          
          builder: (context, provider, child) {
            if (provider.isLoading) {
              return const Center(child: CircularProgressIndicator(),);  
            } else if(provider.recipes.isEmpty) {
              return const Center(child: Text('No recipes found'),);
            } else {
              return ListView.builder(
                  itemCount: provider.recipes.length,
                  itemBuilder: (context, index) {
                    return _RecipesCard(context, provider.recipes[index]);
                  });
            }
          }),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.orange,
        child: Icon(Icons.add, color: Colors.white),
        onPressed: () {
          _showBottom(context); // Esto está correcto y debería funcionar
        },
      ),
    );
  }

  Future<void> _showBottom(BuildContext context) {
    return showModalBottomSheet(
      context: context,
      builder: (context) =>
          Container(height: 500, color: Colors.white, child: RecipeForm()),
    );
  }

  Widget _RecipesCard(BuildContext context, dynamic recipe) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) =>
                    RecipeDetail(recipesData: recipe)));
      },
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          width: MediaQuery.of(context).size.width,
          height: 125,
          child: Card(
            child: Row(children: <Widget>[
              Container(
                height: 125,
                width: 100,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(12),
                  child: Image.network(
                    recipe.image_link,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              SizedBox(
                width: 26,
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text( recipe.name,
                      style: TextStyle(fontSize: 16, fontFamily: 'Quicksand')),
                  SizedBox(
                    height: 4,
                  ),
                  Container(
                    height: 2,
                    width: 75,
                    color: Colors.orange,
                  ),
                   Text('By ${recipe.author}',
                      style: const TextStyle(fontSize: 16, fontFamily: 'Quicksand')),
                  SizedBox(
                    height: 4,
                  ),
                ],
              )
            ]),
          ),
        ),
      ),
    );
  }
}

class RecipeForm extends StatelessWidget {
  const RecipeForm({super.key});

  @override
  Widget build(BuildContext context) {
    final _formKey = GlobalKey<FormState>();

    final TextEditingController _recipeName = TextEditingController();
    final TextEditingController _recipeAuthor = TextEditingController();
    final TextEditingController _recipeIMG = TextEditingController();
    final TextEditingController _recipeIngredients = TextEditingController();
    final TextEditingController _recipeDescription = TextEditingController();

    return Padding(
      padding: EdgeInsets.all(8),
      child: Form(
        key: _formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Add New Recipe',
              style: TextStyle(
                color: Colors.orange,
                fontSize: 24,
              ),
            ),
            SizedBox(
              height: 16,
            ),
            _buidTextField(
                controller: _recipeName,
                label: 'Recipe Name',
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter the name recipe';
                  }
                  return null;
                }),
            SizedBox(
              height: 16,
            ),
            _buidTextField(
                controller: _recipeAuthor,
                label: 'Nombre Author',
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter the name recipe';
                  }
                  return null;
                }),
            SizedBox(
              height: 16,
            ),
            _buidTextField(
                controller: _recipeIMG,
                label: 'Image URL',
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter the name recipe';
                  }
                  return null;
                }),
            SizedBox(
              height: 16,
            ),
            _buidTextField(
                controller: _recipeIngredients,
                label: 'Ingredients',
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter the name recipe';
                  }
                  return null;
                }),
            SizedBox(
              height: 16,
            ),
            _buidTextField(
                maxLines: 4,
                controller: _recipeDescription,
                label: 'Recipe Content',
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter the name recipe';
                  }
                  return null;
                }),
            SizedBox(
              height: 16,
            ),
            Center(
              child: ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) Navigator.pop(context);
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.orange,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)),
                ),
                child: Text(
                  'Save Recipe',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buidTextField(
      {required String label,
      required TextEditingController controller,
      required String? Function(String?) validator,
      int maxLines = 1}) {
    return TextFormField(
      decoration: InputDecoration(
          labelText: label,
          labelStyle: TextStyle(
            fontFamily: 'Quicksand',
            color: Colors.orange,
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.orange, width: 1),
              borderRadius: BorderRadius.circular(10))),
      validator: validator,
      maxLines: maxLines,
    );
  }
}
