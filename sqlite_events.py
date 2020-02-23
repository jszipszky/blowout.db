import sqlite3
from event import Event

conn = sqlite3.connect('event.db')

c = conn.cursor()

# c.execute("""CREATE TABLE events (
#          name text,
#          address text,
#          city text,
#          state text,
#          day integer,
#          month integer,
#          year integer,
#          start_time integer,
#          start_ampm integer,
#          end_time integer,
#          end_ampm integer,
#          fee integer,
#          private integer,
#          driver integer,
#          dj integer
#      )""")

def insert_event(__event):
    with conn:
        c.execute("INSERT INTO events VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)",
        (__event.name, __event.address, __event.city, __event.state,
        __event.day, __event.month, __event.year, __event.start_time,
        __event.start_ampm, __event.end_time, __event.end_ampm, __event.fee,
        __event.private, __event.driver, __event.dj))

def get_event_by_date_in_city(__day, __month, __year, __city):
    c.execute("SELECT * FROM events WHERE day=? and month=? and year=?", (__day, __month, __year))
    print(c.fetchall())
    return c.fetchall()

def get_event_by_name_in_city(__name, __city):
    c.execute("SELECT * FROM events WHERE name=? and city=?", (__name, __city))
    print(c.fetchall())
    return c.fetchall()

name = "First Party"
address = "123 State St."
city = "West Lafayette"
state = "Indiana"
day = 1
month = 4
year = 2020
start_time = 10
start_ampm = 1
end_time = 11
end_ampm = 1
fee = 0
private = 0
driver = 0
dj = 1

event = Event(name, address, city, state, day, month, year, start_time, start_ampm, end_time, end_ampm, fee, private, driver, dj)

insert_event(event)

get_event_by_date_in_city(1, 4, 2020, "West Lafayette")
get_event_by_name_in_city("First Party", "West Lafayette")

conn.close()
