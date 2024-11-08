// index.js

const express = require('express');
const mongoose = require('mongoose');
require('dotenv').config();  // Load environment variables

const app = express();

// Middleware to parse incoming JSON requests
app.use(express.json());

// Import routes
const attendanceRoutes = require('./routes/attendanceRoutes');

// Use routes
app.use('/api/attendances', attendanceRoutes);

// MongoDB URI from environment variable
const uri = process.env.MONGODB_URI;

// Check if URI is not undefined
if (!uri) {
  console.error("MONGODB_URI is not defined in the environment variables.");
  process.exit(1);  // Exit if no URI is provided
}

// Connect to MongoDB
mongoose.connect(uri)
  .then(() => console.log("MongoDB connected"))
  .catch((err) => console.log("MongoDB connection error:", err));

// Set the port
const PORT = process.env.PORT || 5000;

// Start the server
app.listen(PORT, () => {
  console.log(`Server running on port ${PORT}`);
});
