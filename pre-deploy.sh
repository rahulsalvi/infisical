#!/bin/sh

git submodule update --init --recursive
if [ ! -e .env ]; then
    echo "Creating .env"
    touch .env
    chmod 600 .env
    {
        echo "TS_AUTHKEY=$(get-authkey -tags tag:webserver -ephemeral -preauth)"
        echo "ENCRYPTION_KEY=$(openssl rand -hex 16)"
        echo "AUTH_SECRET=$(openssl rand -base64 32)"
        echo "POSTGRES_PASSWORD=$(openssl rand -hex 16)"
    } >>.env
fi
