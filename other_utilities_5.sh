# Dropbox
cd ~ && wget -O - "https://www.dropbox.com/download?plat=lnx.x86_64" | tar xzf -
# ~/.dropbox-dist/dropboxd

# exposing locally running server --------------------------
# ngrok
curl -s https://ngrok-agent.s3.amazonaws.com/ngrok.asc | \
  sudo tee /etc/apt/trusted.gpg.d/ngrok.asc >/dev/null && \
  echo "deb https://ngrok-agent.s3.amazonaws.com buster main" | \
  sudo tee /etc/apt/sources.list.d/ngrok.list && \
  sudo apt update && sudo apt install ngrok
# now save the ngrok token (log into your ngrok account dashboard)
ngrok config add-authtoken 1nTqIQ9xxxxxxxxxxxxxxxxxxxxxxx

# localtunnel
npm install -g localtunnel
# ----------------------------------------------------------

# notebook
sudo snap install cherrytree

