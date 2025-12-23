const hello = require('./hello');

// Get name from command line arguments
const name = process.argv[2];

// Call hello function
const message = hello(name);
console.log(message);
