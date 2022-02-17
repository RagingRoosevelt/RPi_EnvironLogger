create table env_log (
    location varchar(30) not null,
    ts_load_utc timestamp without time zone not null,
    humidity    decimal(6,3),
    co2         decimal(10,2),
    temp_mcp    decimal(6,2),
    temp_tmp    decimal(6,2),
    temp_scd    decimal(6,2),
    temp_rtc    decimal(6,2),
    temp_avg    decimal(6,2),
    primary key (ts_load_utc, location)
)
