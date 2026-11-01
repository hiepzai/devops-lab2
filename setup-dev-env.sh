
#!/bin/bash

# ==========================================
# DevOps Lab 2 - Automation Script
# CALMS Principle: Automation
# ==========================================

echo "===================================="
echo "     DEVOPS LAB 2 - AUTO SETUP"
echo "===================================="

# 1. Check Node.js
if ! command -v node &> /dev/null; then
    echo "ERROR: Node.js is not installed!"
    echo "Please install Node.js first."
    exit 1
fi

echo "Node.js version: $(node --version)"
echo "npm version: $(npm --version)"

# 2. Create project directory
PROJECT_DIR="automation-demo"

if [ -d "$PROJECT_DIR" ]; then
    echo "Project directory already exists."
else
    mkdir -p "$PROJECT_DIR"
    echo "Created project directory."
fi

cd "$PROJECT_DIR" || exit 1

# 3. Create package.json
if [ ! -f package.json ]; then
    cat > package.json <<'EOF'
{
  "name": "automation-demo",
  "version": "1.0.0",
  "description": "DevOps Lab 2 Automation Demo",
  "main": "server.js",
  "scripts": {
    "start": "node server.js"
  }
}
EOF
    echo "Created package.json"
fi

# 4. Create server.js
if [ ! -f server.js ]; then
    cat > server.js <<'EOF'
const http = require('http');

const server = http.createServer((req, res) => {
    res.writeHead(200, {
        'Content-Type': 'application/json'
    });

    res.end(JSON.stringify({
        message: 'Hello from Automation!',
        lab: 'DevOps Lab 2',
        timestamp: new Date().toISOString()
    }));
});

server.listen(3000, () => {
    console.log('Server running at http://localhost:3000');
});
EOF
    echo "Created server.js"
fi

# 5. Install dependencies
npm install

echo ""
echo "===================================="
echo "   AUTOMATION SETUP COMPLETED!"
echo "===================================="
echo "Project location: $PROJECT_DIR"
echo "Run application: cd $PROJECT_DIR && npm start"

