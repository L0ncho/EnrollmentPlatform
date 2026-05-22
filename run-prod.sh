#!/usr/bin/env bash
set -euo pipefail
cd "$(dirname "$0")"

if [[ ! -f .env ]]; then
  echo "Falta .env. Cópialo desde el ejemplo y completa las credenciales Oracle:"
  echo "  cp .env.example .env"
  exit 1
fi

set -a
source .env
set +a

if command -v /usr/libexec/java_home >/dev/null 2>&1; then
  export JAVA_HOME="${JAVA_HOME:-$(/usr/libexec/java_home -v 21)}"
fi

echo "Perfil: ${SPRING_PROFILES_ACTIVE:-prod}. Verifica en logs: The following 1 profile is active: \"prod\""
./mvnw spring-boot:run
