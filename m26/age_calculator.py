__author__ = "cjoakim"

import datetime

from .age import Age


class AgeCalculator(object):

    @classmethod
    def seconds_per_year(cls):
        # seconds * minutes * hours * days
        return float(60 * 60 * 24 * 365.25)

    @classmethod
    def milliseconds_per_year(cls):
        return float(cls.seconds_per_year() * 1000.0)

    @classmethod
    def calculate(self, birth_yyyy_mm_dd, as_of_yyyy_mm_dd):
        if birth_yyyy_mm_dd:
            format = "%Y-%m-%d"
            birth_datetime = datetime.datetime.strptime(birth_yyyy_mm_dd, format)
            asof_datetime = datetime.datetime.strptime(as_of_yyyy_mm_dd, format)
            if False:
                print(
                    "{} {}".format(birth_datetime, str(type(birth_datetime)))
                )  # <class 'datetime.datetime'>
                print("birth_datetime ts: {}".format(birth_datetime.timestamp()))
                print("asof_datetime  ts: {}".format(asof_datetime.timestamp()))

            if birth_datetime and asof_datetime:
                birth_ts = birth_datetime.timestamp()
                asof_ts = asof_datetime.timestamp()
                diff = float(asof_ts - birth_ts)
                years = diff / self.seconds_per_year()
                return Age(years)
            else:
                return None

            # if birth_date and asof_date:
            # birth_ts = birth_date.timestamp
            # asof_ts = asof_date.timestamp
            # diff = float(asof_ts - birth_ts)
            # years = diff / self.seconds_per_year()
            # return Age(years)
        else:
            return None
