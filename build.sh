#!/bin/bash
# =========================================================
#  KnowIP Build Script
#  Author: Sanket Jaybhaye
#  Description: One-click build script for KnowIP tool
# =========================================================

APP_NAME="KnowIP"
ENTRY_FILE="launcher.py"
DIST_DIR="dist"
BUILD_DIR="build"
SPEC_FILE="${APP_NAME,,}.spec"

echo "🚀 Building ${APP_NAME}..."

# Step 1: Clean old builds
if [ -d "$DIST_DIR" ]; then
    echo "🧹 Cleaning old dist folder..."
    rm -rf "$DIST_DIR"
fi

if [ -d "$BUILD_DIR" ]; then
    echo "🧹 Cleaning old build folder..."
    rm -rf "$BUILD_DIR"
fi

if [ -f "$SPEC_FILE" ]; then
    echo "🧹 Removing old spec file..."
    rm -f "$SPEC_FILE"
fi

# Step 2: Run PyInstaller
echo "⚙️  Running PyInstaller..."
pyinstaller --onefile --name "$APP_NAME" "$ENTRY_FILE"

# Step 3: Check build result
if [ -f "$DIST_DIR/$APP_NAME" ]; then
    echo "✅ Build successful!"
    echo "📦 Binary: $DIST_DIR/$APP_NAME"
else
    echo "❌ Build failed! Check errors above."
    exit 1
fi

# Step 4: Make binary executable
chmod +x "$DIST_DIR/$APP_NAME"

# Step 5: Clean temp files
echo "🧼 Cleaning temporary files..."
rm -rf "$BUILD_DIR" "__pycache__"

echo "🎉 Done! Run your tool using:"
echo "   ./dist/$APP_NAME --help"
