# m26

m26 - calculations for sports like running, cycling, and swimming

## Urls

- GitHub: https://github.com/cjoakim/m26-py
- PyPi: https://pypi.org/project/m26/

## Features

- Create Distances in either miles, kilometers, or yards.
- Translates Distances to the other units of measure.
- Specify ElapsedTime either in 'hh:mm:ss' strings, or int second values.
- Calculates Speed from a given Distance and ElapsedTime - per mile, per kilometer, and per yard.
- Calculates pace_per_mile and seconds_per_mile for a given Speed.
- Projects one Speed to another Distance with either a simple or algorithmic formula.
- RunWalkCalculator calculates pace and mph from given time intervals and paces.
- Calculates the Age of person, and age_graded times.
- Calculates five standard heart-rate training zones based on Age.


## Quick start


### Installation

```
$ pip install m26
```

### Use


#### Sample Program

See sample-program.py in the GitHub repo.

```
import json

import m26

if __name__ == "__main__":

    d1 = m26.Distance(26.2)
    print(d1)
    print("d1, as_miles:      {0}".format(d1.as_miles()))
    print("d1, as_kilometers: {0}".format(d1.as_kilometers()))
    print("d1, as_yards:      {0}".format(d1.as_yards()))

    print("")
    d2 = m26.Distance(50.0, m26.Constants.uom_kilometers())
    print(d2)

    print("")
    d3 = m26.Distance(7040, m26.Constants.uom_yards())
    print(d3)

    print("")
    d4 = m26.Distance(10.0, m26.Constants.uom_kilometers())
    print(d4)

    print("")
    d4.add(d1)
    print(d4)

    print("")
    d4.subtract(d3)
    print(d4)

    print("")
    t1 = m26.ElapsedTime("3:47:30")
    print(t1)
    print("t1 hours: {0}".format(t1.hours()))

    print("")
    t2 = m26.ElapsedTime(3662)
    print(t2)
    print("t2 hours: {0}".format(t2.hours()))

    print("")
    s = m26.Speed(d1, t1)
    print(s)
    print("s, mph: {0}".format(s.mph()))
    print("s, kph: {0}".format(s.kph()))
    print("s, yph: {0}".format(s.yph()))
    print("s, spm: {0}".format(s.seconds_per_mile()))
    print("s, ppm: {0}".format(s.pace_per_mile()))

    hhmmss_simple = s.projected_time(d2, "simple")
    hhmmss_riegel = s.projected_time(d2, "riegel")
    print("projected_time, simple: {0}".format(hhmmss_simple))
    print("projected_time, riegel: {0}".format(hhmmss_riegel))

    print("")
    result = m26.RunWalkCalculator.calculate("2:30", "9:16", "0:45", "17:00", 31.0)
    print(json.dumps(result, sort_keys=True, indent=2))

    print("")
    a = m26.AgeCalculator.calculate("1960-10-01", "2015-10-18")
    print(a)

    print("")
    a2 = m26.Age(58.1)
    graded = s.age_graded(a, a2)
    print(graded)

    zones = a2.training_zones()
    print(json.dumps(zones, sort_keys=True, indent=2))
    print("")
```

#### Sample Program Output

```
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

---

## Changelog

Current version: 0.4.0

-  2025/07/xx, version 0.4.0, python 3.12 & 3.13.  uv and pyproject.toml tooling
-  2024/09/24, version 0.3.2, python 3.11 support
-  2024/09/23, version 0.3.1, Class AgeCalculator modified to use datetime delta for mac/win consistency
-  2024/09/21, version 0.3.0, Removed arrow dependency, upgraded to python 3.12
-  2020/02/19, version 0.2.1, Jinja2 upgrade
-  2017/09/27, version 0.2.0, Converted to the pytest testing framework; coverage at 100%.
-  2015/10/31, version 0.1.0, Initial Production release.
