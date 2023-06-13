.PHONY: install-yarn deps test build storybook release

install-yarn:
	# Install Yarn on macOS (OS X) using Homebrew
	brew install yarn

deps:
	# Install core dependencies using Yarn (assuming Yarn is already installed)
	yarn install

test:
	# Run tests using Jest and React Testing Library
	yarn test

build:
	# Build the packages using Rollup
	yarn build

storybook:
	# Start the Storybook development server
	yarn storybook

release:
	# Release and publish packages to the package registry
	yarn release
