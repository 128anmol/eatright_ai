import 'package:flutter/material.dart';

class SearchScreen extends StatefulWidget {
  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  final TextEditingController _controller = TextEditingController();
  String _searchQuery = '';

  // Sample data: In a real app, this would come from user scans
  final List<Map<String, String>> _meals = [
    {'name': 'Fish Curry', 'date': '2024-06-01'},
    {'name': 'Chicken Biryani', 'date': '2024-06-02'},
    {'name': 'Salad Bowl', 'date': '2024-06-03'},
    {'name': 'Paneer Tikka', 'date': '2024-06-04'},
  ];

  @override
  Widget build(BuildContext context) {
    // Filter meals by name or date
    final filteredMeals = _meals.where((meal) {
      final query = _searchQuery.toLowerCase();
      return meal['name']!.toLowerCase().contains(query) ||
             meal['date']!.contains(query);
    }).toList();

    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 40),
          // Search Bar
          TextField(
            controller: _controller,
            decoration: InputDecoration(
              prefixIcon: Icon(Icons.search, color: Color(0xFF2D8C8C)),
              hintText: 'Search Here',
              filled: true,
              fillColor: Color(0xFFF5F5F5),
              contentPadding: EdgeInsets.symmetric(vertical: 0, horizontal: 20),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(16),
                borderSide: BorderSide.none,
              ),
            ),
            onChanged: (value) {
              setState(() {
                _searchQuery = value;
              });
            },
          ),
          const SizedBox(height: 32),
          // Search Results
          Expanded(
            child: filteredMeals.isEmpty
                ? Center(
                    child: Text(
                      'No results found.',
                      style: TextStyle(fontSize: 18, color: Color(0xFF333333)),
                    ),
                  )
                : ListView.builder(
                    itemCount: filteredMeals.length,
                    itemBuilder: (context, index) {
                      final meal = filteredMeals[index];
                      return Card(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: ListTile(
                          leading: Icon(Icons.restaurant_menu, color: Color(0xFF2D8C8C)),
                          title: Text(meal['name']!),
                          subtitle: Text('Date: ${meal['date']}'),
                        ),
                      );
                    },
                  ),
          ),
        ],
      ),
    );
  }
}
