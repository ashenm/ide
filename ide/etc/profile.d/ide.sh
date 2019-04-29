if [ `id -u` -eq 1000 ]
then

  export IDE_OFFLINE=1

  export C9_PORT=${PORT:-5050}
  export C9_HOSTNAME=${IP:-0.0.0.0}
  export C9_PROJECT=c9-ide
  export C9_USER=ubuntu

  alias c9=$HOME/.c9sdk/bin/c9

fi
