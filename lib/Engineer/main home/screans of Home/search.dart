import 'package:flutter/material.dart';



class SearchPage extends StatelessWidget {
  SearchPage({Key? key}) : super(key: key);
  String searchQuery = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(top: 35, left: 20, right: 20),
        child: Column(
          children: [
            TextField(
              onChanged: (value) {
                searchQuery = value;
              },
              decoration: InputDecoration(
                filled: true,
                fillColor: Colors.grey[300],
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                  borderSide: BorderSide(
                    style: BorderStyle.none,
                    width: 0,
                  ),
                ),
                hintText: 'Search ....',
                prefixIcon: IconButton(
                  icon: Icon(Icons.search, color: Colors.grey),
                  onPressed: () async {
                    // Implement search functionality
                    //    List<String> searchResults = await searchUsers(searchQuery);
                  },
                ),
              ),
            ),

            // Implement displaying search results if needed
          ],
        ),
      ),
    );
  }
}
