local_ip=$(ip addr show wlp59s0 | grep 'state UP' -A2 | tail -n1 | awk '{print $2}' | cut -f1  -d'/');
if [ -z $local_ip ]
then
  echo "  0.0.0.0";
else
  echo " " $local_ip;
fi
