<?php
header('Content-Type: application/json');

// Database connection
include 'db_connection.php';

// Check if the request is a POST request
if ($_SERVER["REQUEST_METHOD"] == "POST") {
    // Retrieve form data
    $name = $_POST['name'] ?? '';
    $email = $_POST['email'] ?? '';
    $message = $_POST['message'] ?? '';

    // Validate inputs
    if (empty($name) || empty($email) || empty($message)) {
        http_response_code(400);
        echo json_encode(['status' => 'error', 'message' => 'All fields are required']);
        exit();
    }

    // Sanitize inputs
    $name = $conn->real_escape_string($name);
    $email = $conn->real_escape_string($email);
    $message = $conn->real_escape_string($message);

    // Prepare SQL statement
    $sql = "INSERT INTO contact (name, email, message) VALUES ('$name', '$email', '$message')";
    
    // Execute query
    if ($conn->query($sql) === TRUE) {
        // Successful insertion
        http_response_code(200);
        echo json_encode(['status' => 'success', 'message' => 'Message saved to database']);
    } else {
        // Database insertion failed
        http_response_code(500);
        echo json_encode(['status' => 'error', 'message' => 'Database insertion failed: ' . $conn->error]);
    }

    // Close database connection
    $conn->close();
} else {
    // Not a POST request
    http_response_code(405);
    echo json_encode(['status' => 'error', 'message' => 'Method Not Allowed']);
}
?>