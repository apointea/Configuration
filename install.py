# @Author: Antoine Pointeau <kalif>
# @Date:   2017-07-26T23:40:00+02:00
# @Email:  web.pointeau@gmail.com
# @Filename: install.py
# @Last modified by:   kalif
# @Last modified time: 2017-07-27T01:28:58+02:00

import os

from utils import *

SDIR = os.path.dirname(os.path.realpath(__file__))
HDIR = os.path.expanduser('~')

def configuration():
    res = {
        "pmanager": inquire("What's your password manager ?", ["yum", "apt-get"]),
    }
    # Convert yes/no inputs into booleans
    for key in []:
        res[key] = YN_to_bool(res[key])
    return res

def common(conf):
    if inquire("Install common packages(vim, curl, git, wget, ...) ?", ["y", "n"]) == "n":
        return False
    for pack in ["vim", "curl", "git", "wget"]:
        pinfo("Install %s:" % (pack))
        install_package(conf["pmanager"], pack, sudo=True)
    return True

def zsh(conf):
    if inquire("Install zsh and oh-my-zsh ?", ["y", "n"]) == "n":
        return False
    pinfo("Install zsh:")
    install_package(conf["pmanager"], "zsh", sudo=True)
    pinfo("Download oh-my-zsh:")
    cmd = ["curl", "-fsSL", "-o", "/tmp/oh-my-zsh-install.sh", "https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh"]
    proc = Popen(cmd)
    if not proc.wait() is 0:
        raise Exception("Download oh-my-zsh failed")
    pinfo("Run oh-my-zsh install:")
    cmd = ["sh", "/tmp/oh-my-zsh-install.sh"]
    proc = Popen(cmd)
    if not proc.wait() is 0:
        raise Exception("Install oh-my-zsh failed")
    # Delete the oh-my-zsh script silently
    cmd = ["rm", "/tmp/oh-my-zsh-install.sh"]
    Popen(cmd, stdin=PIPE, stdout=PIPE, stderr=PIPE)
    pinfo("Add custom oh-my-zsh theme")
    cmd = ["cp", os.path.join(SDIR, "res/custom.zsh-theme"), os.path.join(HDIR, ".oh-my-zsh/themes/")]
    Popen(cmd)
    pinfo("Replace zshrc")
    cmd = ["cp", os.path.join(SDIR, "res/zshrc"), os.path.join(HDIR, ".zshrc")]
    Popen(cmd)
    pinfo("Add link sbin in home")
    cmd = ["ln", "-s", os.path.join(SDIR, "sbin"), os.path.join(HDIR, "sbin")]
    Popen(cmd)
    print("%sReplace the default shell out of the script with 'chsh -s /bin/zsh'%s" % (BBLUE, CLEAR))
    return True


def main():
    print
    conf = configuration()
    common(conf)
    zsh(conf)

if __name__ == "__main__":
    main()
