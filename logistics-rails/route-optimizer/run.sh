#!/bin/bash

# Caminho para o binário do route-optimizer
BINARY="/mnt/c/Users/leite/Documents/logistics-project/route-optimizer/.stack-work/install/x86_64-linux/372513ea186300155e736d1efb9c364f88df870fa8e541d271ec5c8603ed85ff/9.10.2/bin/route-optimizer"

# Lê o JSON do stdin e passa para o Haskell
cat | "$BINARY"
