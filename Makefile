.PHONY: up
up:
	docker-compose up -d

.PHONY: down
down:
	docker-compose down
	
.PHONY: restart
restart:
	docker-compose down
	docker-compose up -d
	
.PHONY: build
build:
	docker-compose --env-file localdev.env build

.PHONY: xphp
xphp:
	docker-compose exec php sh

.PHONY: xweb
xweb:
	docker-compose exec web sh

.PHONY: xdb
xdb:
	docker-compose exec db sh

.PHONY: xredis
xredis:
	docker-compose exec redis sh

.PHONY: laravel-init
laravel-init:
	docker-compose exec php sh -c " \
		composer create-project laravel/laravel . \
		&& chmod -R 775 storage/ bootstrap/cache/ \
	"

.PHONY: demolish-khoo-yam
demolish-khoo-yam:
	docker-compose exec php sh -c "find . -name . -o -prune -exec rm -rf -- {} +"
