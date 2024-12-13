<?php
// manage_news.php

include 'db_connection.php';

if ($_SERVER['REQUEST_METHOD'] == 'POST') {
    // Handle Add News
    if (isset($_POST['add_news'])) {
        $title = $conn->real_escape_string($_POST['title']);
        $paragraph = $conn->real_escape_string($_POST['paragraph']);
        $posted_date = $conn->real_escape_string($_POST['posted_date']);
        $url = $conn->real_escape_string($_POST['url']);
        $sdg_id = intval($_POST['sdg_id']);

        // File upload handling for image
        $image = '';
        if (!empty($_FILES['image']['name'])) {
            $target_dir = "news/";
            // Create directory if it doesn't exist
            if (!file_exists($target_dir)) {
                mkdir($target_dir, 0777, true);
            }

            // Generate unique filename to prevent overwriting
            $file_extension = pathinfo($_FILES['image']['name'], PATHINFO_EXTENSION);
            $unique_filename = uniqid() . '.' . $file_extension;
            $image = $target_dir . $unique_filename;

            // Move uploaded file
            if (!move_uploaded_file($_FILES['image']['tmp_name'], $image)) {
                $error_message = "Failed to upload image.";
            }
        }

        // Insert the news into the database
        $sql = "INSERT INTO news (title, image, paragraph, posted_date, url, sdg_id) 
                VALUES ('$title', '$image', '$paragraph', '$posted_date', '$url', $sdg_id)";

        if ($conn->query($sql)) {
            $success_message = "News added successfully!";
        } else {
            $error_message = "Error adding news: " . $conn->error;
        }

    // Handle Delete News
    } elseif (isset($_POST['delete_news'])) {
        $news_id = intval($_POST['news_id']);

        // First, delete the associated image file if it exists
        $delete_image_query = $conn->prepare("SELECT image FROM news WHERE id = ?");
        $delete_image_query->bind_param("i", $news_id);
        $delete_image_query->execute();
        $result = $delete_image_query->get_result();

        if ($row = $result->fetch_assoc()) {
            $image_path = $row['image'];
            if (!empty($image_path) && file_exists($image_path)) {
                unlink($image_path);
            }
        }
        $delete_image_query->close(); // Cleanup

        // Then delete the news from the database
        $delete_query = $conn->prepare("DELETE FROM news WHERE id = ?");
        $delete_query->bind_param("i", $news_id);

        if ($delete_query->execute()) {
            $success_message = "News deleted successfully!";
        } else {
            $error_message = "Error deleting news: " . $conn->error;
        }
        $delete_query->close(); // Cleanup
    }
}

// Fetch News with SDG Name
$news_query = "SELECT news.*, sdg.name as sdg_name FROM news LEFT JOIN sdg ON news.sdg_id = sdg.id";
$news = $conn->query($news_query);
?>

<!DOCTYPE html>
<html>
<head>
    <link rel="icon" href="icon/iconLogo/Logo.ico" type="icon/x-icon" />
    <title>Manage News</title>
    <style>
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
    </style>
</head>
<body>
    <h1>Manage News</h1>

    <?php 
    if (isset($error_message)) {
        echo "<p class='error'>$error_message</p>";
    }
    if (isset($success_message)) {
        echo "<p class='success'>$success_message</p>";
    }
    ?>

    <form method="post" enctype="multipart/form-data">
        <input type="text" name="title" placeholder="News Title" required>
        <textarea name="paragraph" placeholder="News Content" required></textarea>
        <input type="date" name="posted_date" required>
        <input type="url" name="url" placeholder="News URL">

        <select name="sdg_id" required>
            <option value="">Select SDG</option>
            <?php 
            $sdgs = $conn->query("SELECT id, name FROM sdg");
            while($sdg = $sdgs->fetch_assoc()) {
                echo "<option value='{$sdg['id']}'>{$sdg['name']}</option>";
            }
            ?>
        </select>

        <input type="file" name="image" accept="image/*">
        <button type="submit" name="add_news">Add News</button>
    </form>

    <table>
        <thead>
            <tr>
                <th>Title</th>
                <th>SDG</th>
                <th>Posted Date</th>
                <th>Actions</th>
            </tr>
        </thead>
        <tbody>
            <?php while($item = $news->fetch_assoc()): ?>
            <tr>
                <td><?php echo htmlspecialchars($item['title']); ?></td>
                <td><?php echo htmlspecialchars($item['sdg_name'] ?? 'N/A'); ?></td>
                <td><?php echo htmlspecialchars($item['posted_date']); ?></td>
                <td>
                    <form method="POST">
                        <input type="hidden" name="news_id" value="<?php echo htmlspecialchars($item['id']); ?>">
                        <button type="submit" name="delete_news" onclick="return confirm('Are you sure you want to delete this news?')">Delete</button>
                    </form>
                </td>
            </tr>
            <?php endwhile; ?>
        </tbody>
    </table>
</body>
</html>
