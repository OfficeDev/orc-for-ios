export LC_ALL="en_US.UTF-8"
cd "${WORKSPACE_PATH}/.."
REPO_ROOT=`pwd`
LOG_FILE="${REPO_ROOT}/orc_pre-build.log"

echo "Starting log file at $LOG_FILE"
echo "" > $LOG_FILE

echo "Executing prebuild.sh" >> ${LOG_FILE}
echo "Installing pods" >> ${LOG_FILE}

pod install

echo "Done" >> ${LOG_FILE}
