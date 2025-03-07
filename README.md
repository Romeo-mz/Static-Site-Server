# Simple Webpage Deployment with Raspberry Pi

This project sets up a simple webpage on a Raspberry Pi and uses a script to automatically sync local files to it whenever changes are detected.

## Features

- Monitors local files for changes using `fswatch`.
- Automatically syncs changes to a remote Raspberry Pi using `rsync` over SSH.
- Easy to set up and use for hosting simple webpages.

## Prerequisites

- Raspberry Pi with Raspberry Pi OS installed.
- SSH access to the Raspberry Pi.
- `fswatch` and `rsync` installed on your local machine.

## Setup

### On Raspberry Pi

1. **Install Nginx**:
   ```bash
   sudo apt update
   sudo apt install nginx
   ```

2. **Start and Enable Nginx**:
   ```bash
   sudo systemctl start nginx
   sudo systemctl enable nginx
   ```

3. **Configure Nginx**:
   - Create a new configuration file for your website:
     ```bash
     sudo nano /etc/nginx/sites-available/mywebsite
     ```
   - Add the following configuration:
     ```nginx
     server {
         listen 80;
         server_name your_domain_or_ip;

         root /var/www/html;
         index index.html index.htm;

         location / {
             try_files $uri $uri/ =404;
         }
     }
     ```
   - Enable the configuration:
     ```bash
     sudo ln -s /etc/nginx/sites-available/mywebsite /etc/nginx/sites-enabled/
     ```
   - Test and reload Nginx:
     ```bash
     sudo nginx -t
     sudo systemctl reload nginx
     ```

### On Local Machine (Mac)

1. **Install Required Tools**:
   ```bash
   brew install fswatch rsync
   ```

2. **Make the Script Executable**:
   ```bash
   chmod +x deploy.sh
   ```

3. **Run the Script**:
   ```bash
   ./deploy.sh
   ```

## Usage

1. **Edit Local Files**:
   - Make changes to `index.html` or `styles.css` in your local directory.

2. **Automatic Sync**:
   - The `deploy.sh` script will automatically detect changes and sync them to the Raspberry Pi.

3. **Access Your Webpage**:
   - Open a web browser and navigate to your Raspberry Pi's IP address to view your webpage.

## Notes

- Ensure that the SSH server on your Raspberry Pi is configured to listen on port 2002 if you intend to use it.
- Make sure the user `user` has the necessary permissions to write to the `/var/www/html` directory on the Raspberry Pi.
- Adjust the `LOCAL_FILES` variable in the script to include any additional files you want to monitor.


--- 

For more projects, visit [Roadmap.sh](https://roadmap.sh/projects/static-site-server).
