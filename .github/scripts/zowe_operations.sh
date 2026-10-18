#!/bin/bash
set -e

for v in ZOWE_OPT_HOST ZOWE_OPT_PORT ZOWE_OPT_USER ZOWE_OPT_PASSWORD; do
  if [ -z "${!v}" ]; then
    echo "::error::$v is empty – check your repository secrets"
    exit 1
  fi
done

# #!/bin/bash

# # zowe_operations.sh
# # Convert username to lowercase
# LOWERCASE_USERNAME=$(echo "$ZOWE_OPT_USER" | tr '[:upper:]' '[:lower:]')
# # Check if directory exists, create if it doesn't
# if ! zowe zos-files list uss-files "/z/$LOWERCASE_USERNAME/cobolcheck" &>/dev/null; then
#   echo "Directory does not exist. Creating it..."
#   zowe zos-files create uss-directory /z/$LOWERCASE_USERNAME/cobolcheck
# else
#   echo "Directory already exists."
# fi
# # Upload files
# zowe zos-files upload dir-to-uss "./cobol-check" "/z/$LOWERCASE_USERNAME/cobolcheck" --recursive --binary-files "cobol-check-0.2.9.jar"
# # Verify upload
# echo "Verifying upload:"
# zowe zos-files list uss-files "/z/$LOWERCASE_USERNAME/cobolcheck"
