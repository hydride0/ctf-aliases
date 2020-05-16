# To use these aliases, functions and variables put
# "source /path/to/cft-aliases.sh" to your shellrc file.
# These are my personal preferences and they'll change and improve
# with time. I'll try to keep this repo up-to-date.

export IP=127.0.0.1 # to be set before starting with a new machine
export MACHINE_DIR=$HOME/machines
export CURRENT_DIR=$MACHINE_DIR/$IP

nmap_most() {
  mkdir $CURRENT_DIR
  nmap -A -v -T4 -sC -oN $CURRENT_DIR/$IP.scan -p- $IP
}

gobuster_dir() {  gobuster dir -w $1 -u http://$IP  }

md5() {  echo $1 | md5sum - | awk '{ print $1 }'  }

e4l() {  enum4linux -a $IP | grep -v "Use of uninitialized value" > $MACHINE_DIR/$IP/enum4linux_$IP  }

alias httpserv="echo Your IP is $(ip --br addr|tail -n1|awk '{print $3}' | sed 's/\/..//g') && python3 -m http.server"
