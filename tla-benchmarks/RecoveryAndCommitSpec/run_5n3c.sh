#!/usr/bin/env bash
# Builds and runs the AccordSpec model for the 5-node, 3-command configuration.
set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

exec "${SCRIPT_DIR}/build_and_run.sh" AccordSpec.tla AccordSpec_5n3c.cfg RECOVERYCOMMIT