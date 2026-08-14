#!/usr/bin/env bash
#
# log-cleaner.sh - Safely clean or truncate old log files.
#
set -euo pipefail

# --- Configuration Defaults ---
LOG_DIR="/var/log/app"
DAYS_OLD=7
DRY_RUN=false
MAX_SIZE_MB=100

usage() {
    echo "Usage: $0 [-d <log_dir>] [-d <days_old>] [-s <max_size_mb>] [-n]"
    echo "  -d  Directory containing logs (Default: $LOG_DIR)"
    echo "  -m  Delete files older than N days (Default: $DAYS_OLD)"
    echo "  -s  Truncate files exceeding N MB (Default: $MAX_SIZE_MB)"
    echo "  -n  Dry-run mode (simulate changes without deleting/truncating)"
    exit 1
}

while getopts "d:m:s:nh" opt; do
    case "${opt}" in
        d) LOG_DIR="${OPTARG}" ;;
        m) DAYS_OLD="${OPTARG}" ;;
        s) MAX_SIZE_MB="${OPTARG}" ;;
        n) DRY_RUN=true ;;
        h|*) usage ;;
    esac
done

log() {
    echo "[$(date +'%Y-%m-%d %H:%M:%S')] $1"
}

if [[ ! -d "$LOG_DIR" ]]; then
    log "ERROR: Log directory '$LOG_DIR' does not exist."
    exit 1
fi

log "Starting log cleanup in: $LOG_DIR"
if $DRY_RUN; then
    log "--- DRY RUN MODE ENABLED ---"
fi

# 1. Truncate files exceeding MAX_SIZE_MB
log "Checking for files larger than ${MAX_SIZE_MB}MB..."
find "$LOG_DIR" -type f -name "*.log" -size +"${MAX_SIZE_MB}M" | while read -r logfile; do
    if $DRY_RUN; then
        log "[DRY-RUN] Would truncate: $logfile"
    else
        log "Truncating: $logfile"
        : > "$logfile"  # Safely clears file without breaking open file descriptors
    fi
done

# 2. Remove compressed/archived logs older than DAYS_OLD
log "Checking for archived log files older than ${DAYS_OLD} days..."
find "$LOG_DIR" -type f \( -name "*.gz" -o -name "*.tar.gz" -o -name "*.log.*" \) -mtime +"$DAYS_OLD" | while read -r oldfile; do
    if $DRY_RUN; then
        log "[DRY-RUN] Would delete: $oldfile"
    else
        log "Deleting: $oldfile"
        rm -f "$oldfile"
    fi
done

log "Log cleanup completed successfully."
