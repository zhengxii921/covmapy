# covmapy

A Python CLI tool that visualizes test coverage data as interactive treemap charts.

## Features

- Convert coverage.xml files to interactive HTML visualizations
- Treemap representation showing coverage by file/module hierarchy
- Customizable color schemes and dimensions
- Zero-configuration usage with sensible defaults

## Installation

```bash
pip install covmapy
```

## Usage

Basic usage:

```bash
covmapy coverage.xml
```

With options:

```bash
covmapy coverage.xml --output my-coverage.html --width 1200 --height 800 --colorscale Viridis
```

### Options

- `--output, -o`: Output HTML file path (default: coverage.html)
- `--width, -w`: Figure width in pixels (default: 800)
- `--height, -h`: Figure height in pixels (default: 600)
- `--colorscale`: Color scheme for visualization (default: RdYlGn)
  - Available: RdYlGn, Viridis, Blues, Reds, YlOrRd, YlGnBu, RdBu, Spectral

## Example

Generate coverage data and visualize:

```bash
# Generate coverage.xml using pytest-cov
pytest --cov=your_package --cov-report=xml

# Create visualization
covmapy coverage.xml --output coverage-report.html
```

## Requirements

- Python 3.9+
- Coverage data in XML format (e.g., from pytest-cov, coverage.py)

## License

This project is licensed under the Apache License 2.0 - see the LICENSE file for details.
