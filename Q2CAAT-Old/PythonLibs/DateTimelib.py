from datetime import datetime, timedelta
import pytz

class datetimelib():

    def __init__(self):
        pass

    @staticmethod
    def verify_date_is_dst(sdate,tzone):
        dtimestrf = datetime.strptime(sdate, '%m/%d/%Y %I:%M:%S %p')
        pstz = pytz.timezone(tzone)
        pstz.localize((datetime(dtimestrf.year, dtimestrf.month, dtimestrf.day))).dst()
        print(bool(pstz.localize((datetime(dtimestrf.year, dtimestrf.month, dtimestrf.day))).dst()))
        return bool(pstz.localize((datetime(dtimestrf.year, dtimestrf.month, dtimestrf.day))).dst())

    @staticmethod
    def add_days_to_date(startdate, daysdelta):
        tempdate = datetime.strptime(startdate, "%Y-%m-%d %H:%M:%S").date()
        tempdate1 = tempdate + timedelta(days=daysdelta)
        return tempdate1

    @staticmethod
    def subtract_dates(startdate,enddate):
        startdate_fmt = datetime.strptime(startdate, '%m/%d/%Y %I:%M:%S %p')
        enddate_fmt = datetime.strptime(enddate, '%m/%d/%Y %I:%M:%S %p')
        datediff =  startdate_fmt - enddate_fmt
        return datediff.total_seconds()

    @staticmethod
    def add_seconds_to_date(startdate, secondsdelta):
        tempdate = datetime.strptime(startdate, "%Y-%m-%d %H:%M:%S").date()
        tempdate1 = tempdate + timedelta(seconds=secondsdelta)
        return tempdate1



