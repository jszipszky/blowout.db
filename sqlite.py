import sqlite3
from user import User

conn = sqlite3.connect('user.db')

c = conn.cursor()

# c.execute("""CREATE TABLE users (
#         email text,
#         username text,
#         password text,
#         name text,
#         phone integer
#     )""")

def insert_user(__user):
    with conn:
        c.execute("INSERT INTO users VALUES (?, ?, ?, ?, ?)",
        (__user.email, __user.username, __user.password, __user.name, __user.phone))

def remove_user(__username):
    with conn:
        c.execute("DELETE from users WHERE username=?", (__username,))

def get_user_by_email(__email):
    c.execute("SELECT * FROM users WHERE email=?", (__email,))
    print(c.fetchone())
    return c.fetchone()

def get_user_by_username(__username):
    c.execute("SELECT * FROM users WHERE username=?", (__username,))
    print(c.fetchone())
    return(c.fetchone())

def get_user_by_phone(__phone):
    c.execute("SELECT * FROM users WHERE phone=?", (__phone,))
    print(c.fetchone())
    return(c.fetchone())

def update_user_email(__username, __newemail):
    with conn:
        c.execute("""UPDATE users SET email=?
        WHERE username=?""", (__newemail, __username))
    print(c.fetchone())

def update_user_username(__username, __newusername):
    with conn:
        c.execute("""UPDATE users SET username=?
        WHERE username=?""", (__newusername, __username))
    print(c.fetchone())

def update_user_password(__username, __newpassword):
    with conn:
        c.execute("""UPDATE users SET password=?
        WHERE username=?""", (__newpassword, __username))
    print(c.fetchone())

def update_user_name(__username, __newname):
    with conn:
        c.execute("""UPDATE users SET name=?
        WHERE username=?""", (__newname, __username))
    print(c.fetchone())

def update_user_phone(__username, __newphone):
    with conn:
        c.execute("""UPDATE users SET phone=?
        WHERE username=?""", (__newphone, __username))
    print(c.fetchone())

email = 'user@email.com'
username = 'user'
password = 'password'
name = 'Use Er'
phone = 1110001111

user = User(email, username, password, name, phone)

insert_user(user)

conn.close()
