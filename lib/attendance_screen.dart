import 'package:flutter/material.dart';
import 'package:intl/intl.dart'; // Add intl package for date formatting

class AttendanceScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Attendance")),
      body: ListView.builder(
        itemCount: 10, // Replace with actual data length
        itemBuilder: (context, index) {
          return ListTile(
            leading: CircleAvatar(
              backgroundImage: NetworkImage("https://example.com/photo.jpg"),
            ),
            title: Text("Member Name"),
            subtitle: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Icon(Icons.access_time, color: Colors.green),
                SizedBox(width: 5),
                Text("Check-in Time"),
                SizedBox(width: 10),
                Icon(Icons.access_time, color: Colors.red),
                SizedBox(width: 5),
                Text("Check-out Time"),
              ],
            ),
            trailing: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                IconButton(
                  icon: Icon(Icons.calendar_today),
                  onPressed: () => _selectDate(context),
                ),
                IconButton(
                  icon: Icon(Icons.location_on),
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

  // This is the _selectDate method
  void _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2020),
      lastDate: DateTime(2025),
    );
    if (picked != null) {
      // Example of formatting the selected date
      String formattedDate = DateFormat('yyyy-MM-dd').format(picked);
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Selected Date: $formattedDate")),
      );
      // You can use the formattedDate further, like updating UI or passing it to other screens.
    }
  }
}
