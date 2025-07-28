const express = require('express');
const path = require('path');
const app = express();

// Get port from environment variable or default to 5000
const port = process.env.PORT || 5000;

// Serve static files from the Flutter web build directory
app.use(express.static(path.join(__dirname, 'build/web')));

// Handle client-side routing - serve index.html for all routes
app.get('*', (req, res) => {
  res.sendFile(path.join(__dirname, 'build/web/index.html'));
});

// Start the server
app.listen(port, () => {
  console.log(`Benpo Trouble server is running on port ${port}`);
  console.log(`Visit http://localhost:${port} to play the game!`);
}); 