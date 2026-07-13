name: Data Pipeline CI

on:
  push:
    branches: [ main ]
  pull_request:
    branches: [ main ]

jobs:
  validate-data-pipeline:
    runs-on: ubuntu-latest

    steps:
      - name: Checkout repository
        uses: actions/checkout@v4

      - name: Set up Python
        uses: actions/setup-python@v5
        with:
          python-version: '3.11'

      - name: Compile Python files
        run: python -m compileall .

      - name: Check SQL files exist
        run: |
          test -f sql/create_reporting_table.sql
          echo "SQL validation passed"
