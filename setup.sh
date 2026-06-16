#!/bin/bash

echo "📦 Installing dependencies..."

# Install ngrok
curl -sSL https://ngrok-agent.s3.amazonaws.com/ngrok.asc | sudo tee /etc/apt/trusted.gpg.d/ngrok.asc >/dev/null
echo "deb https://ngrok-agent.s3.amazonaws.com buster main" | sudo tee /etc/apt/sources.list.d/ngrok.list
sudo apt-get update -qq && sudo apt-get install -y ngrok

# Install pnpm
npm install -g pnpm

# Add ngrok authtoken
ngrok config add-authtoken 3AulYzIfrZMZrXAJwF8fUYzaojl_6dEUDMBWp86LBbDg8fFLM

echo "✅ Dependencies installed"
echo ""
echo "Now run these in separate terminals:"
echo "  Terminal 1 (SAP):       cd ~/e-mobility-charging-stations-simulator/docker && docker-compose up"
echo "  Terminal 2 (ws-server): cd ~/ocpp/apps/ws-server && node dist/server.js"
echo "  Terminal 3 (ngrok):     ngrok http 8080"

