###############################
##@ Development
###############################

fresh: clean install lint tsc dev ## Fresh local environment.

dev: ## Run local dev environment.
	make install && \
	make dev-db-up && \
	export ENVIRONMENT=local && \
	pnpm dev;
dev-db-migration-generate: ## Dev DB migration:generate.
	pnpm run --filter @ooh/inventory-server migration:generate;
dev-db-migration-run: ## Dev DB migration:run.
	pnpm run --filter @ooh/inventory-server migration:run;
dev-db-migration-seed: ## Dev DB migration:seed.
	pnpm run --filter @ooh/inventory-server migration:seed;
test: ## pnpm run all tests.
	make test-client && \
	make test-server && \
	make test-server-int
test-client: ## pnpm run frontend tests.
	pnpm run --filter @ooh/inventory-client test;

test-server: ## pnpm run server tests.
	pnpm run --filter @ooh/inventory-server test;

test-server-int:   ## pnpm run integration tests.
	pnpm run --filter @ooh/inventory-server test:int;
test-client-watch: ## pnpm run and watch frontend tests.
	pnpm run --filter @ooh/inventory-client test --watch --verbose;
test-server-watch: ## pnpm run and watch server tests.
	pnpm run --filter @ooh/inventory-server test --watch;

###############################
##@ Package Management
###############################

install: ## pnpm install.
	pnpm i

install-ci: ## pnpm CI install.
	pnpm i --frozen-lockfile --prod

build: ## pnpm build.
	pnpm build

lint: ## pnpm lint.
	pnpm lint

tsc: ## pnpm TypeScript config.
	pnpm tsc

pnpm-outdated: ## pnpm outdated.
	pnpm outdated --filter "@ooh/*"

pnpm-update: ## pnpm update.
	pnpm update "@ooh/*"