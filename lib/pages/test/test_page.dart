import 'package:flutter/material.dart';

void main() {
  runApp(FoodSearchApp());
}

class FoodSearchApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Food Search',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: FoodSearchPage(),
    );
  }
}

class FoodSearchPage extends StatefulWidget {
  @override
  _FoodSearchPageState createState() => _FoodSearchPageState();
}

class _FoodSearchPageState extends State<FoodSearchPage> {
  List<Map<String, String>> foodItems = [
    {'name': 'Pizza', 'category': 'Vegetarian'},
    {'name': 'Burger', 'category': 'Non-Vegetarian'},
    {'name': 'Pasta', 'category': 'Vegetarian'},
    {'name': 'Sushi', 'category': 'Non-Vegetarian'},
    {'name': 'Tacos', 'category': 'Vegan'},
    {'name': 'Salad', 'category': 'Vegan'},
    {'name': 'Sandwich', 'category': 'Vegetarian'},
    {'name': 'Steak', 'category': 'Non-Vegetarian'},
    {'name': 'Ice Cream', 'category': 'Vegetarian'},
    {'name': 'Donuts', 'category': 'Vegetarian'}
  ];

  List<Map<String, String>> filteredFoodItems = [];
  List<String> selectedCategories = ['All'];
  String searchQuery = '';

  @override
  void initState() {
    super.initState();
    filteredFoodItems = foodItems;
  }

  void _filterFoodItems() {
    final filtered = foodItems.where((foodItem) {
      final matchesQuery = foodItem['name']!
          .toLowerCase()
          .contains(searchQuery.toLowerCase());
      final matchesCategory = selectedCategories.contains('All') ||
          selectedCategories.contains(foodItem['category']);
      return matchesQuery && matchesCategory;
    }).toList();

    setState(() {
      filteredFoodItems = filtered;
    });
  }

  void _navigateToFilterPage() async {
    final result = await Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => FilterPage(selectedCategories: selectedCategories),
      ),
    );
    if (result != null) {
      setState(() {
        selectedCategories = result;
        _filterFoodItems();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Search Food Items'),
        actions: [
          IconButton(
            icon: Icon(Icons.filter_list),
            onPressed: _navigateToFilterPage,
          )
        ],
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              onChanged: (query) {
                setState(() {
                  searchQuery = query;
                  _filterFoodItems();
                });
              },
              decoration: InputDecoration(
                labelText: 'Search',
                prefixIcon: Icon(Icons.search),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(25.0)),
                ),
              ),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: filteredFoodItems.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(filteredFoodItems[index]['name']!),
                  subtitle: Text(filteredFoodItems[index]['category']!),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

class FilterPage extends StatefulWidget {
  final List<String> selectedCategories;

  FilterPage({required this.selectedCategories});

  @override
  _FilterPageState createState() => _FilterPageState();
}

class _FilterPageState extends State<FilterPage> {
  late List<String> _tempSelectedCategories;

  @override
  void initState() {
    super.initState();
    _tempSelectedCategories = List.from(widget.selectedCategories);
  }

  void _onCategoryChanged(bool? selected, String category) {
    setState(() {
      if (selected == true) {
        _tempSelectedCategories.add(category);
      } else {
        _tempSelectedCategories.remove(category);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Select Categories'),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.pop(context, _tempSelectedCategories);
            },
            child: Text(
              'Done',
              style: TextStyle(color: Colors.white),
            ),
          ),
        ],
      ),
      body: ListView(
        children: <String>['All', 'Vegetarian', 'Non-Vegetarian', 'Vegan']
            .map((String category) {
          return CheckboxListTile(
            title: Text(category),
            value: _tempSelectedCategories.contains(category),
            onChanged: (bool? selected) {
              if (category == 'All') {
                setState(() {
                  _tempSelectedCategories = ['All'];
                });
              } else {
                if (selected == true && _tempSelectedCategories.contains('All')) {
                  _tempSelectedCategories.remove('All');
                }
                _onCategoryChanged(selected, category);
              }
            },
          );
        }).toList(),
      ),
    );
  }
}
