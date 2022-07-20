.PHONY: up
up:
	docker-compose up -d

.PHONY: down
down:
	docker-compose down
	
.PHONY: build
build:
	docker-compose build

.PHONY: xphp
xphp:
	docker-compose exec php sh

.PHONY: laravel-init
laravel-init:
	docker-compose exec php sh -c " \
		composer create-project laravel/laravel . \
		&& chmod -R 777 storage/ bootstrap/cache/ \
	"

.PHONY: demolish-khoo-yam
demolish-khoo-yam:
	docker-compose exec php sh -c "find . -name . -o -prune -exec rm -rf -- {} +"
