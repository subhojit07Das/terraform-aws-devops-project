#!/bin/bash

dnf update -y
dnf install nginx -y
systemctl enable --now nginx

cat << 'EOF' > /usr/share/nginx/html/index.html
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Subhojit Das | DevOps Engineer</title>
    <link rel="stylesheet" href="style.css">
</head>
<body>
    <div class="container">
        <h1>Subhojit Das</h1>
        <h2>Aspiring DevOps Engineer</h2>

        <p class="bio">
            Passionate about Linux, Cloud, and Automation.
            I enjoy building reliable infrastructure and learning modern DevOps tools.
        </p>

        <div class="section">
            <h3>Certifications</h3>
            <ul>
                <li>RHCSA â€“ Red Hat Certified System Administrator</li>
                <li>CKA â€“ Certified Kubernetes Administrator</li>
                <li>AWS Solutions Architect (SAA-C03)</li>
            </ul>
        </div>

        <div class="section">
            <h3>Skills</h3>
            <ul>
                <li>Linux (RHEL)</li>
                <li>AWS & Terraform</li>
                <li>Docker & Kubernetes</li>
                <li>Git & CI/CD</li>
            </ul>
        </div>

        <footer>
            <p>Deployed using Terraform on AWS EC2 íº€</p>
        </footer>
    </div>
</body>
</html>
EOF

cat << 'EOF' > /usr/share/nginx/html/style.css
body {
    font-family: Arial, Helvetica, sans-serif;
    background: linear-gradient(120deg, #0f2027, #203a43, #2c5364);
    color: #ffffff;
    margin: 0;
    padding: 0;
}
.container {
    max-width: 800px;
    margin: 80px auto;
    background-color: rgba(0, 0, 0, 0.4);
    padding: 40px;
    border-radius: 12px;
}
h1 {
    font-size: 42px;
    margin-bottom: 5px;
}
h2 {
    font-weight: 300;
    color: #00d9ff;
}
.bio {
    font-size: 18px;
    margin: 20px 0;
}
.section {
    margin-top: 30px;
}
.section h3 {
    border-bottom: 2px solid #00d9ff;
    padding-bottom: 5px;
}
ul {
    list-style: none;
    padding: 0;
}
ul li {
    padding: 8px 0;
}
footer {
    margin-top: 40px;
    text-align: center;
    font-size: 14px;
    color: #cccccc;
}
EOF

