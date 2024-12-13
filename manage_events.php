<?php
// manage_events.php

include 'db_connection.php';

if ($_SERVER['REQUEST_METHOD'] == 'POST'){
// Handle Add Event
if (isset($_POST['add_event'])) {
    $title = $conn->real_escape_string($_POST['title']);
    $time = $conn->real_escape_string($_POST['time']);
    $place = $conn->real_escape_string($_POST['place']);
    $from_url = $conn->real_escape_string($_POST['from_url']);
    $organization_id = intval($_POST['organization_id']);
    
    // File upload handling for image
    $image = '';
    if (!empty($_FILES['image']['name'])) {
        $target_dir = "events/";
        // Create directory if it doesn't exist
        if (!file_exists($target_dir)) {
            mkdir($target_dir, 0777, true);
        }
        
        // Generate unique filename to prevent overwriting
        $file_extension = pathinfo($_FILES['image']['name'], PATHINFO_EXTENSION);
        $unique_filename = uniqid() . '.' . $file_extension;
        $image = $target_dir . $unique_filename;
        
        // Move uploaded file
        if (move_uploaded_file($_FILES['image']['tmp_name'], $image)) {
            // File upload successful
        } else {
            // Handle upload error
            $error_message = "Failed to upload image.";
        }
    }

    // Fix the SQL query (close the quote for organization_id)
    $sql = "INSERT INTO sdg_event (title, time, place, image, from_url, organization_id) 
            VALUES ('$title', '$time', '$place', '$image', '$from_url', $organization_id)";
    
    if ($conn->query($sql)) {
        $success_message = "Event added successfully!";
    } else {
        $error_message = "Error adding event: " . $conn->error;
    }


// Handle Delete Event
}elseif (isset($_POST['delete_event'])) {
    $event_id = intval($_POST['event_id']);
    
    // First, delete the associated image file if it exists
    $delete_image_query = $conn->prepare("SELECT image FROM sdg_event WHERE id = ?");
    $delete_image_query->bind_param("i", $event_id);
    $delete_image_query->execute();
    $result = $delete_image_query->get_result();
    
    if ($row = $result->fetch_assoc()) {
        $image_path = $row['image'];
        if (!empty($image_path) && file_exists($image_path)) {
            unlink($image_path);
        }
    }
    $delete_image_query->close(); // Cleanup
    
    // Then delete the event from the database
    $delete_query = $conn->prepare("DELETE FROM sdg_event WHERE id = ?");
    $delete_query->bind_param("i", $event_id);
    
    if ($delete_query->execute()) {
        $success_message = "Event deleted successfully!";
    } else {
        $error_message = "Error deleting event: " . $conn->error;
    }
    $delete_query->close(); // Cleanup
    }

}

// Fetch Events with Organization Name
$events_query = "SELECT sdg_event.*, organization.name as org_name FROM sdg_event LEFT JOIN organization ON sdg_event.organization_id = organization.id";
$events = $conn->query($events_query);
?>

<!DOCTYPE html>
<html>
<head>
    <link rel="icon" href="icon/iconLogo/Logo.ico" type="icon/x-icon" />
    <title>Manage Events</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
            background-color: #f4f4f9;
        }

        header {
            background-color: #2c3e50;
            color: white;
            padding: 15px;
            text-align: center;
        }

        main {
            padding: 20px;
        }

        h1 {
            color: #2c3e50;
            text-align: center;
            margin-bottom: 20px;
        }

        form {
            background: white;
            padding: 20px;
            border-radius: 8px;
            box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
            margin-bottom: 20px;
        }

        form input, form select, form textarea, form button {
            width: 100%;
            margin-bottom: 15px;
            padding: 10px;
            border: 1px solid #ddd;
            border-radius: 4px;
            box-sizing: border-box;
        }

        form button {
            background-color: #2c3e50;
            color: white;
            border: none;
            cursor: pointer;
        }

        form button:hover {
            background-color: #34495e;
        }

        table {
            width: 100%;
            border-collapse: collapse;
            margin-bottom: 20px;
            background: white;
            border-radius: 8px;
            overflow: hidden;
            box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
        }

        table th, table td {
            padding: 12px;
            text-align: left;
            border-bottom: 1px solid #ddd;
        }

        table th {
            background-color: #2c3e50;
            color: white;
        }

        table tr:nth-child(even) {
            background-color: #f9f9f9;
        }

        table tr:hover {
            background-color: #f1f1f1;
        }

        .actions button {
            background-color: #e74c3c;
            color: white;
            border: none;
            padding: 8px 12px;
            border-radius: 4px;
            cursor: pointer;
        }

        .actions button:hover {
            background-color: #c0392b;
        }

        .success {
            color: #27ae60;
            margin-bottom: 20px;
        }

        .error {
            color: #e74c3c;
            margin-bottom: 20px;
        }

        @media (max-width: 768px) {
            table, form input, form select, form textarea, form button {
                font-size: 14px;
            }

            form button, .actions button {
                padding: 10px;
            }
        }
    </style>
</head>
<body>
    <h1>Manage Events</h1>

    <?php 
    if (isset($error_message)) {
        echo "<p class='error'>$error_message</p>";
    }
    if (isset($success_message)) {
        echo "<p class='success'>$success_message</p>";
    }
    ?>

    <form method="post" enctype="multipart/form-data">
        <input type="text" name="title" placeholder="Event Title" required>
        <input type="datetime-local" name="time" required>
        <input type="text" name="place" placeholder="Event Place" required>
        <input type="url" name="from_url" placeholder="Event URL">
        
        <select name="organization_id" required>
            <option value="">Select Organization</option>
            <?php 
            $organizations = $conn->query("SELECT id, name FROM organization");
            while($organization = $organizations->fetch_assoc()) {
                echo "<option value='{$organization['id']}'>{$organization['name']}</option>";
            }
            ?>
        </select>
        
        <input type="file" name="image" accept="image/*">
        <button type="submit" name="add_event">Add Event</button>
    </form>

    <table>
        <thead>
            <tr>
                <th>Title</th>
                <th>Time</th>
                <th>Place</th>
                <th>Organization</th>
                <th>Actions</th>
            </tr>
        </thead>
        <tbody>
            <?php while($event = $events->fetch_assoc()): ?>
            <tr>
                <td><?php echo htmlspecialchars($event['title']); ?></td>
                <td><?php echo htmlspecialchars($event['time']); ?></td>
                <td><?php echo htmlspecialchars($event['place']); ?></td>
                <td><?php echo htmlspecialchars($event['org_name'] ?? 'N/A'); ?></td>
                <td>
                    <form method="POST">
                    <input type="hidden" name="event_id" value="<?php echo htmlspecialchars($event['id']); ?>">
                    <button type="submit" id="delete" name="delete_event" onclick="return confirm('Are you sure you want to delete this event ?')">Hapus</button>
                    </form>
                </td>
            </tr>
            <?php endwhile; ?>
        </tbody>
    </table>
</body>
</html>