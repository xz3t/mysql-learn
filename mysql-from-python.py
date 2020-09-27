import os
import pymysql

#get username
username = os.environ.get('USERNAME')

#conection

connection = pymysql.connect( host='localhost',
                            user = username,
                            password = '',
                            db='Chinook')

try: 
    #run query  
    with connection.cursor() as cursor:
        sql = "SELECT * FROM Artist;"
        cursor.execute(sql)
        result = cursor.fetchall()
        print (result)
finally:
    #close connection sql
    connection.close()