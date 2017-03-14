import bottle

__author__ = 'yuyichuan'

from bottle import *
import logging
import logging.config
import macaron
from beaker.middleware import SessionMiddleware

session_opts = {
    'session.type': 'file',
    'session.cookie_expires': 31536000,
    'session.data_dir': './data',
    'session.timeout': 18000,
    'session.auto': True
}

app=SessionMiddleware(bottle.app(), session_opts)

# install macaron plugin instance
DB_FILE = './SERVER_LIST.DB'
install(macaron.MacaronPlugin(DB_FILE))

# class user definition
class User(macaron.Model):
    _table_name = "pc_user"
    def __str__(self):
        return "User, id:%s, name:%s;" %(self.id, self.u_name)

# class server definition
class Server(macaron.Model):
    _table_name = "pc_server"
    def __str__(self):
        return "Server, ind:%s,ip:%s" % (self.ind, self.ip)

# static file definition
@route('/include/<filename:path>')
def send_file(filename):
    return static_file(filename, root='./static/include')

# server wrapper
class ServerWrap(object):
    def __init__(self, server, sub_servers):
        self.server = server
        self.sub_servers = sub_servers

# Route definition
@route("/")
@route("/index")
def index():
    user_id=0
    s = bottle.request.environ.get('beaker.session')
    if s and s.has_key('user_id'):
        user_id = s['user_id']

    result={}
    servers = Server.select("ind_prent=?", ["0"]) # real server
    server_list = []
    for server in servers:
        sub_servers = Server.select("ind_prent=?", [server.ind]) #virtual server
        sub_server_list = []
        for sub_server in sub_servers:
            sub_sub_servers = Server.select("ind_prent=?", [sub_server.ind]) # servervice
            sub_server_wrap = ServerWrap(sub_server, sub_sub_servers)
            sub_server_list.append(sub_server_wrap)

        server_wrap = ServerWrap(server, sub_server_list)
        server_list.append(server_wrap)

    result['servers'] = server_list
    result['user'] = user_id
    if user_id > 0:
        result['user_name']= s['user_name']


    return template('list_info', viewmodel=result)

@route("/server/<ind>")
def server_info(ind):
    s = bottle.request.environ.get('beaker.session')
    server = Server.get(ind)

    if s and s.has_key('user_id') and s['user_id'] > 0:
        result={}
        result['server']=server
        result['user']=s['user_id']
        result['user_name']=s['user_name']

        return template("pc_server_info", viewmodel=result)
    else:
        return template("pc_server_info_readonly", viewmodel=server)


@route("/save", method='POST')
def update_server():
    s = ''
    return

@route('/newserver/<pind>', method='GET')
def new_server_inf(pind):
    s = bottle.request.environ.get('beaker.session')
    if not s or not s.has_key('user_id') or s['user_id'] == 0:
        redirect('/login', code=302)

    result={}
    result['ind_prent'] = pind
    result['user']=s['user_id']
    result['user_name']=s['user_name']

    return template("pc_server_info_new", viewmodel=result)

@route('/login', method='GET')
def login_show():
    s = bottle.request.environ.get('beaker.session')
    if s and s.has_key('user_id') and s['user_id'] > 0:
        redirect('/', code=302)

    result={}
    result['errmsg']=""

    return template("login", viewmodel=result)

@route('/login', method='POST')
def login():
    s = bottle.request.environ.get('beaker.session')
    uname = request.forms.get('uname')
    upwd = request.forms.get('upwd')
    users = User.select("u_name=?", [uname])

    if users and users.all().count() > 0 and users[0].u_pwd == upwd:
        s['user_id']=users[0].id
        s['user_name']=users[0].u_name
        redirect('/', code=302)
    else:
        s['user_id']=0

    result={}
    result['errmsg']="User name error or password error."
    return template("login", viewmodel=result)

@route('/logout')
def logout():
    s = bottle.request.environ.get('beaker.session')
    if s and s.has_key('user_id'):
        s['user_id']=0

    redirect('/', code=302)

if __name__ == '__main__':
    logging.config.fileConfig('logging.conf')
    run(app=app, host='0.0.0.0', port=8081, reloader=True)