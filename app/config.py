# Objeto de conexão para encontrar o servidor, sql logon e efetivar a conexão
from app import app
from flaskext.mysql import MySQL
from flask_basicauth import BasicAuth

app.config['BASIC_AUTH_USERNAME']= 'silsil'
app.config['BASIC_AUTH_PASSWORD']= '1234567'
auth = BasicAuth(app)

mysql = MySQL()
app.config['MYSQL_DATABASE_USER'] = 'root'
app.config['MYSQL_DATABASE_PASSWORD'] = 1234 #insira a sua senha do DB
app.config['MYSQL_DATABASE_DB'] = 'db_clientes' #insira o nome do seu DB
app.config['MYSQL_DATABASE_DB'] = 'db_produtos' #insira o nome do seu DB
app.config['MYSQL_DATABASE_DB'] = 'db_vendas' #insira o nome do seu DB
app.config['MYSQL_DATABASE_HOST'] = 'endpoing do load balance' #colocar o localhost pelo endpoing rds


mysql.init_app(app)
