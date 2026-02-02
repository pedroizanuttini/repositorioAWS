const http = require('http');
const hello = require('./hello');

const PORT = process.env.PORT || 3000;

// Create HTTP server
const server = http.createServer((req, res) => {
    // Set response headers
    res.setHeader('Content-Type', 'application/json');
    
    // Parse URL to get query parameters
    const url = new URL(req.url, `http://${req.headers.host}`);
    const name = url.searchParams.get('name');
    
    // Call hello function
    const message = hello(name);
    
    // Send response
    res.statusCode = 200;
    res.end(JSON.stringify({ message }));
});

// Start server
server.listen(PORT, () => {
    console.log(`Server is running on http://localhost:${PORT}`);
    console.log(`Try: http://localhost:${PORT}?name=Pedro`);
});
