# This fixes Node ENOSPC error
# See https://github.com/facebook/jest/issues/3254
echo fs.inotify.max_user_watches=524288 | sudo tee -a /etc/sysctl.conf && sudo sysctl -p
