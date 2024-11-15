# Makefile for deploying Flutter web projects to a subfolder in the same repository and committing changes

# User configuration
GITHUB_USER = sasanktumpati
GITHUB_REPO = menuapp
BASE_HREF = /$(GITHUB_REPO)/
BUILD_VERSION := $(shell grep 'version:' pubspec.yaml | awk '{print $$2}')
DEPLOY_DIR = deploy_web
BRANCH = gh-pages

deploy:
ifndef GITHUB_USER
	$(error GITHUB_USER is not set. Please set your GitHub username in the Makefile)
endif

	@echo "Starting deployment for repository: $(GITHUB_REPO)"
	
	@echo "Cleaning the project..."
	flutter clean

	@echo "Fetching dependencies..."
	flutter pub get

	@echo "Enabling web support..."
	flutter create . --platform web

	@echo "Building for web..."
	flutter build web --base-href $(BASE_HREF) --release

	@echo "Preparing deployment folder..."
	# Create the deployment folder if it doesn't exist
	if not exist "$(DEPLOY_DIR)" mkdir "$(DEPLOY_DIR)"

	# Clear the deployment folder
	rm -rf "$(DEPLOY_DIR)/*"

	# Copy the built web files to the deployment folder
	cp -R build/web/* "$(DEPLOY_DIR)"

	@echo "Deployment files are ready in: $(DEPLOY_DIR)"

	@echo "Committing deployment files to branch $(BRANCH)..."
	# Check out the target branch or create it if it doesn't exist
	git checkout $(BRANCH) || git checkout -b $(BRANCH)

	# Add deployment files
	git add $(DEPLOY_DIR)
	git commit -m "Deploy Version $(BUILD_VERSION)" || echo "No changes to commit"

	# Push to the branch
	git push origin $(BRANCH)

	@echo "Deployment complete!"
	@echo "Your app is live at: https://$(GITHUB_USER).github.io/$(GITHUB_REPO)/"

.PHONY: deploy
