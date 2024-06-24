apt-get update && \
apt-get install -y \
curl \
nano \
git && \
rm -rf /var/lib/apt/lists/* && \
apt-get update && \

# install redis to this repository
apt-get install -y lsb-release curl gpg && \
curl -fsSL https://packages.redis.io/gpg | gpg --dearmor -o /usr/share/keyrings/redis-archive-keyring.gpg && \

echo "deb [signed-by=/usr/share/keyrings/redis-archive-keyring.gpg] https://packages.redis.io/deb $(lsb_release -cs) main" | tee /etc/apt/sources.list.d/redis.list && \

apt-get update && \
apt-get install redis -y
