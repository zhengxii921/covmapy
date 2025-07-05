#!/bin/bash

# Integration test for covmapy CLI
# This test verifies that the package can be installed and used to generate plots from coverage.xml

set -euo pipefail

echo "=== Starting integration test ==="

# Check if coverage.xml exists
if [ ! -f "test_outputs/coverage.xml" ]; then
    echo "Error: coverage.xml not found at test_outputs/coverage.xml"
    echo "Please run pytest first to generate coverage.xml"
    exit 1
fi

echo "✓ Found coverage.xml at test_outputs/coverage.xml"

# Create temporary directory for integration test
TEMP_DIR=$(mktemp -d)
trap 'rm -rf "$TEMP_DIR"' EXIT

echo "✓ Created temporary directory: $TEMP_DIR"

# Install the package in development mode
# Note: This script assumes 'uv' is available (installed via tox environment)
echo "Installing covmapy package..."
uv pip install -e .

echo "✓ Package installed successfully"

# Run covmapy on the coverage.xml file
OUTPUT_FILE="$TEMP_DIR/integration_test_output.html"
echo "Running covmapy on coverage.xml..."
uv run covmapy test_outputs/coverage.xml --output "$OUTPUT_FILE"

echo "✓ covmapy executed successfully"

# Check that the HTML output was generated
if [ ! -f "$OUTPUT_FILE" ]; then
    echo "Error: Expected output file not found at $OUTPUT_FILE"
    exit 1
fi

echo "✓ HTML output file generated at $OUTPUT_FILE"

# Basic validation: check that the HTML file contains expected content
if ! grep -q "plotly" "$OUTPUT_FILE"; then
    echo "Error: Output HTML file does not contain expected Plotly content"
    exit 1
fi

echo "✓ Output HTML file contains expected Plotly content"

# Get file size for basic validation
FILE_SIZE=$(wc -c < "$OUTPUT_FILE" | tr -d ' ')
if [ "$FILE_SIZE" -lt 1000 ]; then
    echo "Error: Output HTML file is too small ($FILE_SIZE bytes), likely incomplete"
    exit 1
fi

echo "✓ Output HTML file has reasonable size ($FILE_SIZE bytes)"

echo "=== Integration test completed successfully ==="
