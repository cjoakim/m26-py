# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## What this project is

**m26** is a Python library (published to PyPI) for sports calculations: running, cycling, and swimming. It handles distance unit conversions, pace/speed calculations, race time projections, run/walk interval calculations, and heart-rate training zones based on age.

## Environment setup

Uses `uv` and `pyproject.toml` (Python 3.13+). To recreate the virtual environment:

```bash
./venv.sh
```

This runs `uv venv`, activates `.venv`, and installs the package in editable mode via `uv pip install --prerelease=allow --editable .`

## Running tests

```bash
./tests.sh
```

This activates `.venv`, reformats source with `ruff`, then runs pytest with coverage:

```bash
pytest -v --cov=m26/ --cov-report html tests/
```

To run a single test file:

```bash
source .venv/bin/activate && pytest -v tests/test_speed.py
```

To run a single test by name:

```bash
source .venv/bin/activate && pytest -v tests/test_speed.py::test_a_marathon_with_fractional_numbers
```

Coverage HTML report is written to `htmlcov/`.

## Code formatting

`ruff` is used for formatting (line length 100). It runs automatically as part of `tests.sh`. To format manually:

```bash
ruff format *.py m26 tests
```

## Building and publishing

```bash
./build.sh              # builds dist/ via python3 -m build
python3 -m twine upload --repository pypi dist/*   # publish to PyPI
```

## Architecture

All public classes are re-exported from `m26/__init__.py`, so users only need `import m26` and then access `m26.Distance`, `m26.Speed`, etc.

**Class dependency chain:**

```
Constants  (no deps)
    └── Distance  (uses Constants for unit conversion)
    └── ElapsedTime  (uses Constants for seconds_per_hour)
            └── Speed  (takes Distance + ElapsedTime; projects times, age-grades)
                    └── RunWalkCalculator  (computes avg pace/mph from run/walk intervals)
Age  (no deps; holds age in years, computes max_pulse and training zones)
    └── AgeCalculator  (factory: takes date strings, returns Age)
```

**Key design patterns:**
- `Distance` stores a value + unit-of-measure (`"m"`, `"k"`, `"y"`). All arithmetic methods (`add`, `subtract`) convert the other operand to the receiver's UOM before operating.
- `ElapsedTime` accepts either a numeric seconds value or an `"hh:mm:ss"` / `"mm:ss"` string.
- `Speed.projected_time(distance, algorithm)` supports `"simple"` (linear) and `"riegel"` (exponential, exponent 1.06) formulas.
- `Speed.age_graded(event_age, graded_age)` adjusts a finish time based on the ratio of max heart rates between two ages.
- `RunWalkCalculator.calculate()` returns a plain dict (not a class instance).
- Training zones in `Age.training_zones()` return a list of dicts at 95/90/85/80/75% of max pulse (220 − age).

## Test conventions

Tests import `m26` at the top level and use a local `assert_almost_equal(x, y, threshold=0.0001)` helper for floating-point comparisons. No mocking — all tests use real class instances.
