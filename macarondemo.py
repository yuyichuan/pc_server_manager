__author__ = 'yuyichuan'

from bottle import *

import macaron

# install MacaronPlugin instance
DB_FILE = './team.db'
install(macaron.MacaronPlugin(DB_FILE))

# Class Team definition
class TeamCla(macaron.Model):
    _table_name="team"
    def __str__(self):
        return "[Team '%s']" % self.name

# class member definition
class MemberCla(macaron.Model):
    _table_name = "member"
    team = macaron.ManyToOne(TeamCla, related_name="members", ref_key="id", fkey="team_id")
    age = macaron.IntegerField(min=15, max=18)

    def __str__(self):
        return "[Member '%s %s : %s']" % (self.first_name, self.last_name, self.part)


# Route definition
@route("/hello")
def index():
    html = "<html>\n<head><title>Teams</title></head>\n"
    html += "<body>\n<h1>Teams</h1>\n<ul>\n"

    for team in TeamCla.all():
        html += '<li><a href="/member/%s">%s</a></li>\n' % (team.id, team.name)
    html += "</ul>\n</body>\n</html>\n"
    return html

@route("/member/<tid>")
def show_member(tid):
    team = TeamCla.get(tid)

    html = "<html>\n<head><title>Member</title></head>\n"
    html += "<body>\n<h1>Members</h1>\n<ul>\n"

    for member in team.members:
        html += '<li>%s</li>\n' % member
    html += "</ul>\n</body>\n</html>\n"
    return html

@route("/newt")
def newt():
    new_team = TeamCla.create(name="Houkago Tea Time")
    member1 = new_team.members.append(first_name="Ritsu", last_name="Tainaka", part="Dr", age=15)
    member2 = new_team.members.append(first_name="Mio", last_name="Akiyama", part="Ba", age=17)
    macaron.bake()

    html = "<html>\n<head><title>Teams</title></head>\n"
    html += "<body>\n<h1>Teams</h1>\n<ul>\n"

    for team in TeamCla.all():
        html += '<li><a href="/member/%s">%s</a></li>\n' % (team.id, team.name)
    html += "</ul>\n</body>\n</html>\n"
    return html


@route("/updatemember/<mid>")
def newmember(mid):
    mio = MemberCla.get(mid)
    mio.part = "Vo"
    mio.save()

if __name__ == "__main__":
    run(host="localhost", port=8080)


