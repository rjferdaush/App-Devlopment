import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Contact List',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xFF5B7FA6)),
        useMaterial3: true,
      ),
      home: const ContactListScreen(),
    );
  }
}

class ContactListScreen extends StatefulWidget {
  const ContactListScreen({super.key});

  @override
  State<ContactListScreen> createState() => _ContactListScreenState();
}

class _ContactListScreenState extends State<ContactListScreen> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();

  // Static contact list matching the screenshot
  final List<Map<String, String>> _contacts = [
    {'name': 'Jawad', 'phone': '01877-777777'},
    {'name': 'Ferdous', 'phone': '01673-777777'},
    {'name': 'Hasan', 'phone': '01745-777777'},
    {'name': 'Hasan', 'phone': '01745-777777'},
    {'name': 'Hasan', 'phone': '01745-777777'},
  ];

  @override
  void dispose() {
    _nameController.dispose();
    _phoneController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Contact List',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.w500,
            fontSize: 18,
          ),
        ),
        backgroundColor: const Color(0xFF5B7FA6),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            // Name TextFormField
            TextFormField(
              controller: _nameController,
              decoration: InputDecoration(
                hintText: 'Hasan',
                hintStyle: const TextStyle(color: Colors.black54),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(4),
                  borderSide: const BorderSide(color: Colors.grey),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(4),
                  borderSide: const BorderSide(color: Colors.grey),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(4),
                  borderSide: const BorderSide(color: Color(0xFF5B7FA6)),
                ),
                contentPadding: const EdgeInsets.symmetric(
                  horizontal: 12,
                  vertical: 12,
                ),
              ),
            ),
            const SizedBox(height: 10),

            // Phone TextFormField
            TextFormField(
              controller: _phoneController,
              keyboardType: TextInputType.phone,
              decoration: InputDecoration(
                hintText: '01745-777777',
                hintStyle: const TextStyle(color: Colors.black54),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(4),
                  borderSide: const BorderSide(color: Colors.grey),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(4),
                  borderSide: const BorderSide(color: Colors.grey),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(4),
                  borderSide: const BorderSide(color: Color(0xFF5B7FA6)),
                ),
                contentPadding: const EdgeInsets.symmetric(
                  horizontal: 12,
                  vertical: 12,
                ),
              ),
            ),
            const SizedBox(height: 12),

            // Add ElevatedButton
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  // UI only - no functionality needed per assignment
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF5B7FA6),
                  foregroundColor: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(4),
                  ),
                  padding: const EdgeInsets.symmetric(vertical: 14),
                ),
                child: const Text(
                  'Add',
                  style: TextStyle(fontSize: 16),
                ),
              ),
            ),
            const SizedBox(height: 16),

            // Contact List
            Expanded(
              child: ListView.builder(
                itemCount: _contacts.length,
                itemBuilder: (context, index) {
                  final contact = _contacts[index];
                  return Card(
                    elevation: 0,
                    color: const Color(0xFFF5F5F5),
                    margin: const EdgeInsets.symmetric(vertical: 4),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(4),
                    ),
                    child: ListTile(
                      leading: const Icon(
                        Icons.person,
                        color: Colors.grey,
                        size: 30,
                      ),
                      title: Text(
                        contact['name']!,
                        style: const TextStyle(
                          color: Color(0xFFE57373),
                          fontWeight: FontWeight.w500,
                          fontSize: 15,
                        ),
                      ),
                      subtitle: Text(
                        contact['phone']!,
                        style: const TextStyle(
                          color: Colors.black54,
                          fontSize: 13,
                        ),
                      ),
                      trailing: const Icon(
                        Icons.phone,
                        color: Color(0xFF5B7FA6),
                        size: 24,
                      ),
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