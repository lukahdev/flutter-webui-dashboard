#!/bin/bash



# Set script to exit immediately if any command fails
set -e

#====================================================================================
# Build the Flutter web app
echo "Building Flutter web app..."
OUTPUT_DIR="C:\xampp\htdocs\vendorportal.cheil.rocks\app_dev"

# Default base href
DEFAULT_HREF="/"

# Desired base href
BASE_HREF="./"

# Modify the base href in index.html
sed -i "s|<base href=\".*\">|<base href=\"$BASE_HREF\">|" web/index.html

# Build Flutter web app
flutter build web --dart-define=ENVIRONMENT=localhost --output="$OUTPUT_DIR"

# Revert the default base href in index.html
sed -i "s|<base href=\".*\">|<base href=\"$DEFAULT_HREF\">|" web/index.html

#====================================================================================

echo "Build completed at $OUTPUT_DIR."
