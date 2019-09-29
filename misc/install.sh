#!/usr/bin/env bash
#
# This script installs everything that requires a manual install/update process
# and doesn't belong to any more specific category.

set -e

# chromedriver is released along with the chrome, so it should be safe to use LATEST build
# as long as chrome is being updated in the system as well.
provisionChromeDriver () {
  echo "> Provisioning ChromeDriver..."
  latest_version=`curl -sS chromedriver.storage.googleapis.com/LATEST_RELEASE`
  current_version=`chromedriver --version | awk '{ print $2 }'`

  if [ "$latest_version" = "$current_version" ]; then
    echo "    Already up to date."
  else
    echo "    Downloading latest version of chromedriver ($latest_version)"
    chromedriver_url="https://chromedriver.storage.googleapis.com/$latest_version/chromedriver_linux64.zip"
    cd /tmp
    sudo wget -qO - $chromedriver_url > chromedriver_linux64.zip
    sudo unzip chromedriver_linux64.zip
    sudo mv chromedriver /usr/bin/chromedriver
    sudo chown root:root /usr/bin/chromedriver
    sudo chmod +x /usr/bin/chromedriver
  fi
}

provisionChromeDriver