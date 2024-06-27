build:
	docker build . -t debian-lab --build-arg ROOT_PASSWORD=123 --build-arg APP_PATH=./volumes/app

run:
	docker run -v ./volumes/app:/app -d debian-lab