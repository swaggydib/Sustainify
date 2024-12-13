<?php
session_start();

// Check if logged in
if (!isset($_SESSION['admin_logged_in']) || $_SESSION['admin_logged_in'] !== true) {
    header("Location: admin_login.php");
    exit();
}

include 'db_connection.php';

// Handle form submissions
if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    if (isset($_POST['add_task'])) {
        $task = $conn->real_escape_string($_POST['task']);
        $conn->query("INSERT INTO todo_list (task) VALUES ('$task')");
    } elseif (isset($_POST['mark_done'])) {
        $task_id = (int) $_POST['task_id'];
        $conn->query("UPDATE todo_list SET is_done = 1 WHERE id = $task_id");
    } elseif (isset($_POST['delete_task'])) {
        $task_id = (int) $_POST['task_id'];
        $conn->query("DELETE FROM todo_list WHERE id = $task_id");
    }
}

// Fetch tasks
$tasks = $conn->query("SELECT * FROM todo_list ORDER BY created_at DESC");

// Determine which section to display
$section = isset($_GET['section']) ? $_GET['section'] : 'home';
?>


<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="icon" href="icon/iconLogo/Logo.ico" type="icon/x-icon" />
    <title>Sustainify Admin Dashboard</title>
    <style>
        /* General Styles */
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
            display: flex;
            height: 100vh;
            background-color: #f7f9fc;
        }

        /* Sidebar Styles */
        .sidebar {
            width: 250px;
            background-color: #2c3e50;
            color: white;
            display: flex;
            flex-direction: column;
            height: 100%;
            padding: 20px;
        }
        .sidebar h2 {
            font-size: 1.5rem;
            margin-bottom: 20px;
            text-align: center;
        }
        .sidebar a {
            display: block;
            color: white;
            padding: 15px;
            text-decoration: none;
            border-radius: 5px;
            margin-bottom: 10px;
            text-align: center;
            font-size: 1rem;
        }
        .sidebar a:hover {
            background-color: #34495e;
        }
        .sidebar a.logout {
            margin-top: auto;
            background-color: #e74c3c;
        }
        .sidebar a.logout:hover {
            background-color: #c0392b;
        }

        /* Content Styles */
        .content {
            flex-grow: 1;
            padding: 20px;
            background-color: #ecf0f1;
            overflow-y: auto;
        }
        .content h1 {
            font-size: 2rem;
            color: #2c3e50;
        }

        /* To-Do List Styles */
        .todo-section {
            max-width: 600px;
            margin: 20px auto;
            background-color: #ffffff;
            padding: 20px;
            border-radius: 10px;
            box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1);
        }
        .todo-section h2 {
            text-align: center;
            color: #34495e;
        }
        .todo-form {
            display: flex;
            justify-content: space-between;
            margin-bottom: 20px;
        }
        .todo-form input[type="text"] {
            width: calc(100% - 110px);
            padding: 10px;
            margin-right: 10px;
            border: 1px solid #bdc3c7;
            border-radius: 5px;
        }
        .todo-form button {
            padding: 10px;
            background-color: #27ae60;
            color: white;
            border: none;
            border-radius: 5px;
            cursor: pointer;
        }
        .todo-form button:hover {
            background-color: #2ecc71;
        }
        .todo-list .todo-item {
            display: flex;
            justify-content: space-between;
            align-items: center;
            padding: 10px;
            border-bottom: 1px solid #bdc3c7;
        }
        .todo-list .todo-item.done span {
            text-decoration: line-through;
            color: #7f8c8d;
        }
        .todo-actions button {
            margin-left: 5px;
            padding: 5px 10px;
            border: none;
            border-radius: 5px;
            cursor: pointer;
        }
        .todo-actions .mark-done {
            background-color: #3498db;
            color: white;
        }
        .todo-actions .delete {
            background-color: #e74c3c;
            color: white;
        }
        .todo-actions button:hover {
            opacity: 0.8;
        }
    </style>
</head>
<body>
    <div class="sidebar">
        <h2>Sustainify Admin</h2>
        <a href="admin_dashboard.php?section=home">Home</a>
        <a href="admin_dashboard.php?section=events">Manage Events</a>
        <a href="admin_dashboard.php?section=organizations">Manage Organizations</a>
        <a href="admin_dashboard.php?section=news">Manage News</a>
        <a href="admin_logout.php" class="logout">Logout</a>
    </div>

    <div class="content">
        <h1>Welcome to Sustainify Admin Dashboard</h1>
        <?php
        $section = $_GET['section'] ?? 'home';
        
        switch($section) {
            case 'events':
                include 'manage_events.php';
                break;
            case 'organizations':
                include 'manage_organizations.php';
                break;
            case 'news':
                include 'manage_news.php';
                break;
        }
        ?>
        <div class="todo-section">
            <h2>To-Do List</h2>
            <form class="todo-form" method="POST">
                <input type="text" name="task" placeholder="Enter a new task" required>
                <button type="submit" name="add_task">Add Task</button>
            </form>
            <div class="todo-list">
                <?php while ($task = $tasks->fetch_assoc()): ?>
                    <div class="todo-item <?php echo $task['is_done'] ? 'done' : ''; ?>">
                        <span><?php echo htmlspecialchars($task['task']); ?></span>
                        <div class="todo-actions">
                            <?php if (!$task['is_done']): ?>
                                <form method="POST" style="display:inline;">
                                    <input type="hidden" name="task_id" value="<?php echo $task['id']; ?>">
                                    <button type="submit" name="mark_done" class="mark-done">Mark Done</button>
                                </form>
                            <?php endif; ?>
                            <form method="POST" style="display:inline;">
                                <input type="hidden" name="task_id" value="<?php echo $task['id']; ?>">
                                <button type="submit" name="delete_task" class="delete">Delete</button>
                            </form>
                        </div>
                    </div>
                <?php endwhile; ?>
            </div>
        </div>
    </div>
</body>
</html>
