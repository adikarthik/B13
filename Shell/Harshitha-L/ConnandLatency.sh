hosts=("8.8.8.8" "1.1.1.1" "example.com")

for host in "${hosts[@]}"; do
    echo "Checking $host..."
    ping -c 4 "$host"
    echo
done
