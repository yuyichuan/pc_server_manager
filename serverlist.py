__author__ = 'yuyichuan'

from bottle import *
import logging
import logging.config
import macaron

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

    return template('list_info', viewmodel=result)

@route("/server/<ind>")
def server_info(ind):
    server = Server.get(ind)
    return template("pc_server_info_readonly", viewmodel=server)


if __name__ == '__main__':
    logging.config.fileConfig('logging.conf')
    run(host='0.0.0.0', port=8081, reloader=True)