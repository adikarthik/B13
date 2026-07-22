#!/bin/bash
#5. How do you automate log rotation-compress, upload to Blob, and purge old archives?
# Compress logs
sudo tar --ignore-failed-read -czf logs.tar.gz /var/log

# Upload to Azure Blob
az storage blob upload \
--account-name swethaacc123 \
--container-name swetha-blob \
--name logs.tar.gz \
--file logs.tar.gz \
--auth-mode login

# Delete old archives
find . -name "*.tar.gz" -mtime +30 -delete
