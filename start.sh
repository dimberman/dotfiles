DIRNAME=$(cd "$(dirname "$0 (0h 0m)")"; pwd)

$DIRNAME/profile-install.sh
$DIRNAME/docker-install.sh
$DIRNAME/python-install.sh
$DIRNAME/golang-install.sh
$DIRNAME/kubernetes-install.sh
$DIRNAME/vim-install.sh
exec $SHELL
