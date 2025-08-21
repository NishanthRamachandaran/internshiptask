import 'package:flutter/material.dart';

class ManageCustomersScreen extends StatelessWidget {
  const ManageCustomersScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Hardcoded customer list for demo
    final List<String> customers = [
      'John Doe',
      'Jane Smith',
      'Bob Johnson',
      'Alice Williams',
      'Charlie Brown',
      'Emma Watson',
      'Michael Chen',
      'Sarah Wilson'
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text('Manage Customers'),
      ),
      body: ListView.builder(
        itemCount: customers.length,
        itemBuilder: (context, index) {
          return ListTile(
            leading: CircleAvatar(
              backgroundColor: Colors.orange[700],
              child: Text(
                customers[index][0],
                style: const TextStyle(color: Colors.white),
              ),
            ),
            title: Text(customers[index]),
            subtitle: Text('customer${index + 1}@example.com'),
            trailing: const Icon(Icons.arrow_forward_ios, size: 16),
            onTap: () {
              // Would navigate to customer details in real app
            },
          );
        },
      ),
    );
  }
}