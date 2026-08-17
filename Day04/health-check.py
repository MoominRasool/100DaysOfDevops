#!/usr/bin/env python3
import os
import requests
import time
import logging

# Configure standard logging
logging.basicConfig(
    level=logging.INFO,
    format='%(asctime)s | %(levelname)-7s | %(message)s',
    datefmt='%Y-%m-%d %H:%M:%S'
)

# Load Slack Webhook from environment variable
SLACK_WEBHOOK_URL = os.environ.get("SLACK_WEBHOOK_URL")

# List of URLs to monitor
URLS_TO_CHECK = [
    "https://github.com",
    "https://google.com",
    "https://httpstat.us/404",          # Triggers a non-200 alert
    "https://this-site-will-fail.local" # Triggers a connection error alert
]

def send_slack_alert(message):
    """Sends a formatted JSON payload to the Slack Webhook."""
    if not SLACK_WEBHOOK_URL:
        logging.info("ℹ️ Skipping Slack alert: SLACK_WEBHOOK_URL not set.")
        return

    payload = {"text": message}
    try:
        requests.post(SLACK_WEBHOOK_URL, json=payload, timeout=5)
    except Exception as e:
        logging.error(f"Failed to send Slack alert: {e}")

def check_url_health(url):
    """Pings a URL and alerts Slack on non-200 status or connection errors."""
    try:
        start_time = time.time()
        response = requests.get(url, timeout=5)
        response_time_ms = round((time.time() - start_time) * 1000, 2)
        
        # Check specifically for a 200 OK response
        if response.status_code == 200:
            logging.info(f"Status: {response.status_code} | Time: {response_time_ms}ms | URL: {url}")
        else:
            msg = f"⚠️ *Health Check Alert*\n*Status:* {response.status_code} (Non-200)\n*URL:* {url}\n*Latency:* {response_time_ms}ms"
            logging.warning(f"Status: {response.status_code} | Time: {response_time_ms}ms | URL: {url}")
            send_slack_alert(msg)

    except requests.exceptions.Timeout:
        msg = f"🚨 *Health Check Critical*\n*Error:* Timeout (Exceeded 5s)\n*URL:* {url}"
        logging.error(f"TIMEOUT       | URL: {url}")
        send_slack_alert(msg)
        
    except requests.exceptions.RequestException as e:
        error_type = type(e).__name__
        msg = f"🚨 *Health Check Critical*\n*Error:* {error_type}\n*URL:* {url}"
        logging.error(f"ERROR         | URL: {url} | Details: {error_type}")
        send_slack_alert(msg)

def main():
    logging.info("Starting automated health checks...")
    print("-" * 65)
    
    for url in URLS_TO_CHECK:
        check_url_health(url)
        
    print("-" * 65)
    logging.info("Health checks completed.")

if __name__ == "__main__":
    main()
