set -o xtrace

TESTFILE_ORIGIN_PATH=${1:-/usr/bin/inkscape}
TEST_DIR="/tmp"

TESTFILE_NAME=$(basename "${TESTFILE_ORIGIN_PATH}")
TESTFILE_PATH="${TEST_DIR}/${TESTFILE_NAME}"
GZ_FILE="${TEST_DIR}/${TESTFILE_NAME}.gz"
MD5_FILE="${TEST_DIR}/${TESTFILE_NAME}.md5"

cp "${TESTFILE_ORIGIN_PATH}" "${TESTFILE_PATH}"
md5sum "${TESTFILE_PATH}" >| "${MD5_FILE}"
gzip -f "${TESTFILE_PATH}"
./gunzip "${GZ_FILE}"
md5sum -c - < "${MD5_FILE}"
