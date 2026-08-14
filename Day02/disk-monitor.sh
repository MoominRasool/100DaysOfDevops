#!/usr/bin/env bash
#
# disk-monitor.sh - Alert on high disk usage threshold breaches.
#
set -euo pipefail

# --- Configuration ---
THRESHOLD=85                     # Percentage trigger
ALERT_WEBHOOK_URL="${WEBHOOK_URL:-}" # Set via ENV or hardcode here
HOSTNAME="$(hostname)"

log() {
    echo "[$(date +'%Y-%m-%d %H:%M:%S')] $1"
}

send_alert() {
    local mount_point="$1"
    local usage="$2"
    local message="CRITICAL: Disk usage on $HOSTNAME ($mount_point) reached ${usage}% (Threshold: ${THRESHOLD}%)"

    log "$message"

    if [[ -n "$ALERT_WEBHOOK_URL" ]]; then
        curl -s -X POST -H 'Content-type: application/json' \
            --data "{\"text\":\"🚨 ${message}\"}" \
            "$ALERT_WEBHOOK_URL" || log "WARNING: Failed to send Slack alert."
    else
        log "INFO: No WEBHOOK_URL configured. Skipping remote alert."
    fi
}

main() {
    log "Starting disk monitoring check..."

    # Read mount points, ignoring virtual filesystems (tmpfs, devtmpfs, loop devices)
    df -H | grep -vE '^Filesystem|tmpfs|cdrom|overlay|devtmpfs' | awk '{ print $5 " " $6 }' | while read -r output; do
        usage_pct=$(echo "$output" | awk '{ print $1 }' | cut -d'%' -f1)
        mount_point=$(echo "$output" | awk '{ print $2 }')

        if [[ "$usage_pct" -ge "$THRESHOLD" ]]; then
            send_alert "$mount_point" "$usage_pct"
        fi
    done

    log "Disk check complete."
}

main
