# test_subproject

This subproject is used to test a beta version of m26
that has been uploaded to test.pypi.org.

Instructions:
- Upload m26 to testpypi
- Execute ./venv.sh in this directory
  - See this line in the script
  - python3 -m pip install --index-url https://test.pypi.org/simple/ --no-deps m26
- Activate the venv
- Execute the following - pip list and the sample program

The venv.sh script in this directory installs m26 as follows:

```
$ pip list
Package         Version
--------------- -------
black           24.8.0
click           8.1.7
m26             0.3.0
mypy-extensions 1.0.0
packaging       24.1
pathspec        0.12.1
pip             24.2
platformdirs    4.3.6


$ python sample-program.py
<Distance value:26.2 uom:m>
d1, as_miles:      26.2
d1, as_kilometers: 42.1648128
d1, as_yards:      46112.0

<Distance value:50.0 uom:k>

<Distance value:7040.0 uom:y>

<Distance value:10.0 uom:k>

<Distance value:52.1648128 uom:k>

<Distance value:45.7274368 uom:k>

<ElapsedTime hh:3.0 mm:47.0 ss:30.0 secs:13650.0>
t1 hours: 3.7916666666666665

<ElapsedTime hh:1 mm:1 ss:2.0 secs:3662.0>
t2 hours: 1.0172222222222222

<Speed dist:<Distance value:26.2 uom:m> etime:<ElapsedTime hh:3.0 mm:47.0 ss:30.0 secs:13650.0>>
s, mph: 6.90989010989011
s, kph: 11.120390189010989
s, yph: 12161.406593406595
s, spm: 520.9923664122138
s, ppm: 8:40.99
projected_time, simple: 04:29:46
projected_time, riegel: 04:32:32

{
  "avg_mph": 5.4292343387471,
  "avg_ppm": "11:03.07",
  "miles": 31.0,
  "proj_miles": 31.0,
  "proj_time": "05:42:35",
  "run_hhmmss": "2:30",
  "run_ppm": "9:16",
  "walk_hhmmss": "0:45",
  "walk_ppm": "17:00"
}

<Age value:55.044490075290895>

<Speed dist:<Distance value:26.2 uom:m> etime:<ElapsedTime hh:3 mm:51 ss:47.61402391772026 secs:13907.61402391772>>
[
  {
    "age": 58.1,
    "max": 161.9,
    "pct_max": 0.95,
    "pulse": 153.805,
    "zone": 1
  },
  {
    "age": 58.1,
    "max": 161.9,
    "pct_max": 0.9,
    "pulse": 145.71,
    "zone": 2
  },
  {
    "age": 58.1,
    "max": 161.9,
    "pct_max": 0.85,
    "pulse": 137.615,
    "zone": 3
  },
  {
    "age": 58.1,
    "max": 161.9,
    "pct_max": 0.8,
    "pulse": 129.52,
    "zone": 4
  },
  {
    "age": 58.1,
    "max": 161.9,
    "pct_max": 0.75,
    "pulse": 121.42500000000001,
    "zone": 5
  }
]
```
