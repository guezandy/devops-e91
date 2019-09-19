ls /var/log/
res=$(cat /var/log/auth.log | grep "New session")
file="output.txt"
echo "$res" >> "$file"
