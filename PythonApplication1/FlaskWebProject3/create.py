import db_connection as dbConn

class Create:
    def func_CreateData(self):
        connection = dbConn.getConnection()

        name = input('Enter Name: ')
        password = input('Enter Password: ')

        try:
            query = 'insert into test (Name, Password) values(?,?)'
            cursor = connection.cursor()

            cursor.execute(query, [name, password])

            connection.commit()
            print("Data Saved Successfully")

        except:
            print("Something is wrong, Please try later")

        finally:
            connection.close()