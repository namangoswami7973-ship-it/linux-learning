#!/bin/bash

# Function to display memory usage
check_memory() {
    echo "--- Memory Usage Report (in MiB) ---"
    
    # Use 'free -m' to get memory stats in Megabytes
    # 'awk' is used to parse the output
    read -r _ total used free shared buff cache available <<< $(free -m | grep Mem:)
    
    # Calculate percentage usage: (Used Memory / Total Memory) * 100
    # The 'bc' command is used for floating point arithmetic
    if [[ $total -gt 0 ]]; then
        usage_percent=$(bc <<<"scale=2; $used * 100 / $total")
        echo "Total: $total MiB"
        echo "Used: $used MiB"
        echo "Free (buffers/cache included): $available MiB"
        echo "Memory Usage Percentage: $usage_percent%"
    else
        echo "Could not retrieve memory information."
    fi
    echo "-------------------------------------"
}

# Execute the function
check_memory

