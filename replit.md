# OrvantaX Global Shipping — Replit Setup

## Project Overview
A PHP-based delivery logistics web application for "OrvantaX Global Shipping" (veteran-logistics-group). It includes:
- Public homepage and quote request forms
- Shipment tracking
- User auth (signup, login, email verification)
- User dashboard (payments, shipping management)
- Admin control panel
- Shipping order creation flow

## Homepage Design (2026-05)
- **Dark aesthetic**: `body.home-v2` scope, design tokens in `assets/stylesheets/home.css`
- **Hero**: 2-slide Swiper (fade, 6s autoplay) with full-bleed BG images and dark gradient overlay
  - Slide 1: Tesla Semi truck (`assets/images/home/hero-ev-truck.jpg`)
  - Slide 2: Modern courier (`assets/images/home/hero-courier.jpg`)
  - Swiper 9 loaded from CDN; initialized inline at bottom of `index.php`
- **Footer logo**: `filter: brightness(0) invert(1)` applied globally in `main.css` to make dark logo visible on navy footer
- **Stats section**: removed (was generic 1M+, 150+, etc.)

## Tech Stack
- **Backend**: PHP 8.2 (procedural, no framework)
- **Database**: MySQL 8.0 (local, managed by `start-mysql.sh`)
- **Frontend**: HTML + PHP templates, Sass/CSS, plain JS
- **Email**: PHPMailer (vendored in `common-sections/PHPMailer/`)

## Project Structure
```
/
├── index.php                    # Homepage
├── app.php                      # Homepage form handler
├── common-sections/             # Shared includes (globals, header, footer, PHPMailer)
│   ├── globals.php              # DB connection + shared functions
│   ├── email-secrets.php        # Email config
│   └── PHPMailer/               # Vendored PHPMailer library
├── assets/                      # CSS, JS, images
├── shipping/                    # Shipping order flow
├── track/                       # Package tracking
├── login/, signup/, logout/     # Authentication
├── emailVerificationAndLogin/   # Email verification
├── dashboard/                   # User dashboard
├── control-panel/               # Admin panel
├── support/, services/, legal/  # Info pages
├── install-database.php         # DB schema setup script
└── start-mysql.sh               # Startup script (MySQL + PHP server)
```

## Running the App

### Development
The app is started via the "Start application" workflow which runs `start-mysql.sh`.
This script:
1. Starts MySQL 8.0 on port 3306 (socket: `/home/runner/mysql-run/mysql.sock`)
2. Creates the `shipping_db` database and `shipping_user` if they don't exist
3. Starts PHP built-in server on `0.0.0.0:5000`

### Database Setup
Run once after cloning:
```bash
DB_SOCKET=/home/runner/mysql-run/mysql.sock php install-database.php
```
(Or just visit the site — tables are created on first run via the startup script)

## Environment Variables
| Variable | Default | Description |
|----------|---------|-------------|
| DB_HOST | 127.0.0.1 | MySQL host |
| DB_USER | shipping_user | MySQL username |
| DB_PASS | shipping_pass | MySQL password |
| DB_NAME | shipping_db | MySQL database name |
| DB_SOCKET | /home/runner/mysql-run/mysql.sock | MySQL socket path |

## MySQL Data Location
- Data: `/home/runner/mysql-data/`
- Socket: `/home/runner/mysql-run/mysql.sock`
- Logs: `/home/runner/mysql-logs/`

## Deployment
- Target: VM (always-running, needed for local MySQL)
- Run command: `bash /home/runner/workspace/start-mysql.sh`
