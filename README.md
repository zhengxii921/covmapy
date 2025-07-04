# covmapy

[![CI](https://github.com/zhengxii921/covmapy/actions/workflows/ci.yml/badge.svg)](https://github.com/zhengxii921/covmapy/actions/workflows/ci.yml)
[![codecov](https://codecov.io/gh/zhengxii921/covmapy/branch/main/graph/badge.svg)](https://codecov.io/gh/zhengxii921/covmapy)
[![Python 3.9+](https://img.shields.io/badge/python-3.9+-blue.svg)](https://www.python.org/downloads/)
[![License](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT)
[![CodeRabbit Pull Request Reviews](https://img.shields.io/coderabbit/prs/github/zhengxii921/covmapy?utm_source=oss&utm_medium=github&utm_campaign=zhengxii921%2Fcovmapy&labelColor=171717&color=FF570A&link=https%3A%2F%2Fcoderabbit.ai&label=CodeRabbit+Reviews)](https://coderabbit.ai)

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

This project is licensed under the MIT License - see the LICENSE file for details.
