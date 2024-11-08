const express = require('express');
const router = express.Router();
const Attendance = require('../models/attendanceModel'); // Import the model

// Route to get all attendance records
router.get('/', async (req, res) => {
  try {
    const attendances = await Attendance.find(); // Fetch all attendance records
    res.json(attendances);
  } catch (err) {
    res.status(500).json({ message: err.message });
  }
});

// Route to create a new attendance record
router.post('/', async (req, res) => {
  const { userId, date, status } = req.body;

  // Create a new attendance record
  const newAttendance = new Attendance({
    userId,
    date,
    status,
  });

  try {
    const savedAttendance = await newAttendance.save(); // Save to MongoDB
    res.status(201).json(savedAttendance);
  } catch (err) {
    res.status(400).json({ message: err.message });
  }
});

// Route to get attendance for a specific user (optional)
router.get('/user/:userId', async (req, res) => {
  try {
    const attendances = await Attendance.find({ userId: req.params.userId });
    res.json(attendances);
  } catch (err) {
    res.status(500).json({ message: err.message });
  }
});

module.exports = router;
