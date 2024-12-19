<?php
// manage_organizations.php

include 'db_connection.php';

if ($_SERVER['REQUEST_METHOD'] == 'POST') {
    // Handle Add Organization
    if (isset($_POST['add_organization'])) {
        $name = $conn->real_escape_string($_POST['name']);
        $url = $conn->real_escape_string($_POST['url']);

        // File upload handling for logo
        $logo = '';
        if (!empty($_FILES['logo']['name'])) {
            $target_dir = "organization/";
            // Create directory if it doesn't exist
            if (!file_exists($target_dir)) {
                mkdir($target_dir, 0777, true);
            }

            // Generate unique filename to prevent overwriting
            $file_extension = pathinfo($_FILES['logo']['name'], PATHINFO_EXTENSION);
            $unique_filename = uniqid() . '.' . $file_extension;
            $logo = $target_dir . $unique_filename;

            // Move uploaded file
            if (move_uploaded_file($_FILES['logo']['tmp_name'], $logo)) {
                // File upload successful
            } else {
                $error_message = "Failed to upload logo.";
            }
        }

        $sql = "INSERT INTO organization (name, logo, url) VALUES ('$name', '$logo', '$url')";
        if ($conn->query($sql)) {
            $success_message = "Organization added successfully!";
        } else {
            $error_message = "Error adding organization: " . $conn->error;
        }

    // Handle Delete Organization
    } elseif (isset($_POST['delete_organization'])) {
        $organization_id = intval($_POST['organization_id']);

        // Delete associated logo file if it exists
        $logo_query = $conn->prepare("SELECT logo FROM organization WHERE id = ?");
        $logo_query->bind_param("i", $organization_id);
        $logo_query->execute();
        $result = $logo_query->get_result();

        if ($row = $result->fetch_assoc()) {
            $logo_path = $row['logo'];
            if (!empty($logo_path) && file_exists($logo_path)) {
                unlink($logo_path);
            }
        }
        $logo_query->close();

        // Delete the organization
        $delete_query = $conn->prepare("DELETE FROM organization WHERE id = ?");
        $delete_query->bind_param("i", $organization_id);

        if ($delete_query->execute()) {
            $success_message = "Organization deleted successfully!";
        } else {
            $error_message = "Error deleting organization: " . $conn->error;
        }
        $delete_query->close();
    }
}

// Fetch Organizations
$organizations_query = "SELECT * FROM organization";
$organizations = $conn->query($organizations_query);

// Fetch SDGs for connection
$sdgs_query = "SELECT * FROM sdg";
$sdgs = $conn->query($sdgs_query);

// Fetch SDG-Organization connections
$connections_query = "SELECT sdg.name AS sdg_name, organization.name AS organization_name FROM sdg_organization 
                    JOIN sdg ON sdg_organization.sdg_id = sdg.id 
                    JOIN organization ON sdg_organization.organization_id = organization.id";
$connections = $conn->query($connections_query);
?>

<!DOCTYPE html>
<html>
<head>
<link rel="icon" href="icon/iconLogo/Logo.ico" type="icon/x-icon" />
    <title>Manage Organizations</title>
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
    <h1>Manage Organizations</h1>

    <?php 
    if (isset($error_message)) {
        echo "<p class='error'>$error_message</p>";
    }
    if (isset($success_message)) {
        echo "<p class='success'>$success_message</p>";
    }
    ?>

    <h2>Add Organization</h2>
    <form method="post" enctype="multipart/form-data">
        <input type="text" name="name" placeholder="Organization Name" required>
        <input type="url" name="url" placeholder="Organization URL">
        <input type="file" name="logo" accept="image/*">
        <button type="submit" name="add_organization">Add Organization</button>
    </form>

    <h2>Organizations</h2>
    <table>
        <thead>
            <tr>
                <th>Name</th>
                <th>Logo</th>
                <th>URL</th>
                <th>Actions</th>
            </tr>
        </thead>
        <tbody>
            <?php while ($organization = $organizations->fetch_assoc()): ?>
            <tr>
                <td><?php echo htmlspecialchars($organization['name']); ?></td>
                <td>
                    <?php if (!empty($organization['logo'])): ?>
                        <img src="<?php echo htmlspecialchars($organization['logo']); ?>" alt="Logo" width="50">
                    <?php endif; ?>
                </td>
                <td><a href="<?php echo htmlspecialchars($organization['url']); ?>" target="_blank">Visit</a></td>
                <td>
                    <form method="POST">
                        <input type="hidden" name="organization_id" value="<?php echo htmlspecialchars($organization['id']); ?>">
                        <button type="submit" name="delete_organization" onclick="return confirm('Are you sure you want to delete this organization?')">Delete</button>
                    </form>
                </td>
            </tr>
            <?php endwhile; ?>
        </tbody>
    </table>

    <h2>Connect Organization to SDG</h2>
    <form method="post">
        <select name="sdg_id" required>
            <option value="">Select SDG</option>
            <?php while ($sdg = $sdgs->fetch_assoc()): ?>
                <option value="<?php echo htmlspecialchars($sdg['id']); ?>"><?php echo htmlspecialchars($sdg['name']); ?></option>
            <?php endwhile; ?>
        </select>

        <select name="organization_id" required>
            <option value="">Select Organization</option>
            <?php $organizations->data_seek(0); while ($organization = $organizations->fetch_assoc()): ?>
                <option value="<?php echo htmlspecialchars($organization['id']); ?>"><?php echo htmlspecialchars($organization['name']); ?></option>
            <?php endwhile; ?>
        </select>

        <button type="submit" name="connect_sdg_organization">Connect</button>
    </form>

    <h2>SDG-Organization Connections</h2>
    <table>
        <thead>
            <tr>
                <th>SDG</th>
                <th>Organization</th>
            </tr>
        </thead>
        <tbody>
            <?php while ($connection = $connections->fetch_assoc()): ?>
            <tr>
                <td><?php echo htmlspecialchars($connection['sdg_name']); ?></td>
                <td><?php echo htmlspecialchars($connection['organization_name']); ?></td>
            </tr>
            <?php endwhile; ?>
        </tbody>
    </table>
</body>
</html>
