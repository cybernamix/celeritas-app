BINARY_NAME=celeritasApp

build:
	@go mod vendor
	@echo "Building Celeritas..."
	@go build -o tmp/${BINARY_NAME} .
	@echo "Celeritas built!"

run: build
	@echo "Starting Celeritas..."
	@./tmp/${BINARY_NAME} &
	@echo "Celeritas started!"

clean:
	@echo "Cleaning..."
	@go clean
	@rm tmp/${BINARY_NAME}
	@echo "Cleaned!"

start_compose:
	docker-compose up -d

stop_compose:
	docker-compose down

test:
	@echo "Testing..."
	@go test ./...
	@echo "Done!"

start: run

stop:
	@echo "Stopping Celeritas..."
	@taskkill /IM ${BINARY_NAME} /F
	@echo "Stopped Celeritas!"

restart: stop start




# @-pkill -SIGTERM -f "./tmp/${BINARY_NAME}"

# BINARY_NAME=celeritasApp.exe

# ## build: builds all binaries
# build:
# 	@go mod vendor
# 	@go build -o tmp/${BINARY_NAME} .
# 	@echo Celeritas built!

# run:
# 	@echo Starting Celeritas...
# 	@start /min cmd /c tmp\${BINARY_NAME} &
# 	@echo Celeritas started!

# clean:
# 	@echo Cleaning...
# 	@DEL ${BINARY_NAME}
# 	@go clean
# 	@echo Cleaned!

# test:
# 	@echo Testing...
# 	@go test ./...
# 	@echo Done!

# start: run
	
# stop:
# 	@echo "Starting the front end..."
# 	@taskkill /IM ${BINARY_NAME} /F
# 	@echo Stopped Celeritas

# restart: stop start