# @Author: Antoine Pointeau <kalif>
# @Date:   2017-07-27T00:10:02+02:00
# @Email:  web.pointeau@gmail.com
# @Filename: inquire.py
# @Last modified by:   kalif
# @Last modified time: 2017-07-27T01:13:35+02:00

from subprocess import Popen, PIPE

RED="\033[0;31m"
GREEN="\033[0;32m"
YELLOW="\033[0;33m"
BLUE="\033[0;34m"
MAGENTA="\033[0;35m"
CYAN="\033[0;36m"
BRED="\033[1;31m"
BGREEN="\033[1;32m"
BYELLOW="\033[1;33m"
BBLUE="\033[1;34m"
BMAGENTA="\033[1;35m"
BCYAN="\033[1;36m"
CLEAR="\033[0m"

def inquire(question, choices, limit=0):
    """
    Asks the `question` to the user and checks that the answer is include in
    `Choices` and return it. Otherwise it asks until `limit` is reach.
    - question (String): question to ask
    - choices (list(String)): list of the choices the user can choose
    - limit (Int): limit until it will raise an Exception. If the value is 0
                   it will do an endless loop.
    - ~return (String): the user answer contained in choices
    """
    res = None
    cstr = ", ".join(choices)
    limit = limit if limit > 0 else -1
    while not res in choices:
        if not res is None:
            print("%sError: invalid answer '%s'%s" % (RED, res, CLEAR))
        res = raw_input("%s%s (%s) : %s" % (BGREEN, question, cstr, CLEAR))
        limit = limit + 1 if not limit is -1 else -1
        if limit is 0:
            raise Exception("inquire limit reached")
    return res

def YN_to_bool(val):
    return (True if val in ["y", "Y", "Yes", "YES"] else False)

def install_package(pmanager, package, sudo=False, auto_yes=True):
    """
    Install the package `name` with following the configuration `conf`.
    - pmanager (String) : name of the package manager used by thew System
    - package (String) : name of the package to install
    - auto_yes (Bool) : use the argument '-y' when calling the package manager
    """
    cmd = []
    if sudo: cmd.append("sudo")
    cmd.append(pmanager)
    cmd.append("install")
    if auto_yes: cmd.append("-y")
    cmd.append(package)
    proc = Popen(cmd)
    if not proc.wait() is 0:
        raise Exception("install package '%s' failed." % (package))
    return True

def pinfo(val): print("%s- %s%s" % (BLUE, val, CLEAR))
