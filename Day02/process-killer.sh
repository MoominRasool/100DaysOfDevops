#!/usr/bin/env bash
#
# process-killer.sh - Gracefully terminate rogue/runaway processes.
#
set -euo pipefail

# --- Configuration Defaults ---
PROCESS_NAME=""
MAX_CPU_PERCENT=90
KILL_TIMEOUT=10 # Seconds to wait for SIGTERM before sending SIGKILL

usage() {
    echo "Usage: $0 -p <process_name> [-c <max_cpu_percent>]"
    echo "  -p  Process name or pattern to target (Required)"
    echo "  -c  Max allowed CPU usage percentage (Default: $MAX_CPU_PERCENT%)"
    exit 1
}

while getopts "p:c:h" opt; do
    case "${opt}" in
        p) PROCESS_NAME="${OPTARG}" ;;
        c) MAX_CPU_PERCENT="${OPTARG}" ;;
        h|*) usage ;;
    esac
done

if [[ -z "$PROCESS_NAME" ]]; then
    echo "Error: Process name is required."
    usage
fi

log() {
    echo "[$(date +'%Y-%m-%d %H:%M:%S')] $1"
}

terminate_pid() {
    local pid="$1"
    local cpu="$2"

    log "Targeting PID $pid (CPU Usage: ${cpu}%)"

    # Send graceful termination signal
    kill -15 "$pid" 2>/dev/null || return 0

    # Wait for process to exit
    local count=0
    while kill -0 "$pid" 2>/dev/null; do
        sleep 1
        ((count++))
        if [[ $count -ge $KILL_TIMEOUT ]]; then
            log "PID $pid did not terminate gracefully after ${KILL_TIMEOUT}s. Sending SIGKILL..."
            kill -9 "$pid" 2>/dev/null || true
            break
        fi
    done

    log "Process PID $pid successfully terminated."
}

main() {
    log "Scanning for processes matching '$PROCESS_NAME' exceeding ${MAX_CPU_PERCENT}% CPU..."

    # Get PIDs and CPU utilization using ps
    # Exclude the script itself and grep from matches
    ps -eo pid,pcpu,comm | grep -i "$PROCESS_NAME" | grep -v "process-killer" | grep -v "grep" | while read -r pid cpu comm; do
        # Convert CPU float to integer for comparison
        cpu_int=$(printf "%.0f" "$cpu")

        if [[ "$cpu_int" -ge "$MAX_CPU_PERCENT" ]]; then
            log "Found runaway process: $comm (PID: $pid, CPU: ${cpu}%)"
            terminate_pid "$pid" "$cpu"
        fi
    done

    log "Process inspection complete."
}

main
