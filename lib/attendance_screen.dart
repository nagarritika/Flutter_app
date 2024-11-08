import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

// ignore: use_key_in_widget_constructors
class AttendanceScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Attendance")),
      body: ListView.builder(
        itemCount: 10, // Replace with actual data length
        itemBuilder: (context, index) {
          return ListTile(
            leading: const CircleAvatar(
              backgroundImage: NetworkImage(
                  "https://unsplash.com/photos/a-satellite-image-of-a-large-body-of-water--6CZAfsOKm8"), // Check URL validity
            ),
            title: const Text("Member Name"),
            subtitle: const Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Icon(Icons.access_time, color: Colors.green),
                SizedBox(width: 5),
                Text("09:00 AM"), // Example check-in time
                SizedBox(width: 10),
                Icon(Icons.access_time, color: Colors.red),
                SizedBox(width: 5),
                Text("05:00 PM"), // Example check-out time
              ],
            ),
            trailing: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                IconButton(
                  icon: const Icon(Icons.calendar_today),
                  onPressed: () => _selectDate(context),
                ),
                IconButton(
                  icon: const Icon(Icons.location_on),
                  onPressed: () {
                    Navigator.pushNamed(context, '/location');
                  },
                ),
              ],
            ),
          );
        },
      ),
    );
  }

  // Date picker method
  void _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2020),
      lastDate: DateTime(2025),
    );
    if (picked != null) {
      String formattedDate = DateFormat('yyyy-MM-dd').format(picked);
      // ignore: use_build_context_synchronously
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Selected Date: $formattedDate")),
      );
    }
  }
}
