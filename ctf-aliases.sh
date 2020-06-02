# To use these aliases, functions and variables put
# "source /path/to/cft-aliases.sh" to your shellrc file.
# These are my personal preferences and they'll change and improve
# with time. I'll try to keep this repo up-to-date.

export IP=127.0.0.1
export MACHINE_DIR=$HOME/machines

nmap_most() {
  mkdir $MACHINE_DIR/$IP
  ports=$(nmap -T4 -p- $IP | \
    grep \tcp | \
    tr "/" " " | \
    awk '{ print $1 }' | \
    tr "\n" ","
  )
  if [ ports ]; then
    nmap -A -T4 -oN $MACHINE_DIR/$IP/$IP.scan -p${ports%?} $IP
  else
    echo "No scanning since no open ports were found";
  fi
}

gobuster_dir() {
  gobuster dir -w $1 -u http://$IP
}

md5() {
  echo $1 | md5sum - | awk '{ print $1 }'
}

e4l() {
  enum4linux -a $IP | grep -v "Use of uninitialized value" > $MACHINE_DIR/$IP/enum4linux_$IP
}

alias httpserv="echo Listening on $(ip --br addr|tail -n1|awk '{print $3}' | sed 's/\/..//g') && python3 -m http.server"
alias ref="cat $HOME/.reference" # memos, commands I use often but that I never remember, ...
