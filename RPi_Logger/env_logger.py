import time
import board
import adafruit_scd30
import adafruit_ds3231
import adafruit_mcp9808
import adafruit_tmp117
import psycopg2
from pytz import timezone
from datetime import datetime, timedelta

from pathlib import Path
from configparser import ConfigParser
conf = ConfigParser()
conf.read(Path(__file__).parent / 'logging_config.ini')

conn = psycopg2.connect(
    host=conf['postgres'].get('hostname'),
    database=conf['postgres'].get('database'),
    port=conf['postgres'].get('port', 5432),
    user=conf['postgres'].get('username'),
    password=conf['postgres'].get('password')
)
cur = conn.cursor()

i2c = board.I2C()
scd = adafruit_scd30.SCD30(i2c)
rtc = adafruit_ds3231.DS3231(i2c)
tmp = adafruit_tmp117.TMP117(i2c)
mcp = adafruit_mcp9808.MCP9808(i2c)

log_freq = int(conf['logging'].get('frequency_min', 15))
log_location = conf['logging'].get('location_name', 'unspecified location')
local_timezone = timezone(conf['logging'].get('local_timezone', 'UTC'))

sleep_time = lambda _dt: 60*(log_freq - (dt.minute % log_freq) - 1) + (60 - dt.second)
get_dt = lambda _rtc: datetime.fromtimestamp(time.mktime(_rtc.datetime)).replace(tzinfo=timezone('UTC'))


dt = get_dt(rtc)
st = sleep_time(dt)
print(
    "Current time is %s UTC"%dt.strftime("%Y-%m-%d %H:%M:%S"),
    "Waiting %s minutes and %s seconds to start logging" %(st//60, st%60),
    "Logging starting at %s UTC"%(dt+timedelta(seconds=st)).strftime("%H:%M:%S"),
    "",
    sep='\n'
)
time.sleep(sleep_time(get_dt(rtc)))

while True:
    try:
        datum = dict(
            loc=log_location,
            tsl=get_dt(rtc),
            hum=scd.relative_humidity,
            co2=scd.CO2,
            mcp=mcp.temperature,
            tmp=tmp.temperature,
            scd=scd.temperature,
            rtc=rtc.temperature,
            avg=0.25*(mcp.temperature+tmp.temperature+scd.temperature+rtc.temperature)
        )
        if True:
            dt = get_dt(rtc)
            print(
                datum['tsl'].strftime("[%Y-%m-%d %H:%M:%S UTC]"),
                datum['tsl'].astimezone(local_timezone).strftime("[%Y-%m-%d %H:%M:%S Local]"),
                f'Sleeping {sleep_time(dt)} seconds',
                f" - {datum['co2']: 10.3f} PPM",
                f" - {datum['avg']: 10.1f}C"
            )
        else:
            print(
                "===========================",
                datum['tsl'].astimezone(local_timezone).strftime("[%Y-%m-%d %H:%M:%S Local]"),
                "",
                f"{datum['co2']: 10.3f} PPM",
                f"{datum['hum']: 10.3f} %rH",
                "",
                "Average Temp\tMCP9808\tTMP117\tSCD-30\tRTC\t\t",
                "{avg:0.2f}\N{DEGREE SIGN}C\t\t"
                "{mcp:0.2f}\N{DEGREE SIGN}C\t{tmp:0.2f}\N{DEGREE SIGN}C"
                "\t{scd:0.2f}\N{DEGREE SIGN}C\t{rtc:0.2f}\N{DEGREE SIGN}C".format(
                    **{k:v for k,v in datum.items() if k in ('mcp','tmp','scd','rtc','avg')}
                ),
                sep='\n'
            )
        cur.execute(
            """
                insert into env_log (
                    location,ts_load,humidity,co2,
                    temp_mcp,temp_tmp,temp_scd,temp_rtc,temp_avg
                )
                values
                (%(loc)s,%(tsl)s,%(hum)s,%(co2)s,%(mcp)s,%(tmp)s,%(scd)s,%(rtc)s,%(avg)s)
            """,
            {**datum, 'tsl': datum['tsl'].strftime("%Y-%m-%dT%H:%M:%SZ")}
        )
        conn.commit()
    except OSError as ex:
        print("===========================")
        print(ex)

    time.sleep(sleep_time(get_dt(rtc)))