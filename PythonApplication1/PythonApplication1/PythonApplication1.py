
import pyodbc;
conn_str = (
    r'DRIVER={SQL Server};'
    r'SERVER=DESKTOP-G37V1H3;'
    r'DATABASE=Staff;'
    r'Trusted_Connection=yes;'
)
cnxn = pyodbc.connect(conn_str)
cnxn.execute("SELECT * FROM EmployeeData")

from flask import Flask, request, render_template
import io
import importlib_metadata
App = Flask(__name__)  
 
@App.route("/")   
def index():
    #decode('Index.html')
     return  render_template("index.html")

@App.route('/hello', methods=['POST'])  
def hello():  
    first_name = request.form['first_name']  
    last_name = request.form['last_name']  
    data=' %s %s ' % (first_name, last_name)  
    return render_template('hello.html',value=data)  

if __name__ == '__main__':  
    #app.run(use_debugger=False, use_reloader=False, passthrough_errors=True)  
    App.run('localhost', 4459)  

