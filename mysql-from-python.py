import os
import datetime
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
    with connection.cursor(pymysql.cursors.DictCursor) as cursor:
        list_of_names = ['fred', 'bob']
        #prepare a string with same number of placeholders in list_of names
        format_strings = ','.join(['%s']*len(list_of_names))
        cursor.execute("delete from Friends where name in ({});".format(format_strings), list_of_names)
        connection.commit()
        
finally:
    #close connection sql
    connection.close()