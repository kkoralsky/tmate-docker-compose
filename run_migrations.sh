#!/bin/sh

docker-compose up -d postgres
docker-compose run master ./bin/tmate console <<EOF
Mix.Task.rerun("ecto.migrate", ["-r", Tmate.Repo, "--migrations-path", "./lib/tmate-0.1.1/priv/repo/migrations"])
Mix.Task.rerun("ecto.migrate", ["-r", Tmate.Repo, "--migrations-path", "./lib/tmate-0.1.1/priv/repo/migrations"])
EOF
