#!/usr/bin/env bash
# Starts the AccordSpec model with the TLC server mapper, using the local jar.
set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
JAR="${SCRIPT_DIR}/tla2tools_server.jar"

SPEC="${1:-AccordSpec.tla}"
CONFIG="${2:-AccordSpec_7n3c.cfg}"
MAPPER_NAME="${3:-RECOVERYCOMMIT}"

echo "==> Starting TLC server"
cd "${SCRIPT_DIR}"
exec java -jar "${JAR}" "${SPEC}" -config "${CONFIG}" -mapperparams "name=${MAPPER_NAME}"