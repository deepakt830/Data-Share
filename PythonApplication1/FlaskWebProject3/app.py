
from flask import Flask, render_template, request, jsonify, json, redirect, url_for
app = Flask(__name__)

# Make the WSGI interface available at the top level so wfastcgi can get it.
wsgi_app = app.wsgi_app

import pypyodbc
import db_connection as dbConn
from create import Create
import webbrowser
import sys

@app.route('/', methods=['POST','GET'])
@app.route('/python', methods=['POST','GET'])
def python():
    try:
       
        if request.method == 'POST':
            name = request.form.get('user')
            client = request.form.get('client')
            token = request.form.get('token')
            if (name== None or token== None or name=='' or token==''):
                return render_template('Unauthorized.html');
            print(token)
            conn = dbConn.getConnection()
            cursor = conn.cursor()
            cursor.execute("Select Token from UserMaster Where UserName ='"+name+"'")
            valids = cursor.fetchone()

            #print(valids[0])
            if(token == valids[0]):
                cursor.execute("Select * from SaleOrder where Client='"+client+"'")
                data = cursor.fetchall()
                print(data)
                for row in data:
                    OrderNo = row[0]
                    Name = row[1]
                    Mobile = row[2]
                    Client = row[3]
                return render_template('Info.html',name = name, data=data);
            else:
                return render_template('Unauthorized.html')
    except Exception as e:
        sys.exit('error',e)
    return render_template("Unauthorized.html")


@app.route('/additem')
def additem():
    return render_template("NewOrder.html")

@app.route('/insertorder', methods=['POST','GET'])
def insertorder():
    try:
        conn = dbConn.getConnection()
        cursor = conn.cursor()
        if request.method == "POST":
            order=request.form['neworder']
            custname=request.form['cname']
            mobile=request.form['phn']
            allclients = request.form['clints']
            #if (order == None or order == '' or custname == None or custname == '' or mob == None or mob == ''):
            #else:
            query="INSERT INTO SaleOrder(Order_No,Customer_Name,Mobile_No,Client) VALUES(%s,%s,%s,%s)"
            cursor.execute(query,(order,custname,mobile,allclients))
            connection.commit()
            return redirect(url_for('python'))
            
    except Exception as e:
        sys.exit('error',e)
    return redirect(url_for('python'))

if __name__ == '__main__':
    app.run(debug=True, port=5000)
    #return json.dumps({'status':'OK','user':custname,'pass':allclients})
    #return redirect(url_for('home'))
    #return redirect(url_for('https://localhost:44384/Home.aspx'));


#def clearAll():


#@app.route('/back', methods=['POST', 'GET'])
#def back():
#    try:
#        if request.methods == 'POST':
#            return redirect('Info.html');
#        #else:
#        #    return redirect('Info.html');
#    except Exception as e:
#        sys.exit('error', e)


#@app.route('/resources', methods=['GET','POST'])
#def resources():  
#    try:
#        if request.method == 'POST':
#            Data =request.form.get("dt")
#    except Exception as e:
#        print(e)
#    return render_template('Data.html', Data=Data)




#@app.route('/ajaxfile', methods=["POST","GET"])
#def ajaxfile():
#    try:
#        ncl = client
#        conn = dbConn.getConnection()
#        cursor = conn.cursor()

#    except Exception as e:
#        sys.exit('error',e)

    #cur = conn.cursor()
    #cur.execute("Select * from SaleOrder where Client='"+ncl+"'")
    #data = cur.fetchall()
        
    #for row in data:
    #    OrderNo = row[0]
    #    Name = row[1]
    #    Mobile = row[2]
    #    Client = row[3]
    #return render_template('Info.html', data=data);
    #try:
    #    conn = dbConn.getConnection()
    #    cursor = conn.cursor()
    #    if request.method == 'POST':
    #        draw = request.form['draw'] 
    #        row = int(request.form['start'])
    #        rowperpage = int(request.form['length'])
    #        searchValue = request.form["search[value]"]
    #        print(draw)
    #        print(row)
    #        print(rowperpage)
    #        print(searchValue)
 
    #        ## Total number of records without filtering
    #        cursor.execute("select count(*) as allcount from test")
    #        rsallcount = cursor.fetchone()
    #        totalRecords = rsallcount['allcount']
    #        print(totalRecords) 
 
    #        ## Total number of records with filtering
    #        likeString = "%" + searchValue +"%"
    #        cursor.execute("SELECT count(*) as allcount from test WHERE name LIKE %s OR position LIKE %s OR office LIKE %s", (likeString, likeString, likeString))
    #        rsallcount = cursor.fetchone()
    #        totalRecordwithFilter = rsallcount['allcount']
    #        print(totalRecordwithFilter) 
 
    #        ## Fetch records
    #        if searchValue=='':
    #            cursor.execute("SELECT * FROM test ORDER BY name asc limit %s, %s;", (row, rowperpage))
    #            employeelist = cursor.fetchall()
    #        else:        
    #            cursor.execute("SELECT * FROM test WHERE name LIKE %s OR position LIKE %s OR office LIKE %s limit %s, %s;", (likeString, likeString, likeString, row, rowperpage))
    #            employeelist = cursor.fetchall()
    #            print(employeelist)
 
    #        data = []
    #        for row in employeelist:
    #            data.append({
    #                'name': row['Name'],
    #                'products': row['Client'],
    #                #'age': row['age'],
    #                #'salary': row['salary'],
    #                #'office': row['office'],
    #            })
 
    #        response = {
    #            'draw': draw,
    #            'iTotalRecords': 3,
    #            'iTotalDisplayRecords': 3,
    #            'aaData': data,
    #        }
    #        return jsonify(response)
    #except Exception as e:
    #    print(e)
    #finally:
    #    cursor.close() 
    #    conn.close()




