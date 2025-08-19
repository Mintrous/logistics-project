#!/bin/bash
set -e

# Lê JSON da entrada padrão e passa para o binário
STACK_BIN=$(stack path --local-install-root)/bin/route-optimizer
cat | $STACK_BIN
