#!/usr/bin/env bash
# Builds tlc-controlled-mapper and starts the AccordSpec model with the TLC server mapper.
set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
REPO_ROOT="$(cd "${SCRIPT_DIR}/../.." && pwd)"
MAPPER_DIR="${REPO_ROOT}/tlc-controlled-mapper"
JAR="${MAPPER_DIR}/dist/tla2tools_server.jar"

SPEC="${1:-AccordSpec.tla}"
CONFIG="${2:-AccordSpec_7n3c.cfg}"
MAPPER_NAME="${3:-RECOVERYCOMMIT}"

echo "==> Building tlc-controlled-mapper (ant compile, compile-test, dist)"
ant -f "${MAPPER_DIR}/customBuild.xml" compile
ant -f "${MAPPER_DIR}/customBuild.xml" compile-test
ant -f "${MAPPER_DIR}/customBuild.xml" dist

echo "==> Starting TLC server"
cd "${SCRIPT_DIR}"
exec java -jar "${JAR}" "${SPEC}" -config "${CONFIG}" -mapperparams "name=${MAPPER_NAME}"