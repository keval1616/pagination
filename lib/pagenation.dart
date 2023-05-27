
import 'package:flutter/material.dart';

class PaginationExample extends StatefulWidget {
  @override
  _PaginationExampleState createState() => _PaginationExampleState();
}

class _PaginationExampleState extends State<PaginationExample> {
  // Dummy list of items
  List<String> items = List.generate(100, (index) => 'Item ${index + 1}');
  int currentPage = 1;
  int itemsPerPage = 10;
  int totalPages;

  @override
  void initState() {
    super.initState();
    // Calculate the total number of pages
    totalPages = (items.length / itemsPerPage).ceil();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Pagination Example'),
      ),
      body: ListView.builder(
        itemCount: (currentPage * itemsPerPage) > items.length
            ? items.length
            : currentPage * itemsPerPage,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(items[index]),
          );
        },
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentPage - 1,
        onTap: (int index) {
          setState(() {
            currentPage = index + 1;
          });
        },
        items: List.generate(totalPages, (index) {
          return BottomNavigationBarItem(
            label: '${index + 1}',
            icon: Icon(Icons.pages),
          );
        }),
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(
    home: PaginationExample(),
  ));
}