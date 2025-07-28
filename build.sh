#!/bin/bash

# Build script for Heroku deployment
echo "Starting Flutter web build for Heroku..."

# Install Flutter if not present (Heroku buildpack should handle this)
if ! command -v flutter &> /dev/null; then
    echo "Flutter not found. Please use Flutter buildpack or install Flutter."
    exit 1
fi

# Clean previous build
echo "Cleaning previous build..."
flutter clean

# Get dependencies
echo "Getting Flutter dependencies..."
flutter pub get

# Build for web
echo "Building Flutter web app..."
flutter build web --release

echo "Flutter web build completed successfully!"
echo "Build files are in build/web/" 