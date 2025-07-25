import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

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
    final filteredMeals = _meals.where((meal) {
      final query = _searchQuery.toLowerCase();
      return meal['name']!.toLowerCase().contains(query) ||
             meal['date']!.contains(query);
    }).toList();

    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          colors: [Color(0xFF2D8C8C), Color(0xFFFFA726)],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 40),
            Text(
              'Search',
              style: GoogleFonts.poppins(
                fontSize: 28,
                fontWeight: FontWeight.bold,
                color: const Color(0xFF333333),
              ),
            ),
            const SizedBox(height: 24),
            // Search Bar
            TextField(
              controller: _controller,
              decoration: InputDecoration(
                prefixIcon: Icon(Icons.search, color: Color(0xFF2D8C8C)),
                hintText: 'Search Here',
                hintStyle: GoogleFonts.openSans(color: Colors.grey),
                filled: true,
                fillColor: Color(0xFFF5F5F5),
                contentPadding: EdgeInsets.symmetric(vertical: 0, horizontal: 20),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(16),
                  borderSide: BorderSide.none,
                ),
              ),
              style: GoogleFonts.openSans(fontSize: 16),
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
                        style: GoogleFonts.openSans(fontSize: 18, color: Color(0xFF333333)),
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
                          elevation: 3,
                          margin: const EdgeInsets.symmetric(vertical: 8),
                          child: ListTile(
                            leading: Icon(Icons.restaurant_menu, color: Color(0xFF2D8C8C)),
                            title: Text(meal['name']!, style: GoogleFonts.poppins(fontWeight: FontWeight.w600)),
                            subtitle: Text('Date: ${meal['date']}', style: GoogleFonts.openSans()),
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
