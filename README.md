# Yeoman Generator for Fai Apps.

Yeoman-generator to automate the creation of a **[fai](https://github.com/gikmx/fai.git)** application.


## Installation

	npm install -g yo generator-fai


## Usage

Create your project folder

	mkdir project && cd $_

Initialize the project

	yo fi

When in development you can watch for changes

	npm run watch

In another terminal window, you can optionally run browser-sync for your convenience

	npm run sync

## Bundle creation

You can create an example bundle using this simple command.

	yo fi:bundle bundlename
