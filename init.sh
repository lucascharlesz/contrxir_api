#!/usr/bin/env sh

set -e

mix ecto.setup && mix phx.server