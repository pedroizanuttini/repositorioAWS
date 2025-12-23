const hello = require('../src/hello');

describe('Hello Function', () => {
  test('should return "Hello World!"', () => {
    const result = hello(); // Assuming hello is the function to test
    expect(result).toBe('Hello, World!');
  });

  test('should return a greeting with the provided name', () => {
    const result = hello('Alice'); // Assuming hello is the function to test
    expect(result).toBe('Hello, Alice!');
  });
});
