#!/usr/bin/env bash
set -euo pipefail
cd "$(dirname "$0")"

if command -v /usr/libexec/java_home >/dev/null 2>&1; then
  export JAVA_HOME="${JAVA_HOME:-$(/usr/libexec/java_home -v 21)}"
fi

echo "Perfil: local (H2 en memoria). Verifica en logs: The following 1 profile is active: \"local\""
./mvnw spring-boot:run
