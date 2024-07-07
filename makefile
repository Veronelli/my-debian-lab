build:
	docker build . -t debian-lab --build-arg ROOT_PASSWORD=123 --build-arg APP_PATH=./volumes/app

run:
	docker run -v ./volumes/app:/app -d debian-lab

# TODO: create a ENV to auto access to container
# TODO: check server status by name service