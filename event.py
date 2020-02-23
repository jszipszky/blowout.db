class Event:
  # class for each event

  def __init__(self, name, address, city, state, day, month, year, start_time, start_ampm, end_time, end_ampm, fee, private, driver, dj):
    self.name = name
    self.address = address
    self.city = city
    self.state = state
    self.day = day
    self.month = month
    self.year = year
    self.start_time = start_time
    self.start_ampm = start_ampm
    self.end_time = end_time
    self.end_ampm = end_ampm
    self.fee = fee
    self.private = private
    self.driver = driver
    self.dj = dj

  def __repr__(self):
    return "User('{}', '{}', '{}', '{}', {}, {}, {}, {}, {}, {}, {}, {}, {}, {}, {})".format(
        self.name, # TEXT i.e. "MY PARTY"
        self.address, # TEXT i.e. "123 STATE ST."
        self.city, # TEXT i.e. "WEST LAFAYETTE"
        self.state, # TEXT i.e. "INDIANA"
        self.day, # INTEGER from 1-31 i.e. 01
        self.month, # INTEGER from 1-12 i.e. 04
        self.year, # INTEGER from 2020 - 2999 i.e. 2020
        self.start_time, # INTEGER from 1 to 12 i.e. 10
        self.start_ampm, # INTEGER from 0 for AM and 1 for PM i.e. 1 "PM"
        self.end_time, # INTEGER from 1 to 12 i.e. 11
        self.end_ampm, # INTEGER from 0 for AM and 1 for PM i.e. 1 "PM"
        self.fee, # INTEGER i.e. 5 "$5.00"
        self.private, # INTEGER from 0 for PUBLIC and 1 for PRIVATE
        self.driver, # INTEGER from 0 for NO and 1 for YES
        self.dj) # INTEGER from 0 for NO and 1 for YES
