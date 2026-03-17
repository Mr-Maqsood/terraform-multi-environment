#!/bin/bash

# Update package index
dnf update -y

# Install NGINX
dnf install -y nginx

# Start NGINX
systemctl start nginx

# Enable NGINX to start on boot
systemctl enable nginx

# Create a test HTML page
cat << 'EOF' > /usr/share/nginx/html/index.html
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>My Amazon Server</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background: #0f172a;
            color: #e2e8f0;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            margin: 0;
        }
        .container {
            text-align: center;
            background: #1e293b;
            padding: 40px;
            border-radius: 12px;
            box-shadow: 0 10px 25px rgba(0,0,0,0.3);
        }
        h1 {
            color: #38bdf8;
        }
        p {
            margin-top: 10px;
            font-size: 18px;
        }
        button {
            margin-top: 20px;
            padding: 10px 20px;
            border: none;
            background: #38bdf8;
            color: #0f172a;
            border-radius: 8px;
            cursor: pointer;
            font-weight: bold;
        }
        button:hover {
            background: #0ea5e9;
        }
    </style>
</head>
<body>
    <div class="container">
        <h1>🚀 Welcome to My Server</h1>
        <p>Your NGINX server is up and running on Amazon Linux 2023.</p>
        <button onclick="showMessage()">Click Me</button>
        <p id="message"></p>
    </div>

    <script>
        function showMessage() {
            document.getElementById("message").innerText = "Server is working perfectly!";
        }
    </script>
</body>
</html>
EOF