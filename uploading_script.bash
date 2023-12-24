docker build -t gcr.io/backgammonlove2d/backgammon-server .
docker push gcr.io/backgammonlove2d/backgammon-server:latest
gcloud compute instances create backgammon-server \
  --machine-type e2-medium \
  --zone europe-west3-c \
  --tags http-server,https-server \
  --provisioning-model=STANDARD \
  --scopes=default \
  --metadata google-container-manifest='[{"image": "gcr.io/backgammonlove2d/backgammon-server:latest"}, {"restart-policy": "always"}] '


# Allow HTTP traffic
#gcloud compute firewall-rules create allow-http \
#  --allow tcp:27002 \
#  --target-tags http-server
#
## Allow HTTPS traffic
#gcloud compute firewall-rules create allow-https \
#  --allow tcp:27002 \
#  --target-tags https-server
