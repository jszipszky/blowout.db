class User:
  # class for each blowout user

  def __init__(self, email, username, password, name, phone):
    self.email = email
    self.username = username
    self.password = password
    self.name = name
    self.phone = phone

  def __repr__(self):
    return "User('{}', '{}', '{}', '{}', {})".format(self.email, self.username, self.password, self.name, self.phone)
