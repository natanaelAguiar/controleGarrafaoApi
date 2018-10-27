docker.build:
	docker build -t controle-garrafao-api .
docker.up:
	docker-compose up
docker.container:
	docker run --rm -it --network=controlegarrafaoapi_default -p 3000:3000 -v ${PWD}:/app controle-garrafao-api:latest bash
server:
	rails s -p 3000 -b '0.0.0.0'
recreate:
	rails db:drop db:create db:migrate db:seed
chown:
	$(shell sudo chown -R $$USER:$$USER .)
